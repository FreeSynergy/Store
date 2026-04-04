mistral-description =
    Mistral.rs is a blazing-fast local LLM inference engine built in Rust, forked and pre-configured for FreeSynergy.

    It runs large language models entirely on your own hardware — no cloud, no data leaving your server.
    FreeSynergy uses it as the inference backend for fs-ai and fs-bots, with an OpenAI-compatible API
    so any tool that speaks OpenAI can use your local models instead.

mistral-features =
    - Supports Mistral, Llama, Phi, Gemma, and more in GGUF format
    - OpenAI-compatible REST API (drop-in replacement for OpenAI clients)
    - Vision models (image understanding) supported
    - Quantized models for lower memory usage
    - Optional GPU acceleration (CUDA 12+)
    - Used by fs-ai (AI assistant) and fs-bots (bot runtime)
    - No external API keys or cloud dependency
    - All inference runs on your own hardware
