store-description =
    FreeSynergy Store is the unified package manager for the FreeSynergy platform.

    It reads the Store catalog — a Git repository containing package metadata,
    icons, and help texts — and provides a graphical interface for discovering,
    installing, updating, and removing packages of all types: apps, containers,
    themes, widgets, icon sets, language packs, tasks, and bundles.

    The Store is itself a package and can be installed and updated through itself.
    It is bootstrapped by fs-init on first setup and runs independently of Node.

store-features =
    - Browse all package types: apps, containers, themes, widgets, and more
    - Install, update, and remove packages with dependency resolution
    - Version pinning: track latest, pin to major, minor, or exact version
    - Release channels: stable, beta, nightly
    - Offline-first: local catalog cache, no internet required after sync
    - Multiple catalog sources: add community or private repositories
    - Bus-driven: other programs can trigger installs via the message bus
