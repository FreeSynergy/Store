kanidm-description =
    Kanidm es un servidor moderno de gestión de identidades y accesos, escrito completamente en Rust.

    Es el núcleo IAM central de FreeSynergy — cada servicio se autentica a través de Kanidm.
    Proporciona OAuth2, OIDC, LDAP, SCIM 2.0, passkeys WebAuthn y MFA sin configuración adicional.
    FreeSynergy incluye su propio fork con aprovisionamiento SCIM e integración PAM preconfigurados.

kanidm-features =
    - Proveedor de identidad OAuth2 y OpenID Connect (OIDC)
    - SCIM 2.0 para aprovisionamiento automático de usuarios y grupos
    - Interfaz LDAP para compatibilidad con aplicaciones legacy
    - Passkeys WebAuthn y autenticación multifactor TOTP/FIDO2
    - Integración PAM para inicio de sesión en sistemas Linux
    - Gestión de contraseñas y claves SSH de autoservicio
    - Control de acceso basado en grupos para todos los servicios FreeSynergy
    - Interfaz web y CLI integradas (cliente kanidm)
