# i18n/en/overview.ftl — FreeSynergy Settings help texts (English)

help-settings-title = FreeSynergy Settings

help-settings-body =
    FreeSynergy Settings is the central configuration app for the platform.
    It organizes all configuration into sections, accessible from the sidebar.

    Settings are divided into node-wide settings (require administrator role)
    and per-user settings (editable by every user for their own account).
    The Settings app shows only the sections relevant to the current user's permissions.

help-settings-roles-title = Service Roles

help-settings-roles-body =
    Service roles are an extended MIME-type system for functions, not files.
    Each role defines what capability a service provides to the platform.

    Examples:
    - auth → the identity provider (default: Kanidm)
    - mail → the mail server (default: Stalwart)
    - git → the git hosting service (default: Forgejo)
    - wiki → the wiki service (e.g. Outline)
    - chat → the chat service (e.g. Tuwunel)
    - map → the map service
    - tasks → the task tracker service (e.g. Vikunja)

    Assigning a service to a role tells all other programs how to reach that
    capability. Programs never hardcode service names — they look up the role.

help-settings-network-title = Network Settings

help-settings-network-body =
    Network settings configure how this node identifies itself and communicates
    with other nodes and services.

    Node URL: the publicly reachable URL of this FreeSynergy node.
    Used by federated nodes and services to reach this node.

    Federation: enable or disable federation with other FreeSynergy nodes.
    When enabled, this node can receive invitations from and send invitations to
    other nodes to join a shared project.

    Proxy: configure an outbound HTTP/HTTPS proxy for all platform traffic.
    Useful in corporate environments with mandatory proxy infrastructure.
