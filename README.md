# FreeSynergy Store

The official FreeSynergy package registry — apps, containers, external services, themes, languages, widgets, tasks, and icon sets.

## Namespaces

| Namespace | Type | Description |
|---|---|---|
| `init/` | bootstrap | Bootstrap package — not installable, only downloadable |
| `bundles/` | bundle | Meta-packages referencing other packages |
| `themes/` | theme | Visual themes |
| `packages/apps/` | app | Native Rust binaries (kanidm, stalwart, tuwunel, zentinel, …) |
| `packages/containers/` | container | Podman/Docker containers (forgejo, postgres, outline, …) |
| `packages/external/` | external | Non-self-hostable services (Telegram, Discord, …) — metadata only |
| `packages/widgets/` | widget | Desktop widgets |
| `packages/i18n/` | language | Language packs |
| `packages/icons/` | icon_set | SVG icon sets |
| `packages/tasks/` | task | Community automation templates |
| `packages/repos/` | repo | Additional store repository sources |

## Package layout

Every installable package (`app`, `container`, `task`) is self-describing:

```
packages/{namespace}/{name}/
├── catalog.toml           ← Full description + deployment spec (MANDATORY)
├── icon.svg               ← SVG icon (MANDATORY)
├── templates/             ← Jinja2 config templates + scripts (MANDATORY for installable types)
│   ├── *.toml.j2          ← App config templates
│   ├── *.service          ← systemd units
│   ├── *.container.j2     ← Podman Quadlet (containers)
│   └── scripts/
│       ├── pre-install.sh
│       ├── post-install.sh
│       ├── pre-remove.sh
│       └── post-remove.sh
├── en/                    ← English (MANDATORY)
│   ├── description.ftl    ← Long description for Store detail view
│   ├── overview.ftl       ← Help overview shown in the manager UI
│   └── fields.ftl         ← Field-level help for config variables
└── de/                    ← German (and other ISO-639-1 codes)
    └── ...
```

External packages (`type = "external"`) have only `catalog.toml`, `icon.svg`, and locale dirs — no `templates/`.

## catalog.toml mandatory fields

```toml
[package]
summary          = "..."    # ≤255 chars — shown in lists and search
description      = "..."    # inline medium-length description
description_file = "en/description.ftl"

[provides]
apis = ["messenger.send", "messenger.receive"]   # capabilities this package provides

[requires]
apis = ["iam.oidc-provider"]                     # capabilities this package needs
```

## Feature flags

Packages can declare optional features that users toggle on/off:

```toml
[[features]]
id      = "ldap"
label   = "LDAP Interface"
default = false
```

Feature flag values are stored in `fs-db` (InventoryObject), not in this repo.

## API compatibility rule

APIs never produce errors on unknown fields. If a new field is added to an API, old implementations silently ignore it. A warning is shown in the UI, but the system keeps running.

## Adding a package

1. Create `packages/{namespace}/{name}/`
2. Write `catalog.toml` — all three description fields are **mandatory**
3. Add `icon.svg`
4. Add `templates/` with all required Jinja2 templates
5. Add `en/description.ftl`, `en/overview.ftl`, and `en/fields.ftl` (if variables exist)
6. The CI validator rejects commits with incomplete or broken packages

## Versioning

Versioning is handled via Git — tags, branches, or commit refs. No `v2/` subdirectories.
