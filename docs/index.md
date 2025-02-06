# Mastering RobotCode and robot.toml: Best Practices in Real-Life Robot Framework Projects


## Prepare Project

- Devumgebung einrichten
  - Leeres Repo mit DevContainer mit Python und TodoApp
      - Todo App Starten und ein wenig erklären
  - RobotCode installieren und einrichten
- Simples Projekt anlegen
    - venv mit VSCode `Create Python Environment` anlegen
    - requirements.txt anlegen
    - robotframework installieren
- Einen simplen Test anlegen
    - laufen lassen
    - debuggen
    - erklären
- eine Resource anlegen
    - in den robotcode default Ordner `resources`
    - Resource debuggen
- eine Library anlegen
    - in den robotcode default Ordner `lib`
    - Library debuggen
    - Python debugging anschalten
    - RobotFramework BuiltIn keyword debuggen
        - Just My Code im Python Debugger ausschalten
    - Class Library mit `__init__` und `BuiltIn().robot_running` abfragen
- Robotidy und RoboCop installieren
    - requirements.txt erweitern

- RobotCode Language StatusItem Informationen anzeigen lassen
    - RoboCop anschalten ausschalten
    - RobotCode Tool Menu zeigen
        - Speziell Report Issue
        - Debug an/ausschalten
    - REPL zeigen
    - Robot Framework Notebook zeigen

- Browser Library installieren
    - Browser Library initialisieren?
    - TodoApp starten auf Console
    - Todo App `Eintrag anlegen` automatisieren

- Simplen Listener implementieren
    - Muss nichts drin stehen, nur aufgerufen werden
    - Debugging zeigen
    - Einrichtung in VSCode
        - `robotcode.robot.args` einstellen

- 2 Umgebungen
    - Dev und Test
    - Variablen anlegen
    - Alles mit VSCode Settings oder Resource/Variables Datei Änderung


*Conclusion*
    - wie haben die Grundlagen verstanden
    - Fragen die offen sind?
        - Für mich alleine ist das ok, was wenn ich im Team arbeite?
            - Python Umgebung einrichten
            - Packages installieren
            - Initialisieren von Libraries
            - Alle sollen die gleichen Packages und Einstellungen verwenden

        - Testruns konfigurieren
            - Verschiedene Umgebungen
            - Listeners
            - Variablen
            - Ausführungen mit Tags

# Python Package Managers

- Hatch installieren
    - https://hatch.pypa.io/latest/install/
    - im devcontainer einrichten (siehe TODOS)
- Hatch Projekt anlegen und konfigurieren und erklären (`pyproject.toml`)
- default env konfigurieren
    - Splitting in package und dev environment
- default env erzeugen und in VSCode einbinden
- Browser Library initialisieren
- Skript anlegen zum einfachen `robot` ausführen
- Was über plugins erzählen

*Conclusion*
- Einheitliche Python Umgebung
- Nutzung von Skripten
- Wiederverwendbarkeit in Teams
- Als Package verteilbar über Pip Repositories, installierbar direkt aus git repo
- Einrichtung der Python Umgebung reproduzierbar gemacht

# Robot.toml

TODO

## TODO's
- hatch im devcontainer auskommentieren
    - im Workshop wieder einkommentieren und