# help/de/fields.ftl — Outline Feld-Hilfetexte (Deutsch)

help-outline-field-secret-key-title = Geheimschlüssel (SECRET_KEY / UTILS_SECRET)

help-outline-field-secret-key-body =
    Outline benötigt zwei separate Geheimschlüssel:

    SECRET_KEY: Signiert Authentifizierungs-Cookies und Session-Tokens. Mindestens
    32 zufällige Zeichen. Automatisch generiert und im Vault gespeichert.

    UTILS_SECRET: Für interne Utility-Anfragen wie Dateiexport-Links und
    geplante Job-Tokens. Ebenfalls automatisch generiert.

    Wichtig: Beide Schlüssel stabil halten. SECRET_KEY rotieren macht alle aktiven
    Benutzer-Sessions ungültig — alle Benutzer werden ausgeloggt. UTILS_SECRET
    rotieren macht laufende Exporte und geplante Operationen ungültig.

help-outline-field-oidc-title = OIDC-Client-Zugangsdaten

help-outline-field-oidc-body =
    Outline nutzt OIDC (OpenID Connect) für die Benutzerauthentifizierung via Kanidm.

    OIDC_CLIENT_ID: Der OAuth2-Client-Name in Kanidm (Standard: "outline").
    Muss exakt mit dem Kanidm-Client-Namen übereinstimmen — Groß-/Kleinschreibung beachten.

    OIDC_CLIENT_SECRET: Das Client-Secret, das Kanidm beim Registrieren der
    "outline"-OAuth2-Anwendung generiert. Im Vault gespeichert.

    Die OIDC_*_URI-Variablen werden automatisch aus der Kanidm-Service-Domain abgeleitet
    und zeigen auf:
        https://<kanidm_domain>/ui/oauth2
        https://<kanidm_domain>/oauth2/token
        https://<kanidm_domain>/oauth2/openid/outline/userinfo
        https://<kanidm_domain>/ui/logout

    OIDC_USERNAME_CLAIM: "preferred_username" mappt auf den Kanidm-Benutzernamen.
    Auf "email" ändern, wenn E-Mail-Adressen als Outline-Anzeigenamen bevorzugt werden.

    OIDC_DISPLAY_NAME: Bezeichnung auf der "Anmelden mit …"-Schaltfläche.

help-outline-field-upload-size-title = Maximale Upload-Größe

help-outline-field-upload-size-body =
    FILE_STORAGE_UPLOAD_MAX_SIZE steuert die maximale Größe eines einzelnen
    Datei-Uploads (Bilder, Anhänge usw.) in Bytes.

    Standard: 262144000 Bytes = 250 MB

    Richtwerte:
    - 52428800  =  50 MB (konservativ, hauptsächlich Textdokumente)
    - 262144000 = 250 MB (Standard, für die meisten Teams geeignet)
    - 524288000 = 500 MB (für Teams mit großen Design-Dateien oder Videos)

    Hinweis: Große Uploads erfordern auch ausreichend Speicherplatz im
    Volume und ggf. Anpassung des Request-Body-Limits in Zentinel.

help-outline-field-language-title = Standardsprache

help-outline-field-language-body =
    DEFAULT_LANGUAGE setzt die UI-Sprache für neue Benutzer beim ersten Login.
    Outline unterstützt viele Locales — Standard-Locale-Code-Format verwenden.

    Häufige Werte:
    - en_US: Englisch (USA) — Standard
    - de_DE: Deutsch (Deutschland)
    - fr_FR: Französisch (Frankreich)
    - es_ES: Spanisch (Spanien)
    - ja_JP: Japanisch (Japan)

    Einzelne Benutzer können dies in ihren Profileinstellungen überschreiben.

help-outline-field-db-pool-title = Datenbankverbindungs-Pool

help-outline-field-db-pool-body =
    DATABASE_CONNECTION_POOL_MIN: Minimale Anzahl offengehaltener Idle-Verbindungen.
    DATABASE_CONNECTION_POOL_MAX: Maximale Anzahl gleichzeitiger Verbindungen.

    Beide standardmäßig leer (Outline nutzt interne Defaults: min=1, max=5).

    Wann anpassen:
    - Hoher Traffic (50+ aktive Benutzer): max auf 10–20 erhöhen
    - Speicherbegrenzter Host: max auf 2–3 reduzieren
    - Schnelle Antwortzeiten erforderlich: min erhöhen für vorgewärmte Verbindungen

    Niemals max höher als PostgreSQL's max_connections setzen.
