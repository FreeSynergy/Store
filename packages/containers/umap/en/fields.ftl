# help/en/fields.ftl — uMap field help texts (English)

help-umap-field-secret-key-title = Django Secret Key (SECRET_KEY)

help-umap-field-secret-key-body =
    The cryptographic secret used by Django for:
    - Signing cookies (CSRF tokens, session cookies)
    - Hashing passwords in password-reset links
    - Internal token generation

    Auto-generated (50+ characters) and stored in vault. Must be kept secret.

    Rotating this key:
    - Invalidates all active user sessions (users get logged out)
    - Invalidates all password-reset links in flight
    - CSRF tokens for open browser tabs become invalid

    Never set a predictable or short value. The auto-generated key is sufficient
    for all production use cases.

help-umap-field-site-title = Site URL and Name

help-umap-field-site-body =
    SITE_URL: The full HTTPS URL of this uMap instance (e.g. https://maps.example.com).
    Used in:
    - Embed code for sharing maps on external websites
    - OAuth2 redirect URIs for OIDC authentication
    - Email links (if email is configured)

    SITE_NAME: Display name shown in the uMap header, page titles and embeds.
    Default: "{project_domain} Maps" (e.g. "example.com Maps")
    Change to your organization name or a descriptive name.

    Both values are set in the setup wizard and can be updated in the
    Django admin at https://maps.example.com/admin/sites/site/.

help-umap-field-realtime-title = Real-Time Editing (REALTIME_ENABLED)

help-umap-field-realtime-body =
    "true" (default): Enables WebSocket-based live collaborative editing.
    Multiple users see each other's cursor and edits in real time.

    "false": Disables real-time features. Maps can only be edited by one
    person at a time. Other users see changes only after page refresh.

    Requirements when enabled:
    - Zentinel proxy must forward WebSocket connections (Upgrade header)
    - Stable network connection for users (mobile may disconnect frequently)

    Performance note: Each active WebSocket connection is a persistent
    connection to the server. For 50 simultaneous users, that's 50 open
    connections. This is generally fine for a single server.

help-umap-field-anonymous-title = Anonymous Map Creation (UMAP_ALLOW_ANONYMOUS)

help-umap-field-anonymous-body =
    "true" (default): Any visitor, including unauthenticated users, can
    create and edit maps. Maps created anonymously are tied to a local cookie.

    "false": Only authenticated users (logged in via OIDC/Kanidm) can create
    maps. Visitors can still view public maps.

    For a public community map platform: use "true" for maximum participation.
    For a private team tool: use "false" to require login for all map creation.

    Note: Even with anonymous = true, users can log in to have persistent
    accounts with all their maps in one place.

help-umap-field-database-title = PostGIS Database URL (DATABASE_URL)

help-umap-field-database-body =
    The database connection URL for the PostgreSQL+PostGIS sub-service.
    Auto-derived from the postgres sub-module.

    Format: postgis://user:password@host:port/database

    IMPORTANT: The scheme must be "postgis://" (not "postgres://").
    uMap uses the Django GIS framework which requires this scheme to
    activate the PostGIS backend. A plain postgres:// URL will fail
    with a "type geometry does not exist" error.

    This value is automatically constructed from the postgres sub-service's
    credentials. Do not edit it manually unless you are connecting to an
    external database.
