inventory-description =
    FreeSynergy Inventory ist die autoritative Aufzeichnung von allem, was auf
    einem FreeSynergy-Node installiert ist.

    Es pflegt eine SQLite-Datenbank (fs-inventory.db) mit drei Tabellen:
    installierte Ressourcen (jedes jemals installierte Paket), laufende
    Service-Instanzen (Container-Services mit aktuellem Status) und
    Bridge-Instanzen (welcher Dienst welche Plattform-Rolle übernimmt).

    Das Drei-Ebenen-Prinzip:
    - Store beantwortet: "Was ist verfügbar?"
    - Inventory beantwortet: "Was ist gerade installiert?"
    - Manager beantworten: "Wie installiert oder entfernt man etwas?"

    Kein Programm darf eine eigene Installations-Liste führen. Jeder
    Status-Query geht ans Inventory. Der Bus fragt das Inventory, um Events
    an den richtigen Dienst zu routen. Lenses fragt das Inventory, um
    Datenquellen zu finden.

inventory-features =
    - Einzige Wahrheitsquelle für den installierten Zustand des gesamten Nodes
    - Verfolgt alle Ressourcentypen: Apps, Container, Themes, Widgets, Sprachpakete
    - Pro-Service-Instanz-Status: laufend, gestoppt, Fehler, wird aktualisiert
    - Bridge-Instanz-Registry: welcher Dienst welche Plattform-Rolle übernimmt
    - Wird von Bus, Lenses, Search, Container Manager, Store und Widgets genutzt
    - Wird ausschließlich von Managern geschrieben — nie direkt von Programmen
    - Nur lokales SQLite: kein Netzwerkzugang, keine externen Abhängigkeiten
