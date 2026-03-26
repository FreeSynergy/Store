bots-description =
    FreeSynergy Bots is the management interface for bots on the FreeSynergy platform.

    Bots are small, event-driven programs that listen to service events via the message
    bus and respond through chat messages, notifications, or other service actions.
    They are Bus-native: a bot declares what topics it subscribes to and what messages
    it emits — no direct API access, no stored credentials.

    The Bots app lets you install bots from the Store, configure their parameters,
    monitor their activity logs, and create simple rule-based bots without code.

bots-features =
    - Install and manage bots from the Store catalog
    - Visual rule editor: "when X happens, do Y" without writing code
    - Per-bot activity log with message history
    - Bot gatekeeper: review and approve bot actions before they run (opt-in)
    - Broadcast subscriptions: bots can follow topics across federated nodes
    - Community bots in the Store — install with one click
    - Custom bots via the fs-bot SDK (WASM or native)
