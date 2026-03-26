# i18n/de/fields.ftl — FreeSynergy Store Feldhilfetexte (Deutsch)

help-store-field-catalog-url-title = Katalog-URL

help-store-field-catalog-url-body =
    Die URL des primären Store-Katalog-Git-Repositories.

    Standard: https://github.com/FreeSynergy/Store.git

    Hier einen lokalen Spiegel, eine offline-Kopie oder einen Fork des offiziellen
    Katalogs eintragen. Die URL kann eine HTTPS-URL, eine SSH-URL oder ein lokaler
    Dateipfad sein (file:///pfad/zum/katalog).

    Weitere Katalogquellen (Community-Repos, private Pakete) werden separat unter
    Einstellungen → Quellen verwaltet und werden von dieser Einstellung nicht beeinflusst.

help-store-field-auto-update-title = Katalog automatisch aktualisieren

help-store-field-auto-update-body =
    Wenn aktiviert, synchronisiert der Store das Katalog-Repository bei jedem Start
    und lädt die neuesten Paket-Metadaten im Hintergrund.

    Deaktivieren auf:
    - Luftdicht isolierten Systemen ohne Internetzugang
    - Systemen mit begrenzter Bandbreite
    - Umgebungen, in denen der Katalog manuell aktualisiert wird

    Der Katalog kann jederzeit manuell über den Sync-Button in der Toolbar
    synchronisiert werden.
