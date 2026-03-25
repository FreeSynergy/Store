# help/de/fields.ftl — CryptPad Feld-Hilfetexte (Deutsch)

help-cryptpad-field-main-domain-title = Haupt-Domain (CPAD_MAIN_DOMAIN)

help-cryptpad-field-main-domain-body =
    Die vollständige HTTPS-URL der CryptPad-Haupt-Domain (inklusive Schema).
    Beispiel: https://pad.example.com

    Das ist die URL, die Benutzer aufrufen, wenn sie CryptPad öffnen. Sie muss
    übereinstimmen mit:
    - Der Zentinel-Proxy-Route für die Haupt-Route
    - Der Domain im TLS-Zertifikat
    - Dem, was Benutzer im Browser eingeben

    CryptPad nutzt dies für Content-Security-Policy-Header und zum Erstellen
    von Teile-Links in Dokumenten.

    Kein abschließender Schrägstrich.

help-cryptpad-field-sandbox-domain-title = Sandbox-Domain (CPAD_SANDBOX_DOMAIN)

help-cryptpad-field-sandbox-domain-body =
    Die vollständige HTTPS-URL der CryptPad-Sandbox-Domain (inklusive Schema).
    Beispiel: https://sandbox.pad.example.com

    Muss ein vollständig anderer Ursprung als die Haupt-Domain sein. Eine andere
    Subdomain reicht (z. B. sandbox.pad.example.com ist ein anderer Ursprung
    als pad.example.com, da die Subdomain unterschiedlich ist).

    CryptPad lädt alle Dokument-Editoren in einem <iframe> von dieser Domain —
    verhindert Cross-Origin-Angriffe. Ohne korrekt konfigurierte Sandbox-Domain
    funktioniert das Dokument-Bearbeiten nicht.

    Eine zweite Zentinel-Proxy-Route muss diese Domain auf denselben Container
    wie die Haupt-Domain zeigen lassen. Beide Routen → Container-Port 3000.

help-cryptpad-field-trusted-proxy-title = Vertrauenswürdiger Proxy CIDR (CPAD_TRUSTED_PROXY)

help-cryptpad-field-trusted-proxy-body =
    Der IP-Bereich vertrauenswürdiger Reverse-Proxies. CryptPad akzeptiert die
    echte Client-IP aus X-Forwarded-For-Headern nur, wenn die Verbindung aus
    diesem Bereich kommt.

    Standard "10.0.0.0/8" deckt alle internen Podman-Netzwerke ab (Podman nutzt
    10.x.x.x für Container-zu-Container-Kommunikation). Korrekt für Standard-
    Deployments mit Zentinel als einzigem Proxy.

    Nur ändern bei:
    - Zusätzlichen vorgelagerten Proxies (CDN, Load Balancer) mit anderen IPs
    - Podman-Netzwerken mit anderem CIDR-Bereich

    Zu weit gefasst (z. B. 0.0.0.0/0) ermöglicht IP-Spoofing.

help-cryptpad-field-admin-email-title = Admin-E-Mail-Adresse

help-cryptpad-field-admin-email-body =
    Die E-Mail-Adresse, die im CryptPad-Footer als Administrator-Kontakt angezeigt
    wird. Benutzer können diese Adresse anklicken für Support oder Account-Fragen.

    Konfiguriert KEIN E-Mail-Versenden — CryptPad sendet in der Standardkonfiguration
    keine transaktionalen E-Mails. Nur ein Anzeige-Wert.

    Nach dem ersten Start kann dies auch im CryptPad-Admin-Panel unter
    https://pad.example.com/admin eingestellt werden (Allgemein > Kontakt-E-Mail).
