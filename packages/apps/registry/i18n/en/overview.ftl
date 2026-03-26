# i18n/en/overview.ftl — FreeSynergy Registry help texts (English)

help-registry-title = FreeSynergy Registry

help-registry-body =
    FreeSynergy Registry is the live service directory for this node.
    It is a node-boot background service — started before any user logs in and
    running for the entire lifetime of the node.

    When a service (e.g. Kanidm) starts, it registers with the Registry:
    "I am kanidm, I provide the auth capability at http://kanidm:8443."
    When a service stops, it deregisters (or the Registry removes it after a
    failed health check). The Bus uses this information to route events:
    "Send this auth event to whoever is registered for the auth role."

    This means the Bus never needs to know which specific service handles auth —
    it just sends to the role. If Kanidm is replaced by a different IAM system,
    only the Registry entry changes. All other programs continue to work unchanged.

help-registry-roles-title = Roles and Capabilities

help-registry-roles-body =
    A role is a named capability that a service can provide. Roles are defined
    in the platform type system (fs-types) and versioned.

    Standard roles:
    auth        — identity and access management (Kanidm)
    mail        — email sending and receiving (Stalwart)
    git         — git hosting and CI (Forgejo)
    chat        — real-time messaging (Tuwunel)
    wiki        — collaborative documentation (Outline)
    storage     — S3-compatible object storage (Node built-in)
    tasks       — task and project management (Vikunja)
    map         — map tile serving and geocoding
    calendar    — calendar and scheduling
    push        — push notification gateway

    A service may provide multiple roles. A node may have multiple services
    providing the same role (e.g. two Forgejo instances) — the bus routes to
    the primary unless a specific instance is requested.

help-registry-adapter-title = Adapter Pattern (replaces Bridge)

help-registry-adapter-body =
    The Registry uses the Adapter pattern instead of the former Bridge system.
    Each service ships with a typed Rust adapter that implements the platform
    service traits:

        struct KanidmAdapter;
        impl AuthService for KanidmAdapter { ... }

        struct StalwartAdapter;
        impl MailService for StalwartAdapter { ... }

    The adapter is compiled against the platform trait definition — if the trait
    changes, the adapter fails to compile. No runtime surprises. No generic
    dispatcher that silently accepts malformed requests.

    The Registry holds the active adapter instance for each registered service.
    The Bus calls the adapter method directly, without going through a string-keyed
    dispatcher.
