<p align="center">
  <img src="media/hero.gif" alt="A pen draws a line; it becomes Uko, who comes alive, hops onto a subscription card and floats over the app" width="720">
</p>

<h1 align="center">Uko — a living mascot for your app</h1>

<p align="center">
  A stick-figure mascot that acts out every state of your interface: <b>welcome, loading, success, error, empty, sleep…</b><br>
  It breathes, blinks, reacts to touch and never freezes. One tag on the web, one Rive file everywhere else.<br>
  With the full pack, it sits on your cards, climbs your modals, hops and dances, wherever you decide.
</p>

<p align="center">
  <a href="https://mascot-uko.com/en/"><b>Website</b></a> ·
  <a href="https://mascot-uko.com/en/#galerie"><b>Try the colors and hairstyles</b></a> ·
  <a href="https://mascot-uko.com/free/Uko-Starter.zip"><b>Download (free)</b></a> ·
  <a href="https://www.youtube.com/@Hosh-uko"><b>YouTube</b></a>
</p>

<p align="center">
  <img alt="Free, commercial use included" src="https://img.shields.io/badge/price-free%20·%20commercial%20use%20OK-FF7AAE">
  <img alt="Version" src="https://img.shields.io/badge/version-2.7.2-16161D">
  <img alt="Web + Rive" src="https://img.shields.io/badge/web%20%2B%20Rive-iOS%20·%20Android%20·%20Flutter%20·%20React-3B5BFF">
  <img alt="Zero dependencies" src="https://img.shields.io/badge/dependencies-0-3DDC97">
  <img alt="Web engine size" src="https://img.shields.io/badge/web%20engine-57%20KB%20gzip-FFC93C">
</p>

<p align="center"><i>Français : <a href="README.fr.md">README.fr.md</a> · Español: <a href="README.es.md">README.es.md</a></i></p>

---

This repository is **Uko Starter**, the free edition: the files you get in the download, ready to use.
Version 2.7.2.

| | Free (this repository) | Full pack ★ |
|---|---|---|
| Characters | Uko, Aituko the robot, Meowuko the cat | same |
| States (web engine) | all 9: `idle` `welcome` `thinking` `loading` `success` `error` `empty` `sleep` `wake` | same |
| Hairstyles (Uko) | 3: `original`, `classique`, `chauve` | 17 |
| Colors, light and dark themes | ✓ | ✓ |
| Touch reactions, in every awake state | ✓ | ✓ |
| Eyes that follow the pointer across the whole page (`follow="page"`), then look away after a few seconds | ✓ | ✓ |
| Rive files (iOS, Android, Flutter, React Native) | all 3 characters, 4 states each (idle, welcome, loading, success) | all 3 characters, 9 states each |
| Postures: sits on a card, leans on a window, lies along an edge, dances, floats | — | ✓ |
| Moves: hops, climbs, walks, turns around | — | ✓ |
| One line to place it on any element: `uko.placeOn(card, { posture: 'sit' })` | — | ✓ |
| A soul: reacts to where it is touched, to the moment and to its mood | — | ✓ |
| Speech: its mouth follows the voice you provide (your recording or your text-to-speech); no voice is included | — | ✓ |
| Eyes on one precise element: `uko.lookAt(element)` | — | ✓ |
| Commercial use | ✓ | ✓ |
| Price | free | €5.99 launch price, then €9.99 · paid once |

The full pack is on sale: [see it and buy it](https://mascot-uko.com/en/#prix) (one payment, instant download after payment, receipt by email, sold through Stripe).
Moving to it means replacing the files: your code does not change.

### The full pack, filmed in a real app

It has a soul: it reacts to where it is touched, to the moment and to its mood. Each move is one line, wherever you decide. In [SubFlow](https://mascot-uko.com/en/#ia), a subscription tracker, it sits on the empty list's button, climbs onto the form, hops back home and dances on every saving:

<p align="center">
  <img src="media/pack-sit.gif" alt="Empty list: Uko sits on the button" width="200">
  <img src="media/pack-climb.gif" alt="A form opens: Uko climbs on top of it" width="200">
  <img src="media/pack-hop.gif" alt="Saved: Uko hops back home" width="200">
  <img src="media/pack-dance.gif" alt="Every saving: Uko dances" width="200">
</p>

<p align="center"><img src="media/pack-soul.gif" alt="Touch it: hearts, dizziness, a sneeze, then it gets annoyed and crosses its arms. It has a soul." width="420"></p>

```js
uko.placeOn('#empty-list button', { posture: 'sit' });     // sits on the button
uko.placeOn(modal, { posture: 'lean', move: 'climb' });    // climbs up and leans on the modal
await uko.goHome();                                        // back to its place
uko.dance();                                               // a free dance, never twice the same
```

### Free: every state, touch reactions and a gaze that follows the page

It reacts to touch in every awake state, and with `follow="page"` its eyes follow your mouse (or finger) across the whole page.

<p align="center"><img src="media/touch.gif" alt="Bald, pink Uko: tapping the head, a hand, a foot, the body; three taps make it dizzy, five make it jump for joy" width="420"></p>

## Quick start

**HTML**

```html
<script src="uko-mascot-engine.min.js"></script>

<uko-mascot state="loading" hair="classique" brand="#FFE3C4" style="width:160px;height:240px"></uko-mascot>
<uko-mascot character="meowuko" state="welcome" brand="#FFD9B3" style="width:160px;height:240px"></uko-mascot>   <!-- or "aituko" -->
```

```js
document.querySelector('uko-mascot').setAttribute('state', 'success');
```

**React**

```jsx
import './uko-mascot-engine.min.js';

export function Status({ busy, done }) {
  const state = busy ? 'loading' : done ? 'success' : 'idle';
  return <uko-mascot state={state} hair="chauve" style={{ width: 160, height: 240 }} />;
}
```

**JavaScript**

```js
const uko = UkoMascot.create('#mascot', { hairStyle: 'classique', brandColor: '#DDE3FF' });
uko.startLoading();      // during a request
uko.resolveSuccess();    // … then the celebration
```

**Rive** (web, iOS, Android, Flutter)

```js
import { Rive } from '@rive-app/canvas-lite';

const input = name => uko.stateMachineInputs('Uko').find(i => i.name === name);
const uko = new Rive({
  src: 'rive/uko.riv', canvas: document.querySelector('canvas'), stateMachines: 'Uko', autoplay: true,
  onLoad: () => { uko.resizeDrawingSurfaceToCanvas(); input('state').value = 2; },   // 0 idle, 2 loading
});
// later, when the request has succeeded (triggers: welcome, success; the free Rive files have 4 states: idle, welcome, loading, success)
function done() { input('state').value = 0; input('success').fire(); }
```

Complete examples for React, Flutter, iOS (Swift) and Android (Kotlin) are in [`examples/`](examples).
To fit the mascot to your app with Claude, ChatGPT, Cursor or Copilot, use [`AI-PROMPT.md`](AI-PROMPT.md).
Full documentation: [README.en.md](README.en.md).

## Files

| File | What |
|---|---|
| `uko-mascot-engine.min.js` | The web engine to load in your site or app (57 KB gzip, zero dependencies) |
| `uko-mascot-engine.js` | The same code, readable |
| `rive/uko.riv`, `rive/aituko.riv`, `rive/meowuko.riv` | The same mascots for iOS, Android, Flutter, React Native and the web (74 KB each) |
| `examples/` | One ready-to-open example per platform |
| `AI-PROMPT.md` | The prompt to fit the mascot to your app with AI |
| `CHANGELOG.md` | What changed in each version |

## License

Free, commercial use included: use Uko in as many personal or commercial projects as you like and modify it,
including with AI. Do not redistribute or resell the files on their own, or present the characters as your own
creation or brand. See [LICENSE.md](LICENSE.md) (French; it prevails over any translation).
Questions and bug reports: [issues](https://github.com/hoshuko/uko-mascot/issues) or hello@aadatech.com.

Made by [AadaTech](https://aadatech.com) · [mascot-uko.com](https://mascot-uko.com)
