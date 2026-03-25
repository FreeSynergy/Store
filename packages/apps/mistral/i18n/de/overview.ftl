# help/de/overview.ftl — Mistral.rs-Hilfetexte (Deutsch)

help-mistral-title = Mistral.rs — Lokaler LLM-Inferenz-Server

help-mistral-body =
    Mistral.rs ist eine schnelle, in Rust geschriebene LLM-Inferenz-Engine mit
    OpenAI-kompatiblem REST-API. Große Sprachmodelle (LLMs) laufen lokal auf dem
    FreeSynergy-Node — keine Daten verlassen den eigenen Server.

    Hauptfunktionen:
    - OpenAI-kompatibles API (/v1/chat/completions, /v1/completions, /v1/embeddings)
    - ISQ (In-Situ-Quantisierung): lädt ein Modell von HuggingFace herunter und
      quantisiert es im Arbeitsspeicher — keine vorquantisierte Datei nötig
    - GGUF-Modell-Unterstützung (vorquantisierte Dateien)
    - CPU- und Metal-Inferenz (Apple Silicon)
    - Mehrere Modellarchitekturen: Qwen, Llama, Mistral, Phi, Gemma u. a.

    Im Gegensatz zu einem Container wird Mistral.rs als Binary-Service deployted
    (kind = "binary"). Das Binary wird aus dem FreeSynergy-Katalog installiert.

    Anwendungsfälle:
    - KI-gestützte Suche und Dokumentenzusammenfassung (via Outline, Forgejo)
    - Privater Coding-Assistent (Continue.dev, VS Code)
    - Bot-Automatisierung innerhalb der FreeSynergy-Plattform (fs-bots)
    - Embeddings für semantische Suche

help-mistral-install-title = Mistral.rs installieren

help-mistral-install-body =
    1. Setup-Assistenten ausführen:
       - Model-ID: HuggingFace-Repo (z. B. "Qwen/Qwen3-4B") oder lokaler .gguf-Pfad
       - ISQ-Typ: "q4k" (empfohlen, ~3 GB RAM für ein 4B-Modell)
       - Max Sequences: 4 (für eine 16-GB-Maschine)
       - Service-Domain (optional, für externen API-Zugang via Proxy)

    2. Beim ersten Start lädt Mistral.rs das Modell von HuggingFace herunter.
       Kann je nach Modellgröße und Verbindungsgeschwindigkeit mehrere Minuten dauern.
       Das Modell wird in {models_dir} für folgende Starts gecacht.

    3. Wenn laufend, ist das API verfügbar unter:
       - Lokal: http://localhost:1234/v1/
       - Via Proxy: https://ai.example.com/v1/ (wenn Domain konfiguriert)

    4. Test:
         curl http://localhost:1234/v1/chat/completions \
           -H "Content-Type: application/json" \
           -d '{"model":"default","messages":[{"role":"user","content":"Hallo!"}]}'

help-mistral-models-title = Modelle und Quantisierung

help-mistral-models-body =
    Mistral.rs unterstützt zwei Modell-Lademodi:

    ISQ-Modus (empfohlen):
    mistral_model_id auf HuggingFace-Repo-ID setzen (z. B. "Qwen/Qwen3-4B").
    mistral_isq auf einen Quantisierungstyp setzen. Mistral.rs lädt das
    Vollpräzisionsmodell herunter und quantisiert es im Arbeitsspeicher.

    ISQ-Quantisierungstypen und RAM-Bedarf (für ein 4B-Modell):
    - q2k:  ~1,5 GB RAM  (sehr komprimiert, Qualitätsverlust)
    - q4k:  ~2,5 GB RAM  (empfohlene Balance)
    - q6k:  ~3,5 GB RAM  (hohe Qualität)
    - q8_0: ~4,5 GB RAM  (nahe Vollqualität)

    GGUF-Modus:
    mistral_model_id auf einen absoluten Pfad zu einer .gguf-Datei setzen.
    mistral_isq leer lassen. Die Datei muss bereits quantisiert sein.

    Empfohlene Modelle je Hardware:
    - 8 GB RAM:  Qwen/Qwen3-1.7B mit q4k oder q8_0
    - 16 GB RAM: Qwen/Qwen3-4B mit q4k (Standard-Setup)
    - 32 GB RAM: Qwen/Qwen3-8B oder Meta-Llama-3.1-8B mit q4k

help-mistral-api-title = Das API verwenden

help-mistral-api-body =
    Mistral.rs stellt ein OpenAI-kompatibles API bereit. Jedes OpenAI-SDK funktioniert:

    Chat-Completions (POST /v1/chat/completions):
        {
          "model": "default",
          "messages": [{"role": "user", "content": "Fasse diesen Text zusammen: ..."}],
          "max_tokens": 512,
          "temperature": 0.7
        }

    Embeddings (POST /v1/embeddings):
        {
          "model": "default",
          "input": "zu einbettender Text"
        }

    Streaming: "stream": true hinzufügen für Token-für-Token-Ausgabe via SSE.

    Continue.dev-Konfiguration (~/.continue/config.json):
        {
          "models": [{
            "title": "Lokal (Mistral.rs)",
            "provider": "openai",
            "model": "default",
            "apiBase": "http://localhost:1234/v1"
          }]
        }

    Hinweis: Der Modellname "default" referenziert immer das aktuell geladene Modell.
