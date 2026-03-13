// I18nBundle — locale data loaded from a Store namespace.
//
// A bundle contains:
//   meta  — the [i18n] block from manifest.toml (code, direction, completeness, …)
//   ui    — the full ui.toml as a raw toml::Value (TOML table hierarchy)
//
// Consumers call to_hashmap() to get flat dot-notation keys suitable for
// a t("welcome.title") lookup, or to_json() for Vue i18n / REST API responses.

use std::collections::HashMap;

use serde::{Deserialize, Serialize};

// ── TextDirection ─────────────────────────────────────────────────────────────

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize, Default)]
#[serde(rename_all = "lowercase")]
pub enum TextDirection {
    #[default]
    Ltr,
    Rtl,
}

// ── I18nMeta ──────────────────────────────────────────────────────────────────

/// The `[i18n]` section from a locale's `manifest.toml`.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct I18nMeta {
    /// BCP-47 locale code, e.g. "de", "ar", "pt-br".
    pub locale_code: String,

    /// Display name in the locale's own script, e.g. "Deutsch".
    pub native_name: String,

    /// Text direction.
    #[serde(default)]
    pub direction: TextDirection,

    /// Percentage of keys translated, 0–100.
    #[serde(default)]
    pub completeness: u8,

    /// Translation API version — must match `TRANSLATION_API_VERSION` in the app.
    #[serde(default = "default_api_version")]
    pub api_version: u32,
}

fn default_api_version() -> u32 { 1 }

// ── I18nBundle ────────────────────────────────────────────────────────────────

/// A fully loaded locale bundle for one namespace + locale code.
pub struct I18nBundle {
    /// Metadata from `manifest.toml [i18n]`.
    pub meta: I18nMeta,
    /// Full `ui.toml` as a raw TOML value (table hierarchy preserved).
    pub ui: toml::Value,
}

impl I18nBundle {
    /// Returns the ui TOML value as-is.
    pub fn as_toml(&self) -> &toml::Value {
        &self.ui
    }

    /// Flattens the TOML table hierarchy to dot-notation HashMap.
    ///
    /// `[welcome] title = "Willkommen"` → `"welcome.title" = "Willkommen"`.
    /// Non-string leaf values (integers, booleans) are converted via Display.
    /// Used by terminal UIs and anywhere needing `t("section.key")` lookups.
    pub fn to_hashmap(&self) -> HashMap<String, String> {
        let mut map = HashMap::new();
        flatten_toml(&self.ui, String::new(), &mut map);
        map
    }

    /// Serializes ui to a JSON string — suitable for Vue i18n or REST API.
    pub fn to_json(&self) -> anyhow::Result<String> {
        serde_json::to_string(&self.ui).map_err(Into::into)
    }
}

// ── flatten helpers ───────────────────────────────────────────────────────────

fn flatten_toml(value: &toml::Value, prefix: String, out: &mut HashMap<String, String>) {
    match value {
        toml::Value::Table(table) => {
            for (k, v) in table {
                let key = if prefix.is_empty() {
                    k.clone()
                } else {
                    format!("{prefix}.{k}")
                };
                flatten_toml(v, key, out);
            }
        }
        toml::Value::String(s) => {
            out.insert(prefix, s.clone());
        }
        other => {
            out.insert(prefix, other.to_string());
        }
    }
}

