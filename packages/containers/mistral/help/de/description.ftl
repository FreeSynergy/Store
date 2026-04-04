mistral-description =
    Mistral.rs ist eine hochschnelle lokale LLM-Inferenz-Engine in Rust, als Fork für FreeSynergy vorkonfiguriert.

    Modelle laufen vollständig auf eigener Hardware — keine Cloud, keine Daten verlassen den Server.
    FreeSynergy nutzt es als Inferenz-Backend für fs-ai und fs-bots, mit einer OpenAI-kompatiblen API,
    sodass jedes Tool das OpenAI spricht stattdessen lokale Modelle verwenden kann.

mistral-features =
    - Unterstützt Mistral, Llama, Phi, Gemma und mehr im GGUF-Format
    - OpenAI-kompatible REST-API (Drop-in-Ersatz für OpenAI-Clients)
    - Vision-Modelle (Bildverständnis) unterstützt
    - Quantisierte Modelle für geringeren Speicherbedarf
    - Optionale GPU-Beschleunigung (CUDA 12+)
    - Genutzt von fs-ai (KI-Assistent) und fs-bots (Bot-Runtime)
    - Keine externen API-Schlüssel oder Cloud-Abhängigkeit
    - Alle Inferenzen laufen auf eigener Hardware
