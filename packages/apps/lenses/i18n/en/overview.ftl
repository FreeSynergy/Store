# i18n/en/overview.ftl — FreeSynergy Lenses help texts (English)

help-lenses-title = FreeSynergy Lenses

help-lenses-body =
    FreeSynergy Lenses aggregates data from all services connected to your
    FreeSynergy node and presents the results in unified views.

    When you search in Lenses, it queries every registered service simultaneously
    through the message bus and returns grouped results. Each result section shows
    a summary card from one service type: wiki articles, chat messages, open tasks,
    git commits, map locations, or calendar events.

    Clicking a result opens the original item in the service it came from — Lenses
    never modifies data. For automation and data changes, use Tasks.

help-lenses-personal-title = Personal Lenses

help-lenses-personal-body =
    A "Lens" is a saved view: a specific query with filters, service selection,
    and layout preferences that you can return to at any time.

    Examples:
    - "Project Alpha" — wiki + tasks + git for a specific project tag
    - "Today" — tasks due today + calendar events for the current day
    - "Mentions" — chat messages where you are mentioned

    Personal lenses appear in the sidebar for quick access.
    Organization-wide lenses (shared across all users) are managed in Node.

help-lenses-bus-title = Message Bus Integration

help-lenses-bus-body =
    Lenses communicates with services exclusively through the message bus.
    It never calls service APIs directly. This means:
    - Lenses works with any service that registers on the bus
    - Adding a new service (e.g. a second wiki) automatically makes it searchable
    - Lenses respects the access rights enforced by each service
    - Results are only shown for services the current user has access to
