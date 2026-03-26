# i18n/de/overview.ftl — FreeSynergy Tasks Hilfetexte (Deutsch)

help-tasks-title = FreeSynergy Tasks

help-tasks-body =
    FreeSynergy Tasks ist die Workflow- und Automatisierungs-Engine für die
    FreeSynergy-Plattform. Es kombiniert persönliches Aufgabenmanagement mit
    dienst-übergreifender Pipeline-Automatisierung.

    Aufgaben können einfache To-Do-Einträge oder mehrstufige Pipelines sein,
    die Aktionen über alle verbundenen Dienste koordinieren. Die gesamte
    Dienst-Kommunikation läuft über den Message Bus — Tasks ruft niemals
    direkt Service-APIs auf.

help-tasks-pipelines-title = Pipelines

help-tasks-pipelines-body =
    Eine Pipeline ist eine Abfolge von Schritten, von denen jeder eine Nachricht
    über den Bus an einen Dienst sendet und optional auf eine Antwort wartet.
    Schritte können bedingt sein: ein Verzweigungsschritt führt unterschiedliche
    Folgeschritte basierend auf dem Ergebnis eines vorherigen Schritts aus.

    Pipelines können ausgelöst werden:
    - Manuell: aus der Tasks-UI oder per CLI
    - Nach Zeitplan: Cron-Ausdruck (z.B. jeden Montag um 09:00 Uhr)
    - Durch ein Bus-Ereignis: z.B. "wenn ein neuer Git-Commit auf main gepusht wird"

    Pipeline-Definitionen können verpackt und im Store als Task-Pakete geteilt werden.

help-tasks-community-title = Community-Task-Pakete

help-tasks-community-body =
    Der Store enthält einen tasks/-Namespace mit von der Community beigesteuerten
    Pipeline-Templates. Die Installation eines Task-Pakets fügt eine fertige Pipeline
    zur Tasks-App hinzu.

    Beispiele:
    - Wöchentliche Backup-Pipeline (Node S3 → Forgejo-Artefakt)
    - Onboarding neuer Nutzer (Kanidm → Vikunja-Projekt → Chat-Willkommensnachricht)
    - Deployment-Pipeline (Forgejo-Webhook → Container-Update → Gesundheitsprüfung)

    Community-Tasks sind schreibgeschützte Templates. Nach der Installation eine Kopie
    erstellen, um die Pipeline für die eigene Umgebung anzupassen.
