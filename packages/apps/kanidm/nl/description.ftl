kanidm-description =
    Kanidm is een moderne server voor identiteits- en toegangsbeheer,
    volledig geschreven in Rust.

    Het is de standaard IAM-provider voor FreeSynergy en wordt vereist door
    Tuwunel (OIDC), Stalwart (OIDC) en fs-node (authenticatie). Alle services
    authenticeren via Kanidm met OAuth2 of OIDC — gebruikers loggen één keer
    in en hebben overal toegang.

    FreeSynergy distribueert Kanidm vanuit zijn eigen fork (FreeSynergy/
    fs-kanidm) om gecontroleerde builds, ondertekende releases en de
    mogelijkheid om patches terug te porteren te garanderen.

kanidm-features =
    - OAuth2- en OIDC-provider
    - LDAP-server (voor legacy-applicaties)
    - SCIM 2.0-gebruikersprovisioning
    - WebAuthn- en passkey-ondersteuning
    - MFA (TOTP, beveiligingssleutels)
    - Ingebouwde webbeheerinterface
    - Volledig geschreven in Rust — geen JVM, geen Python-runtime
