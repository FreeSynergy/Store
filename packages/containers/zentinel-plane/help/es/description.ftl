zentinel-plane-description =
    El Zentinel Control Plane gestiona la flota de proxies Zentinel con configuración centralizada de rutas y TLS.

    Proporciona una API REST y un panel para agregar, actualizar y eliminar rutas de proxy en todas
    las instancias Zentinel. FreeSynergy lo usa para gestión centralizada de ingreso — cuando se instala
    un nuevo servicio, el fs-container-adapter registra sus rutas aquí automáticamente.

zentinel-plane-features =
    - Configuración centralizada de rutas para todos los proxies Zentinel
    - Aprovisionamiento y renovación automática de certificados TLS
    - Monitoreo de salud de todas las instancias proxy
    - API REST para gestión programática de rutas
    - Panel para rutas activas y estado de certificados
    - Registro automático de rutas via integración fs-registry
    - API de administración protegida por OAuth2 (Kanidm)
