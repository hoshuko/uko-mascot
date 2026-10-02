# Uko Starter — free

*Français : `README.md` · Español: `README.es.md`*

Uko, free edition: **4 states**, **3 hairstyles** (`original`, `classique`, `chauve`), any colors, light or dark theme.
Try it in your app, and keep it in production if you like: that is allowed
(see `LICENSE.md`; the French text of the license prevails).

| | For | File |
|---|---|---|
| **Web engine** | websites and web apps (HTML, React, Vue, Svelte…) | `uko-mascot-engine.min.js` (≈ 45 KB gzip, zero dependencies); `uko-mascot-engine.js` = the same, readable |
| **Rive file** | web, Flutter, iOS, Android, React Native… | `rive/uko.riv` + "Uko" state machine |

## Starter or full pack

| | Starter (free) | Full pack |
|---|---|---|
| Mascots | Uko | Uko, Aituko the robot, Meowuko the cat |
| States | `idle` `welcome` `loading` `success` | those 4 + `thinking` `error` `empty` `sleep` `wake` |
| Hairstyles, colors, theme | 3 hairstyles, any colors | 17 hairstyles, any colors |
| Rive files | 4 states | 9 states |
| Movements: walk, turn around, climb `climb()` | — | yes |
| Gaze: follows the mouse on hover | yes | yes |
| Gaze over the whole page (`follow="page"`, finger on mobile), `lookAt()` | — | yes |
| Commercial use | yes | yes |

**Moving to the full pack**: replace `uko-mascot-engine.min.js` (and `uko-mascot-engine.js`) and the `rive/*.riv` files with the pack's files. Your code does not change.
If your code already asks for a full-pack state or movement (for example `error`, `climb()`, `lookAt()`), Uko stays in its current state
and the console says where to get it: nothing breaks.

Full pack: https://uko-mascot.pages.dev/en/#prix

## What you get

- `uko-mascot-engine.min.js`: the web engine to load in your site or app.
- `uko-mascot-engine.js`: the same code, readable: to understand it or to give it to your coding assistant.
- `rive/uko.riv`: the same mascot for iOS, Android, Flutter, React Native and the web.
- `examples/`: one ready-to-open example per platform.
- `AI-PROMPT.md`: the prompt to fit the mascot to your app with AI.

**It is a base.** The Starter's 4 states work as they are. What is specific to your app
(when the mascot reacts, where it sits, a custom behavior such as climbing onto a form)
takes a few lines of code: paste the prompt from `AI-PROMPT.md` into your coding assistant
(Claude, ChatGPT, Cursor, Copilot…) and it does it for you.

---

## 1. Web engine

```html
<script src="uko-mascot-engine.min.js"></script>

<uko-mascot state="loading" hair="classique" brand="#FFD6E0" style="width:240px;height:360px"></uko-mascot>
```

Change an attribute and the mascot reacts, with a natural transition:

```js
document.querySelector('uko-mascot').setAttribute('state', 'success');
```

| Attribute | Values | Default |
|---|---|---|
| `state` | `idle` `welcome` `loading` `success` | `idle` |
| `character` | `uko` (Aituko and Meowuko: full pack) | `uko` |
| `hair` | `original`, `classique` (classic), `chauve` (bald) | `original` |
| `brand` | color of the face, hands and feet (`#RRGGBB`) | `#FFFFFF` |
| `hair-color` | hair color | `#0B0B0B` |
| `theme` | `auto` (follows `html.dark` / `data-theme`), `system`, `light`, `dark` | `auto` |
| `contrast` | `auto` (colors adjusted for WCAG contrast) or `direct` | `auto` |
| `interactive` | the mascot follows the cursor and reacts to clicks | `true` |
| `one-shot` | `return` (back to idle after welcome or success) or `loop` | `return` |
| `cheeks` | pink cheeks | `true` |

Events: `statechange`, `complete` (`event.detail.state`) and `tap` (`event.detail.zone`: `head`, `hand_L`, `hand_R`, `foot_L`, `foot_R`, `body`; `event.detail.reaction`).

### Touch

Touch the mascot (mouse or finger): the zone touched reacts, with a small effect. Head: boop, giggle, squint; hand: wave, high five; foot: hop, kick, ouch; body: bounce, tickle, surprise.
Several taps in a row: three on the head make it dizzy; three on the body make it burst out laughing; five anywhere make it jump for joy. Asleep, a tap wakes it up.
From your code: `uko.poke('head')` (or `'hand'`, `'foot'`, `'body'`), with a given reaction if you like: `uko.poke('body', 'joy')`. `interactive="false"` turns touch off.

In every background state Uko breathes, shifts its weight and makes small gestures on its own
(looking around, shrugging, checking the progress while loading…): it never freezes.

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

uko.startLoading();            // during a request
uko.resolveSuccess();          // … then the celebration
uko.setState('welcome');
uko.setHairStyle('chauve');
uko.setBrandColor('#C9F2E1');
uko.destroy();
```

`UkoMascot.edition` is `"starter"` and `UkoMascot.ORDER` lists the available states.

### Characters

Aituko the robot and Meowuko the cat come with the full pack: same skeleton, same states, same code.
In the Starter, `character` is always `uko`.

\g<1>`original` `classique` (classic) `chauve` (bald; English alias `bald`)

The 14 other hairstyles (afro, dreadlocks, braids, bun, curls…) come with the full pack. A full-pack hairstyle asked for here
shows `original` and the console says where to get it.

### Accessibility and performance

- `prefers-reduced-motion` is respected (still poses, no effects).
- The animation pauses when the tab is hidden. `setMaxFps(30)` for very busy pages.
- Off screen (scrolled away, `display: none`), a mascot redraws only 4 times per second; its states and moves carry on. Detailed hairstyles lighten themselves when small (under ~200 screen pixels wide), with no visible difference.
- Size: web engine **≈ 45 KB gzip** (`uko-mascot-engine.min.js`, 133 KB raw; the readable version is 267 KB). Rive file: uko.riv 74 KB.

---

## 2. Rive files (`rive/*.riv`)

- One file, `uko.riv` (74 KB), rigged with bones, state machine **`Uko`**. The full pack's files keep the same inputs.
- While idle and loading, the machine chains small life gestures (looking around, shrugging,
  checking the progress…): Uko never freezes. Plus a blink layer.

| Input | Type | Role |
|---|---|---|
| `state` | Number | `0` idle · `2` loading |
| `welcome` | Trigger | hello |
| `success` | Trigger | celebration (from loading: dedicated transition) |

After a successful load: set `state = 0` **and** fire `success` at the same time.
The numbers are the full pack's (which adds `1` thinking, `3` sleep, and the `error`, `empty` triggers).

**Colors** (data binding): view model `Appearance` with `bodyColor`, `lineColor`, `hairColor`.

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

Examples in `examples/`: web, React, Flutter, iOS (Swift), Android (Kotlin).

---

## License

Free, commercial use included, no resale or redistribution of the files: see `LICENSE.md` (French; it prevails over any translation).
