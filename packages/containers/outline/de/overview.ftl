# help/de/overview.ftl — Outline-Hilfetexte (Deutsch)

help-outline-title = Outline — Kollaboratives Wiki & Wissensbasis

help-outline-body =
    Outline ist ein modernes, Open-Source-Wiki und eine Wissensbasis mit einer
    sauberen, Notion-ähnlichen Bearbeitungserfahrung. Es dient als Dokumentations-
    und Wissensmanagement-Schicht der FreeSynergy-Plattform.

    Funktionen:
    - Echtzeit-kollaboratives Bearbeiten
    - Rich-Markdown-Editor mit Slash-Befehlen
    - Verschachtelte Dokumentensammlungen mit automatischem Inhaltsverzeichnis
    - Volltextsuche mit sofortigen Ergebnissen
    - Dokumenthistorie und Versionsvergleich
    - Datei- und Bild-Anhänge
    - Öffentliches Teilen mit optionalem Passwortschutz
    - API für programmatischen Dokumentenzugriff
    - OIDC/SSO-Authentifizierung

    Abhängigkeiten: PostgreSQL (Dokumente und Benutzerdaten), Dragonfly (Caching,
    Sessions), Kanidm (SSO), optional Stalwart (E-Mail-Einladungen).

    Alle Dokumente werden in PostgreSQL gespeichert. Hochgeladene Dateien und Bilder
    werden im lokalen Volume (FILE_STORAGE = "local") oder in einem S3-kompatiblen
    Bucket gespeichert.

help-outline-install-title = Outline installieren

help-outline-install-body =
    1. Vor der Installation OAuth2-Client in Kanidm anlegen:
       - Client-Name: "outline"
       - Redirect-URI: https://wiki.example.com/auth/oidc.callback
       - Scopes: openid, email, profile
       - Client-Secret notieren.

    2. Setup-Assistenten ausführen. Pflichtfelder:
       - Service-Domain (z. B. wiki.example.com)
       - OIDC-Client-Secret aus Kanidm
       - Secret Key und Utils Secret (automatisch generiert)

    3. Nach dem ersten Start wird der erste Benutzer, der sich via OIDC anmeldet,
       zum Admin. Collections anlegen und Teammitglieder einladen.

    4. E-Mail konfigurieren (optional) für Einladungs-E-Mails und Benachrichtigungen.

    Hinweis: Outline benötigt Node.js (NODE_ENV = "production" erforderlich).
    Health-Check-Endpunkt: /_health.

help-outline-storage-title = Dateispeicherung

help-outline-storage-body =
    Outline unterstützt zwei Datei-Speicher-Backends:

    1. Lokaler Speicher (Standard, FILE_STORAGE = "local"):
       Dateien werden im Container-Volume unter /var/lib/outline/data gespeichert.
       Eingebunden von {config_dir}/data auf dem Host.
       Einfach einzurichten, aber nicht horizontal skalierbar.

    2. S3-Speicher (FILE_STORAGE = "s3"):
       Dateien werden in einem S3-kompatiblen Bucket gespeichert. Erfordert
       zusätzliche Umgebungsvariablen für S3-Zugangsdaten und Bucket-URL.
       Der eingebaute FreeSynergy S3-Server (Teil von fs-node) kann als Backend
       dienen.

    Dateigrößenlimit: FILE_STORAGE_UPLOAD_MAX_SIZE (Bytes). Standard 250 MB.

    Backup: Das Daten-Volume enthält alle hochgeladenen Dateien. Zusammen mit
    dem PostgreSQL-Dump sichern.

help-outline-mail-title = E-Mail-Konfiguration

help-outline-mail-body =
    Outline sendet E-Mails für:
    - Team-Einladungen (Benutzer per E-Mail-Adresse einladen)
    - Erwähnungs-Benachrichtigungen
    - Dokumentenaktivitäts-Zusammenfassungen

    Konfiguration:
        SMTP_HOST:       Mailserver-Hostname (z. B. Stalwart-Container-Name)
        SMTP_PORT:       587 (STARTTLS) oder 465 (implizites TLS)
        SMTP_USERNAME:   SMTP-Authentifizierungsname
        SMTP_PASSWORD:   SMTP-Passwort (vault_outline_smtp_password)
        SMTP_FROM_EMAIL: Absenderadresse (z. B. wiki@example.com)
        SMTP_REPLY_EMAIL: Reply-To-Adresse
        SMTP_SECURE:     "true" (immer in der Produktion)

    Mit Stalwart: SMTP_HOST auf den Stalwart-Container-Namen setzen, PORT auf 587.
    Dediziertes Postfach in Stalwart für die Wiki-Absenderadresse anlegen.
