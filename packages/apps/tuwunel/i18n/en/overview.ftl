# help/en/overview.ftl — Tuwunel help texts (English)

help-tuwunel-title = Tuwunel — Matrix Homeserver

help-tuwunel-body =
    Tuwunel is a high-performance Matrix homeserver, the spiritual successor to
    conduwuit (itself a fork of Conduit). It provides the real-time messaging
    layer of the FreeSynergy platform.

    The Matrix protocol is an open, federated standard for real-time communication.
    Users on your Tuwunel homeserver can:
    - Chat in private 1:1 rooms and group spaces
    - Join rooms on other Matrix homeservers (federation)
    - Use any Matrix-compatible client (Element, Cinny, FluffyChat, etc.)
    - Bridge to other platforms (Signal, WhatsApp, Telegram) via optional bridges

    Matrix IDs look like: @username:example.com
    The domain part (example.com) is the server_name — set once, never changed.

    Tuwunel uses a RocksDB database for extreme write throughput and stores all
    data in a single volume at /var/lib/tuwunel.

    Dependencies: Kanidm is referenced for identity awareness but Tuwunel does
    not natively use OIDC — registration and authentication are handled by the
    Matrix client registration flow.

help-tuwunel-install-title = Installing Tuwunel

help-tuwunel-install-body =
    CRITICAL: Choose your server_name carefully. It becomes the domain part
    of every Matrix ID (@user:server_name). It CANNOT be changed after first start
    without losing all data and user identities.

    1. Set TUWUNEL_SERVER_NAME to your main domain (e.g. example.com), NOT to the
       subdomain where Tuwunel runs (e.g. NOT matrix.example.com).
       Users will have IDs like @alice:example.com.

    2. Set WELL_KNOWN_CLIENT and WELL_KNOWN_SERVER to point to the actual server
       location (e.g. https://matrix.example.com and matrix.example.com:443).

    3. Add /.well-known/matrix/client and /.well-known/matrix/server JSON endpoints
       to your main domain. Zentinel can serve static JSON files for this, or
       configure it in the main website.

    4. Start the container. No admin setup UI — use the Matrix admin API or
       the Synapse Admin tool (compatible with Tuwunel) for management.

    5. Create the first admin user:
         podman exec {instance_name} tuwunel create-admin-user -u admin -p <password>

help-tuwunel-federation-title = Matrix Federation

help-tuwunel-federation-body =
    When TUWUNEL_ALLOW_FEDERATION = "true", your homeserver joins the global
    Matrix network. Users on your server can:
    - Join public rooms on matrix.org and other servers
    - DM users with identities on other homeservers (e.g. @friend:matrix.org)
    - Participate in federated spaces

    Federation requirements:
    - The server must be reachable on port 443 from the internet
    - /.well-known/matrix/server must be served at your server_name domain
    - The Zentinel proxy must forward Matrix federation traffic to the container

    Disable federation (TUWUNEL_ALLOW_FEDERATION = "false") for fully private
    deployments where you only want internal messaging within your organization.

    Note: Disabling federation after users have joined federated rooms may cause
    those rooms to become inaccessible. Plan this decision before first use.

help-tuwunel-registration-title = User Registration

help-tuwunel-registration-body =
    Matrix registration is separate from Kanidm SSO. Users register directly
    with the Matrix homeserver using the Matrix client registration API.

    Options:
    1. Open registration (ALLOW_REGISTRATION = "true", TOKEN_REQUIRED = "false"):
       Anyone can create an account. Not recommended for private servers.

    2. Token-gated registration (ALLOW_REGISTRATION = "true", TOKEN_REQUIRED = "true"):
       Users need a registration token to sign up. Tokens are created via the
       admin API: POST /_matrix/client/v3/admin/registration_tokens/new

    3. Closed registration (ALLOW_REGISTRATION = "false"):
       Only admins can create accounts via the admin API. Recommended for
       private deployments.

    Admin creates a user:
        POST /_synapse/admin/v2/users/@user:example.com
        (Tuwunel is compatible with the Synapse admin API)
