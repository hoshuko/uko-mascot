# Uko Starter — free

*Français : `README.md` · Español: `README.es.md`*

Uko, Aituko the robot and Meowuko the cat, free edition: **all 9 states**, **3 hairstyles** for Uko (`original`, `classique`, `chauve`), any colors, light or dark theme. It reacts to touch in every state, and its eyes can follow the pointer across the whole page (`follow="page"`).
Try it in your app, and keep it in production if you like: that is allowed
(code under the MIT license, characters: see `LICENSE-CHARACTERS.md`).

| | For | File |
|---|---|---|
| **Web engine** | websites and web apps (HTML, React, Vue, Svelte…) | `uko-mascot-engine.min.js` (≈ 55 KB gzip, zero dependencies); `uko-mascot-engine.js` = the same, readable |
| **Rive file** | web, Flutter, iOS, Android, React Native… | `rive/uko.riv`, `rive/aituko.riv`, `rive/meowuko.riv` + "Uko" state machine |

## Starter or full pack

| | Starter (free) | Full pack |
|---|---|---|
| Mascots | Uko, Aituko the robot, Meowuko the cat | same |
| States (web engine) | all 9: `idle` `welcome` `thinking` `loading` `success` `error` `empty` `sleep` `wake` | same |
| Hairstyles, colors, theme | 3 hairstyles, any colors | 17 hairstyles, any colors |
| Rive files (mobile) | all 3 characters, 4 states each (idle, welcome, loading, success) | all 3 characters, 9 states each |
| Touch: the zone touched reacts, in every awake state | yes (simple reaction, effects never on the face) | yes, with the soul |
| Gaze: follows the pointer on hover or over the whole page (`follow="page"`, finger on mobile), then looks away after a few seconds without movement | yes | yes |
| Look at one precise element (`lookAt()`) | — | yes |
| A soul: mood, reactions of its own for each state, pats, handshake, a life of its own | — | yes |
| Speech: the mouth follows the voice you provide (`speak()`, `setMouth()`); no voice is provided | — | yes |
| Movements: sit on a card, lean on a window, dance, float, hop, climb `climb()`, walk, turn around | — | yes |
| Place the mascot on an element in one line (`placeOn()`, `goHome()`) | — | yes |
| Commercial use | yes | yes |

**Moving to the full pack**: replace `uko-mascot-engine.min.js` (and `uko-mascot-engine.js`) and the `rive/*.riv` files with the pack's files. Your code does not change.
If your code already asks for a full-pack movement (for example `climb()` or `lookAt()`), the mascot stays in its current state
and the console says where to get it: nothing breaks.

Full pack: https://mascot-uko.com/en/#prix

## What you get

- `uko-mascot-engine.min.js`: the web engine to load in your site or app.
- `uko-mascot-engine.js`: the same code, readable: to understand it or to give it to your coding assistant.
- `rive/uko.riv`, `rive/aituko.riv`, `rive/meowuko.riv`: the same mascots for iOS, Android, Flutter, React Native and the web.
- `examples/`: one ready-to-open example per platform.
- `AI-PROMPT.md`: the prompt to fit the mascot to your app with AI.

**It is a base.** The Starter's 9 states work as they are. What is specific to your app
(when the mascot reacts, where it sits, a custom behavior such as climbing onto a form)
takes a few lines of code, with the API described below. You can also hand it to your coding assistant
(Claude, ChatGPT, Cursor, Copilot…): paste it the prompt from `AI-PROMPT.md`.

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
| `state` | `idle` `welcome` `thinking` `loading` `success` `error` `empty` `sleep` `wake` | `idle` |
| `character` | `uko`, `aituko` (robot), `meowuko` (cat) | `uko` |
| `hair` | `original`, `classique` (classic), `chauve` (bald) | `original` |
| `brand` | color of the face, hands and feet (`#RRGGBB`) | `#FFFFFF` |
| `hair-color` | hair color | `#0B0B0B` |
| `theme` | `auto` (follows `html.dark` / `data-theme`), `system`, `light`, `dark` | `auto` |
| `contrast` | `auto` (colors adjusted for WCAG contrast) or `direct` | `auto` |
| `interactive` | the mascot follows the cursor and reacts to clicks | `true` |
| `follow` | where the eyes follow the pointer: `hover` (over the mascot), `page` (anywhere on the page, and the finger on touch screens), `none` | `hover` |
| `one-shot` | `return` (back to idle after welcome, success, error, empty or wake) or `loop` | `return` |
| `cheeks` | pink cheeks | `true` |
| `accent` | color of Aituko's antenna light | `#FFC93C` |

Events: `statechange`, `complete` (`event.detail.state`) and `tap` (`event.detail.zone`: `head`, `hand_L`, `hand_R`, `foot_L`, `foot_R`, `body`; `event.detail.reaction`).

### Touch

Touch the mascot (mouse or finger): the zone touched reacts, with a small effect. Head: boop, giggle, squint; hand: wave, high five; foot: hop, kick, ouch; body: bounce, tickle, surprise.
Several taps in a row: three on the head make it dizzy; three on the body make it burst out laughing; five anywhere make it jump for joy. Asleep, a tap wakes it up. In the other awake states (loading, success, error…) it reacts too, with a simple reaction whose effects never land on the face; in error or for an empty list, no party: a small surprise mark.
From your code: `uko.poke('head')` (or `'hand'`, `'foot'`, `'body'`), with a given reaction if you like: `uko.poke('body', 'joy')`. `interactive="false"` turns touch off.

### Gaze

By default the eyes follow the pointer when it is over the mascot (`follow="hover"`). With `follow="page"` (or `uko.setFollow('page')`) they follow it across the whole page, and the finger on touch screens; after a few seconds without movement, it looks away and goes back to its own life. `follow="none"` turns following off. Looking at one precise element (`lookAt()`) is in the full pack.

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

Same skeleton, same states, same life gestures: only the head changes.

```html
<uko-mascot character="aituko" state="loading" brand="#DDE3FF" accent="#3B5BFF"></uko-mascot>
<uko-mascot character="meowuko" state="success" brand="#FFD9B3"></uko-mascot>
```

JavaScript: `UkoMascot.create('#m', { character: 'meowuko' })`, `uko.setCharacter('aituko')`, list in `UkoMascot.CHARACTERS`.
Hairstyles only apply to Uko.

### Hairstyles

`original` `classique` (classic) `chauve` (bald; English alias `bald`)

The 14 other hairstyles (afro, dreadlocks, braids, bun, curls…) come with the full pack. A full-pack hairstyle asked for here
shows `original` and the console says where to get it.

### Accessibility and performance

- `prefers-reduced-motion` is respected (still poses, no effects).
- The animation pauses when the tab is hidden. The frame rate adapts on its own (`maxFps: 'auto'`, the default): 60 fps, then 30 or 20, with simplified hair, when the page's mascots cost too much (a modest phone, many mascots); it goes back up as soon as it can. Long hair only computes its physics while the head moves. A number fixes the rate: `maxFps: 60`, or `setMaxFps(30)`.
- Off screen (scrolled away, `display: none`), a mascot redraws only 4 times per second; its states and moves carry on. Detailed hairstyles lighten themselves when small (under ~200 screen pixels wide), with no visible difference.
- Size: web engine **≈ 55 KB gzip** (`uko-mascot-engine.min.js`, 168 KB raw; the readable version is 321 KB). Rive files: uko.riv 74 · aituko.riv 72 · meowuko.riv 73 KB.

---

## 2. Rive files (`rive/*.riv`)

- One file per character, `uko.riv`, `aituko.riv`, `meowuko.riv` (≈ 73 KB each), rigged with bones, same state machine **`Uko`** and same inputs: switching characters means switching files. The full pack's files keep the same inputs.
- While idle and loading, the machine chains small life gestures (looking around, shrugging,
  checking the progress…): Uko never freezes. Plus a blink layer.

| Input | Type | Role |
|---|---|---|
| `state` | Number | `0` idle · `2` loading |
| `welcome` | Trigger | hello |
| `success` | Trigger | celebration (from loading: dedicated transition) |

These files contain 4 states: idle (`state = 0`), loading (`state = 2`), welcome (`welcome`) and success (`success`). All 9 states are in the web engine; the full pack's Rive files have all 9.

After a successful load: set `state = 0` **and** fire `success` at the same time.
The numbers are the full pack's (which adds `1` thinking, `3` sleep, and the `error`, `empty` triggers).

**Colors** (data binding): view model `Appearance` with `bodyColor`, `lineColor`, `hairColor` (+ `accentColor` in `aituko.riv`).

```js
import { Rive } from '@rive-app/canvas-lite';

const input = (n) => uko.stateMachineInputs('Uko').find(i => i.name === n);
const uko = new Rive({
  src: 'uko.riv', canvas: document.querySelector('canvas'),
  stateMachines: 'Uko', autoplay: true, autoBind: true,
  onLoad: () => {
    uko.resizeDrawingSurfaceToCanvas();
    // The inputs exist once the file has loaded
    input('state').value = 2;   // loading
  },
});

// Later, when the request has succeeded
function done() {
  input('state').value = 0;
  input('success').fire();
}
```

Examples in `examples/`: web, React, Flutter, iOS (Swift), Android (Kotlin).

---

## License

The code is open source under the MIT license (`LICENSE`): read it, change it, republish it. The characters Uko, Aituko
and Meowuko can be used freely in your products, commercial ones included and even as a logo, as long as they are not
sold as they are or claimed as yours: see `LICENSE-CHARACTERS.md` (the French text prevails).
