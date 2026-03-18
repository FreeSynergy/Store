# FreeSynergy Store

> Repository: https://github.com/FreeSynergy/Store
> Full documentation: https://github.com/FreeSynergy/Documentation

This repository is a **data-only store** — no binaries, no compiled code.
It contains TOML manifests, configuration templates, icons, themes, widgets,
bots, task templates, and language packs for all FreeSynergy applications.

## Repository Structure

```
Store/
├── catalog.toml          ← App packages (node, desktop, init) with GitHub Release URLs
│
├── node/                 ← FreeSynergy.Node deployment modules
│   ├── catalog.toml      ← All node modules + locales (read by fsn store sync)
│   ├── modules/          ← Container-App manifests + Podman Compose templates
│   │   ├── proxy/zentinel/
│   │   ├── iam/kanidm/
│   │   ├── git/forgejo/
│   │   └── ...
│   ├── bridges/          ← Role-API bridge definitions (future)
│   ├── i18n/             ← Locale files for FreeSynergy.Node UI
│   └── store.toml        ← Trust chain manifest (Ed25519 signatures)
│
├── shared/               ← Cross-application resources
│   ├── icons/            ← SVG icons for all packages
│   │   └── defaults/     ← Fallback icons per ResourceType
│   ├── themes/           ← Theme bundles (ColorScheme + Style + FontSet + ...)
│   ├── widgets/          ← Desktop widget definitions
│   ├── bots/             ← Bot definitions
│   ├── tasks/            ← Automation task templates
│   └── i18n/             ← Shared locale snippets (future)
│
├── apps/                 ← App manifests (detailed, for Store UI display)
├── desktop/              ← FreeSynergy.Desktop specific resources (future)
└── bundles/              ← Bundle definitions (meta-packages)
```

## Distribution Model

**App packages** (node, desktop, init) are distributed as compiled binaries:
- Each program has its own GitHub repository with source code
- GitHub Actions compiles and uploads binaries on `git tag v*`
- `catalog.toml` lists download URLs per platform (`{version}` is substituted at runtime)
- No binaries in this repository — Git is for text

**Container modules** (kanidm, forgejo, etc.) live here as TOML + YAML files:
- Manifests describe services, roles, variables, healthchecks
- Templates generate Podman Quadlet configs at deploy time
- `node/catalog.toml` indexes all modules

## Icons

All icons are SVG files stored locally in `shared/icons/`.
They can originate from:
- **Homarr Dashboard Icons** (MIT) — downloaded via `fsn-builder`
- **Simple Icons** (CC0) — downloaded via `fsn-builder`
- Custom URL — provided in Builder, downloaded and stored here

The goal is offline resilience: external sources are used for initial download only.

## Consuming the Store

The store is consumed via the `fsn-store` crate (`FreeSynergy.Lib.Ext`):

```rust
let mut client = StoreClient::new(StoreSource::Http(store_url));
let catalog: Catalog<StoreEntry> = client.fetch_catalog("node", false).await?;
```

`StoreClient` fetches `{store_url}/node/catalog.toml`, parses it, and caches the result.
