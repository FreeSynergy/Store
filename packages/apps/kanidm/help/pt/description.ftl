kanidm-description =
    O Kanidm é um servidor moderno de gerenciamento de identidade e acesso
    escrito inteiramente em Rust.

    É o provedor IAM padrão do FreeSynergy e é exigido pelo Tuwunel (OIDC),
    Stalwart (OIDC) e fs-node (autenticação). Todos os serviços se
    autenticam através do Kanidm usando OAuth2 ou OIDC — os usuários fazem
    login uma vez e acessam tudo.

    O FreeSynergy distribui o Kanidm a partir de seu próprio fork
    (FreeSynergy/fs-kanidm) para garantir builds controlados, releases
    assinados e a capacidade de aplicar patches retroativos.

kanidm-features =
    - Provedor OAuth2 e OIDC
    - Servidor LDAP (para aplicações legadas)
    - Provisionamento de usuários SCIM 2.0
    - Suporte a WebAuthn e passkeys
    - MFA (TOTP, chaves de segurança)
    - Interface web de administração integrada
    - Escrito inteiramente em Rust — sem JVM, sem runtime Python
