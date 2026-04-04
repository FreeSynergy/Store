zentinel-plane-description =
    The Zentinel Control Plane manages the Zentinel proxy fleet with centralized route and TLS configuration.

    It provides a REST API and dashboard for adding, updating, and removing proxy routes across all
    Zentinel instances. FreeSynergy uses it for centralized ingress management — when a new service
    is installed, the fs-container-adapter registers its routes here automatically.

zentinel-plane-features =
    - Centralized route configuration for all Zentinel proxies
    - Automatic TLS certificate provisioning and renewal
    - Health monitoring of all proxy instances
    - REST API for programmatic route management
    - Dashboard for viewing active routes and certificate status
    - Automatic route registration via fs-registry integration
    - OAuth2-protected admin API (Kanidm)
