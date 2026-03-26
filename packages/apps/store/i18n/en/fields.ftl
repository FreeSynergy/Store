# i18n/en/fields.ftl — FreeSynergy Store field help texts (English)

help-store-field-catalog-url-title = Catalog URL

help-store-field-catalog-url-body =
    The URL of the primary Store catalog Git repository.

    Default: https://github.com/FreeSynergy/Store.git

    Change this to point to a local mirror, an air-gapped copy, or a fork of
    the official catalog. The URL can be an HTTPS URL, an SSH URL, or a local
    file path (file:///path/to/catalog).

    Additional catalog sources (community repos, private packages) are managed
    separately under Settings → Sources and are not affected by this setting.

help-store-field-auto-update-title = Auto-update catalog

help-store-field-auto-update-body =
    When enabled, the Store syncs the catalog repository on every startup,
    pulling the latest package metadata in the background.

    Disable this on:
    - Air-gapped systems with no internet access
    - Systems where bandwidth is limited
    - Environments where the catalog is updated manually

    The catalog can always be synced manually via the Sync button in the toolbar.
