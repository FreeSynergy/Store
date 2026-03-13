// Manifest trait — every package type must implement this.
//
// Design: project-specific manifest structs (e.g. FSN's ModuleManifest,
// Wiki.rs's PluginManifest) implement this trait so generic catalog
// infrastructure can work with any package type without knowing the details.

use serde::{Deserialize, Serialize};

// ── Manifest trait ────────────────────────────────────────────────────────────

/// Common interface for all package types across all FreeSynergy namespaces.
///
/// Implementors provide identity and classification. The catalog infrastructure
/// uses these methods for filtering and lookup without knowing the concrete type.
pub trait Manifest {
    fn id(&self)       -> &str;
    fn version(&self)  -> &str;
    fn category(&self) -> &str;

    /// Short display name, e.g. "Kanidm", "Zentinel".
    fn name(&self) -> &str;
}

// ── PackageMeta ───────────────────────────────────────────────────────────────

/// The `[package]` block present in every `manifest.toml`.
///
/// Used when loading full per-package manifests. Catalog entries are typically
/// flat summaries; the full `[package]` block lives in the individual file.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PackageMeta {
    pub id:          String,
    pub name:        String,
    pub version:     String,
    pub category:    String,
    pub description: String,
    pub license:     String,
    pub author:      String,
    #[serde(default)]
    pub tags:        Vec<String>,
    #[serde(default)]
    pub source:      Option<PackageSource>,
    #[serde(default)]
    pub compat:      Option<PackageCompat>,
}

/// `[package.source]` — upstream project links.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PackageSource {
    pub website:    Option<String>,
    pub repository: Option<String>,
}

/// `[package.compat]` — version and namespace constraints.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PackageCompat {
    /// Minimum version of the consuming application required.
    pub min_app_version: Option<String>,
    /// Which Store namespaces this package targets, e.g. `["Node"]`.
    #[serde(default)]
    pub projects: Vec<String>,
}
