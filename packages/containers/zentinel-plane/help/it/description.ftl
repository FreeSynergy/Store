zentinel-plane-description =
    Il Zentinel Control Plane gestisce la flotta di proxy Zentinel con configurazione centralizzata di route e TLS.

    Fornisce un'API REST e una dashboard per aggiungere, aggiornare e rimuovere route proxy su tutte
    le istanze Zentinel. FreeSynergy lo usa per la gestione centralizzata dell'ingress — quando viene
    installato un nuovo servizio, il fs-container-adapter registra le sue route qui automaticamente.

zentinel-plane-features =
    - Configurazione centralizzata delle route per tutti i proxy Zentinel
    - Provisioning e rinnovo automatico dei certificati TLS
    - Monitoraggio della salute di tutte le istanze proxy
    - API REST per la gestione programmatica delle route
    - Dashboard per route attive e stato dei certificati
    - Registrazione automatica delle route tramite integrazione fs-registry
    - API di amministrazione protetta da OAuth2 (Kanidm)
