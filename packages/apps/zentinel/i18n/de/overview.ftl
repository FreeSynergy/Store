# help/de/overview.ftl — Zentinel-Hilfetexte (Deutsch)

help-zentinel-title = Zentinel — Reverse Proxy mit automatischem TLS

help-zentinel-body =
    Zentinel ist der einzige externe Einstiegspunkt der gesamten FreeSynergy-Plattform.
    Es ist der EINZIGE Container mit veröffentlichten Ports (80 und 443) — alle anderen
    Dienste sind nur über Zentinel erreichbar, niemals direkt aus dem Internet.

    Zentinel übernimmt:
    - Reverse Proxying des gesamten HTTP/S-Traffics zu internen Diensten
    - Automatische TLS-Zertifikats-Bereitstellung via ACME (Let's Encrypt / ZeroSSL)
    - Automatische Zertifikatserneuerung (vor Ablauf)
    - HTTP → HTTPS-Weiterleitung (gesamter HTTP-Traffic wird auf HTTPS hochgestuft)
    - Routing basierend auf Domain-Namen und Pfad-Prefixen
    - WebSocket-Proxy-Unterstützung
    - Upstream-TLS-Unterstützung (für Dienste mit eigenem TLS, z. B. Kanidm, Stalwart)

    Konfiguration erfolgt über eine KDL-Datei (KDL Document Language), die automatisch
    vom generate-config-Plugin aus allen Service-Contracts generiert wird. Die KDL-Datei
    wird nie manuell bearbeitet — sie wird bei jedem `fsn deploy` neu generiert.

    Constraint: per_host = 1, per_ip = 1 — exakt ein Zentinel pro Host.

help-zentinel-tls-title = Automatisches TLS (ACME)

help-zentinel-tls-body =
    Zentinel bezieht und erneuert TLS-Zertifikate für alle konfigurierten Domains
    automatisch via ACME-Protokoll (Automatic Certificate Management Environment).

    Unterstützte ACME-Provider:
    - Let's Encrypt (Standard, kostenlos, Rate-Limits beachten)
    - ZeroSSL (Alternative, Free-Tier verfügbar)

    Die ACME-E-Mail-Adresse wird in der host.toml-Datei konfiguriert:
        [proxy]
        acme_email = "admin@example.com"

    Diese E-Mail erhält Ablauf-Warnungen von Let's Encrypt (normalerweise durch
    Auto-Erneuerung unterdrückt). Eine echte, überwachte Adresse verwenden.

    Zertifikat-Speicherung: /data/certificates/ im Container, gesichert durch das
    Config-Volume.

    Rate-Limits (Let's Encrypt):
    - 50 Zertifikate pro registrierter Domain pro Woche
    - Zentinel in der Produktion nicht häufig neu installieren

help-zentinel-routing-title = Routing und Service-Contracts

help-zentinel-routing-body =
    Jeder Dienst definiert seine Routing-Anforderungen im [contract]-Abschnitt
    seiner Modul-TOML. Zentinels generate-config-Plugin liest alle Contracts und
    generiert eine KDL-Konfigurationsdatei.

    Contract-Beispiel (aus kanidm.toml):
        [contract]
        upstream_tls = true
        [[contract.routes]]
        id    = "main"
        path  = "/"

    Das teilt Zentinel mit:
    - Gesamten Traffic für die Kanidm-Domain an den Kanidm-Container weiterleiten
    - HTTPS für die Upstream-Verbindung nutzen (upstream_tls = true)

    Das generierte KDL mappt die Domain jedes Dienstes auf seinen Container-Namen
    und Port. Der Container-Name wird beim Deployment automatisch abgeleitet.

    Nach dem Hinzufügen oder Entfernen von Diensten neu generieren:
        fsn deploy  (generiert neu und startet Zentinel neu)

help-zentinel-security-title = Sicherheitsmodell

help-zentinel-security-body =
    Zentinel ist die Sicherheitsgrenze der Plattform:

    1. NUR Zentinel hat published_ports = ["80:80", "443:443"]
       Alle anderen Container haben KEINE published_ports — sie sind vom
       Internet aus unerreichbar.

    2. Gesamter externer Traffic läuft durch Zentinel. Dienste ohne öffentlichen
       Zugang (z. B. PostgreSQL, Dragonfly) haben keinen Zentinel-Contract —
       sie sind vom Internet aus unsichtbar.

    3. TLS überall: Zentinel terminiert TLS für alle externen Verbindungen.
       Interne Verbindungen zwischen Zentinel und Diensten können plain HTTP
       (im vertrauenswürdigen Podman-Netzwerk) oder HTTPS sein (upstream_tls = true).

    4. Keine anderen Reverse Proxies: Nicht Nginx, Caddy oder Apache neben
       Zentinel betreiben. Zwei Proxies verursachen Routing-Verwirrung und doppeltes TLS.

    Best Practices:
    - Host-Firewall auf Ports 80, 443 und 22 (SSH) beschränken
    - Nie Port-Ranges für einzelne Dienste öffnen — Zentinel routet sie
    - Zentinels Forward-Auth für Dienste ohne OIDC nutzen (z. B. OpenObserve)
