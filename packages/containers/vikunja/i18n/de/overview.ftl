# help/de/overview.ftl — Vikunja-Hilfetexte (Deutsch)

help-vikunja-title = Vikunja — Open-Source-Aufgabenverwaltung

help-vikunja-body =
    Vikunja ist eine Open-Source-Aufgabenverwaltungs- und To-Do-Liste-Anwendung.
    Sie stellt die Aufgabenverfolgung und Projektmanagement-Schicht der
    FreeSynergy-Plattform bereit.

    Funktionen:
    - Mehrere Ansichten: Liste, Kanban-Board, Gantt-Diagramm, Kalender
    - Projekte mit verschachtelten Aufgaben und Unteraufgaben
    - Fälligkeitsdaten, Erinnerungen, Prioritäten und Labels
    - Aufgabenzuweisungen (Aufgaben Teammitgliedern zuweisen)
    - Wiederkehrende Aufgaben
    - Dateianhänge
    - Team-Workspaces mit granularen Berechtigungen
    - API für Automatisierung und Integrationen
    - OIDC/SSO-Authentifizierung via Kanidm
    - E-Mail-Erinnerungen (via Stalwart oder beliebigen SMTP-Server)

    Abhängigkeiten: PostgreSQL (Aufgabendaten), Dragonfly (Caching, Redis DB 3),
    Kanidm (SSO), optional Stalwart (E-Mail-Erinnerungen).

    Constraint: per_host = 1, per_ip = 1.

help-vikunja-install-title = Vikunja installieren

help-vikunja-install-body =
    1. Vor der Installation OAuth2-Client in Kanidm anlegen:
       - Client-Name: "vikunja"
       - Redirect-URI: https://tasks.example.com/auth/openid/vikunja
       - Scopes: openid, email, profile
       - Client-Secret notieren.

    2. Setup-Assistenten ausführen:
       - Service-Domain (z. B. tasks.example.com)
       - JWT-Secret (automatisch generiert)
       - Datenbankpasswort (automatisch generiert)

    3. OIDC in config.yml konfigurieren (vom deploy-setup-Hook generiert):
         auth:
           openid:
             enabled: true
             providers:
               - name: "Kanidm"
                 authurl: "https://auth.example.com/oauth2/openid/vikunja"
                 clientid: "vikunja"
                 clientsecret: "<aus-Kanidm>"

    4. Nach dem ersten Start kann jeder OIDC-eingeloggte Benutzer Aufgaben erstellen.
       Der erste OIDC-Benutzer wird NICHT automatisch Admin — per Admin-API
       oder temporärem lokalem Auth befördern.

    5. Benutzer zum Admin machen:
         podman exec {instance_name} /app/vikunja/vikunja user set-admin <benutzername>

help-vikunja-oidc-title = OIDC und Authentifizierung

help-vikunja-oidc-body =
    Vikunja unterstützt zwei Authentifizierungsmodi:

    OIDC (empfohlen): Benutzer melden sich über Kanidm an.
    Keine lokalen Passwörter nötig:
        VIKUNJA_AUTH_OPENID_ENABLED = "true"

    Lokal: Benutzer haben Benutzername/Passwort in Vikunjas Datenbank.
    Kann mit OIDC koexistieren:
        VIKUNJA_AUTH_LOCAL_ENABLED = "true"/"false"

    Für FreeSynergy-Deployments empfohlenes Setup:
    - OIDC: aktiviert (Kanidm als Provider)
    - Lokales Auth: deaktiviert (VIKUNJA_AUTH_LOCAL_ENABLED = "false")

    Das erzwingt Authentifizierung über Kanidm für alle Benutzer und stellt
    eine einheitliche Identität plattformweit sicher.

    Hinweis: Vikunjas OIDC-Konfiguration erfolgt in config.yml (nicht in
    Umgebungsvariablen). Der deploy-setup-Hook generiert diese Datei.

help-vikunja-mail-title = E-Mail-Erinnerungen

help-vikunja-mail-body =
    Vikunja sendet E-Mails für:
    - Aufgaben-Erinnerungen (Fälligkeits-Benachrichtigungen)
    - Team-Einladungs-E-Mails
    - Erwähnungs-Benachrichtigungen

    Konfiguration:
        VIKUNJA_MAILER_ENABLED:   "true" zum Aktivieren
        VIKUNJA_MAILER_HOST:      SMTP-Server (z. B. Stalwart-Container-Name)
        VIKUNJA_MAILER_PORT:      587 (STARTTLS) oder 465 (implizites TLS)
        VIKUNJA_MAILER_USERNAME:  SMTP-Authentifizierungsname
        VIKUNJA_MAILER_PASSWORD:  SMTP-Passwort (im Vault gespeichert)
        VIKUNJA_MAILER_FROMEMAIL: Absenderadresse (z. B. tasks@example.com)

    Mit Stalwart: HOST auf den Stalwart-Container-Namen setzen, PORT auf 587.
    Dediziertes Postfach in Stalwart für die Aufgaben-Absenderadresse anlegen.

    Erinnerungen werden basierend auf VIKUNJA_SERVICE_TIMEZONE geplant. Die
    Zeitzone sollte der der meisten Benutzer entsprechen.
