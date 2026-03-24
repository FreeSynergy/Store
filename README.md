# FreeSynergy Store

The official FreeSynergy package registry — apps, containers, themes, languages, widgets, bots, tasks, bridges, and icon sets.

## Structure

```
Store/
├── catalog.toml                    ← Namespace index (read first by StoreClient)
├── icon.svg
├── init/                           ← Bootstrap package (type: bootstrap)
│   └── catalog.toml
└── packages/
    ├── apps/                       ← Native Rust binaries
    ├── containers/                 ← Container apps (Podman or Docker)
    ├── widgets/                    ← Desktop widgets
    ├── themes/                     ← Visual themes
    ├── i18n/                       ← Shared language snippets
    ├── icons/                      ← Icon sets (overridable)
    ├── repos/                      ← Additional store repository sources
    ├── bots/                       ← Bot definitions
    ├── tasks/                      ← Automation templates
    ├── bridges/                    ← Service-to-service bridges
    └── bundles/                    ← Meta-packages
```

## Package layout

Every package lives in its own directory and is self-describing:

```
packages/{namespace}/{name}/
├── catalog.toml           ← Full package description (type, summary, description, tags, …)
├── icon.svg               ← Mandatory SVG icon
├── help/
│   ├── en/
│   │   ├── description.ftl    ← Long description (used in docs)
│   │   ├── overview.ftl       ← Help overview shown in the manager
│   │   └── fields.ftl         ← Field-level help for config variables
│   └── de/
│       └── ...
└── templates/             ← Config templates (only where needed)
```

## Adding a package

1. Create `packages/{namespace}/{name}/`
2. Write `catalog.toml` — all three description fields are **mandatory**
3. Add `icon.svg`
4. Add `help/en/description.ftl` (and translations)
5. The CI validator will reject commits with broken or incomplete packages

## Description levels (all mandatory)

| Field              | Max    | Where shown                        |
|--------------------|--------|------------------------------------|
| `summary`          | 255ch  | Store card, search, sidebar        |
| `description`      | free   | Store detail view (inline)         |
| `description_file` | path   | `help/en/description.ftl` — docs  |
