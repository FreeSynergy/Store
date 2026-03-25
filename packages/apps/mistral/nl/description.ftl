mistral-description =
    Mistral.rs is een hoogwaardige lokale LLM-inferentieserver met een
    OpenAI-compatibele API.

    Het draait volledig lokaal — geen cloud, geen abonnementen. Het
    ondersteunt ISQ in-situ kwantisatie: download elk HuggingFace-model
    en kwantiseer het in het geheugen bij de eerste start, zonder
    voorgekwantiseerde bestanden. Ondersteunt ook GGUF-bestanden direct.

    Draait op CPU zonder GPU. Optionele GPU-versnelling via CUDA of Metal.

mistral-features =
    - OpenAI-compatibele REST API (/v1/chat/completions, /v1/models, …)
    - ISQ in-situ kwantisatie (elk HuggingFace-model → gekwantiseerd in geheugen)
    - GGUF-bestandsondersteuning
    - CPU-inferentie (geen GPU vereist)
    - Optionele GPU-versnelling (CUDA, Metal)
    - Streaming-antwoorden
