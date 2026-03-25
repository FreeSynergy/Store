# help/en/fields.ftl — pretix field help texts (English)

help-pretix-field-instance-name-title = Instance Name (PRETIX_PRETIX_INSTANCE_NAME)

help-pretix-field-instance-name-body =
    The name of this pretix installation shown in:
    - The pretix control panel header
    - Email subjects and footers ("Powered by {instance_name}")
    - Ticket PDFs

    Default: "{project_domain} Tickets" (e.g. "example.com Tickets")

    Change to your organization or event series name. Examples:
    - "Linux Conference EU Tickets"
    - "Example.com Events"
    - "TechMeetup Registration"

    This can be updated in the pretix admin panel at any time:
    System Settings > General > Installation Name

help-pretix-field-currency-title = Default Currency (PRETIX_PRETIX_CURRENCY)

help-pretix-field-currency-body =
    The default currency for new events. Uses ISO 4217 currency codes.

    Common values:
    - EUR: Euro (default)
    - USD: US Dollar
    - GBP: British Pound
    - CHF: Swiss Franc

    This is only the DEFAULT — each event can use a different currency in
    its individual settings. Events with different currencies can coexist
    in the same pretix installation.

    Important: Currency affects which payment providers are available.
    Some Stripe configurations are currency-specific.

help-pretix-field-locale-title = Locale Settings

help-pretix-field-locale-body =
    PRETIX_LOCALE_DEFAULT: Default language for the shop and organizer interface.
    ISO 639-1 language code.

    Common values: de (German), en (English), fr (French), es (Spanish)

    PRETIX_LOCALE_TIMEZONE: Default timezone for event dates and schedules.
    IANA timezone name (e.g. "Europe/Berlin"). Overridable per event.

    PRETIX_LANGUAGES_ENABLED: Comma-separated list of available languages.
    Default: "de,en" (German and English available to shop visitors).

    Restrict LANGUAGES_ENABLED to languages you have translations for.
    pretix supports 30+ languages but organizer/admin interfaces may be
    partially translated in less common languages.

    All locale settings can be overridden per organizer and per event in
    the pretix control panel.

help-pretix-field-automigrate-title = Auto-Migration (AUTOMIGRATE)

help-pretix-field-automigrate-body =
    Controls whether Django database migrations run automatically on startup.

    "yes" (default): Migrations run before the pretix process starts.
    Safe for routine updates (patch versions, minor versions).

    "no": Migrations must be run manually before starting pretix.
    Use this for major version upgrades (e.g. pretix 4.x → 5.x) where
    the migration process requires manual steps or data transformation.

    How to run migrations manually (when AUTOMIGRATE = "no"):
        podman exec {instance_name} python -m pretix migrate
    Then restart the container.

    For FreeSynergy-managed deployments, "yes" is safe since `fsn deploy`
    handles the deployment sequence and downtime window.

help-pretix-field-redis-title = Redis / Celery Configuration

help-pretix-field-redis-body =
    pretix uses Dragonfly (Redis-compatible) for three purposes:

    PRETIX_REDIS_LOCATION: Session storage (DB 4).
    PRETIX_REDIS_SESSIONS = "true": Store sessions in Redis instead of DB.

    PRETIX_CELERY_BROKER: Celery task queue broker (DB 5).
    Used for async tasks: sending emails, generating PDFs, processing payments.

    PRETIX_CELERY_BACKEND: Celery task result storage (DB 6).

    Database indices 4, 5, 6 are reserved for pretix to avoid conflicts
    with other services (Forgejo uses 0–2, Vikunja uses 3).

    All three are auto-derived from the Dragonfly sub-service credentials.
    Do not edit manually unless using an external Redis server.

help-pretix-field-mail-title = Email Configuration

help-pretix-field-mail-body =
    pretix sends emails for:
    - Order confirmations with attached PDF tickets
    - Reminder emails before events
    - Cancellation and refund notifications
    - Admin notifications (low quota warnings, etc.)

    Configuration:
        PRETIX_MAIL_HOST:     SMTP server hostname (e.g. Stalwart container name)
        PRETIX_MAIL_PORT:     587 (STARTTLS) or 465 (implicit TLS)
        PRETIX_MAIL_USER:     SMTP auth username
        PRETIX_MAIL_PASSWORD: SMTP password (vault_pretix_mail_password)
        PRETIX_MAIL_FROM:     sender address (e.g. tickets@example.com)
        PRETIX_MAIL_TLS:      "on" for TLS (always in production)

    With Stalwart: set MAIL_HOST to the Stalwart container name, PORT to 587.
    Create a dedicated mailbox (tickets@example.com) in Stalwart.

    Email templates (subject lines, body text) can be customized per organizer
    and per event in the pretix control panel under Settings > Email.
