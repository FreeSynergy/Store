kanidm-description =
    Kanidm es un servidor moderno de gestión de identidad y acceso, desarrollado completamente en Rust.

    Es el proveedor IAM predeterminado de FreeSynergy y es requerido por Tuwunel (OIDC),
    Stalwart (OIDC) y fs-node (autenticación). Todos los servicios se autentican a través
    de Kanidm usando OAuth2 u OIDC — los usuarios inician sesión una vez y acceden a todo.

    FreeSynergy distribuye Kanidm desde su propio fork (FreeSynergy/fs-kanidm) para garantizar
    compilaciones controladas, versiones firmadas y la capacidad de aplicar parches retroactivos.

kanidm-features =
    - Proveedor de OAuth2 y OIDC
    - Servidor LDAP (para aplicaciones heredadas)
    - Aprovisionamiento de usuarios SCIM 2.0
    - Soporte para WebAuthn y passkeys
    - MFA (TOTP, llaves de seguridad)
    - Interfaz de administración web integrada
    - Escrito completamente en Rust — sin JVM, sin runtime de Python
