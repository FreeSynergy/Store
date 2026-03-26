# i18n/en/overview.ftl — FreeSynergy Inventory help texts (English)

help-inventory-title = FreeSynergy Inventory

help-inventory-body =
    FreeSynergy Inventory maintains the authoritative installation state of this node.
    It is a background service — you do not interact with it directly. Every other
    program queries or updates the Inventory through the message bus.

    The Inventory answers two types of questions:
    - Package questions: "Is kanidm installed? Which version? Is it active?"
    - Service questions: "Which running services provide the 'auth' role?
      What is their current health status?"

    Nothing else on the node may answer these questions. If a program needs to know
    what is installed, it asks the Inventory. If the Inventory says it is there, it is there.

help-inventory-three-layers-title = The Three Layers

help-inventory-three-layers-body =
    FreeSynergy separates the concepts of what exists, what is installed, and
    how installation works:

    Store — "What is available?"
    The Store catalog lists all packages that could be installed. It reads from
    a Git repository and has network access to download packages.

    Inventory — "What is installed right now?"
    The Inventory knows only what is currently on this node. It has no network
    access and does not consult the Store. It is a local, offline-only record.

    Managers — "How do you install or remove something?"
    Managers (Container Manager, Language Manager, etc.) perform the actual
    installation steps and then write the result to the Inventory.

    This separation means the Inventory is always fast (local SQLite only),
    always consistent (one writer protocol), and always authoritative.

help-inventory-bus-title = Bus Queries

help-inventory-bus-body =
    The Inventory responds to the following bus namespaces:

    inventory::packages::list — list all installed packages with status
    inventory::packages::query — get details for one package by id
    inventory::services::list — list all running service instances
    inventory::services::by-role — find services that provide a given role
    inventory::status::health — overall node health summary

    These are used by: Bus (routing), Lenses (data sources), Search (service discovery),
    Container Manager (service status), Store (update check), Widgets (role fulfillment).
