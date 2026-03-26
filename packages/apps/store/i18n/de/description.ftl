store-description =
    FreeSynergy Store ist der einheitliche Paketmanager für die FreeSynergy-Plattform.

    Er liest den Store-Katalog — ein Git-Repository mit Paket-Metadaten, Icons und
    Hilfetexten — und bietet eine grafische Oberfläche zum Entdecken, Installieren,
    Aktualisieren und Entfernen von Paketen aller Typen: Apps, Container, Themes,
    Widgets, Icon-Sets, Sprachpakete, Tasks und Bundles.

    Der Store ist selbst ein Paket und kann sich über sich selbst installieren und
    aktualisieren. Er wird beim ersten Start von fs-init gebootstrappt und läuft
    unabhängig von Node.

store-features =
    - Alle Pakettypen durchsuchen: Apps, Container, Themes, Widgets und mehr
    - Pakete mit Abhängigkeitsauflösung installieren, aktualisieren und entfernen
    - Versions-Pinning: aktuellste Version tracken oder auf Major/Minor/Exakt pinnen
    - Release-Channels: stable, beta, nightly
    - Offline-first: lokaler Katalog-Cache, nach dem Sync kein Internet nötig
    - Mehrere Katalogquellen: Community- oder private Repositories hinzufügen
    - Bus-gesteuert: andere Programme können Installationen über den Message Bus auslösen
