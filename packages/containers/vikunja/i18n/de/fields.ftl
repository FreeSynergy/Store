# help/de/fields.ftl — Vikunja Feld-Hilfetexte (Deutsch)

help-vikunja-field-jwt-secret-title = JWT-Secret (VIKUNJA_SERVICE_JWTSECRET)

help-vikunja-field-jwt-secret-body =
    Der kryptografische Schlüssel zum Signieren von JWT-Authentifizierungstoken.
    Jede Benutzer-Session wird durch ein signiertes JWT gesichert. Automatisch
    generiert und im Vault gespeichert.

    Diesen Key rotieren macht ALLE aktiven Benutzer-Sessions sofort ungültig.
    Alle Benutzer werden ausgeloggt und müssen sich erneut anmelden. Nur rotieren,
    wenn der Schlüssel kompromittiert wurde.

    Vikunja-JWTs laufen standardmäßig nach 48 Stunden ab. Der JWT-Key muss
    nicht regelmäßig rotiert werden — nur bei Kompromittierungs-Verdacht.

help-vikunja-field-timezone-title = Zeitzone (VIKUNJA_SERVICE_TIMEZONE)

help-vikunja-field-timezone-body =
    Die Zeitzone für:
    - Fälligkeitsdaten-Berechnung und -Anzeige
    - E-Mail-Erinnerungs-Planung
    - Generierung wiederkehrender Aufgaben

    IANA-Zeitzonennamen verwenden (z. B. "Europe/Berlin", "America/New_York",
    "Asia/Tokyo", "UTC").

    Standard: "Europe/Berlin"

    Auf die Zeitzone der meisten Teammitglieder setzen. Einzelne Benutzer
    können diese in ihren persönlichen Einstellungen überschreiben.

    Wichtig: Änderung nach der initialen Einrichtung kann bestehende
    Fälligkeitsdaten verschieben. Team vor Änderung der Server-Zeitzone informieren.

help-vikunja-field-local-auth-title = Lokale Authentifizierung (VIKUNJA_AUTH_LOCAL_ENABLED)

help-vikunja-field-local-auth-body =
    Steuert, ob Benutzer Accounts anlegen und sich mit lokalem Benutzername/Passwort
    anmelden können (ohne OIDC).

    "false" (Standard): Alle Authentifizierung muss über OIDC (Kanidm) erfolgen.
    Benutzer können keine lokalen Accounts anlegen oder sich mit Passwort anmelden.
    Erzwingt eine einheitliche Identität plattformweit.

    "true": Benutzer können sich auch mit lokalem Passwort registrieren und anmelden.
    Nützlich als Fallback wenn OIDC vorübergehend nicht verfügbar ist.

    Tipp: In der Produktion auf "false" halten und einen lokalen CLI-Admin-Account
    via Vikunja-CLI für Notfallzugang pflegen.

help-vikunja-field-redis-db-title = Redis-Datenbank-Index (VIKUNJA_REDIS_DB)

help-vikunja-field-redis-db-body =
    Der Dragonfly/Redis-Datenbank-Index, den Vikunja für Caching und Queues nutzt.
    Standard: 3

    Dieser Index wurde bewusst gewählt, um Konflikte mit anderen Diensten auf
    derselben Dragonfly-Instanz zu vermeiden:
    - 0, 1, 2: von Forgejo genutzt (Cache, Sessions, Queues)
    - 3: Vikunja
    - 4, 5, 6: pretix (Sessions, Celery-Broker, Ergebnisse)

    Nicht ändern, außer ein anderer Dienst nutzt ebenfalls Index 3.
    Für neue Dienste freie Indizes (7–15) zuweisen und die Zuteilung dokumentieren.

help-vikunja-field-mailer-title = Mailer-Einstellungen (VIKUNJA_MAILER_*)

help-vikunja-field-mailer-body =
    VIKUNJA_MAILER_ENABLED: "true" zum Aktivieren des E-Mail-Versands.

    VIKUNJA_MAILER_HOST: Hostname des SMTP-Servers.
    Mit Stalwart: Stalwart-Container-Namen verwenden (z. B. "stalwart-01").

    VIKUNJA_MAILER_PORT: 587 für STARTTLS (empfohlen mit Stalwart), 465 für implizites TLS.

    VIKUNJA_MAILER_FROMEMAIL: "Von"-Adresse für alle Vikunja-E-Mails.
    Muss ein gültiges Postfach auf dem SMTP-Server sein.
    Standard: "tasks@{project_domain}"

    VIKUNJA_MAILER_USERNAME / VIKUNJA_MAILER_PASSWORD:
    SMTP-Authentifizierungsdaten. Beide im Vault gespeichert.

    Ohne E-Mail: VIKUNJA_MAILER_ENABLED = "false" setzen. Aufgaben-Erinnerungen
    werden in der App angezeigt, aber nicht per E-Mail gesendet.
