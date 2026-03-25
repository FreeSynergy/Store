mistral-description =
    O Mistral.rs é um servidor de inferência LLM local de alto desempenho
    com API compatível com OpenAI.

    Funciona inteiramente de forma local — sem nuvem, sem assinaturas.
    Suporta quantização ISQ in-situ: baixe qualquer modelo HuggingFace e
    quantize-o em memória na primeira execução, sem necessidade de arquivos
    pré-quantizados. Também suporta arquivos GGUF diretamente.

    Funciona em CPU sem exigir GPU. Aceleração GPU opcional via CUDA ou
    Metal.

mistral-features =
    - API REST compatível com OpenAI (/v1/chat/completions, /v1/models, …)
    - Quantização ISQ in-situ (qualquer modelo HuggingFace → quantizado em memória)
    - Suporte a arquivos GGUF
    - Inferência em CPU (GPU não necessária)
    - Aceleração GPU opcional (CUDA, Metal)
    - Respostas em streaming
