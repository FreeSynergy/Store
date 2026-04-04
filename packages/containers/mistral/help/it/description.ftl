mistral-description =
    Mistral.rs è un motore di inferenza LLM locale ultra-veloce scritto in Rust, biforcato e preconfigurato per FreeSynergy.

    I modelli girano interamente sul tuo hardware — niente cloud, nessun dato lascia il tuo server.
    FreeSynergy lo usa come backend di inferenza per fs-ai e fs-bots, con un'API compatibile OpenAI
    così qualsiasi strumento che usa OpenAI può usare i tuoi modelli locali al suo posto.

mistral-features =
    - Supporta Mistral, Llama, Phi, Gemma e altro in formato GGUF
    - API REST compatibile OpenAI (sostituto drop-in per client OpenAI)
    - Modelli vision (comprensione delle immagini) supportati
    - Modelli quantizzati per minor utilizzo di memoria
    - Accelerazione GPU opzionale (CUDA 12+)
    - Usato da fs-ai (assistente AI) e fs-bots (runtime bot)
    - Nessuna chiave API esterna o dipendenza cloud
    - Tutta l'inferenza gira sul tuo hardware
