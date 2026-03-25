mistral-description =
    Mistral.rs es un servidor local de inferencia LLM de alto rendimiento con API compatible con OpenAI.

    Se ejecuta completamente en local — sin nube, sin suscripciones. Soporta cuantización
    in-situ ISQ: descarga cualquier modelo de HuggingFace y cuantízalo en memoria en el
    primer inicio, sin necesidad de archivos precuantizados. También soporta archivos GGUF directamente.

    Se ejecuta en CPU sin necesitar una GPU. Aceleración por GPU opcional vía CUDA o Metal.

mistral-features =
    - API REST compatible con OpenAI (/v1/chat/completions, /v1/models, …)
    - Cuantización in-situ ISQ (cualquier modelo de HuggingFace → cuantizado en memoria)
    - Soporte de archivos GGUF
    - Inferencia en CPU (sin GPU requerida)
    - Aceleración por GPU opcional (CUDA, Metal)
    - Respuestas en streaming
