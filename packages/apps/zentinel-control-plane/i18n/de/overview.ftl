# help/de/overview.ftl — Zentinel Control Plane Hilfetexte (Deutsch)

help-zentinel-plane-title = Zentinel Control Plane — Konfigurations-Dashboard

help-zentinel-plane-body =
    Zentinel Control Plane ist die Verwaltungsschicht für den Zentinel Reverse Proxy.
    Es stellt eine REST-API und ein Web-Dashboard zur Konfiguration aller Routing-,
    Zertifikats- und Provider-Einstellungen bereit — ohne direkte Bearbeitung von
    Konfigurationsdateien.

    Alle über das Dashboard vorgenommenen Änderungen werden sofort auf Zentinel
    angewendet — kein Neustart für Route-Updates und Zertifikatskonfiguration nötig.

    Funktionen:
    - Route-Verwaltung: Routing-Regeln erstellen, bearbeiten und löschen
    - Zertifikatsverwaltung: Zertifikatsstatus anzeigen, Erneuerung manuell auslösen
    - DNS-Provider-Konfiguration: DNS-01-Challenge-Provider für Wildcard-Zertifikate
    - ACME-Provider-Auswahl: zwischen Let's Encrypt und ZeroSSL wechseln
    - Echtzeit-Konfigurationsreload
    - Audit-Log der Konfigurationsänderungen

    Die Control Plane ist im Zentinel-Bundle enthalten — der empfohlene Weg,
    beide Komponenten gemeinsam zu installieren.

help-zentinel-plane-routes-title = Routen verwalten

help-zentinel-plane-routes-body =
    Routen definieren, wie eingehender HTTPS-Traffic an interne Dienste weitergeleitet
    wird. Jede Route gibt an:
    - Domain (z. B. forgejo.example.com)
    - Pfad-Prefix (z. B. / für die gesamte Domain)
    - Upstream-Dienst-Adresse (Container-Name und Port)
    - Ob der Pfad-Prefix beim Weiterleiten entfernt wird
    - Ob der Upstream eigenes TLS verwendet (upstream_tls)

    Routen können manuell im Dashboard erstellt oder automatisch aus Service-Contracts
    beim Ausführen von `fsn deploy` generiert werden.

    Manuell hinzugefügte Routen bleiben über Deployments hinweg erhalten.

help-zentinel-plane-certs-title = Zertifikatsverwaltung

help-zentinel-plane-certs-body =
    Die Control Plane zeigt den Status und das Ablaufdatum aller von Zentinel
    verwalteten TLS-Zertifikate. Zertifikate werden von Zentinel automatisch vor
    Ablauf erneuert — das Dashboard zeigt den Erneuerungsstatus und ermöglicht
    frühzeitige manuelle Erneuerung.

    Für Wildcard-Zertifikate (*.example.com) ist eine DNS-01-ACME-Challenge nötig.
    Den DNS-Provider-Plugin vor der Wildcard-Anforderung in den Control-Plane-
    Einstellungen konfigurieren.

    Unterstützte DNS-Provider: Cloudflare, Route 53, DigitalOcean und weitere
    über das Zentinel DNS-Plugin-Interface.
