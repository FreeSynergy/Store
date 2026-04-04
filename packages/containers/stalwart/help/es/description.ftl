stalwart-description =
    Stalwart es un servidor de correo todo-en-uno moderno escrito en Rust, compatible con SMTP, IMAP y JMAP.

    FreeSynergy incluye un fork preconfigurado con autenticación OIDC de Kanidm y almacenamiento
    compatible con S3 para datos de correo. Las cuentas de usuario se gestionan centralmente
    en Kanidm y se aprovisionan automáticamente mediante SCIM — no se necesita base de datos separada.

stalwart-features =
    - SMTP, SMTPS y envío SMTP (puertos 25, 465, 587)
    - IMAP e IMAPS (puertos 143, 993)
    - JMAP para clientes modernos (Bulwark Mail usa JMAP)
    - Anti-spam integrado, firma DKIM, aplicación de SPF y DMARC
    - Inicio de sesión único via Kanidm OIDC
    - Aprovisionamiento de usuarios SCIM desde Kanidm
    - Almacenamiento compatible S3 para datos de correo
    - Interfaz de administración web para configuración y monitoreo
