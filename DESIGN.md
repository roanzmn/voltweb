# Design

Visuelles System der VoltWeb-Landing-Page ([index.html](index.html)). Referenz-Lane: Premium-Werkzeugmarke × deutsche Elektro-Signaletik, in funnelstar-artiger Dunkel-Tiefe: **warmes Anthrazit statt Schwarz, Volt-Schimmer statt Blau-Schimmer**. Register: brand, Platform: web.

## Farben (OKLCH)

| Token | Wert | Rolle |
|---|---|---|
| `--bg` | `oklch(0.205 0.012 96)` | Seitenhintergrund – warmes Anthrazit, bewusst KEIN Schwarz |
| `--bg-deep` | `oklch(0.175 0.011 96)` | Wechselsektionen |
| `--surface` / `--surface-2` | `oklch(0.245 …)` / `oklch(0.285 …)` | Karten, Panels, Hover |
| `--line` / `--line-soft` | `oklch(0.365 …)` / `oklch(0.305 …)` | Hairlines |
| `--ink` | `oklch(0.965 0.005 96)` | Text |
| `--muted` | `oklch(0.75 0.014 96)` | Sekundärtext (≥ 4.5:1 auf bg) |
| `--volt` | `oklch(0.88 0.175 96)` | Markengelb – Flächen, Highlighter UND Akzenttext (auf Dunkel wieder erlaubt) |
| `--copper` | `oklch(0.72 0.115 55)` | Zweitakzent: Störungscodes, „Ihr Part"-Balken |
| `--live` | `oklch(0.75 0.18 150)` | Grüner Live-Punkt |
| `--night` / `--night-deep` | `oklch(0.15 …)` / `oklch(0.125 …)` | Dunkelste Ebene: Finale, Footer |

Volt-Schimmer: Radial-Glows (`hero::after`, `impact::before`, `finale::after`, Alpha 0.07–0.16) übersetzen funnelstars Blau-Orbs in die Markenfarbe. Das Lead-Formular bleibt als **helle Insel** (hartkodierte Light-Werte) der Kontrast-Höhepunkt am Conversion-Punkt. `.hl`-Highlighter (Gelb hinter Schlüsselwörtern) bleibt.

## Typografie

- **Display:** Archivo variable. Anker (h1/h2): Stretch 118 %, Gewicht 850. Arbeitsebene (h3, Buttons, Marker): Stretch 106–108 %, Gewicht 680–760.
- **Body:** Atkinson Hyperlegible 400/700, Basis 1.0625 rem, Zeilenhöhe 1.65.

## Marken-Bausteine

- **Kabelmarkierer** (`.marker`): auf Hell wieder solid Volt mit dunklem Text (funktioniert dank Flächenkontrast).
- **Highlighter** (`.hl`): Volt-Textmarker, `box-decoration-break: clone` – H1-Schlusszeile, Bridge-Sätze, Finale.
- **Störungssuche**: 4 interaktive weiße Karten, Kupfer-Fehlercode mit Hairline darunter; Hover: -4 px, Volt-Rahmen, `--shadow-m` + Volt-Ring.
- **Sicherungskasten** (`.panel`): Schalter sind echte `<button aria-pressed>` – Klick kippt EIN/AUS (Transition `--ease-move`, 300 ms, interruptibel), Zeile dimmt bei AUS auf 35 %. Initial schalten sie beim Reveal gestaffelt EIN (140 ms Versatz).
- **Bauzeitenplan** (`.plan`): Gantt über 3-Tage-Achse, Nummern 01–04 in `--volt-deep`, Balken `scaleX`-Stagger; Kupfer = Ihr Part, Volt = Unser Part, mit Legende.
- **Stimmen-Marquee** (`.tm-cols`): 3 Endlos-Spalten (1/2/3 ab 760/1080 px), CSS `translateY(-50%)`-Loop 36/44/40 s linear, Fade-Maske oben/unten, Hover pausiert; Duplikat-Sets `aria-hidden`, bei `prefers-reduced-motion` statisch ohne Duplikate. Porträts: Unsplash-Thumbs 96 px, eager + `decoding=async` (lazy feuert im animierten Maskencontainer nicht zuverlässig).
- **Impact-Marquee** (`.impact`, bg-deep): 3 riesige Kennzahl-Zeilen (Ziffern bis 6 rem, Suffix in Volt), abwechselnd links-/rechtsbündig. **Ruhiger rAF-Scrub**: quadratisches Mapping `t·|t| × 0.72vw` (in Leselage steht die Zeile still, Bewegung nur an den Rändern) plus Lerp-Dämpfung (Faktor 0.09) gegen Scroll-Zucken; Loop stoppt 220 ms nach letztem Scroll. Bei reduced-motion statisch. Keine Counter.
- **Lampen-Hero** (`.lamp`): zentrierte Komposition — glühende Volt-Lichtlinie mit Lichtkegel (conic-gradient) und weichem Glow, die beim Laden per `scaleX` „angeknipst" wird (Cyan des Lamp-Components → Volt übersetzt). H1 „Schalten Sie Ihre Online-Sichtbarkeit ein." mit `.hl`-Chip auf „ein." (= EIN-Schalter). Darunter Sub, Trust-Checks, **dezenter** Ghost-CTA, dann das Phone-Mockup mittig im Lichtkegel (Toasts links/rechts außen ab 960 px). Die Aurora wurde durch die Lampe ersetzt.
- **Schwebender CTA** (`.cta-float`): Volt-Pill „Erstgespräch buchen" mit Blitz-Icon, fixed unten rechts; erscheint nach ~1,4 Viewporthöhen (weicher Fade/Rise, `visibility`-getoggelt für saubere Tab-Reihenfolge) und verschwindet, sobald der Kontakt-Bereich in Sicht ist (synchroner Rect-Check im Scroll-Handler, kein IO). Jeder Erstgespräch-Button trägt das Blitz-Icon.
- **Versprechen-Laufzeile** (`.lm`, direkt unterm Hero): endlos laufende Textzeile (Festpreis 500 €, 3 Tage, Hosting inkl., …) mit Volt-Blitz-Separatoren, 38 s linear, Kanten per Maske ausgeblendet. Duplikat-Set `aria-hidden`; reduced-motion: statisch.
- **Stimmen-Marquee**: Pause **nur bei Hover auf einer Karte** (`.tm-col:has(.tm-card:hover)`), nicht auf Container/Rand.
- Vorher/Nachher-Sektion wurde entfernt (Hero-Sekundär-CTA zeigt auf #ablauf, Nav/Footer auf #stimmen). Bauzeitenplan: Balken 02 startet bei 8 % (nach dem Erstgespräch), nicht bei 0.
- **FAQ**: exakt 5 Fragen, Kopf + Liste zentriert (max 720 px), größere Fragen (bis 1.25 rem), Plus-Icon → Volt-×, Antwort via `grid-template-rows 0fr→1fr`.
- **Finale**: dunkle Insel (`--night`) mit Volt-Absperrband-Kante, weißes Formular-Card, Volt-Submit.
- **Funkenspur** (`#fx`): auf Hell in Amber-Tönen mit `mix-blend-mode:multiply`; aus bei Touch/reduced-motion.

## Motion

- Easings: `--ease-out: cubic-bezier(.23,1,.32,1)`, `--ease-move: cubic-bezier(.77,0,.175,1)`. Nie ease-in, nie Bounce.
- Reveals: 0.7 s, translateY 18 px **+ blur(6px) → 0** (Premium-Tiefe), Varianten left/right für Impact.
- Buttons: `:active` scale(.97); Schalter `:active` scale(.93). Hover nur hinter `@media (hover:hover) and (pointer:fine)`.
- Marquee: `linear` (konstante Bewegung), alle UI-Transitions ≤ 400 ms.

## Layout

- `--wrap` 1160 px, Sektionsabstand `clamp(4.5rem, 9vw, 8rem)`, Radius 12–18 px.
- Rhythmus: bg / bg-deep im Wechsel; Finale + Footer als dunkler Abschluss.
- Breakpoints: 560 / 640 / 700 / 760 / 780 / 800 / 860 / 960 / 1080. Mobile-first, bei 375 px verifiziert (kein horizontales Scrollen).
