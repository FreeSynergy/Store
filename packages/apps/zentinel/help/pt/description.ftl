zentinel-description =
    O Zentinel é o proxy reverso e gateway TLS do FreeSynergy.

    Fica na frente de todos os serviços e gerencia a terminação TLS, a
    renovação de certificados ACME (Let's Encrypt e ZeroSSL) e o
    roteamento HTTP. Os desafios DNS-01 são suportados através de
    provedores DNS configuráveis (Cloudflare, Hetzner, IONOS e outros).

    O Zentinel é tipicamente instalado como parte do pacote zentinel junto
    com o Zentinel Control Plane, que fornece o painel de configuração.

zentinel-features =
    - Terminação TLS para todos os serviços
    - Renovação automática de certificados (ACME / Let's Encrypt)
    - Roteamento HTTP/HTTPS com regras baseadas em caminho
    - Suporte a desafios DNS-01 (Cloudflare, Hetzner, IONOS, …)
    - Suporte a desafios HTTP-01
    - Configuração baseada em KDL
