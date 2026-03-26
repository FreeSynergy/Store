# i18n/de/overview.ftl — FreeSynergy Inventory Hilfetexte (Deutsch)

help-inventory-title = FreeSynergy Inventory

help-inventory-body =
    FreeSynergy Inventory pflegt den autoritativen Installationsstatus dieses Nodes.
    Es ist ein Hintergrunddienst — direkte Interaktion ist nicht vorgesehen. Jedes
    andere Programm fragt das Inventory über den Message Bus ab oder aktualisiert es.

    Das Inventory beantwortet zwei Arten von Fragen:
    - Paket-Fragen: "Ist kanidm installiert? Welche Version? Ist es aktiv?"
    - Service-Fragen: "Welche laufenden Dienste stellen die 'auth'-Rolle bereit?
      Was ist ihr aktueller Gesundheitsstatus?"

    Nichts anderes auf dem Node darf diese Fragen beantworten. Wenn ein Programm
    wissen muss, was installiert ist, fragt es das Inventory. Wenn das Inventory
    sagt, es ist da, dann ist es da.

help-inventory-three-layers-title = Die drei Ebenen

help-inventory-three-layers-body =
    FreeSynergy trennt die Konzepte von dem, was existiert, was installiert ist,
    und wie die Installation funktioniert:

    Store — "Was ist verfügbar?"
    Der Store-Katalog listet alle Pakete auf, die installiert werden könnten.
    Er liest aus einem Git-Repository und hat Netzwerkzugang zum Herunterladen.

    Inventory — "Was ist gerade installiert?"
    Das Inventory kennt nur, was sich aktuell auf diesem Node befindet.
    Es hat keinen Netzwerkzugang und konsultiert nicht den Store.
    Es ist eine lokale, offline-only Aufzeichnung.

    Manager — "Wie installiert oder entfernt man etwas?"
    Manager (Container Manager, Sprach-Manager etc.) führen die eigentlichen
    Installationsschritte durch und schreiben dann das Ergebnis ins Inventory.

    Diese Trennung bedeutet: das Inventory ist immer schnell (nur lokales SQLite),
    immer konsistent (Ein-Schreiber-Protokoll) und immer autoritativ.

help-inventory-bus-title = Bus-Abfragen

help-inventory-bus-body =
    Das Inventory antwortet auf folgende Bus-Namespaces:

    inventory::packages::list — alle installierten Pakete mit Status auflisten
    inventory::packages::query — Details für ein Paket per ID abrufen
    inventory::services::list — alle laufenden Service-Instanzen auflisten
    inventory::services::by-role — Dienste finden, die eine bestimmte Rolle bereitstellen
    inventory::status::health — Gesundheitszusammenfassung des gesamten Nodes

    Genutzt von: Bus (Routing), Lenses (Datenquellen), Search (Service-Discovery),
    Container Manager (Service-Status), Store (Update-Check), Widgets (Rollen-Erfüllung).
