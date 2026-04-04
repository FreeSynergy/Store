kanidm-description =
    Kanidm é um servidor moderno de gerenciamento de identidades e acessos, escrito inteiramente em Rust.

    É o núcleo IAM central do FreeSynergy — cada serviço se autentica via Kanidm.
    Fornece OAuth2, OIDC, LDAP, SCIM 2.0, passkeys WebAuthn e MFA sem configuração adicional.
    O FreeSynergy inclui seu próprio fork com provisionamento SCIM e integração PAM pré-configurados.

kanidm-features =
    - Provedor de identidade OAuth2 e OpenID Connect (OIDC)
    - SCIM 2.0 para provisionamento automatizado de usuários e grupos
    - Interface LDAP para compatibilidade com aplicações legadas
    - Passkeys WebAuthn e autenticação multifator TOTP/FIDO2
    - Integração PAM para login no sistema Linux
    - Gerenciamento self-service de senhas e chaves SSH
    - Controle de acesso baseado em grupos para todos os serviços FreeSynergy
    - Interface web e CLI integradas (cliente kanidm)
