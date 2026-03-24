zentinel-description =
    Zentinel est le proxy inverse et la passerelle TLS pour FreeSynergy.

    Il se place devant tous les services et gère la terminaison TLS, le renouvellement
    automatique des certificats ACME (Let's Encrypt et ZeroSSL) et le routage HTTP.
    Les défis DNS-01 sont supportés via des fournisseurs DNS connectables
    (Cloudflare, Hetzner, IONOS et plus).

    Zentinel est généralement installé dans le cadre du bundle zentinel avec
    Zentinel Control Plane, qui fournit le tableau de bord de configuration.

zentinel-features =
    - Terminaison TLS pour tous les services
    - Renouvellement automatique des certificats (ACME / Let's Encrypt)
    - Routage HTTP/HTTPS avec règles basées sur les chemins
    - Support des défis DNS-01 (Cloudflare, Hetzner, IONOS, …)
    - Support des défis HTTP-01
    - Configuration basée sur KDL
