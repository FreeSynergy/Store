mistral-description =
    Mistral.rs ist ein hochperformanter lokaler LLM-Inferenz-Server mit OpenAI-kompatibler API.

    Er läuft vollständig lokal — keine Cloud, keine Abonnements. ISQ-In-Situ-Quantisierung:
    Lade ein beliebiges HuggingFace-Modell herunter und quantisiere es beim ersten Start
    im Speicher — keine vorquantisierten Dateien nötig. Unterstützt auch GGUF-Dateien.

    Läuft auf CPU ohne GPU. Optionale GPU-Beschleunigung via CUDA oder Metal.

mistral-features =
    - OpenAI-kompatible REST-API
    - ISQ In-Situ-Quantisierung (beliebiges HF-Modell → im Speicher quantisiert)
    - GGUF-Dateien direkt unterstützt
    - CPU-Inferenz (keine GPU erforderlich)
    - Optionale GPU-Beschleunigung
    - Streaming-Antworten
