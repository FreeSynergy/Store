# help/en/overview.ftl — Mistral.rs help texts (English)

help-mistral-title = Mistral.rs — Local LLM Inference Server

help-mistral-body =
    Mistral.rs is a fast, Rust-based LLM inference engine that exposes an
    OpenAI-compatible REST API. It runs large language models (LLMs) locally
    on your FreeSynergy node — no data leaves your server.

    Key features:
    - OpenAI-compatible API (/v1/chat/completions, /v1/completions, /v1/embeddings)
    - ISQ (In-Situ Quantization): downloads a model from HuggingFace and quantizes
      it in-memory — no pre-quantized file needed
    - GGUF model support (pre-quantized files from HuggingFace or llama.cpp)
    - CPU and Metal (Apple Silicon) inference
    - Multiple model architectures: Qwen, Llama, Mistral, Phi, Gemma, etc.

    Unlike a container, Mistral.rs is deployed as a binary service (kind = "binary").
    The binary is installed from the FreeSynergy catalog and runs as a background
    service managed by the node's process supervisor.

    Use cases:
    - AI-powered search and document summarization (via Outline, Forgejo)
    - Private coding assistant (Continue.dev, VS Code)
    - Bot automation within the FreeSynergy platform (fs-bots)
    - Embeddings for semantic search

help-mistral-install-title = Installing Mistral.rs

help-mistral-install-body =
    1. Run the setup wizard:
       - Model ID: HuggingFace repo (e.g. "Qwen/Qwen3-4B") or a local .gguf path
       - ISQ type: "q4k" (recommended, ~3 GB RAM for a 4B model)
       - Max sequences: 4 (for a 16 GB machine)
       - Service domain (optional, for external API access via proxy)

    2. On first start, Mistral.rs downloads the model from HuggingFace.
       This may take several minutes depending on model size and connection speed.
       The model is cached in {models_dir} for subsequent starts.

    3. Once running, the API is available at:
       - Locally: http://localhost:1234/v1/
       - Via proxy: https://ai.example.com/v1/ (if a domain was configured)

    4. Test with:
         curl http://localhost:1234/v1/chat/completions \
           -H "Content-Type: application/json" \
           -d '{"model":"default","messages":[{"role":"user","content":"Hello!"}]}'

    Note: First inference after startup is slower (model warmup). Subsequent
    requests are significantly faster.

help-mistral-models-title = Models and Quantization

help-mistral-models-body =
    Mistral.rs supports two model loading modes:

    ISQ Mode (recommended):
    Set mistral_model_id to a HuggingFace repo ID (e.g. "Qwen/Qwen3-4B").
    Set mistral_isq to a quantization type. Mistral.rs downloads the full
    precision model and quantizes it in-memory.

    ISQ quantization types and memory requirements (for a 4B model):
    - q2k:  ~1.5 GB RAM  (very compressed, quality loss)
    - q4k:  ~2.5 GB RAM  (recommended balance of quality and speed)
    - q6k:  ~3.5 GB RAM  (higher quality)
    - q8_0: ~4.5 GB RAM  (near full quality)

    GGUF Mode:
    Set mistral_model_id to an absolute path to a .gguf file.
    Leave mistral_isq empty. The file must already be quantized.
    Download .gguf files from HuggingFace (e.g. TheBloke's quantized models).

    Recommended models for different hardware:
    - 8 GB RAM:  Qwen/Qwen3-1.7B with q4k or q8_0
    - 16 GB RAM: Qwen/Qwen3-4B with q4k (default setup)
    - 32 GB RAM: Qwen/Qwen3-8B or Meta-Llama-3.1-8B with q4k

help-mistral-api-title = Using the API

help-mistral-api-body =
    Mistral.rs exposes an OpenAI-compatible API. Any OpenAI SDK or tool works:

    Chat completions (POST /v1/chat/completions):
        {
          "model": "default",
          "messages": [{"role": "user", "content": "Summarize this text: ..."}],
          "max_tokens": 512,
          "temperature": 0.7
        }

    Embeddings (POST /v1/embeddings):
        {
          "model": "default",
          "input": "text to embed"
        }

    Streaming: Add "stream": true to receive token-by-token output via
    Server-Sent Events (SSE).

    Continue.dev configuration (in ~/.continue/config.json):
        {
          "models": [{
            "title": "Local (Mistral.rs)",
            "provider": "openai",
            "model": "default",
            "apiBase": "http://localhost:1234/v1"
          }]
        }

    Note: The model name "default" always refers to the currently loaded model.
    Mistral.rs serves only one model at a time.
