# i18n/de/overview.ftl — FreeSynergy Profil Hilfetexte (Deutsch)

help-profile-title = FreeSynergy Profil

help-profile-body =
    FreeSynergy Profil ist der Ort, an dem die eigene Identität auf diesem
    FreeSynergy-Node verwaltet wird. Das Profil wird im S3-Speicher des Nodes
    gespeichert und von Kanidm referenziert — Änderungen propagieren automatisch
    über SCIM an alle verbundenen Dienste.

    Die Profil-App hat drei Bereiche:
    - Identität: Anzeigename, Avatar, Bio, Kontaktinformationen
    - Verknüpfte Konten: Service-Konten von verbundenen Diensten
    - Privatsphäre: Sichtbarkeitseinstellungen pro Feld und Föderations-Sharing

help-profile-privacy-title = Privatsphäre und Sichtbarkeit

help-profile-privacy-body =
    Jedes Profilfeld hat eine unabhängige Sichtbarkeitseinstellung:

    Öffentlich (Node): sichtbar für alle Nutzer auf diesem FreeSynergy-Node
    Projekt-Mitglieder: nur sichtbar für Nutzer in gemeinsamen Projekten
    Privat: nur für sich selbst und Node-Administratoren sichtbar

    Föderations-Sharing ist eine separate Einstellung, die steuert, ob das Profil
    einbezogen wird, wenn dieser Node Daten mit föderieerten Nodes teilt.
    Deaktivieren, um das Profil nur lokal auf diesem Node zu halten.

help-profile-linked-title = Verknüpfte Konten

help-profile-linked-body =
    Verknüpfte Konten verbinden die FreeSynergy-Identität mit Konten in einzelnen
    Diensten. Wenn ein verknüpftes Konto gesetzt ist:
    - Avatar erscheint in Forgejo-Commits und Vikunja-Aufgaben
    - Anzeigename wird im Chat neben dem Chat-Handle verwendet
    - Andere Nutzer können Service-Profile vom FreeSynergy-Profil aus finden

    Verknüpfung ist optional. Jedes Service-Konto wird separat verknüpft.
    Das Entfernen eines verknüpften Kontos löscht das Service-Konto nicht.
