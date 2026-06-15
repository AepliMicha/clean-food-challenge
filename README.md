# Clean Food Challenge

Persönlicher Ernährungs- und Kraft-Tracker als Einzeldatei-App (HTML + JavaScript, Daten in `localStorage`).

## Nutzung

1. `index.html` im Browser öffnen (lokal oder über GitHub Pages)
2. Menüs und Zutaten unter **Einstellungen** anpassen
3. Daten bleiben im Browser gespeichert (`ernaehrung_v3`)

## Features

- Tages- und Wochenübersicht (Kcal, Protein, Defizit)
- Menü-Builder für Arbeit / Frei
- Training mit gewichtsbasierten Extra-kcal (Klettern, Gravel, Trail, Schwimmen)
- Kraft-Training (Liegestütz, Klimmzüge, Rumpfbeugen, Burpees)
- Gewichtsverlauf mit Trend
- Dark Mode, Backup Export/Import

## Defizit-Logik

- **Erhaltungsbedarf** = Alltag ohne Sport
- **Defizit** = Erhaltung − Menü-kcal
- **Sport-Extra** wird zum Essen addiert (wird mitgegessen, ändert das Defizit nicht)

## GitHub Pages

Die App kann unter `https://aeplimicha.github.io/clean-food-challenge/` gehostet werden.