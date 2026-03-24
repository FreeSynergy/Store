zentinel-description =
    Das Zentinel-Bundle installiert den Zentinel-Reverse-Proxy und seine Control Plane
    als eine Einheit für FreeSynergy-Deployments.

    Zentinel übernimmt das gesamte eingehende HTTPS-Routing: Es beendet TLS, wendet
    Routing-Regeln an und leitet Anfragen an den entsprechenden FreeSynergy-Dienst weiter.
    Die Control Plane bietet eine API zum dynamischen Verwalten von Routes, Upstreams und
    Zertifikaten — ohne den Proxy neu zu starten. Dieses Bundle ist der empfohlene Weg,
    Zentinel für einen neuen FreeSynergy-Node einzurichten.

zentinel-features =
    - Installiert Zentinel-Server + Control Plane zusammen
    - TLS-Terminierung für alle Dienste
    - Dynamisches Routing ohne Proxy-Neustarts
    - Gemeinsame Routing-Konfiguration über alle FreeSynergy-Dienste
    - Basiert auf dem FreeSynergy/zentinel-Fork
