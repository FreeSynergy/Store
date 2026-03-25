# help/en/fields.ftl — Vikunja field help texts (English)

help-vikunja-field-jwt-secret-title = JWT Secret (VIKUNJA_SERVICE_JWTSECRET)

help-vikunja-field-jwt-secret-body =
    The cryptographic secret used to sign JWT (JSON Web Token) authentication
    tokens. Every user session is backed by a signed JWT. Auto-generated and
    stored in vault.

    Rotating this key invalidates ALL active user sessions immediately.
    All users will be logged out and must sign in again. Only rotate if
    you suspect the secret has been compromised.

    Vikunja JWTs expire after 48 hours by default. The JWT secret does not
    need to be rotated on a schedule — only on suspicion of compromise.

help-vikunja-field-timezone-title = Timezone (VIKUNJA_SERVICE_TIMEZONE)

help-vikunja-field-timezone-body =
    The timezone used for:
    - Due date calculations and display
    - Reminder email scheduling
    - Recurring task generation

    Use IANA timezone names (e.g. "Europe/Berlin", "America/New_York",
    "Asia/Tokyo", "UTC"). The full list is at:
        https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

    Default: "Europe/Berlin"

    Set this to the timezone where most of your team members are located.
    Individual users can override it in their personal settings if they
    are in different timezones.

    Important: If you change this after initial setup, existing due dates
    may shift. Notify your team before changing the server timezone.

help-vikunja-field-local-auth-title = Local Authentication (VIKUNJA_AUTH_LOCAL_ENABLED)

help-vikunja-field-local-auth-body =
    Controls whether users can create accounts and sign in with a local
    username/password (without OIDC).

    "false" (default): All authentication must go through OIDC (Kanidm).
    Users cannot create local accounts or log in with a password.
    This enforces a single identity across the platform.

    "true": Users can also sign up and log in with a local password.
    Useful as a fallback if OIDC is temporarily unavailable.

    Tip: Keep this "false" in production and maintain a local CLI admin
    account via the Vikunja CLI for emergency access.

    If you need to allow a specific user without OIDC (e.g. a service account),
    create it via the CLI: vikunja user create --username ... --password ...

help-vikunja-field-redis-db-title = Redis Database Index (VIKUNJA_REDIS_DB)

help-vikunja-field-redis-db-body =
    The Dragonfly/Redis database index Vikunja uses for caching and queues.
    Default: 3

    This index was specifically chosen to avoid conflicts with other services
    that share the same Dragonfly instance:
    - 0, 1, 2: used by Forgejo (cache, sessions, queues)
    - 3: Vikunja
    - 4, 5, 6: pretix (sessions, Celery broker, results)

    Do not change this unless you know that another service is also using
    database 3. If you add a new service that needs Redis, assign it a
    free index (7–15) and document the allocation.

help-vikunja-field-mailer-title = Mailer Settings (VIKUNJA_MAILER_*)

help-vikunja-field-mailer-body =
    VIKUNJA_MAILER_ENABLED: "true" to activate email sending.

    VIKUNJA_MAILER_HOST: Hostname of the SMTP server.
    With Stalwart: use the Stalwart container name (e.g. "stalwart-01").

    VIKUNJA_MAILER_PORT: 587 for STARTTLS (recommended with Stalwart),
    465 for implicit TLS.

    VIKUNJA_MAILER_FROMEMAIL: The "From" address for all Vikunja emails.
    Must be a valid mailbox on the SMTP server.
    Default: "tasks@{project_domain}"

    VIKUNJA_MAILER_USERNAME / VIKUNJA_MAILER_PASSWORD:
    SMTP authentication credentials. Both stored in vault.

    Without email: set VIKUNJA_MAILER_ENABLED = "false". Task reminders
    will be shown in the app but not sent via email.
