zentinel-description =
    Zentinel es un proxy inverso y gateway API nativo de Rust — la capa de ingreso para todos los servicios FreeSynergy.

    Maneja terminación TLS, HTTP/2, enrutamiento dinámico y limitación de velocidad. Cada servicio contenedor
    se expone a través de Zentinel, que enruta el tráfico automáticamente basándose en capacidades registradas en fs-registry.
    Los certificados TLS se aprovisionan automáticamente via ACME (Let's Encrypt).

zentinel-features =
    - TLS automático via ACME (Let's Encrypt / CA personalizada)
    - Enrutamiento dinámico — las rutas se actualizan sin reiniciar
    - Ingreso HTTP y HTTPS (puertos 80 y 443)
    - Soporte HTTP/2 y WebSocket
    - Limitación de velocidad y throttling de solicitudes
    - Gestionado via Zentinel Control Plane
    - Enrutamiento automático desde capacidades fs-registry
    - Validación de token OAuth2 para rutas protegidas
