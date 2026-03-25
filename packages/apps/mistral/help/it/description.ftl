mistral-description =
    Mistral.rs è un server di inferenza LLM locale ad alte prestazioni con
    API compatibile con OpenAI.

    Funziona interamente in locale — nessun cloud, nessun abbonamento.
    Supporta la quantizzazione ISQ in-situ: scarica qualsiasi modello
    HuggingFace e quantizzalo in memoria al primo avvio, senza bisogno di
    file pre-quantizzati. Supporta anche file GGUF direttamente.

    Funziona su CPU senza richiedere una GPU. Accelerazione GPU opzionale
    tramite CUDA o Metal.

mistral-features =
    - API REST compatibile con OpenAI (/v1/chat/completions, /v1/models, …)
    - Quantizzazione ISQ in-situ (qualsiasi modello HuggingFace → quantizzato in memoria)
    - Supporto file GGUF
    - Inferenza CPU (nessuna GPU richiesta)
    - Accelerazione GPU opzionale (CUDA, Metal)
    - Risposte in streaming
