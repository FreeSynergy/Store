inventory-description =
    FreeSynergy Inventory is the authoritative record of everything installed
    on a FreeSynergy node.

    It maintains a SQLite database (fs-inventory.db) with three tables:
    installed resources (every package ever installed), running service instances
    (container services with their current status), and bridge instances (which
    service handles which platform role).

    The three-layer principle:
    - Store answers: "What is available?"
    - Inventory answers: "What is installed right now?"
    - Managers answer: "How do you install or remove something?"

    No program may maintain its own installation list. Every status query goes
    to the Inventory. The Bus queries the Inventory to route events to the right
    service. Lenses queries the Inventory to find data sources.

inventory-features =
    - Single source of truth for the installed state of the entire node
    - Tracks all resource types: apps, containers, themes, widgets, language packs
    - Per-service-instance status: running, stopped, error, updating
    - Bridge instance registry: which service handles which platform role
    - Consumed by Bus, Lenses, Search, Container Manager, Store, and Widgets
    - Written exclusively by Managers — never by programs directly
    - Local-only SQLite: no network access, zero external dependencies
