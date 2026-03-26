# i18n/en/overview.ftl — FreeSynergy AI help texts (English)

help-ai-title = FreeSynergy AI

help-ai-body =
    FreeSynergy AI is the integrated AI assistant for the FreeSynergy platform.
    It uses a local language model (via fs-mistral) so all data stays on the node.

    The assistant has access to your platform through tools: it can search the wiki,
    list open tasks, check recent git commits, or query service health — and uses
    this context to give accurate, relevant answers.

    To use the AI, fs-mistral must be installed and at least one model must be
    downloaded. The AI app manages model selection; model downloading is done
    in the Mistral app.

help-ai-tools-title = Platform Tools

help-ai-tools-body =
    When AI_TOOLS_ENABLED is true, the AI can use the following tools via the bus:

    wiki.search — full-text search across all wiki pages
    tasks.list — list open tasks, optionally filtered by project or user
    git.log — recent commits across registered Forgejo repositories
    services.status — current health status of all registered services
    store.search — search the Store catalog for packages

    The AI only calls tools for services the current user has access to.
    Tool calls are shown in the chat as collapsible "Thought" blocks.

help-ai-models-title = Model Selection

help-ai-models-body =
    The AI model is set with the AI_MODEL variable. Available models are those
    downloaded in the fs-mistral app. The default is mistral-7b-instruct,
    a capable instruction-following model that runs on most hardware.

    Larger models (13B, 70B) give better answers but require more RAM and are slower.
    Smaller models (3B) are faster but less capable.

    Model recommendations:
    - 8 GB RAM: mistral-7b-instruct (quantized)
    - 16 GB RAM: mistral-7b-instruct (full) or mixtral-8x7b (quantized)
    - 32 GB RAM: mixtral-8x7b (full)
