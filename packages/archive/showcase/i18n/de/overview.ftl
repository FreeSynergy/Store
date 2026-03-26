# i18n/de/overview.ftl — FreeSynergy Showcase Hilfetexte (Deutsch)

help-showcase-title = FreeSynergy Showcase

help-showcase-body =
    FreeSynergy Showcase ist die Komponenten-Galerie und Design-System-Referenz für
    die FreeSynergy-Plattform. Er zeigt jede UI-Komponente, die plattformweit verwendet
    wird, gerendert mit dem aktuell aktiven Theme.

    Showcase verwenden, um:
    - Verfügbare Komponenten beim Erstellen einer neuen FreeSynergy-App zu erkunden
    - zu prüfen, wie eine Komponente in einem anderen Theme aussieht, bevor gewechselt wird
    - den korrekten CSS-Variablennamen für eine Design-Eigenschaft zu finden
    - zu verifizieren, dass ein benutzerdefiniertes Theme alle Komponentenzustände korrekt abdeckt

help-showcase-tokens-title = Design-Tokens

help-showcase-tokens-body =
    Design-Tokens sind CSS Custom Properties (Variablen), die die visuellen Eigenschaften
    der Plattform definieren. Alle Komponenten verwenden diese Variablen — ein Theme
    funktioniert, indem es sie überschreibt.

    Wichtige Token-Kategorien:
    - --fs-color-*: Hintergrund, Oberfläche, Text, Akzent, Status-Farben
    - --fs-font-*: Familie, Basis-Größe, sm-Größe, lg-Größe, Gewicht, Zeilenhöhe
    - --fs-radius-*: Rahmenradius für Buttons, Karten, Inputs, Modals
    - --fs-spacing-*: Abstands-Skala für Padding und Margin (xs, sm, md, lg, xl)
    - --fs-shadow-*: Box-Shadow-Definitionen für Elevationsstufen
    - --fs-transition-*: Animations-Dauer und Easing-Funktionen

    Die Showcase-Token-Seite zeigt alle Variablen mit ihren aktuellen Werten und
    welche Komponenten jede Variable verwenden.

help-showcase-icons-title = Icon-Galerie

help-showcase-icons-body =
    Der Icon-Galerie-Bereich zeigt alle Icons, die im aktuell aktiven Icon-Set verfügbar sind.
    Icons werden in einem durchsuchbaren Raster mit ihren Namen angezeigt.

    Auf ein Icon klicken, um zu kopieren:
    - Den Icon-Namen (zur Verwendung in Templates und Code)
    - Die SVG-Quelle
    - Den Dioxus-RSX-Komponenten-Aufruf

    Wenn ein Icon im aktiven Set fehlt, zeigt die Galerie das Fallback-Icon aus dem
    FreeSynergy-Standard-Set mit einem Warn-Indikator.
