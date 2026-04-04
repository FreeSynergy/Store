zentinel-plane-description =
    Die Zentinel Control Plane verwaltet die Zentinel-Proxy-Flotte mit zentralisierter Routen- und TLS-Konfiguration.

    Sie stellt eine REST-API und ein Dashboard zum Hinzufügen, Aktualisieren und Entfernen von Proxy-Routen
    über alle Zentinel-Instanzen bereit. FreeSynergy nutzt sie für zentrales Ingress-Management — wenn ein
    neuer Dienst installiert wird, registriert der fs-container-adapter seine Routen hier automatisch.

zentinel-plane-features =
    - Zentrale Routenkonfiguration für alle Zentinel-Proxies
    - Automatische TLS-Zertifikatbereitstellung und -erneuerung
    - Health-Monitoring aller Proxy-Instanzen
    - REST-API für programmatisches Routen-Management
    - Dashboard für aktive Routen und Zertifikatsstatus
    - Automatische Routenregistrierung via fs-registry-Integration
    - OAuth2-geschützte Admin-API (Kanidm)
