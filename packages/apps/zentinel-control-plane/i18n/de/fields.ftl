# help/de/fields.ftl — Zentinel Control Plane Feld-Hilfetexte (Deutsch)

help-zentinel-plane-field-port-title = Control Plane Port

help-zentinel-plane-field-port-body =
    Der Port, auf dem die Zentinel Control Plane API und das Dashboard innerhalb
    des Podman-Netzwerks lauschen. Standard ist 9000.

    Dieser Port wird NICHT extern veröffentlicht. Der Zugriff auf die Control Plane
    erfolgt über Zentinels eigenes Routing — sie hat einen Zentinel-Contract, der
    die Control-Plane-Domain (z. B. proxy-admin.example.com) an diesen Port weiterleitet.

    Nur ändern, wenn Port 9000 mit einem anderen internen Dienst kollidiert. Bei
    Änderung die Zentinel-Routing-Konfiguration entsprechend aktualisieren.

    Wichtig: Dies ist ein interner Port im Podman-Netzwerk. Externer Zugriff
    erfolgt immer über Zentinel auf Port 443 — diesen Port niemals direkt exponieren.
