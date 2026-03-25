# help/de/overview.ftl — Kanidm-Hilfetexte (Deutsch)

help-kanidm-title = Kanidm — Identitäts- & Zugriffsverwaltung

help-kanidm-body =
    Kanidm ist ein moderner, hochperformanter Identitätsverwaltungsserver,
    geschrieben in Rust. Er dient als zentrale Authentifizierungsstelle für
    die gesamte FreeSynergy-Plattform — jeder Dienst mit SSO-Unterstützung
    authentifiziert sich über Kanidm.

    Funktionen:
    - Single Sign-On (SSO) via OpenID Connect (OIDC / OAuth2)
    - Benutzer- und Gruppenverwaltung mit übersichtlicher Web-UI
    - Hardware-Sicherheitsschlüssel (WebAuthn / Passkeys)
    - LDAP-Verzeichnis für Legacy-Integrationen
    - SCIM-Provisionierung für automatisierte Benutzersynchronisation
    - Detailliertes Zugriffsprotokoll (Audit-Log)

    Dienste mit Kanidm-Integration: Forgejo, Outline, Tuwunel (Matrix),
    Vikunja, pretix, Stalwart, CryptPad, uMap, OpenObserve.

    Tipp: Installiere Kanidm zuerst, registriere dann die OIDC-Clients für
    alle anderen Dienste, bevor diese installiert werden.

help-kanidm-install-title = Kanidm installieren

help-kanidm-install-body =
    1. Domain für Kanidm wählen (z. B. auth.example.com) und im Setup-Assistenten
       als Service-Domain eintragen.
    2. Der Assistent generiert ein sicheres Admin-Passwort und speichert es im Vault.
       Sofort kopieren — wird für den ersten Login benötigt.
    3. Container starten. Kanidm initialisiert seine Datenbank beim ersten Start.
    4. https://auth.example.com/ui aufrufen und als "admin" mit dem generierten
       Passwort anmelden.
    5. Einen regulären Admin-Account für den täglichen Betrieb anlegen.
       Der eingebaute "admin"-Account ist nur für das Bootstrapping gedacht.

    Hinweis: Kanidm verwendet eigenes TLS — der Reverse Proxy muss
    upstream_tls = true gesetzt haben. Der Zentinel-Contract für kanidm
    erledigt das automatisch.

help-kanidm-oidc-title = OAuth2-/OIDC-Clients registrieren

help-kanidm-oidc-body =
    Für jeden Dienst, der Kanidm für SSO nutzen soll:
    1. In der Kanidm-Web-UI anmelden.
    2. OAuth2 > OAuth2-Anwendung hinzufügen aufrufen.
    3. Client-Namen exakt so setzen wie vom Dienst erwartet:
       - Forgejo: "forgejo"
       - Outline: "outline"
       - Vikunja: "vikunja"
       - pretix: "pretix"
       - Stalwart: "stalwart"
       - CryptPad: "cryptpad"
       - uMap: "umap"
    4. Redirect-URI eintragen: https://<service-domain>/auth/callback
       (jeder Dienst dokumentiert seinen genauen Callback-Pfad)
    5. Das generierte Client-Secret notieren — im Setup-Assistenten des Dienstes
       einfügen.

    Tipp: Gruppen in Kanidm nutzen, um den Zugriff pro Dienst zu steuern.
    Gruppe als Scope-Mapping in der OAuth2-Client-Konfiguration eintragen.

help-kanidm-ldap-title = LDAP und SCIM

help-kanidm-ldap-body =
    Kanidm stellt ein schreibgeschütztes LDAP-Interface für Anwendungen bereit,
    die kein OIDC unterstützen. Der LDAP-Port (636 für LDAPS) ist nicht extern
    erreichbar — nur innerhalb des Podman-Netzwerks.

    LDAP-Bind-DN:  dn=token
    LDAP-Base-DN:  dc=<domain>,dc=<tld>

    SCIM steht für automatisierte Provisionierung aus externen HR-Systemen oder
    Identity-Providern zur Verfügung. Endpunkt-Details in der Kanidm-Dokumentation.

    Hinweis: Moderne Dienste sollten OIDC statt LDAP verwenden. Die LDAP-Unterstützung
    in Kanidm ist aus Sicherheitsgründen bewusst auf Lesezugriffe beschränkt.
