# Uko Starter — gratuit

*English: `README.en.md` · Español: `README.es.md`*

Uko, Aituko le robot et Meowuko le chat en version gratuite : **les 9 états**, **3 coiffures** pour Uko (`original`, `classique`, `chauve`), toutes les couleurs, thème clair ou sombre.
Essaie-le dans ton app, et garde-le en production si tu veux : c'est permis (voir `LICENSE.md`).

| | Pour qui | Fichier |
|---|---|---|
| **Moteur web** | sites et apps web (HTML, React, Vue, Svelte…) | `uko-mascot-engine.min.js` (≈ 53 Ko gzip, zéro dépendance) ; `uko-mascot-engine.js` = le même, lisible |
| **Fichier Rive** | web, Flutter, iOS, Android, React Native… | `rive/uko.riv`, `rive/aituko.riv`, `rive/meowuko.riv` + machine à états « Uko » |

## Starter ou pack complet

| | Starter (gratuit) | Pack complet |
|---|---|---|
| Mascottes | Uko, Aituko le robot, Meowuko le chat | pareil |
| États (moteur web) | les 9 : `idle` `welcome` `thinking` `loading` `success` `error` `empty` `sleep` `wake` | pareil |
| Coiffures, couleurs, thème | 3 coiffures, couleurs libres | 17 coiffures, couleurs libres |
| Fichiers Rive (mobile) | les 3 personnages, 4 états chacun | les 3 personnages, 9 états chacun |
| Mouvements : s'asseoir sur une carte, s'accouder, danser, flotter, sauter, grimper `climb()`, marcher, se retourner | — | oui |
| Regard : suit la souris au survol | oui | oui |
| Regard sur toute la page (`follow="page"`, doigt sur mobile), `lookAt()` | — | oui |
| Usage commercial | oui | oui |

**Passer au pack complet** : remplace `uko-mascot-engine.min.js` (et `uko-mascot-engine.js`) et les fichiers `rive/*.riv` par ceux du pack. Ton code ne change pas.
Si ton code demande déjà un mouvement du pack complet (par exemple `climb()` ou `lookAt()`), la mascotte reste dans son état actuel
et la console indique où le trouver : rien ne casse.

Pack complet : https://uko-mascot.pages.dev/#prix

## Ce que tu reçois

- `uko-mascot-engine.min.js` : le moteur web à charger dans ton site ou ton app.
- `uko-mascot-engine.js` : le même code, lisible : pour le comprendre ou le donner à ton assistant de code.
- `rive/uko.riv`, `rive/aituko.riv`, `rive/meowuko.riv` : les mêmes mascottes pour iOS, Android, Flutter, React Native et le web.
- `examples/` : un exemple prêt à ouvrir par plateforme.
- `AI-PROMPT.md` : le prompt pour adapter la mascotte à ton app avec l'IA.

**C'est une base.** Les 9 états du Starter marchent tels quels. Ce qui est propre à ton app
(à quel moment la mascotte réagit, où elle se place, un comportement sur mesure comme grimper sur un formulaire)
se branche avec quelques lignes de code, avec l'API décrite plus bas. Tu peux aussi le confier à ton assistant
de code (Claude, ChatGPT, Cursor, Copilot…) : colle-lui le prompt de `AI-PROMPT.md`.

---

## 1. Moteur web

```html
<script src="uko-mascot-engine.min.js"></script>

<uko-mascot state="loading" hair="classique" brand="#FFD6E0" style="width:240px;height:360px"></uko-mascot>
```

Change un attribut, la mascotte réagit avec une transition naturelle :

```js
document.querySelector('uko-mascot').setAttribute('state', 'success');
```

| Attribut | Valeurs | Défaut |
|---|---|---|
| `state` | `idle` `welcome` `thinking` `loading` `success` `error` `empty` `sleep` `wake` | `idle` |
| `character` | `uko`, `aituko` (robot), `meowuko` (chat) | `uko` |
| `hair` | `original`, `classique`, `chauve` | `original` |
| `brand` | couleur du visage, des mains et des pieds (`#RRGGBB`) | `#FFFFFF` |
| `hair-color` | couleur des cheveux | `#0B0B0B` |
| `theme` | `auto` (suit `html.dark` / `data-theme`), `system`, `light`, `dark` | `auto` |
| `contrast` | `auto` (couleurs ajustées pour le contraste WCAG) ou `direct` | `auto` |
| `interactive` | la mascotte suit le curseur et réagit au clic | `true` |
| `one-shot` | `return` (revient à idle après welcome ou success) ou `loop` | `return` |
| `cheeks` | joues roses | `true` |
| `accent` | couleur de l'antenne d'Aituko | `#FFC93C` |

Événements : `statechange`, `complete` (`event.detail.state`) et `tap` (`event.detail.zone` : `head`, `hand_L`, `hand_R`, `foot_L`, `foot_R`, `body` ; `event.detail.reaction`).

### Toucher

Touche la mascotte (souris ou doigt) : la zone touchée réagit, avec un petit effet. Tête : boop, fou rire, grimace ; main : coucou, tope-là ; pied : petit saut, coup de pied, aïe ; corps : rebond, chatouilles, surprise.
Plusieurs touches de suite : trois sur la tête, elle a la tête qui tourne ; trois sur le corps, elle rit aux éclats ; cinq n'importe où, elle saute de joie. Endormie, un tap la réveille.
Depuis ton code : `uko.poke('head')` (ou `'hand'`, `'foot'`, `'body'`), avec une réaction précise si tu veux : `uko.poke('body', 'joy')`. `interactive="false"` désactive le toucher.

### React

```jsx
import './uko-mascot-engine.min.js';

export default function Status({ busy, done }) {
  const state = busy ? 'loading' : done ? 'success' : 'idle';
  return <uko-mascot state={state} hair="chauve" brand="#FFD6E0" style={{ width: 200, height: 300 }} />;
}
```

### JavaScript

```js
const uko = UkoMascot.create('#mascot', { hairStyle: 'classique', brandColor: '#FFE8A3', theme: 'auto' });

uko.startLoading();            // pendant une requête
uko.resolveSuccess();          // … puis la célébration
uko.setState('welcome');
uko.setHairStyle('chauve');
uko.setBrandColor('#C9F2E1');
uko.destroy();
```

`UkoMascot.edition` vaut `"starter"` et `UkoMascot.ORDER` liste les états disponibles.

### Personnages

Même squelette, mêmes états, mêmes gestes de vie : seule la tête change.

```html
<uko-mascot character="aituko" state="loading" brand="#DDE3FF" accent="#3B5BFF"></uko-mascot>
<uko-mascot character="meowuko" state="success" brand="#FFD9B3"></uko-mascot>
```

JavaScript : `UkoMascot.create('#m', { character: 'meowuko' })`, `uko.setCharacter('aituko')`, liste dans `UkoMascot.CHARACTERS`.
Les coiffures ne concernent qu'Uko.

### Coiffures

`original` `classique` `chauve` (alias anglais : `bald`)

Les 14 autres coiffures (afro, dreadlocks, tresses, chignon, boucles…) sont dans le pack complet. Une coiffure du pack demandée ici
affiche `original` et la console indique où la trouver.

### Accessibilité et performance

- `prefers-reduced-motion` est respecté (poses fixes, pas d'effets).
- L'animation se met en pause quand l'onglet est caché. `setMaxFps(30)` pour les pages très chargées.
- Hors de l'écran (page défilée, `display: none`), une mascotte ne se redessine que 4 fois par seconde ; ses états et mouvements continuent. Les coiffures détaillées s'allègent toutes seules en petit (moins de ~200 pixels d'écran de large), sans différence visible.
- Poids : moteur web **≈ 53 Ko gzip** (`uko-mascot-engine.min.js`, 164 Ko brut ; la version lisible fait 310 Ko). Fichiers Rive : uko.riv 74 · aituko.riv 72 · meowuko.riv 73 Ko.

---

## 2. Fichiers Rive (`rive/*.riv`)

- Un fichier par personnage, `uko.riv`, `aituko.riv`, `meowuko.riv` (≈ 73 Ko chacun), rig à os, même machine à états **`Uko`** et mêmes entrées : changer de personnage revient à changer de fichier. Les fichiers du pack complet gardent les mêmes entrées.
- En repos et en chargement, la machine enchaîne des gestes de vie (regarder autour, hausser
  les épaules, jeter un œil au chargement…) : Uko ne reste jamais figé. Plus une couche de clignement.

| Entrée | Type | Rôle |
|---|---|---|
| `state` | Number | `0` idle · `2` loading |
| `welcome` | Trigger | salut |
| `success` | Trigger | célébration (depuis loading : enchaînement dédié) |

Après un chargement réussi : mets `state = 0` **et** déclenche `success` en même temps.
Les numéros sont ceux du pack complet (qui ajoute `1` thinking, `3` sleep, et les triggers `error`, `empty`).

**Couleurs** (data binding) : view model `Appearance` avec `bodyColor`, `lineColor`, `hairColor` (+ `accentColor` dans `aituko.riv`).

```js
import { Rive } from '@rive-app/canvas-lite';

const uko = new Rive({
  src: 'uko.riv', canvas: document.querySelector('canvas'),
  stateMachines: 'Uko', autoplay: true, autoBind: true,
  onLoad: () => uko.resizeDrawingSurfaceToCanvas(),
});
const input = (n) => uko.stateMachineInputs('Uko').find(i => i.name === n);
input('state').value = 2;   // loading
input('success').fire();
```

Exemples dans `examples/` : web, React, Flutter, iOS (Swift), Android (Kotlin).

---

## Licence

Gratuit, y compris pour un usage commercial, sans revente ni redistribution des fichiers : voir `LICENSE.md`.
