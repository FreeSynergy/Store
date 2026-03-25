# help/de/fields.ftl — Dragonfly Feld-Hilfetexte (Deutsch)

help-dragonfly-field-password-title = Cache-Passwort (DFLY_requirepass)

help-dragonfly-field-password-body =
    Passwort für alle Client-Verbindungen zu Dragonfly. Wird automatisch generiert
    und im Vault als "vault_cache_password" gespeichert.

    Alle Dienste, die Dragonfly nutzen (Forgejo, Outline, Vikunja, uMap, pretix),
    lesen dieses Passwort aus dem Vault und injizieren es in ihre Redis-URL:
        redis://:{passwort}@{container_name}:{port}/{db}

    Niemals leer lassen in der Produktion. Eine ungeschützte Dragonfly-Instanz
    ist für jeden Prozess im selben Podman-Netzwerk zugänglich.

help-dragonfly-field-maxmemory-title = Speicherlimit (DFLY_maxmemory)

help-dragonfly-field-maxmemory-body =
    Maximaler Speicher, den Dragonfly nutzen darf, bevor Einträge ausgelagert werden.
    Akzeptiert Größenangaben: mb (Megabyte), gb (Gigabyte).

    Standard: 2gb — geeignet für kleine Server mit 3–5 Diensten.

    Richtwerte:
    - 1gb: minimale Installation (1–2 Dienste, kleine Caches)
    - 2gb: Standard-Installation (3–5 Dienste)
    - 4gb: größere Installationen mit intensivem Caching oder aktiven Job-Queues

    Auf ca. 60–70 % des verfügbaren RAM minus Speicher anderer Container setzen.
    Dragonflys tatsächlicher Speicherverbrauch ist typischerweise 30–40 % geringer
    als Redis für denselben Datensatz.

    Bei Erreichen des Limits:
    - DFLY_cache_mode = "true": LRU-Eviction (ältere Einträge werden entfernt)
    - DFLY_cache_mode = "false": Neue Schreibvorgänge schlagen fehl

help-dragonfly-field-cache-mode-title = Cache-Eviction-Modus (DFLY_cache_mode)

help-dragonfly-field-cache-mode-body =
    Steuert das Verhalten wenn maxmemory erreicht wird.

    "false" (Standard): Dragonfly gibt einen Fehler zurück wenn der Speicher voll ist.
    Dienste können keine neuen Einträge cachen, behalten aber vorhandene Daten.

    "true": Dragonfly entfernt die am längsten nicht genutzten (LRU) Einträge,
    um Platz zu schaffen. Datenverlust ist möglich, aber der Dienst bleibt funktionsfähig.

    Für FreeSynergy-Anwendungsfälle (Session-Caches, Job-Queues) ist "false" typischerweise
    sicherer — bei vollem Cache ein Signal, maxmemory zu erhöhen, statt Session-Daten
    stillschweigend zu verwerfen.

help-dragonfly-field-persistence-title = Persistenz (DFLY_dbfilename / DFLY_dir)

help-dragonfly-field-persistence-body =
    DFLY_dbfilename: Dateiname für RDB-Snapshots (z. B. dump.rdb).
    DFLY_dir: Verzeichnis für Snapshots (muss ein eingebundener Volume-Pfad sein).

    Beide standardmäßig leer — Persistenz deaktiviert.

    Ohne Persistenz:
    - Alle Daten gehen beim Container-Neustart verloren
    - Gewollt für reine Cache-Deployments
    - Dienste füllen ihren Cache nach dem Wiederverbinden automatisch neu

    Persistenz aktivieren (beide Variablen setzen + Volume einbinden):
        DFLY_dbfilename = "dump.rdb"
        DFLY_dir = "/data"
    Dann Volume-Mount hinzufügen: /pfad/auf/host:/data

    Hinweis: Für wirklich persistente Daten PostgreSQL verwenden.

help-dragonfly-field-threads-title = Worker-Threads (DFLY_proactor_threads)

help-dragonfly-field-threads-body =
    Anzahl der I/O-Threads in Dragonflys Proactor-Engine.

    0 (Standard): Dragonfly erkennt die verfügbaren CPU-Kerne automatisch und
    nutzt einen Thread pro Kern. Empfohlen für die meisten Deployments.

    Auf eine feste Zahl setzen (z. B. 4), um die CPU-Nutzung auf einem geteilten
    Host zu begrenzen, wo nicht alle Kerne von Dragonfly genutzt werden sollen.

    Im Gegensatz zu Redis (Single-Thread) skaliert Dragonfly linear mit CPU-Kernen.
