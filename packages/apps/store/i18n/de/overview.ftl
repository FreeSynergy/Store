# i18n/de/overview.ftl — FreeSynergy Store Hilfetexte (Deutsch)

help-store-title = FreeSynergy Store

help-store-body =
    FreeSynergy Store ist der Paketmanager für die FreeSynergy-Plattform.
    Er verwaltet alles, was installiert werden kann: Apps, Container, Themes,
    Widgets, Icon-Sets, Sprachpakete, Tasks und Bundle-Meta-Pakete.

    Der Store liest einen Git-basierten Katalog und speichert ihn lokal,
    sodass er nach dem ersten Sync ohne Internetverbindung funktioniert.

    Wichtige Konzepte:
    - Pakete: eigenständige Einheiten mit Metadaten, Icon und Hilfetexten
    - Katalog: das Git-Repository, das alle verfügbaren Pakete definiert
    - Inventory: die lokale Aufzeichnung der installierten Pakete und Versionen
    - Release-Channels: stable (Standard), beta, nightly

help-store-install-title = Pakete installieren

help-store-install-body =
    Ein Paket auswählen, eine Version wählen oder bei „aktuellste" belassen,
    und auf Installieren klicken. Der Store löst Abhängigkeiten automatisch auf
    und installiert alles Benötigte.

    Bei Apps wird das Binary von GitHub Releases heruntergeladen und im
    konfigurierten Installationspfad abgelegt. Bei Containern wird eine
    Quadlet-Service-Datei erstellt und per systemd aktiviert.

    Nach der Installation erscheint das Paket in der Installiert-Ansicht.
    Wenn eine neuere Version verfügbar wird, erscheint ein Update-Badge in der Taskbar.

help-store-catalog-title = Katalogquellen

help-store-catalog-body =
    Standardmäßig nutzt der Store den offiziellen FreeSynergy-Katalog unter
    github.com/FreeSynergy/Store. Weitere Quellen können unter
    Einstellungen → Quellen hinzugefügt werden. Jede Quelle ist ein
    Git-Repository mit derselben Verzeichnisstruktur wie der offizielle Katalog.

    Community-Quellen sind im repos/-Namespace gelistet und können mit
    einem Klick hinzugefügt werden.

help-store-fields-title = Konfiguration

help-store-fields-body =
    STORE_CATALOG_URL — die URL des primären Katalog-Repositories.
    Ändern, um auf einen lokalen Spiegel oder einen Fork zu zeigen.

    STORE_AUTO_UPDATE — wenn aktiviert, synchronisiert der Store den Katalog
    bei jedem Start im Hintergrund. Auf luftdicht isolierten Systemen deaktivieren.
