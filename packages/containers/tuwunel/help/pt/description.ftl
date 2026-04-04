tuwunel-description =
    Tuwunel é um homeserver Matrix de alto desempenho escrito em Rust, bifurcado e pré-configurado para FreeSynergy.

    Fornece mensagens criptografadas em tempo real, salas, espaços e chamadas de voz/vídeo
    através do protocolo aberto Matrix. Os usuários se autenticam via Kanidm OIDC — nenhuma
    conta Matrix separada é necessária. Os arquivos de mídia são armazenados em storage compatível com S3.

tuwunel-features =
    - API cliente-servidor Matrix (CS-API r0/v3)
    - Mensagens e transferência de arquivos criptografados de ponta a ponta
    - Salas, espaços e mensagens diretas
    - Chamadas de voz e vídeo via Element Call (TURN/STUN)
    - Federação Matrix com a rede Matrix
    - Login único via Kanidm OIDC
    - Provisionamento de usuários SCIM a partir do Kanidm
    - Armazenamento de mídia compatível com S3
    - Suporte a bots via fs-bots (adaptador fs-channel-matrix)
