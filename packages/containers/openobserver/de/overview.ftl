# help/de/overview.ftl — OpenObserve-Hilfetexte (Deutsch)

help-openobserver-title = OpenObserve — Observability-Plattform

help-openobserver-body =
    OpenObserve (O2) ist eine Open-Source-Hochleistungs-Observability-Plattform
    für Logs, Metriken und verteilte Traces. Sie stellt die Monitoring- und
    Sichtbarkeitsschicht der gesamten FreeSynergy-Plattform bereit.

    Funktionen:
    - Log-Ingestion und Volltextsuche (10x günstigere Speicherung als Elasticsearch)
    - Metriken-Speicherung und -Abfragen (Prometheus-kompatibel)
    - Verteiltes Tracing (OpenTelemetry / Jaeger kompatibel)
    - Echtzeit-Dashboards und Alerts
    - SQL-basierte Abfragesprache für alle Datentypen
    - Multi-Tenant-Organisationsmodell

    In FreeSynergy senden alle Plattformdienste ihre Logs, Metriken und Traces
    via OTel Collector (otel-collector) an OpenObserve. Der Collector liest
    Podman-Container-Stats, journald-Logs und leitet alles per OTLP weiter.

    Hinweis: Die OSS-Edition von OpenObserve unterstützt kein natives OIDC.
    Für SSO-Zugriffskontrolle Zentinels Forward-Auth-Feature verwenden.

    Constraint: per_host = 1 — nur eine OpenObserve-Instanz pro Host.

help-openobserver-install-title = OpenObserve installieren

help-openobserver-install-body =
    1. Setup-Assistenten ausführen:
       - Admin-E-Mail: eigene E-Mail-Adresse (für den Root-Account)
       - Admin-Passwort: automatisch generiert und im Vault gespeichert

    2. Nach dem ersten Start unter https://logs.example.com mit den generierten
       Zugangsdaten einloggen. Die UI ist sofort nutzbar.

    3. OTel Collector neben OpenObserve installieren:
       - otel-collector als Dienst mit [load.services.openobserver] hinzufügen
       - Der Collector erkennt den OpenObserve-Endpunkt automatisch
       - Innerhalb weniger Minuten erscheinen Logs aller Container in O2

    4. Dashboards erstellen:
       - Plattform-Übersicht: Container-CPU, Arbeitsspeicher, Neustart-Anzahl
       - Dienstspezifisch: Forgejo-Commits, Stalwart-Mail-Queue-Tiefe usw.

    5. Alerts konfigurieren (Einstellungen > Alerts) für kritische Zustände:
       - Container-Neustart-Anzahl > 3 in 5 Minuten
       - HTTP-5xx-Fehlerrate > 1 %
       - Festplattennutzung > 85 %

help-openobserver-ingestion-title = Log- und Metrik-Ingestion

help-openobserver-ingestion-body =
    OpenObserve akzeptiert Daten über mehrere Protokolle:

    OTLP/HTTP (Standard):
        POST https://logs.example.com/api/{org}/v1/logs
        POST https://logs.example.com/api/{org}/v1/metrics
        POST https://logs.example.com/api/{org}/v1/traces
        Authorization: Basic <base64(email:passwort)>

    OTLP/gRPC (ZO_GRPC_PORT, Standard 5081):
        Endpunkt: logs.example.com:5081
        Vom OTel Collector für Hochdurchsatz-Ingestion verwendet.

    Der OTel-Collector-Sub-Service erledigt dies alles automatisch. Das API
    wird nur für eigene Integrationen direkt benötigt.

    Organisation: OpenObserve nutzt "default" als initialen Organisationsnamen.
    Alle vom OTel Collector ingested Daten gehen an die "default"-Org.

help-openobserver-oidc-title = Authentifizierung / SSO

help-openobserver-oidc-body =
    Die OpenObserve-OSS-Edition unterstützt kein natives OIDC. Zwei Optionen:

    Option 1 — Zentinel Forward-Auth:
    Zentinel mit Forward-Auth-Middleware konfigurieren, die Kanidm-Sessions
    validiert, bevor Anfragen an OpenObserve weitergeleitet werden. SSO auf
    Proxy-Ebene ohne OIDC-Unterstützung in OpenObserve.

    Option 2 — Lokale Accounts:
    Eingebautes Benutzermanagement (Einstellungen > Benutzer) nutzen.
    Passwörter werden in OpenObserve verwaltet — kein SSO.

    Für die meisten Deployments ist Option 2 einfacher, da OpenObserve ein
    internes Tool ist, das nur von Admins genutzt wird. Option 1 empfohlen,
    wenn viele Teammitglieder Zugriff benötigen.

    Hinweis: Der Root-Admin-Account (ZO_ROOT_USER_EMAIL) nutzt immer lokale
    Authentifizierung, unabhängig von der gewählten Option.
