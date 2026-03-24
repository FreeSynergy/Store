zentinel-description =
    The Zentinel bundle installs the Zentinel reverse proxy and its control plane
    as a single unit for FreeSynergy deployments.

    Zentinel handles all inbound HTTPS routing: it terminates TLS, applies routing
    rules, and forwards requests to the appropriate FreeSynergy service. The control
    plane provides an API for managing routes, upstreams, and certificates dynamically
    — without restarting the proxy. This bundle is the recommended way to set up
    Zentinel for a new FreeSynergy node.

zentinel-features =
    - Installs Zentinel server + control plane together
    - TLS termination for all services
    - Dynamic routing without proxy restarts
    - Shared routing configuration across all FreeSynergy services
    - Based on the FreeSynergy/zentinel fork
