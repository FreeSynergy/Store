# i18n/de/fields.ftl — FreeSynergy AI Feldhilfetexte (Deutsch)

help-ai-field-model-title = Modell

help-ai-field-model-body =
    Der Name des lokalen LLM-Modells, das über fs-mistral geladen werden soll.
    Muss ein Modellname sein, der in der fs-mistral-App heruntergeladen wurde.

    Standard: mistral-7b-instruct

    Verfügbare Modelle in der Mistral-App ansehen. Häufige Werte:
    - mistral-7b-instruct (empfohlen, ausgewogene Leistung)
    - mixtral-8x7b-instruct (bessere Qualität, erfordert 32 GB RAM)
    - mistral-3b-instruct (schnellste, geringere Qualität)

help-ai-field-context-window-title = Kontextfenster (Token)

help-ai-field-context-window-body =
    Maximale Anzahl von Token (ungefähr: Wörter) im Gesprächs-Kontextfenster.
    Höhere Werte ermöglichen der KI, mehr vom Gespräch zu erinnern und längere
    Dokumente zu verarbeiten, verbrauchen aber mehr RAM.

    Empfohlene Werte:
    - 4096 für Systeme mit wenig Arbeitsspeicher (< 8 GB)
    - 8192 (Standard) für normale Systeme
    - 16384 für Systeme mit ≥ 32 GB RAM

    Wenn die KI frühere Gesprächsteile zu "vergessen" scheint, diesen Wert erhöhen.

help-ai-field-tools-title = Plattform-Werkzeuge aktivieren

help-ai-field-tools-body =
    Wenn aktiviert, kann die KI über den Message Bus auf Plattform-Daten zugreifen:
    Wiki-Suche, Aufgabenlisten, Git-Historie, Dienst-Status und Store-Suche.

    Deaktivieren, um die KI auf reine Konversation ohne Plattform-Zugriff zu beschränken.
    Nützlich auf gemeinsam genutzten oder nicht vertrauenswürdigen Nodes, auf denen
    der KI-Werkzeug-Zugriff eingeschränkt werden soll.
