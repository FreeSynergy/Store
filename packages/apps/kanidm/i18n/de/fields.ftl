# help/de/fields.ftl — Kanidm Feld-Hilfetexte (Deutsch)

help-kanidm-field-domain-title = Service-Domain

help-kanidm-field-domain-body =
    Der öffentliche Domainname dieser Kanidm-Instanz (z. B. auth.example.com).
    Dieser wird zur Issuer-URL für alle OIDC-Token:
        https://auth.example.com/oauth2/openid/<client-id>

    Wichtig: Dieser Wert wird beim ersten Start in Kanidms Datenbank geschrieben
    und kann danach nicht mehr geändert werden — nur durch eine vollständige
    Neuinstallation. Domain sorgfältig wählen vor dem Deployment.

    Alle Dienste, die Kanidm für SSO nutzen, referenzieren diese Domain in
    ihrer OIDC-Konfiguration.

help-kanidm-field-admin-password-title = Admin-Passwort

help-kanidm-field-admin-password-body =
    Das initiale Passwort für den eingebauten "admin"-Account. Wird vom
    Setup-Assistenten automatisch generiert und im Vault gespeichert.

    Dieses Passwort nur für den ersten Login zum Bootstrapping verwenden.
    Nach dem ersten Anmelden einen benannten Admin-Account anlegen und die
    erhöhten Rechte des "admin"-Accounts widerrufen oder deaktivieren.

    Der "idm_admin"-Account (getrennt von "admin") verwaltet Identitätsobjekte
    wie Benutzer, Gruppen und OAuth2-Clients — für den täglichen Betrieb nutzen.

help-kanidm-field-federation-title = Föderations-Vertrauensstufe

help-kanidm-field-federation-body =
    Die minimale Vertrauensstufe, die andere FreeSynergy-Nodes benötigen, um
    diese Kanidm-Instanz als Identity-Provider zu nutzen.

    Vertrauensstufen:
    0 — Keine Föderation (nur lokal)
    1 — Basisföderation (Lesezugriff auf Profildaten)
    2 — Volle Föderation (SSO über föderierte Projekte hinweg)

    Der Standard (min_trust = 1) erlaubt föderierten Nodes die Identitätsprüfung,
    aber keine Session-Erstellung. Auf 2 erhöhen nur für vollständig vertraute Nodes.
