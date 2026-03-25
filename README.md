# FreeSynergy Store

The official FreeSynergy package registry — apps, containers, themes, languages, widgets, icon sets, tasks, and more.

## Namespaces

All packages live under `packages/`. The root `catalog.toml` lists all namespaces.

| Namespace | Type | Description |
|---|---|---|
| `init/` | bootstrap | Bootstrap package — not installable, only downloadable |
| `packages/apps/` | app | Native Rust binaries (kanidm, stalwart, tuwunel, zentinel, …) |
| `packages/bundles/` | bundle | Meta-packages referencing other packages by id |
| `packages/containers/` | container | Podman/Docker containers (forgejo, postgres, outline, …) |
| `packages/external/` | external | Non-self-hostable services (Telegram, Discord, …) — metadata only |
| `packages/i18n/` | language | Language packs — shared UI translation snippets (51 languages) |
| `packages/icons/` | icon_set | SVG icon sets |
| `packages/repos/` | repo | Additional Store repository sources |
| `packages/tasks/` | task | Community automation templates |
| `packages/themes/` | theme | Visual themes with color variables |
| `packages/widgets/` | widget | Desktop widgets |

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
└── i18n/                  ← Translations (at least en/ is MANDATORY)
    ├── en/
    │   ├── description.ftl    ← Long description for Store detail view
    │   ├── overview.ftl       ← Help overview shown in the manager UI
    │   └── fields.ftl         ← Field-level help for config variables
    └── de/                    ← German (and other ISO-639-1 codes)
        └── ...
```

External packages (`type = "external"`) have only `catalog.toml`, `icon.svg`, and `i18n/` — no `templates/`.

## Language packs (`packages/i18n/`)

Each language pack is identified by its ISO 639-1 code (e.g. `de`, `en`, `fr`) and contains shared
UI translation snippets used across all FreeSynergy programs:

```
packages/i18n/{lang}/
├── catalog.toml       ← Package metadata (locale, direction, coverage)
├── icon.svg           ← Language/flag icon
├── actions.toml       ← Verb actions (save, cancel, delete, …)
├── labels.toml        ← UI labels and headings
├── nouns.toml         ← Common nouns (file, user, package, …)
├── errors.toml        ← Error messages
├── confirmations.toml ← Confirmation dialogs
├── notifications.toml ← System notifications
├── phrases.toml       ← Common phrases
├── status.toml        ← Status strings (running, stopped, pending, …)
├── time.toml          ← Time and date expressions
├── validation.toml    ← Form validation messages
└── help.toml          ← General help text snippets
```

Note: Language packs do **not** use `i18n/` sub-folders for their own description — metadata is
inline in `catalog.toml`. Using `i18n/lang/` inside a language pack would create circular paths.

## Themes (`packages/themes/`)

Themes define platform-wide CSS variables. The `[colors]` section in `catalog.toml` is the
authoritative color definition — programs read these on startup and apply their own prefix:

```toml
[colors]
bg_base       = "#0f172a"
primary       = "#00bcd4"
# ... (see individual theme catalog.toml for full color set)
```

## catalog.toml mandatory fields

```toml
[package]
summary          = "..."    # ≤255 chars — shown in lists and search
description      = "..."    # inline medium-length description
description_file = "i18n/en/description.ftl"

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

## API compatibility rule

APIs never produce errors on unknown fields. If a new field is added, old implementations silently
ignore it. A warning is shown in the UI, but the system keeps running.

## Adding a package

1. Create `packages/{namespace}/{name}/`
2. Write `catalog.toml` — `summary`, `description`, and `description_file` are **mandatory**
3. Add `icon.svg`
4. Add `templates/` with all required Jinja2 templates
5. Add `i18n/en/description.ftl`, `i18n/en/overview.ftl`, and `i18n/en/fields.ftl` (if config variables exist)
6. The CI validator rejects commits with incomplete or broken packages

## Versioning

Versioning is handled via Git — tags, branches, or commit refs. No `v2/` subdirectories.
