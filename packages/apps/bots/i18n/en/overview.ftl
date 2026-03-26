# i18n/en/overview.ftl — FreeSynergy Bots help texts (English)

help-bots-title = FreeSynergy Bots

help-bots-body =
    FreeSynergy Bots manages all bots installed on this FreeSynergy node.
    Bots are event-driven programs that communicate exclusively through the message
    bus — they subscribe to topics, receive events, and emit response messages.

    Bots can automate repetitive tasks, send notifications, bridge services,
    or provide conversational interfaces in chat. Because they use the bus,
    a bot does not need credentials for each service it interacts with.

help-bots-rules-title = Rule-Based Bots

help-bots-rules-body =
    The visual rule editor lets you create simple bots without writing any code.
    A rule has three parts:

    Trigger: what event starts the rule
    - A message arrives in a chat channel
    - A git push happens in Forgejo
    - A scheduled time is reached
    - A service health check fails

    Condition (optional): a filter on the trigger data
    - Only if the message contains a specific word
    - Only for a specific user or project

    Action: what to do
    - Send a chat message to a channel
    - Create a task in Vikunja
    - Post a comment on a git issue
    - Send a push notification

help-bots-gatekeeper-title = Bot Gatekeeper

help-bots-gatekeeper-body =
    When the Gatekeeper is enabled for a bot, every action the bot wants to take
    is held in a queue and shown to an administrator for approval before it runs.

    Use this for bots that:
    - Send messages to external services (Telegram, Discord)
    - Create or modify records in services
    - Are newly installed and not yet trusted

    The Gatekeeper can be set to "approve all from this bot" after initial review.
