# help/en/fields.ftl — Mistral.rs field help texts (English)

help-mistral-field-model-id-title = Model ID (mistral_model_id)

help-mistral-field-model-id-body =
    Identifies the model to load. Two formats are supported:

    HuggingFace repo ID (ISQ mode):
        Qwen/Qwen3-4B
        meta-llama/Llama-3.1-8B
        microsoft/Phi-4-mini-instruct
    Mistral.rs downloads the full-precision model and quantizes it in-memory
    using the mistral_isq quantization type. Requires internet access on first
    start. The downloaded model is cached in {models_dir}.

    Local .gguf file path (GGUF mode):
        /path/to/model.gguf
    Mistral.rs loads the pre-quantized GGUF file directly. No download needed.
    Leave mistral_isq empty in this mode.

    Note: HuggingFace requires accepting license agreements for some models
    (e.g. Llama). Run `huggingface-cli login` on the server before starting
    if the model requires authentication.

help-mistral-field-isq-title = ISQ Quantization Type (mistral_isq)

help-mistral-field-isq-body =
    The quantization type for ISQ (In-Situ Quantization) mode.
    Mistral.rs quantizes the model in-memory — no pre-quantized file needed.

    Leave empty when loading a .gguf file (GGUF mode).

    Available types and approximate memory for a 4B model:
    - q2k:  ~1.5 GB  — very small, noticeable quality loss
    - q3k:  ~2.0 GB  — small, moderate quality
    - q4k:  ~2.5 GB  — recommended, good quality/size balance
    - q5k:  ~3.0 GB  — higher quality
    - q6k:  ~3.5 GB  — near full quality
    - q8_0: ~4.5 GB  — close to fp16 quality, no quantization artifacts

    Rule of thumb: available RAM ÷ 2 = maximum model size.
    For 16 GB RAM: q4k on a 4B model leaves ~13.5 GB for OS and other services.

help-mistral-field-max-seqs-title = Max Concurrent Sequences (mistral_max_seqs)

help-mistral-field-max-seqs-body =
    The maximum number of inference requests processed concurrently. Higher
    values increase throughput but require proportionally more memory.

    Default: 4 — suitable for interactive use on a 16 GB machine.

    Guidelines:
    - 1: memory-constrained servers, single-user use
    - 4: standard interactive use (multiple simultaneous users)
    - 8: high-throughput use cases (batch summarization, CI pipelines)

    Each concurrent sequence roughly doubles peak memory usage during generation.
    Set conservatively and increase only if you observe queuing delays.

help-mistral-field-host-title = Bind Host (mistral_host)

help-mistral-field-host-body =
    The IP address the inference server listens on.

    "127.0.0.1" (default): Local-only access. The API is reachable only
    from the same machine. Recommended when accessed via a local IDE plugin
    (Continue.dev) or for security. Zentinel can still proxy to it.

    "0.0.0.0": Bind all interfaces. The API is reachable from other machines
    on the network. Use only if you need direct network access without a proxy,
    for example from a dedicated workstation on the same LAN.

    Note: The API has no built-in authentication. If you expose it externally
    (via Zentinel or 0.0.0.0), add authentication at the proxy layer.
