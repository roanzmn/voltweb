# VoltWeb

Landing Page für **VoltWeb** – eine Webagentur, die Websites für Elektriker, Elektrotechniker und Elektrofachbetriebe erstellt.

## Über das Projekt

Statische Single-Page-Website (eine `index.html` mit eingebettetem CSS/JS, ohne Build-Schritt). Bewusst leichtgewichtig und DSGVO-konform: keine externen Verbindungen zu Drittanbietern.

- **Fonts:** lokal eingebunden (Archivo, Atkinson Hyperlegible als `.woff2`), keine Google-Fonts-Verbindung
- **Bilder:** lokal als WebP unter `assets/img/`
- **Kein Tracking, keine Analytics, keine externen Scripts/CDNs**
- Security-Header via `vercel.json` (bzw. `_headers` für Netlify)

## Struktur

```
index.html          # Die Landing Page (Markup + Styles + Script inline)
impressum.html      # Impressum (Platzhalter – vor Livegang befüllen)
datenschutz.html    # Datenschutzerklärung (Platzhalter – vor Livegang befüllen)
assets/
  fonts/            # Lokale Web-Fonts (.woff2)
  img/              # Testimonial-Portraits (WebP)
vercel.json         # Vercel-Konfiguration + Security-Header
_headers            # Security-Header für Netlify (alternativ)
PRODUCT.md          # Strategisches Produktdokument
DESIGN.md           # Design-System-Dokumentation
```

## Lokal ansehen

Kein Build nötig. Einfach eine der beiden Varianten:

```bash
# Python
python -m http.server 4173

# oder Node
npx serve .
```

Dann `http://localhost:4173` öffnen.

## Deployment (Vercel)

Es ist kein Build-Schritt nötig – Vercel serviert die statischen Dateien direkt. Beim Import als „Other / Static" wird `vercel.json` automatisch angewendet.

## Vor dem Livegang noch zu erledigen

- [ ] Impressum und Datenschutzerklärung mit echten Inhalten füllen (rechtlich Pflicht)
- [ ] Kontaktformular an ein Backend anbinden (aktuell nur Demo ohne Versand)
- [ ] Telefonnummer und E-Mail-Adresse durch echte Daten ersetzen
