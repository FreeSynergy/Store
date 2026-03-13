// StoreClient + StoreSource — generic catalog and i18n fetching.
//
// Design: StoreSource is an enum that abstracts WHERE data comes from.
// StoreClient owns a source and provides typed fetch methods.
// Projects pass their own deserializable type to fetch_catalog<M>.
//
// Pattern: Strategy — StoreSource selects the I/O strategy at runtime.
//
//   StoreSource::LocalPath  → read files directly from disk (dev mode / submodule)
//   StoreSource::RemoteHttp → fetch via HTTPS (production / default)
//
// Namespace convention (matches Store repo layout):
//   catalog: {source_root}/{namespace}/catalog.toml
//   i18n:    {source_root}/{namespace}/i18n/{code}/ui.toml
//                                                 /manifest.toml

use std::path::PathBuf;

use anyhow::{Context, Result};
use serde::de::DeserializeOwned;

use crate::i18n::{I18nBundle, I18nMeta};

// ── StoreSource ───────────────────────────────────────────────────────────────

/// Where a store's data is fetched from.
#[derive(Debug, Clone)]
pub enum StoreSource {
    /// Local filesystem — reads catalog and locale files directly.
    ///
    /// `path` points to the Store repository root (the directory that contains
    /// `Node/`, `Wiki.rs/`, etc.).
    ///
    /// Used in dev mode when the Store repo is already checked out locally,
    /// and as the target after a successful `sync_modules` git clone/pull.
    LocalPath(PathBuf),

    /// Remote HTTP — fetches `catalog.toml` via HTTPS.
    ///
    /// `base_url` is the raw content base URL, e.g.
    /// `"https://raw.githubusercontent.com/FreeSynergy/Store/main"`.
    ///
    /// i18n loading is not supported from HTTP — call `sync_modules` first
    /// to get a local copy, then switch to `LocalPath`.
    RemoteHttp(String),
}

// ── StoreClient ───────────────────────────────────────────────────────────────

/// Generic store client — project-agnostic.
///
/// Callers provide the catalog entry type `M` when calling `fetch_catalog`.
/// The client knows nothing about FSN modules or Wiki.rs plugins.
pub struct StoreClient {
    source: StoreSource,
}

impl StoreClient {
    pub fn new(source: StoreSource) -> Self {
        Self { source }
    }

    /// Fetch `{namespace}/catalog.toml` and deserialize it into `T`.
    ///
    /// `T` is typically `fsn_core::store::StoreCatalog` for FSN or any other
    /// project-specific catalog wrapper.
    pub async fn fetch_catalog<T: DeserializeOwned>(&self, namespace: &str) -> Result<T> {
        let rel = format!("{namespace}/catalog.toml");
        match &self.source {
            StoreSource::LocalPath(base) => {
                let path = base.join(&rel);
                let text = std::fs::read_to_string(&path)
                    .with_context(|| format!("reading catalog from {}", path.display()))?;
                toml::from_str(&text)
                    .with_context(|| format!("parsing catalog from {}", path.display()))
            }
            StoreSource::RemoteHttp(base_url) => {
                let url = format!("{}/{}", base_url.trim_end_matches('/'), rel);
                let text = reqwest::get(&url)
                    .await
                    .with_context(|| format!("fetching catalog from {url}"))?
                    .text()
                    .await
                    .with_context(|| "reading catalog response")?;
                toml::from_str(&text)
                    .with_context(|| format!("parsing catalog response from {url}"))
            }
        }
    }

    /// Load the i18n bundle for a namespace + locale code.
    ///
    /// Reads `{namespace}/i18n/{code}/manifest.toml` and
    ///        `{namespace}/i18n/{code}/ui.toml` from the local path.
    ///
    /// Only available for `LocalPath` sources. Returns an error for
    /// `RemoteHttp` — sync the store locally first.
    pub fn load_i18n(&self, namespace: &str, code: &str) -> Result<I18nBundle> {
        let base = match &self.source {
            StoreSource::LocalPath(p) => p.clone(),
            StoreSource::RemoteHttp(_) => {
                anyhow::bail!(
                    "i18n loading requires a local store path. \
                     Sync the store with sync_modules() first."
                );
            }
        };

        let locale_dir = base.join(namespace).join("i18n").join(code);

        let meta_path = locale_dir.join("manifest.toml");
        let meta: I18nMeta = {
            let text = std::fs::read_to_string(&meta_path)
                .with_context(|| format!("reading i18n manifest from {}", meta_path.display()))?;
            // manifest.toml has a [package] block + [i18n] block — we only need [i18n]
            let raw: toml::Value = toml::from_str(&text)
                .with_context(|| format!("parsing {}", meta_path.display()))?;
            let i18n_val = raw.get("i18n")
                .cloned()
                .unwrap_or(toml::Value::Table(toml::map::Map::new()));
            i18n_val.try_into()
                .with_context(|| format!("deserializing [i18n] from {}", meta_path.display()))?
        };

        let ui_path = locale_dir.join("ui.toml");
        let ui: toml::Value = {
            let text = std::fs::read_to_string(&ui_path)
                .with_context(|| format!("reading ui.toml from {}", ui_path.display()))?;
            toml::from_str(&text)
                .with_context(|| format!("parsing {}", ui_path.display()))?
        };

        Ok(I18nBundle { meta, ui })
    }
}
