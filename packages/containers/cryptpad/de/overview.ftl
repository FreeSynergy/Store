# help/de/overview.ftl — CryptPad-Hilfetexte (Deutsch)

help-cryptpad-title = CryptPad — Ende-zu-Ende-verschlüsselte Zusammenarbeit

help-cryptpad-body =
    CryptPad ist eine Ende-zu-Ende-verschlüsselte kollaborative Office-Suite.
    Alle Dokumente werden im Browser verschlüsselt, bevor sie an den Server
    gesendet werden — der Server sieht niemals den Klartext eines Dokuments.

    Enthaltene Anwendungen:
    - Rich-Text-Dokumente (wie Google Docs)
    - Tabellenkalkulation
    - Kanban-Boards
    - Code-Editoren mit Syntax-Highlighting
    - Präsentationen (Slideshows)
    - Whiteboards
    - Formulare und Umfragen
    - Markdown-Dokumente

    CryptPad benötigt ZWEI Domains für den sicheren Betrieb:
    1. Haupt-Domain (z. B. pad.example.com) — für die CryptPad-UI
    2. Sandbox-Domain (z. B. sandbox.example.com) — isolierter Ursprung
       für sicheres Rendern von Dokumentinhalten

    Beide Domains müssen als Zentinel-Proxy-Routen konfiguriert sein.

    Abhängigkeiten: Kanidm (SSO/Authentifizierung).

help-cryptpad-install-title = CryptPad installieren

help-cryptpad-install-body =
    1. Zwei Domains wählen:
       - Haupt: pad.example.com
       - Sandbox: sandbox.example.com (oder sandbox.pad.example.com)
       Beide müssen separate DNS-Einträge sein, die auf denselben Server zeigen.

    2. Beide Routen im Zentinel-Contract eintragen:
       - Route "main": pad.example.com → Container:3000
       - Route "sandbox": sandbox.example.com → Container:3000

    3. Setup-Assistenten ausführen:
       - CPAD_MAIN_DOMAIN: https://pad.example.com
       - CPAD_SANDBOX_DOMAIN: https://sandbox.example.com
       - Admin-E-Mail: eigene Adresse (erscheint im CryptPad-Footer)

    4. Nach dem ersten Start einloggen. Um Admin zu werden:
       Browser-Konsole auf https://pad.example.com öffnen:
         CryptPad.getPublicKey()
       Dann den Public Key in config.js zur Admin-Liste hinzufügen.

    5. SSO via Kanidm wird im CryptPad-SSO-Plugin konfiguriert (siehe OIDC-Thema).

help-cryptpad-sandbox-title = Die Sandbox-Domain

help-cryptpad-sandbox-body =
    CryptPad nutzt eine separate Sandbox-Domain als Sicherheitsmaßnahme. Beim
    Öffnen eines Dokuments lädt CryptPad den Inhalt in einem <iframe> von der
    Sandbox-Domain. Das sorgt für Ursprungs-Isolation:

    - Dokumente können nicht auf Cookies oder localStorage der Haupt-Domain zugreifen
    - JavaScript in Dokumenten kann keine Anfragen an die Haupt-Domain stellen
    - Content Security Policy (CSP) wird pro Ursprung separat durchgesetzt

    Das macht CryptPad sicher, selbst wenn ein Dokument bösartiges JavaScript enthält
    — es ist in einem vollständig getrennten Ursprung sandboxed.

    Die Sandbox-Domain muss:
    - Ein anderer Ursprung sein (andere Domain oder Subdomain) als die Haupt-Domain
    - Per HTTPS erreichbar sein
    - Eine Zentinel-Proxy-Route haben, die auf denselben Container zeigt

    Wichtig: CPAD_SANDBOX_DOMAIN muss exakt dem übereinstimmen, was der Browser
    sieht — inklusive Schema (https://). Eine Abweichung bricht das Dokument-Rendering.

help-cryptpad-oidc-title = OIDC / SSO mit Kanidm

help-cryptpad-oidc-body =
    CryptPad unterstützt OIDC über sein SSO-Plugin. Konfiguration erfolgt in der
    serverseitigen config.js-Datei (nicht über Umgebungsvariablen).

    Schritte:
    1. In Kanidm OAuth2-Client "cryptpad" anlegen:
       - Redirect-URI: https://pad.example.com/login/sso/callback
       - Scopes: openid, email, profile
    2. In CryptPads config.js (vom deploy-setup-Hook generiert):
         sso: {
           list: [{
             name: "Kanidm",
             type: "oidc",
             url: "https://auth.example.com/oauth2/openid/cryptpad",
             clientId: "cryptpad",
             clientSecret: "<aus-Kanidm>"
           }]
         }
    3. CryptPad-Container neu starten.

    Benutzer sehen dann eine "Mit Kanidm anmelden"-Schaltfläche auf der CryptPad-
    Login-Seite. Ihr CryptPad-Account wird mit ihrer Kanidm-Identität verknüpft.
