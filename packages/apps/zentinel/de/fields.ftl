# help/de/fields.ftl — Zentinel Feld-Hilfetexte (Deutsch)

help-zentinel-field-config-title = KDL-Konfigurationsdatei (ZENTINEL_CONFIG)

help-zentinel-field-config-body =
    Der Pfad im Container zur Zentinel-KDL-Konfigurationsdatei.
    Standard: /config/zentinel.kdl

    Diese Datei wird automatisch vom Zentinel-Plugin (generate-config-Befehl)
    aus allen Service-Contracts während `fsn deploy` generiert. Nicht manuell
    bearbeiten — manuelle Änderungen werden beim nächsten Deploy überschrieben.

    Aktuelle Konfiguration einsehen:
        podman exec {instance_name} cat /config/zentinel.kdl

    Das KDL-Format (KDL Document Language) ist eine kompakte, lesbare
    Konfigurationssprache. Jeder Service-Eintrag sieht ungefähr so aus:
        service "service-name" {
            domain "service.example.com"
            upstream "container-name:port"
        }

    Wenn Zentinel einen Dienst nicht korrekt weiterleitet, die KDL-Datei
    prüfen und `fsn deploy` erneut ausführen, um sie neu zu generieren.

help-zentinel-field-acme-title = ACME-E-Mail

help-zentinel-field-acme-body =
    Die ACME-E-Mail wird für die Let's-Encrypt- und ZeroSSL-Registrierung
    verwendet. Wird NICHT über Umgebungsvariablen konfiguriert — wird in der
    Host-Konfigurationsdatei (host.toml) gesetzt:
        [proxy]
        acme_email = "admin@example.com"

    Diese E-Mail-Adresse:
    - Erhält Ablauf-Warnungen (normalerweise durch Auto-Erneuerung unterdrückt)
    - Ist für die Let's-Encrypt-Account-Registrierung erforderlich
    - Muss eine echte, überwachte Adresse sein

    Die ACME-E-Mail wird einmalig pro Host gesetzt — alle Zertifikate desselben
    Hosts werden unter derselben E-Mail registriert.

help-zentinel-field-ports-title = Veröffentlichte Ports (80 / 443)

help-zentinel-field-ports-body =
    Zentinel ist das EINZIGE Modul in FreeSynergy mit published_ports.
    Es veröffentlicht genau zwei Ports:
    - 80:80  — HTTP (von Zentinel auf HTTPS weitergeleitet)
    - 443:443 — HTTPS (gesamter Service-Traffic)

    Diese sind die einzigen Ports, die in der Host-Firewall für Web-Services
    geöffnet sein müssen. Zusätzlich:
    - 22 (SSH): für Server-Administration
    - 2222 (oder eigener Port): für Forgejo Git-over-SSH (wenn genutzt)

    Keine Ports für einzelne Dienste öffnen (z. B. PostgreSQL-Port 5432,
    Dragonfly-Port 6379). Das umgeht Zentinel und das Sicherheitsmodell.

help-zentinel-field-volumes-title = Volume-Mounts

help-zentinel-field-volumes-body =
    Zentinel mountet vier Verzeichnisse:

    /config (aus {config_dir}/config):
    KDL-Konfigurationsdatei und ACME-E-Mail-Einstellungen.
    Lese-/Schreibzugriff — Zentinel schreibt Zertifikatsdaten hier.

    /data (aus {config_dir}/data):
    TLS-Zertifikate, ACME-Account-Keys und anderer persistenter Zustand.
    Lese-/Schreibzugriff — KRITISCHE Daten, regelmäßig sichern!

    /srv/{project_name}/branding (aus {project_root}/branding, schreibgeschützt):
    Statische Dateien für die Plattform-Landingpage und Fehlerseiten.
    Logos, Favicon und CSS hier anpassen.

    /srv/{project_name}/sites (aus {project_root}/sites, schreibgeschützt):
    Statische Site-Dateien für Domains, die Zentinel direkt ausliefert
    (ohne Upstream-Container). Nützlich für Landingpages und .well-known-Dateien.
