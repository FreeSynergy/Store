# help/de/fields.ftl — OpenObserve Feld-Hilfetexte (Deutsch)

help-openobserver-field-admin-title = Admin-Zugangsdaten

help-openobserver-field-admin-body =
    ZO_ROOT_USER_EMAIL: E-Mail-Adresse für den Root-Admin-Account.
    Wird nur beim ersten Start erstellt. Zum Einloggen in die OpenObserve-UI.

    ZO_ROOT_USER_PASSWORD: Passwort für den Root-Admin-Account.
    Automatisch generiert und im Vault gespeichert.

    Diese Zugangsdaten sind nur für die initiale Einrichtung und Admin-Operationen.
    Danach weitere Benutzeraccounts anlegen (Einstellungen > Benutzer) für
    Teammitglieder, die Zugriff auf Dashboards benötigen.

    Der Root-Account nutzt immer lokale Passwort-Authentifizierung.
    Das generierte Passwort im Vault als Recovery-Credential aufbewahren.

    API-Authentifizierung ebenfalls mit diesen Zugangsdaten via HTTP-Basic-Auth:
        Authorization: Basic <base64(email:passwort)>

help-openobserver-field-storage-title = Datenverzeichnis (ZO_DATA_DIR)

help-openobserver-field-storage-body =
    Das Verzeichnis im Container, wo OpenObserve alle Daten speichert:
    - WAL (Write-Ahead Log) — eingehende, noch nicht kompaktierte Daten
    - Indexes — invertierte Indizes für Volltextsuche
    - Streams — komprimierte Spaltendaten für Logs, Metriken und Traces
    - Metadata — Dashboard-Definitionen, Alert-Regeln, Benutzereinstellungen

    Standard: /data — durch das Host-Volume unter {config_dir}/data/ gesichert.

    Speicherbedarf-Richtwerte:
    - 7 Tage Retention, ~10 Dienste: 5–10 GB
    - 30 Tage Retention, ~15 Dienste: 20–50 GB
    - 90 Tage Retention, 15+ Dienste: 100–200 GB

    OpenObserve komprimiert Daten stark (typisch 10–20x für Log-Daten).
    Tatsächlicher Verbrauch deutlich geringer als Roh-Log-Volumen.

    Festplattennutzung regelmäßig überwachen — OpenObserve löscht alte Daten
    nicht automatisch ohne konfigurierte Retention-Policies.

help-openobserver-field-ports-title = HTTP- und gRPC-Ports

help-openobserver-field-ports-body =
    ZO_HTTP_PORT (Standard: 5080):
    Haupt-API- und Dashboard-Port. Ganzer Browser-Traffic und OTLP/HTTP-Ingestion
    läuft über diesen Port. Zentinel leitet HTTPS-Traffic hierher weiter.

    ZO_GRPC_PORT (Standard: 5081):
    OTLP/gRPC-Port für Hochdurchsatz-Telemetrie-Ingestion. Vom OTel Collector
    als bevorzugte Ingestion-Methode genutzt (geringerer Overhead als HTTP).
    Dieser Port ist intern — nicht via Zentinel exponiert.

    Beide Ports müssen auf dem Host eindeutig sein.

help-openobserver-field-wal-title = WAL-Memory-Modus (ZO_WAL_MEMORY_MODE_ENABLED)

help-openobserver-field-wal-body =
    Steuert, ob eingehende Daten im Arbeitsspeicher gepuffert werden, bevor sie
    auf Disk geschrieben werden.

    "true" (Standard): WAL im Arbeitsspeicher. Deutlich höherer Ingestion-Durchsatz.
    Bei Prozess-Absturz können bis zu ~1 Sekunde Daten verloren gehen.

    "false": WAL bei jedem Schreibvorgang auf Disk geflusht. Geringerer Durchsatz,
    aber kein Datenverlust bei Absturz.

    Für die meisten Deployments ist "true" richtig: 1 Sekunde Datenverlust bei
    einem Absturz ist akzeptabel, und der Durchsatz-Gewinn ist erheblich.

help-openobserver-field-telemetry-title = Telemetrie / Phone-Home (ZO_TELEMETRY)

help-openobserver-field-telemetry-body =
    Steuert, ob OpenObserve anonyme Nutzungsstatistiken an das OpenObserve-Team sendet.

    "false" (Standard in diesem Deployment): Keine Daten werden gesendet. Privates Deployment.

    "true": Sendet aggregierte Nutzungsmetriken (keine Log-Inhalte, keine personenbezogenen
    Daten). Hilft dem Projekt bei der Feature-Priorisierung.

    In FreeSynergy-Deployments immer auf "false" gesetzt für Datenschutz.
    Nur ändern, wenn explizit Nutzungsdaten beigesteuert werden sollen.
