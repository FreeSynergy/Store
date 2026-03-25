zentinel-description =
    Zentinel es el proxy inverso y gateway TLS para FreeSynergy.

    Se sitúa frente a todos los servicios y gestiona la terminación TLS, la renovación
    automática de certificados ACME (Let's Encrypt y ZeroSSL) y el enrutamiento HTTP.
    Los desafíos DNS-01 son soportados mediante proveedores DNS conectables
    (Cloudflare, Hetzner, IONOS y más).

    Zentinel normalmente se instala como parte del bundle zentinel junto con
    Zentinel Control Plane, que proporciona el panel de configuración.

zentinel-features =
    - Terminación TLS para todos los servicios
    - Renovación automática de certificados (ACME / Let's Encrypt)
    - Enrutamiento HTTP/HTTPS con reglas basadas en rutas
    - Soporte para desafíos DNS-01 (Cloudflare, Hetzner, IONOS, …)
    - Soporte para desafíos HTTP-01
    - Configuración basada en KDL
