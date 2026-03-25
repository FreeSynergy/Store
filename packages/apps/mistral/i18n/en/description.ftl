mistral-description =
    Mistral.rs is a high-performance local LLM inference server with an OpenAI-compatible API.

    It runs entirely locally — no cloud, no subscriptions. It supports ISQ in-situ
    quantization: download any HuggingFace model and quantize it in memory on first start,
    no pre-quantized files needed. Also supports GGUF files directly.

    Runs on CPU without requiring a GPU. Optional GPU acceleration via CUDA or Metal.

mistral-features =
    - OpenAI-compatible REST API (/v1/chat/completions, /v1/models, …)
    - ISQ in-situ quantization (any HuggingFace model → quantized in memory)
    - GGUF file support
    - CPU inference (no GPU required)
    - Optional GPU acceleration (CUDA, Metal)
    - Streaming responses
