profile-description =
    FreeSynergy Profil verwaltet die Identität des Nutzers auf der FreeSynergy-Plattform.

    Anzeigenamen, Avatar, Bio und Kontaktinformationen setzen. Service-Konten von
    verbundenen Diensten verknüpfen (Forgejo, Vikunja, Chat). Steuern, welche
    Profilfelder für andere Nutzer auf diesem Node und welche über föderierte
    Nodes hinweg geteilt werden.

    Das Profil wird im S3-Speicher des Nodes gespeichert und automatisch synchronisiert.
    Profildaten werden von Kanidm referenziert — das Ändern des Anzeigenamens oder
    Avatars aktualisiert ihn in allen verbundenen Diensten, die OIDC/SCIM nutzen.

profile-features =
    - Anzeigename und Avatar (im Node-S3 gespeichert)
    - Bio und Kontaktinformationen mit Sichtbarkeitssteuerung
    - Verknüpfte Service-Konten von verbundenen Diensten
    - Feldbezogene Privatsphäre: sichtbar für Node-Mitglieder, Projekt-Mitglieder oder niemanden
    - Föderations-Profil: opt-in-Sharing mit anderen FreeSynergy-Nodes
    - Profilbild-Upload mit automatischer Größenanpassung
    - Konto-Sicherheitsübersicht (verknüpfte Geräte, aktive Sessions)
