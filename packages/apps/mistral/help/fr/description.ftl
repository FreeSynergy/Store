mistral-description =
    Mistral.rs est un serveur d'inférence LLM local haute performance avec une API compatible OpenAI.

    Il s'exécute entièrement en local — sans cloud, sans abonnements. Il supporte la quantification
    in-situ ISQ : téléchargez n'importe quel modèle HuggingFace et quantifiez-le en mémoire au
    premier démarrage, sans fichiers pré-quantifiés nécessaires. Supporte également les fichiers GGUF directement.

    S'exécute sur CPU sans nécessiter de GPU. Accélération GPU optionnelle via CUDA ou Metal.

mistral-features =
    - API REST compatible OpenAI (/v1/chat/completions, /v1/models, …)
    - Quantification in-situ ISQ (n'importe quel modèle HuggingFace → quantifié en mémoire)
    - Support des fichiers GGUF
    - Inférence CPU (sans GPU requis)
    - Accélération GPU optionnelle (CUDA, Metal)
    - Réponses en streaming
