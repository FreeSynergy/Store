# help/en/fields.ftl — Tuwunel field help texts (English)

help-tuwunel-field-server-name-title = Matrix Server Name (TUWUNEL_SERVER_NAME)

help-tuwunel-field-server-name-body =
    The Matrix server name — the domain that appears in all Matrix IDs:
        @username:server_name

    This is typically your main domain (e.g. example.com), NOT the subdomain
    where Tuwunel is running (e.g. not matrix.example.com).

    CRITICAL: This value is written to the RocksDB database on first start
    and CANNOT be changed without a full data migration or fresh install.
    A wrong server_name means your users get wrong Matrix IDs forever.

    If you set server_name = "example.com" but run Tuwunel at
    "matrix.example.com", you must serve /.well-known/matrix/* from example.com
    to tell clients where the actual server is.

help-tuwunel-field-registration-title = Registration Settings

help-tuwunel-field-registration-body =
    TUWUNEL_ALLOW_REGISTRATION: Whether users can register via Matrix clients.
    "false" (default) means only admins can create accounts.

    TUWUNEL_REGISTRATION_TOKEN_REQUIRED: When registration is enabled, whether
    a token is required. "true" (default) means users need a token.

    To create registration tokens (when registration is enabled):
        POST /_matrix/client/v3/admin/registration_tokens/new
        Authorization: Bearer <admin_token>
        Body: {"expiry_time": null, "uses_allowed": 1}

    Tip: For invitation-based registration, create a token per invited user,
    share the token, and set uses_allowed = 1 so each token can only be used once.

help-tuwunel-field-federation-title = Federation Setting (TUWUNEL_ALLOW_FEDERATION)

help-tuwunel-field-federation-body =
    "true" (default) connects your server to the global Matrix network.
    "false" creates an isolated private server — users can only communicate
    with others on the same homeserver.

    With federation enabled, your server exchanges messages with other Matrix
    servers. This requires:
    - Port 443 reachable from the public internet
    - Valid TLS certificate (handled by Zentinel)
    - /.well-known/matrix/server served at the server_name domain
    - Correct DNS records (no SRV needed if using .well-known)

    Warning: Changing from federated to non-federated after users have joined
    federated rooms will break those rooms. Decide before first use.

help-tuwunel-field-well-known-title = Well-Known URLs

help-tuwunel-field-well-known-body =
    These two variables define what Matrix clients and servers discover about
    your homeserver:

    TUWUNEL_WELL_KNOWN_CLIENT:
    Returned in /.well-known/matrix/client as:
        { "m.homeserver": { "base_url": "<value>" } }
    Matrix clients (Element, etc.) use this to find the homeserver API.
    Value: https://matrix.example.com (the actual server URL)

    TUWUNEL_WELL_KNOWN_SERVER:
    Returned in /.well-known/matrix/server as:
        { "m.server": "<value>" }
    Other Matrix homeservers use this for federation.
    Value: matrix.example.com:443 (hostname:port, no scheme)

    Both /.well-known/matrix/client and /.well-known/matrix/server must be
    served from the server_name domain (e.g. example.com), not from the
    subdomain where Tuwunel actually runs. Configure static JSON files or
    proxy rules at example.com to serve these endpoints.
