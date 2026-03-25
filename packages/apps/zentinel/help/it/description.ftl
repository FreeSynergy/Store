zentinel-description =
    Zentinel è il reverse proxy e gateway TLS per FreeSynergy.

    Si posiziona davanti a tutti i servizi e gestisce la terminazione TLS,
    il rinnovo dei certificati ACME (Let's Encrypt e ZeroSSL) e il routing
    HTTP. Le challenge DNS-01 sono supportate tramite provider DNS
    configurabili (Cloudflare, Hetzner, IONOS e altri).

    Zentinel viene tipicamente installato come parte del bundle zentinel
    insieme a Zentinel Control Plane, che fornisce la dashboard di
    configurazione.

zentinel-features =
    - Terminazione TLS per tutti i servizi
    - Rinnovo automatico dei certificati (ACME / Let's Encrypt)
    - Routing HTTP/HTTPS con regole basate sul percorso
    - Supporto challenge DNS-01 (Cloudflare, Hetzner, IONOS, …)
    - Supporto challenge HTTP-01
    - Configurazione basata su KDL
