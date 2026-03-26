# i18n/de/overview.ftl — FreeSynergy Builder Hilfetexte (Deutsch)

help-builder-title = FreeSynergy Builder

help-builder-body =
    FreeSynergy Builder ist das Werkzeug zum Erstellen von FreeSynergy-Paketen und
    zu deren Veröffentlichung im Store-Katalog.

    Er unterstützt alle Pakettypen: Apps, Container, Themes, Widgets, Tasks, Icon-Sets
    und Sprachpakete. Der geführte Assistent führt durch jedes erforderliche Feld und
    jede Datei und validiert das Paket vor der Veröffentlichung.

    Für Container-Pakete ist der Docker-Compose-Importer der schnellste Weg: eine
    Compose-Datei einfügen oder hochladen und Builder generiert das Quadlet-Service-Template,
    erkennt Variablen, leitet ihre Typen ab und erstellt Stub-Hilfetexte.

help-builder-compose-title = Docker-Compose-Import

help-builder-compose-body =
    Eine docker-compose.yml in den Import-Dialog einfügen. Builder analysiert sie und:
    - Ordnet jeden Dienst einem Podman-Quadlet-Service-Datei-Template zu
    - Erkennt Umgebungsvariablen und leitet ihre Typen ab (string, bool, int, port, url)
    - Weist erkannten Variablen Rollen zu (z.B. POSTGRES_PASSWORD → role: db_password)
    - Generiert eine catalog.toml mit allen erforderlichen vorausgefüllten Feldern
    - Erstellt Stub-description.ftl- und fields.ftl-Dateien zur Übersetzung

    Ergebnis prüfen, Beschreibungstext ausfüllen, und das Paket ist bereit für
    Validierung und Veröffentlichung.

help-builder-validate-title = Paket-Validierung

help-builder-validate-body =
    Builder führt dieselben CI-Vollständigkeitsregeln wie der Store-Katalog-CI aus:
    - Erforderliche Dateien vorhanden (catalog.toml, icon.svg, description.ftl)
    - overview.ftl für App- und Container-Typen erforderlich
    - fields.ftl erforderlich, wenn [[variables]] definiert sind
    - icon.svg ist ein gültiges SVG mit viewBox-Attribut
    - Keine Binär-Dateien im Paket-Verzeichnis

    Validierungsfehler werden mit Erklärungen zur Behebung inline angezeigt.
    Der Veröffentlichen-Button ist nur aktiviert, wenn alle Prüfungen bestanden sind.
