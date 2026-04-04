mistral-description =
    Mistral.rs est un moteur d'inférence LLM local ultra-rapide écrit en Rust, forké et préconfiguré pour FreeSynergy.

    Les modèles s'exécutent entièrement sur votre propre matériel — aucun cloud, aucune donnée ne quitte votre serveur.
    FreeSynergy l'utilise comme backend d'inférence pour fs-ai et fs-bots, avec une API compatible OpenAI
    permettant à tout outil qui parle OpenAI d'utiliser vos modèles locaux à la place.

mistral-features =
    - Supporte Mistral, Llama, Phi, Gemma et plus au format GGUF
    - API REST compatible OpenAI (remplacement direct pour les clients OpenAI)
    - Modèles de vision (compréhension d'images) supportés
    - Modèles quantifiés pour une utilisation mémoire réduite
    - Accélération GPU optionnelle (CUDA 12+)
    - Utilisé par fs-ai (assistant IA) et fs-bots (runtime de bots)
    - Aucune clé API externe ni dépendance cloud
    - Toute l'inférence s'exécute sur votre propre matériel
