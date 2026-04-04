mistral-description =
    Mistral.rs es un motor de inferencia LLM local ultrarrápido escrito en Rust, bifurcado y preconfigurado para FreeSynergy.

    Los modelos se ejecutan completamente en tu propio hardware — sin nube, sin datos que salgan de tu servidor.
    FreeSynergy lo usa como backend de inferencia para fs-ai y fs-bots, con una API compatible con OpenAI
    para que cualquier herramienta que use OpenAI pueda usar tus modelos locales en su lugar.

mistral-features =
    - Soporta Mistral, Llama, Phi, Gemma y más en formato GGUF
    - API REST compatible con OpenAI (sustituto directo para clientes OpenAI)
    - Modelos de visión (comprensión de imágenes) soportados
    - Modelos cuantizados para menor uso de memoria
    - Aceleración GPU opcional (CUDA 12+)
    - Usado por fs-ai (asistente de IA) y fs-bots (runtime de bots)
    - Sin claves de API externas ni dependencia de la nube
    - Toda la inferencia se ejecuta en tu propio hardware
