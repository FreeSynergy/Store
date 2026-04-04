zentinel-description =
    Zentinel è un reverse proxy e API gateway nativo Rust — il livello di ingresso per tutti i servizi FreeSynergy.

    Gestisce terminazione TLS, HTTP/2, routing dinamico e rate limiting. Ogni servizio container viene
    esposto tramite Zentinel, che instrada automaticamente il traffico in base alle capabilities registrate in fs-registry.
    I certificati TLS vengono provisionati automaticamente tramite ACME (Let's Encrypt).

zentinel-features =
    - TLS automatico tramite ACME (Let's Encrypt / CA personalizzata)
    - Routing dinamico — le route si aggiornano senza riavvio
    - Ingresso HTTP e HTTPS (porte 80 e 443)
    - Supporto HTTP/2 e WebSocket
    - Rate limiting e throttling delle richieste
    - Gestito tramite Zentinel Control Plane
    - Routing automatico dalle capabilities fs-registry
    - Validazione token OAuth2 per route protette
