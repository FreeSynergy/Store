# i18n/en/fields.ftl — FreeSynergy AI field help texts (English)

help-ai-field-model-title = Model

help-ai-field-model-body =
    The name of the local LLM model to load via fs-mistral.
    Must be a model name that has been downloaded in the fs-mistral app.

    Default: mistral-7b-instruct

    To see available models, open the Mistral app and check the model list.
    Common values:
    - mistral-7b-instruct (recommended, balanced performance)
    - mixtral-8x7b-instruct (better quality, requires 32 GB RAM)
    - mistral-3b-instruct (fastest, lower quality)

help-ai-field-context-window-title = Context window (tokens)

help-ai-field-context-window-body =
    Maximum number of tokens (roughly: words) in the conversation context window.
    Higher values let the AI remember more of the conversation and process longer
    documents, but use more RAM.

    Recommended values:
    - 4096 for low-memory systems (< 8 GB)
    - 8192 (default) for standard systems
    - 16384 for systems with ≥ 32 GB RAM

    If the AI seems to "forget" earlier parts of a conversation, increase this value.

help-ai-field-tools-title = Enable platform tools

help-ai-field-tools-body =
    When enabled, the AI can access platform data through the message bus:
    wiki search, task lists, git history, service status, and Store search.

    Disable this to limit the AI to pure conversation without platform access.
    Useful on shared or untrusted nodes where AI tool access should be restricted.
