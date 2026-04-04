kanidm-description =
    Kanidm ist ein moderner, leistungsstarker Identity-and-Access-Management-Server, vollständig in Rust geschrieben.

    Es ist das zentrale IAM-Fundament für FreeSynergy — jeder Dienst authentifiziert sich über Kanidm.
    Es bietet OAuth2, OIDC, LDAP, SCIM 2.0, WebAuthn-Passkeys und MFA ohne zusätzliche Konfiguration.
    FreeSynergy liefert einen eigenen Fork mit voreingerichteter SCIM-Provisionierung und PAM-Integration.

kanidm-features =
    - OAuth2- und OpenID Connect (OIDC)-Identitätsanbieter
    - SCIM 2.0 für automatisierte Benutzer- und Gruppenbereitstellung
    - LDAP-Schnittstelle für Legacy-Anwendungen
    - WebAuthn-Passkeys und TOTP/FIDO2-Mehrfaktorauthentifizierung
    - PAM-Integration für Linux-Systemanmeldung
    - Self-Service für Passwort- und SSH-Key-Verwaltung
    - Gruppenbasierte Zugriffskontrolle für alle FreeSynergy-Dienste
    - Eingebautes Web-UI und CLI (kanidm-Client)
