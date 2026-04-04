mistral-description =
    Mistral.rs é um motor de inferência LLM local ultrarrápido escrito em Rust, bifurcado e pré-configurado para FreeSynergy.

    Os modelos rodam inteiramente no seu próprio hardware — sem nuvem, sem dados saindo do seu servidor.
    O FreeSynergy o usa como backend de inferência para fs-ai e fs-bots, com uma API compatível com OpenAI
    para que qualquer ferramenta que use OpenAI possa usar seus modelos locais.

mistral-features =
    - Suporta Mistral, Llama, Phi, Gemma e mais no formato GGUF
    - API REST compatível com OpenAI (substituto direto para clientes OpenAI)
    - Modelos de visão (compreensão de imagens) suportados
    - Modelos quantizados para menor uso de memória
    - Aceleração GPU opcional (CUDA 12+)
    - Usado por fs-ai (assistente de IA) e fs-bots (runtime de bots)
    - Sem chaves de API externas ou dependência de nuvem
    - Toda a inferência roda no seu próprio hardware
