# help/en/overview.ftl — FreeSynergy Node help texts (English)

help-node-title = FreeSynergy Node — Deployment Engine

help-node-body =
    FreeSynergy Node is the server-side core of the FreeSynergy platform.
    It runs as a systemd service and exposes both a CLI and a REST API.
    Every other FreeSynergy program — Desktop, Container Manager, Store,
    Browser — communicates with Node through the API.

    Core responsibilities:
    - Project management: create, list, and manage FreeSynergy projects
    - Host management: register and configure deployment targets
    - Package lifecycle: install, update, and remove packages on hosts
    - S3-compatible storage server: profiles, backups, media, and secrets
    - Federation: connect multiple FreeSynergy nodes into a network
    - Message bus: route events between services on the same host

    Node is marked protected = true in the Store — it cannot be removed
    while it is the active node for any project.

help-node-cli-title = CLI and API

help-node-cli-body =
    Every CLI command maps directly to a REST API endpoint. The CLI is
    a thin wrapper — anything you can do with the CLI, you can also do
    with a plain HTTP request to the API.

    Common commands:
        fsn project list          — list all projects
        fsn project create <name> — create a new project
        fsn host list             — list registered hosts
        fsn package install <id>  — install a package on the active host
        fsn package remove <id>   — remove a package
        fsn deploy                — apply all pending changes and restart services

    The API is documented at /api/docs on a running Node instance.

help-node-storage-title = S3-Compatible Storage

help-node-storage-body =
    Node provides a built-in S3-compatible storage server that other services
    use for file storage, backups, and media. It is accessible within the
    FreeSynergy Podman network at http://fs-node:9000.

    Default buckets created automatically:
    - profiles — user profile pictures and assets
    - backups  — automated service backups
    - media    — uploaded files from services (Forgejo attachments, etc.)

    The storage root is configured at startup and defaults to
    {data_root}/s3. All data is stored as plain files — no special
    format or database.

help-node-federation-title = Federation

help-node-federation-body =
    Federation allows multiple FreeSynergy nodes to share projects, users,
    and resources. A federated node can:
    - Act as a package mirror for other nodes
    - Share user identities (via Kanidm trust)
    - Host services on behalf of a primary node

    Federation is configured in host.toml under [federation]. Trust levels:
    0 — No federation (isolated node)
    1 — Basic (package mirror, read-only profile access)
    2 — Full (SSO, shared projects, delegated services)
