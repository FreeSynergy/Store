# i18n/en/overview.ftl — FreeSynergy Store help texts (English)

help-store-title = FreeSynergy Store

help-store-body =
    FreeSynergy Store is the package manager for the FreeSynergy platform.
    It manages everything that can be installed: apps, containers, themes,
    widgets, icon sets, language packs, tasks, and bundle meta-packages.

    The Store reads a Git-based catalog and caches it locally so it works
    without an internet connection after the initial sync.

    Key concepts:
    - Packages: self-contained units with metadata, icon, and help texts
    - Catalog: the Git repository that defines all available packages
    - Inventory: the local record of what is installed and at what version
    - Release channels: stable (default), beta, nightly

help-store-install-title = Installing Packages

help-store-install-body =
    Select a package, choose a version or leave it on "latest", and click Install.
    The Store resolves dependencies automatically and installs everything required.

    For apps, the binary is downloaded from GitHub Releases and placed in the
    configured install path. For containers, a Quadlet service file is generated
    and activated via systemd.

    After installation the package appears in the Installed view. If a newer
    version becomes available, an update badge appears in the taskbar.

help-store-catalog-title = Catalog Sources

help-store-catalog-body =
    By default the Store uses the official FreeSynergy catalog at
    github.com/FreeSynergy/Store. Additional sources can be added under
    Settings → Sources. Each source is a Git repository following the same
    directory structure as the official catalog.

    Community sources are listed in the repos/ namespace and can be added
    with a single click.

help-store-fields-title = Configuration

help-store-fields-body =
    STORE_CATALOG_URL — the URL of the primary catalog repository.
    Change this to point to a local mirror or a fork.

    STORE_AUTO_UPDATE — when enabled, the Store syncs the catalog on every
    startup in the background. Disable this on air-gapped systems.
