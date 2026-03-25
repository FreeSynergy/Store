# help/de/fields.ftl — pretix Feld-Hilfetexte (Deutsch)

help-pretix-field-instance-name-title = Instanzname (PRETIX_PRETIX_INSTANCE_NAME)

help-pretix-field-instance-name-body =
    Der Name dieser pretix-Installation wird angezeigt in:
    - Der Kopfzeile des pretix-Control-Panels
    - E-Mail-Betreffs und -Fußzeilen („Powered by {instance_name}")
    - Ticket-PDFs

    Standard: „{project_domain} Tickets" (z. B. „example.com Tickets")

    Ändern Sie ihn in den Namen Ihrer Organisation oder Veranstaltungsreihe. Beispiele:
    - „Linux Conference EU Tickets"
    - „Example.com Events"
    - „TechMeetup Anmeldung"

    Der Name kann jederzeit im pretix-Admin-Panel aktualisiert werden:
    Systemeinstellungen > Allgemein > Installationsname

help-pretix-field-currency-title = Standardwährung (PRETIX_PRETIX_CURRENCY)

help-pretix-field-currency-body =
    Die Standardwährung für neue Events. Verwendet ISO-4217-Währungscodes.

    Häufige Werte:
    - EUR: Euro (Standard)
    - USD: US-Dollar
    - GBP: Britisches Pfund
    - CHF: Schweizer Franken

    Dies ist nur der STANDARD — jedes Event kann in seinen individuellen
    Einstellungen eine andere Währung verwenden. Events mit unterschiedlichen
    Währungen können in derselben pretix-Installation nebeneinander existieren.

    Wichtig: Die Währung beeinflusst, welche Zahlungsanbieter verfügbar sind.
    Einige Stripe-Konfigurationen sind währungsspezifisch.

help-pretix-field-locale-title = Locale-Einstellungen

help-pretix-field-locale-body =
    PRETIX_LOCALE_DEFAULT: Standardsprache für Shop und Organizer-Oberfläche.
    ISO-639-1-Sprachcode.

    Häufige Werte: de (Deutsch), en (Englisch), fr (Französisch), es (Spanisch)

    PRETIX_LOCALE_TIMEZONE: Standardzeitzone für Eventdaten und Zeitpläne.
    IANA-Zeitzonenname (z. B. „Europe/Berlin"). Pro Event überschreibbar.

    PRETIX_LANGUAGES_ENABLED: Kommagetrennte Liste verfügbarer Sprachen.
    Standard: „de,en" (Deutsch und Englisch für Shop-Besucher verfügbar).

    LANGUAGES_ENABLED auf Sprachen beschränken, für die Übersetzungen vorhanden sind.
    pretix unterstützt 30+ Sprachen, aber Organizer-/Admin-Oberflächen können bei
    weniger verbreiteten Sprachen nur teilweise übersetzt sein.

    Alle Locale-Einstellungen können pro Organizer und pro Event im
    pretix-Control-Panel überschrieben werden.

help-pretix-field-automigrate-title = Automatische Migration (AUTOMIGRATE)

help-pretix-field-automigrate-body =
    Steuert, ob Django-Datenbankmigrationen beim Start automatisch ausgeführt werden.

    „yes" (Standard): Migrationen laufen vor dem Start des pretix-Prozesses.
    Sicher für Routine-Updates (Patch-Versionen, Minor-Versionen).

    „no": Migrationen müssen vor dem Start von pretix manuell ausgeführt werden.
    Verwenden Sie dies bei Major-Version-Upgrades (z. B. pretix 4.x → 5.x), bei denen
    der Migrationsprozess manuelle Schritte oder Datentransformationen erfordert.

    Migrationen manuell ausführen (wenn AUTOMIGRATE = „no"):
        podman exec {instance_name} python -m pretix migrate
    Danach den Container neu starten.

    Für FreeSynergy-verwaltete Deployments ist „yes" sicher, da `fsn deploy`
    die Deployment-Sequenz und das Wartungsfenster steuert.

help-pretix-field-redis-title = Redis- / Celery-Konfiguration

help-pretix-field-redis-body =
    pretix verwendet Dragonfly (Redis-kompatibel) für drei Zwecke:

    PRETIX_REDIS_LOCATION: Session-Speicher (DB 4).
    PRETIX_REDIS_SESSIONS = „true": Sessions in Redis statt in der Datenbank speichern.

    PRETIX_CELERY_BROKER: Celery-Task-Queue-Broker (DB 5).
    Für asynchrone Tasks: E-Mails versenden, PDFs generieren, Zahlungen verarbeiten.

    PRETIX_CELERY_BACKEND: Celery-Task-Ergebnisspeicher (DB 6).

    Datenbankindizes 4, 5, 6 sind für pretix reserviert, um Konflikte
    mit anderen Diensten zu vermeiden (Forgejo nutzt 0–2, Vikunja nutzt 3).

    Alle drei werden automatisch aus den Dragonfly-Sub-Service-Zugangsdaten abgeleitet.
    Nicht manuell bearbeiten, außer wenn ein externer Redis-Server verwendet wird.

help-pretix-field-mail-title = E-Mail-Konfiguration

help-pretix-field-mail-body =
    pretix versendet E-Mails für:
    - Bestellbestätigungen mit angehängten PDF-Tickets
    - Erinnerungs-E-Mails vor Veranstaltungen
    - Stornierungen und Erstattungsbenachrichtigungen
    - Admin-Benachrichtigungen (Warnungen bei niedrigem Kontingent usw.)

    Konfiguration:
        PRETIX_MAIL_HOST:     SMTP-Server-Hostname (z. B. Stalwart-Container-Name)
        PRETIX_MAIL_PORT:     587 (STARTTLS) oder 465 (implizites TLS)
        PRETIX_MAIL_USER:     SMTP-Auth-Benutzername
        PRETIX_MAIL_PASSWORD: SMTP-Passwort (vault_pretix_mail_password)
        PRETIX_MAIL_FROM:     Absenderadresse (z. B. tickets@example.com)
        PRETIX_MAIL_TLS:      „on" für TLS (in Produktion immer aktivieren)

    Mit Stalwart: MAIL_HOST auf den Stalwart-Container-Namen setzen, PORT auf 587.
    Ein dediziertes Postfach (tickets@example.com) in Stalwart anlegen.

    E-Mail-Vorlagen (Betreffzeilen, Nachrichtentext) können pro Organizer
    und pro Event im pretix-Control-Panel unter Einstellungen > E-Mail angepasst werden.
