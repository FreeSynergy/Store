ai-description =
    FreeSynergy AI is the integrated AI assistant for the FreeSynergy platform.

    It runs a local language model via fs-mistral — all inference happens on the
    node, no data is sent to external servers. The AI assistant has access to
    platform context through the message bus: it can search the wiki, query open
    tasks, read git history, and check service status to give contextual answers.

    The AI also assists other platform tools: Builder uses it to generate package
    descriptions, Tasks uses it to suggest pipeline steps, and Bots can delegate
    decisions to it.

ai-features =
    - Local LLM inference — no external API, no data leaves the node
    - Platform tools via message bus: wiki, tasks, git, service status
    - Context-aware: knows the current node, project, and user
    - Multi-turn conversations with session memory
    - Assists Builder (package descriptions), Tasks (pipelines), Bots (decisions)
    - Model selection: choose from available fs-mistral models
    - TUI mode for terminal environments
