stalwart-description =
    Stalwart é um servidor de e-mail all-in-one moderno escrito em Rust, suportando SMTP, IMAP e JMAP.

    O FreeSynergy inclui um fork pré-configurado com autenticação OIDC do Kanidm e armazenamento
    compatível com S3 para dados de e-mail. As contas de usuário são gerenciadas centralmente
    no Kanidm e provisionadas automaticamente via SCIM — nenhum banco de dados separado é necessário.

stalwart-features =
    - SMTP, SMTPS e submissão SMTP (portas 25, 465, 587)
    - IMAP e IMAPS (portas 143, 993)
    - JMAP para clientes modernos (Bulwark Mail usa JMAP)
    - Anti-spam integrado, assinatura DKIM, aplicação de SPF e DMARC
    - Login único via Kanidm OIDC
    - Provisionamento de usuários SCIM a partir do Kanidm
    - Armazenamento compatível com S3 para dados de e-mail
    - Interface de administração web para configuração e monitoramento
