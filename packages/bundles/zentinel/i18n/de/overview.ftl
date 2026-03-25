# help/de/overview.ftl — Zentinel Bundle Hilfetexte (Deutsch)

help-zentinel-bundle-title = Zentinel Bundle — Reverse Proxy + Control Plane

help-zentinel-bundle-body =
    Das Zentinel-Bundle installiert beide für die FreeSynergy Reverse-Proxy-Infrastruktur
    benötigten Komponenten in einem Schritt:

    - Zentinel — der Reverse-Proxy-Server, der den gesamten eingehenden HTTPS-Traffic
      entgegennimmt, TLS terminiert und Anfragen an den entsprechenden Dienst weiterleitet.
    - Zentinel Control Plane — die REST-API und das Web-Dashboard zur Verwaltung von
      Routen, Zertifikaten, DNS-Providern und ACME-Konfiguration.

    Das Bundle ist der empfohlene Weg für neue FreeSynergy-Nodes. Beide Komponenten
    werden gemeinsam konfiguriert und gestartet, die Control Plane ist vorab mit
    dem Proxy verbunden.

    Wer nur den Proxy ohne Dashboard benötigt (z. B. für minimales Headless-Deployment),
    kann stattdessen das Zentinel-App-Paket direkt installieren.

help-zentinel-bundle-order-title = Installationsreihenfolge

help-zentinel-bundle-order-body =
    Zentinel (und damit dieses Bundle) sollte zuerst installiert werden — vor allen
    Diensten, die externen HTTPS-Zugang benötigen. Der Grund:

    1. Alle Dienste mit Zentinel-Contract definieren ihre Domain in diesem Contract.
    2. `fsn deploy` liest alle Contracts und generiert Zentinels Routing-Konfiguration.
    3. Zentinel fordert TLS-Zertifikate für diese Domains beim ersten Start an.

    Empfohlene Reihenfolge:
    1. Dieses Bundle installieren (Zentinel + Control Plane)
    2. Kanidm installieren (IAM — wird von allen OIDC-Diensten benötigt)
    3. Weitere Dienste installieren (Forgejo, Outline usw.)
    4. `fsn deploy` ausführen, um das gesamte Routing anzuwenden

    Zentinel fordert TLS-Zertifikate für alle konfigurierten Domains beim ersten
    Deployment an. DNS-Einträge müssen vor `fsn deploy` auf die öffentliche IP des
    Hosts zeigen.
