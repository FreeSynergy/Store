# i18n/de/overview.ftl — FreeSynergy Managers Hilfetexte (Deutsch)

help-managers-title = FreeSynergy Managers

help-managers-body =
    FreeSynergy Managers ist das zentrale Panel für die Verwaltung plattformweiter
    Ressourcen: Sprachpakete, Icon-Sets, Cursor-Themes, visuelle Themes und die
    Container-Service-Registry.

    Die Managers-App ist die Schicht zwischen dem Store und dem Rest der Plattform.
    Wenn ein Sprachpaket oder Icon-Set aus dem Store installiert wird, macht die
    Managers-App es für alle anderen Programme verfügbar. Programme verwalten diese
    Ressourcen nicht direkt — sie rufen die Manager-APIs über den Message Bus auf.

help-managers-language-title = Sprach-Manager

help-managers-language-body =
    Der Sprach-Manager steuert die Anzeigesprache und Locale für die Plattform.
    Er installiert Sprachpakete aus dem Store (i18n/-Namespace), setzt die aktive
    Sprache für den Node und für einzelne Nutzer, und verwaltet Fallback-Sprachen.

    Die Plattform-Sprache beeinflusst alle UI-Texte, Zahlen-Formatierung,
    Datums-Formatierung und Sortierreihenfolge. Jeder Nutzer kann eine andere
    Sprachpräferenz haben; wenn die Sprache des Nutzers nicht installiert ist,
    wird der Node-Standard verwendet.

help-managers-icons-title = Icon-Manager

help-managers-icons-body =
    Der Icon-Manager installiert Icon-Sets aus dem Store (icons/-Namespace) und
    setzt das aktive Icon-Set. Mehrere Icon-Sets können gleichzeitig installiert sein;
    das aktive Set wird als erste Quelle verwendet, die anderen als Fallback.

    Icon-Sets verwenden die Homarr-Icon-Namenskonvention für Kompatibilität.
    Wenn ein Icon im aktiven Set nicht gefunden wird, fällt die Plattform auf das
    FreeSynergy-Standard-Icon-Set zurück.

help-managers-registry-title = Container-Service-Registry

help-managers-registry-body =
    Die Container-Service-Registry listet alle über den Container Manager installierten
    Dienste und ihren aktuellen Registrierungsstatus beim Store auf.
    Sie zeigt, welche Dienste am Message Bus registriert sind, welche Bus-Namespaces
    sie deklarieren und von welchen anderen Diensten sie abhängen.

    Registry verwenden, um:
    - zu prüfen, ob ein Dienst nach der Installation korrekt registriert ist
    - zu sehen, welche Bus-Namespaces auf diesem Node verfügbar sind
    - fehlende Dienst-Abhängigkeiten zu diagnostizieren
