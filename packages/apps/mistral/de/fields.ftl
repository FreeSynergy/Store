# help/de/fields.ftl — Mistral.rs Feld-Hilfetexte (Deutsch)

help-mistral-field-model-id-title = Modell-ID (mistral_model_id)

help-mistral-field-model-id-body =
    Identifiziert das zu ladende Modell. Zwei Formate werden unterstützt:

    HuggingFace-Repo-ID (ISQ-Modus):
        Qwen/Qwen3-4B
        meta-llama/Llama-3.1-8B
        microsoft/Phi-4-mini-instruct
    Mistral.rs lädt das Vollpräzisionsmodell herunter und quantisiert es
    im Arbeitsspeicher. Erfordert Internetzugang beim ersten Start.
    Das heruntergeladene Modell wird in {models_dir} gecacht.

    Lokaler .gguf-Dateipfad (GGUF-Modus):
        /pfad/zum/modell.gguf
    Mistral.rs lädt die vorquantisierte GGUF-Datei direkt.
    mistral_isq in diesem Modus leer lassen.

    Hinweis: HuggingFace erfordert für manche Modelle (z. B. Llama) das Akzeptieren
    von Lizenzbedingungen. Vorher `huggingface-cli login` auf dem Server ausführen.

help-mistral-field-isq-title = ISQ-Quantisierungstyp (mistral_isq)

help-mistral-field-isq-body =
    Der Quantisierungstyp für den ISQ-Modus (In-Situ-Quantisierung).
    Mistral.rs quantisiert das Modell im Arbeitsspeicher.

    Leer lassen, wenn eine .gguf-Datei geladen wird (GGUF-Modus).

    Verfügbare Typen und ungefährer RAM für ein 4B-Modell:
    - q2k:  ~1,5 GB  — sehr klein, merklicher Qualitätsverlust
    - q3k:  ~2,0 GB  — klein, moderate Qualität
    - q4k:  ~2,5 GB  — empfohlen, gutes Qualität/Größe-Verhältnis
    - q5k:  ~3,0 GB  — höhere Qualität
    - q6k:  ~3,5 GB  — nahe Vollqualität
    - q8_0: ~4,5 GB  — nahe fp16-Qualität, keine Quantisierungsartefakte

    Faustregel: verfügbarer RAM ÷ 2 = maximale Modellgröße.
    Bei 16 GB RAM: q4k auf einem 4B-Modell lässt ~13,5 GB für OS und andere Container.

help-mistral-field-max-seqs-title = Maximale Sequences (mistral_max_seqs)

help-mistral-field-max-seqs-body =
    Die maximale Anzahl gleichzeitig verarbeiteter Inferenz-Anfragen. Höhere
    Werte erhöhen den Durchsatz, erfordern aber proportional mehr Arbeitsspeicher.

    Standard: 4 — geeignet für interaktive Nutzung auf einer 16-GB-Maschine.

    Richtwerte:
    - 1: Speicherbegrenzte Server, Einzelnutzer
    - 4: Standard für interaktive Nutzung (mehrere gleichzeitige Benutzer)
    - 8: Hochdurchsatz-Anwendungsfälle (Batch-Zusammenfassung, CI-Pipelines)

    Jede weitere gleichzeitige Sequence verdoppelt ungefähr den Peak-Speicherbedarf.

help-mistral-field-host-title = Bind-Host (mistral_host)

help-mistral-field-host-body =
    Die IP-Adresse, auf der der Inferenz-Server lauscht.

    "127.0.0.1" (Standard): Nur lokaler Zugriff. Das API ist nur von derselben
    Maschine erreichbar. Empfohlen für Zugriff via lokalem IDE-Plugin (Continue.dev)
    oder aus Sicherheitsgründen. Zentinel kann trotzdem als Proxy dienen.

    "0.0.0.0": Alle Interfaces binden. Das API ist von anderen Maschinen im Netzwerk
    erreichbar. Nur verwenden, wenn direkter Netzwerkzugang ohne Proxy benötigt wird.

    Hinweis: Das API hat keine eingebaute Authentifizierung. Bei externer Exposition
    (via Zentinel oder 0.0.0.0) Authentifizierung auf Proxy-Ebene hinzufügen.
