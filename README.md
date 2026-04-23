# 2D Lernspiel

## 🌟 Projektbeschreibung
Dieses Projekt wurde für kleine Game-Development Workshops entwickelt und bietet eine einfache Möglichkeit, ein vorgegebenes 2D-Level zu erweitern und anzupassen.
Es sind Timer und ein Zielpunkt integriert, um sich beim Bezwingen des selbst erstellten Levels mit anderen zu messen!

## 💡 Features
- **Wiederholender Parallax-Hintergrund**: Level sind endlos nach rechts erweiterbar, ohne sich über den Hintergrund Sorgen machen zu müssen.
- **Einfache Gegnerplatzierung**: Gegner-Szenen können einfach ins Level gezogen werden.
- **Flexibles Leveldesign**: Tilemap-Layers zur Gestaltung des Levels
- **Integrierte Assets**: Enthält verschiedene Assets zur Verschönerung des Levels
- **Kostenlose Ressourcen**: Basierend auf der "Sunny Land" Asset Library von ansimuz (Free for Use)

## 📚 Verwendete Technologien
- **Godot Engine**

## 🛠 Installation & Nutzung
1. **Projekt in Godot öffnen**: Lade das Repository herunter und öffne es mit Godot.
2. **Level anpassen**: Nutze die Tilemaps, um das Level zu bearbeiten, Hindernisse und Gefahren hinzuzufügen.
3. **Gegner hinzufügen**: Ziehe Gegner-Szenen aus dem "_GEGNER"-Ordner in die "_GEGNER"-Node im Level und platziere sie dann in der 2D Ansicht beliebig.
4. **Dekorationen hinzufügen**: Ziehe Bilder aus dem "_DEKORATIONEN"-Ordner in die "_DEKORATIONEN"-Node im Level und platziere sie dann in der 2D Ansicht beliebig.
5. **Aufnehmbare Gegenstände hinzufügen**: Ziehe Item-Szenen aus dem "_AUFNEHMBARES"-Ordner in die "_AUFNEHMBARES"-Node im Level und platziere sie dann in der 2D Ansicht beliebig.
6. **Zielpunkt versetzen**: Suche links in der Node-Hierarchie nach der "Endportal"-Szene. Klicke sie an und verschiebe sie dann in der 2D-Levelübersicht nach belieben. Duplikation für mehrere Endpunkte ist ebenfalls möglich.
7. **Spiel testen**: Starte das Spiel (F5 oder Play-Button oben rechts im Fenster) und durchlaufe dein individuelles Level.

NOTIZ: Man kann die einzelnen Elemente auch direkt aus den Ordnern unten links in die 2D Ansicht ziehen, aber wenn diese nicht in ihren Nodes in der Node-Hierarchie sind, gibt es möglicherweise ungewollte optische Überlappungen.
Sie können allerdings auch nachträglich in der Node-Hierarchie an ihre richtige Stelle gezogen werden, sie erscheinen dann nur ungeordnet unten oder als Kind der zum Zeitpunkt des Reinziehens ausgewählten Node in der Hierarchie.

## 🌟 Credits
- **Assets**: "Sunny Land" von [ansimuz](https://ansimuz.itch.io/sunny-land-pixel-game-art)
- **Entwicklung**: Jan-Simon Bruns, Darren Karuhn

## 👥 Mitwirkende
Falls du zum Projekt beitragen möchtest, erstelle gerne einen Pull-Request!
Behalte im Hinterkopf, dass das Projekt für Leute gedacht ist, die möglicherweise noch keine Coding-Erfahrung haben und somit möglichst simpel gehalten werden sollte.
