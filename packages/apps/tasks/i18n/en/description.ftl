tasks-description =
    FreeSynergy Tasks is the organizational workflow engine for the FreeSynergy platform.

    Create individual tasks, build multi-step pipelines, and set up automations
    that span multiple services — create a git issue, send a chat message, assign
    a task in Vikunja, and update a wiki page, all from one pipeline definition.

    Tasks operates through the message bus: any service registered on the bus can
    be a step in a pipeline. No direct API calls, no credentials to manage per service.

    Where Lenses displays data, Tasks acts on it.

tasks-features =
    - Task creation and tracking with due dates, labels, and assignees
    - Multi-step pipeline editor with visual graph view
    - Triggers: manual, scheduled (cron), event-based (bus messages)
    - Conditions and branching: if/else steps based on previous step results
    - Cross-service steps: any bus-registered service can be a pipeline step
    - Pipeline templates from the Store (community automations)
    - Execution history with step-by-step logs
