# Uko Starter — gratis

*Français : `README.md` · English: `README.en.md`*

Uko en versión gratuita: **4 estados**, **3 peinados** (`original`, `classique`, `chauve`), colores libres, tema claro u oscuro.
Pruébalo en tu app y quédatelo en producción si quieres: está permitido
(ver `LICENSE.md`; prevalece el texto francés de la licencia).

| | Para | Archivo |
|---|---|---|
| **Motor web** | sitios y apps web (HTML, React, Vue, Svelte…) | `uko-mascot-engine.min.js` (≈ 45 KB gzip, cero dependencias); `uko-mascot-engine.js` = el mismo, legible |
| **Archivo Rive** | web, Flutter, iOS, Android, React Native… | `rive/uko.riv` + máquina de estados «Uko» |

## Starter o pack completo

| | Starter (gratis) | Pack completo |
|---|---|---|
| Mascotas | Uko | Uko, Aituko el robot, Meowuko el gato |
| Estados | `idle` `welcome` `loading` `success` | esos 4 + `thinking` `error` `empty` `sleep` `wake` |
| Peinados, colores, tema | 3 peinados, colores libres | 17 peinados, colores libres |
| Archivos Rive | 4 estados | 9 estados |
| Movimientos: caminar, media vuelta, escalar `climb()` | — | sí |
| Mirada: sigue el ratón al pasar por encima | sí | sí |
| Mirada en toda la página (`follow="page"`, dedo en móvil), `lookAt()` | — | sí |
| Uso comercial | sí | sí |

**Pasar al pack completo**: reemplaza `uko-mascot-engine.min.js` (y `uko-mascot-engine.js`) y los archivos `rive/*.riv` por los del pack. Tu código no cambia.
Si tu código ya pide un estado o un movimiento del pack completo (por ejemplo `error`, `climb()`, `lookAt()`), Uko se queda en su estado actual
y la consola indica dónde encontrarlo: nada se rompe.

Pack completo: https://uko-mascot.pages.dev/es/#prix

## Qué recibes

- `uko-mascot-engine.min.js`: el motor web para cargar en tu sitio o tu app.
- `uko-mascot-engine.js`: el mismo código, legible: para entenderlo o dárselo a tu asistente de código.
- `rive/uko.riv`: la misma mascota para iOS, Android, Flutter, React Native y la web.
- `examples/`: un ejemplo listo para abrir por plataforma.
- `AI-PROMPT.md`: el prompt para adaptar la mascota a tu app con IA.

**Es una base.** Los 4 estados del Starter funcionan tal cual. Lo propio de tu app
(cuándo reacciona la mascota, dónde se coloca, un comportamiento a medida como trepar a un formulario)
se conecta con unas pocas líneas de código: pega el prompt de `AI-PROMPT.md` en tu asistente de código
(Claude, ChatGPT, Cursor, Copilot…) y lo hace por ti.

---

## 1. Motor web

```html
<script src="uko-mascot-engine.min.js"></script>

<uko-mascot state="loading" hair="classique" brand="#FFD6E0" style="width:240px;height:360px"></uko-mascot>
```

Cambia un atributo y la mascota reacciona, con una transición natural:

```js
document.querySelector('uko-mascot').setAttribute('state', 'success');
```

| Atributo | Valores | Por defecto |
|---|---|---|
| `state` | `idle` `welcome` `loading` `success` | `idle` |
| `character` | `uko` (Aituko y Meowuko: pack completo) | `uko` |
| `hair` | `original`, `classique` (clásico), `chauve` (calvo) | `original` |
| `brand` | color de la cara, las manos y los pies (`#RRGGBB`) | `#FFFFFF` |
| `hair-color` | color del pelo | `#0B0B0B` |
| `theme` | `auto` (sigue `html.dark` / `data-theme`), `system`, `light`, `dark` | `auto` |
| `contrast` | `auto` (colores ajustados al contraste WCAG) o `direct` | `auto` |
| `interactive` | la mascota sigue el cursor y reacciona al clic | `true` |
| `one-shot` | `return` (vuelve a idle tras welcome o success) o `loop` | `return` |
| `cheeks` | mejillas rosas | `true` |

Eventos: `statechange`, `complete` (`event.detail.state`) y `tap` (`event.detail.zone`: `head`, `hand_L`, `hand_R`, `foot_L`, `foot_R`, `body`; `event.detail.reaction`).

### Tocar

Toca la mascota (ratón o dedo): la zona tocada reacciona, con un pequeño efecto. Cabeza: boop, risita, mueca; mano: saludo, choca esos cinco; pie: saltito, patada, ay; cuerpo: rebote, cosquillas, sorpresa.
Varios toques seguidos: tres en la cabeza y se marea; tres en el cuerpo y se parte de risa; cinco en cualquier sitio y salta de alegría. Dormida, un toque la despierta.
Desde tu código: `uko.poke('head')` (o `'hand'`, `'foot'`, `'body'`), con una reacción concreta si quieres: `uko.poke('body', 'joy')`. `interactive="false"` desactiva el tacto.

En cada estado de fondo Uko respira, cambia el peso de pierna y hace pequeños gestos por sí solo
(mira alrededor, se encoge de hombros, mira la carga…): nunca se queda congelado.

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

uko.startLoading();            // durante una petición
uko.resolveSuccess();          // … y luego la celebración
uko.setState('welcome');
uko.setHairStyle('chauve');
uko.setBrandColor('#C9F2E1');
uko.destroy();
```

`UkoMascot.edition` vale `"starter"` y `UkoMascot.ORDER` lista los estados disponibles.

### Personajes

Aituko el robot y Meowuko el gato vienen con el pack completo: mismo esqueleto, mismos estados, mismo código.
En el Starter, `character` siempre vale `uko`.

\g<1>`original` `classique` (clásico) `chauve` (calvo; alias en inglés `bald`)

Los otros 14 peinados (afro, rastas, trenzas, moño, rizos…) vienen con el pack completo. Un peinado del pack pedido aquí
muestra `original` y la consola indica dónde conseguirlo.

### Accesibilidad y rendimiento

- Se respeta `prefers-reduced-motion` (poses fijas, sin efectos).
- La animación se pausa cuando la pestaña está oculta. `setMaxFps(30)` para páginas muy cargadas.
- Fuera de la pantalla (página desplazada, `display: none`), una mascota solo se redibuja 4 veces por segundo; sus estados y movimientos siguen. Los peinados detallados se aligeran solos en tamaño pequeño (menos de ~200 píxeles de pantalla de ancho), sin diferencia visible.
- Peso: motor web **≈ 45 KB gzip** (`uko-mascot-engine.min.js`, 133 KB sin comprimir; la versión legible pesa 267 KB). Archivo Rive: uko.riv 74 KB.

---

## 2. Archivos Rive (`rive/*.riv`)

- Un archivo, `uko.riv` (74 KB), con huesos, máquina de estados **`Uko`**. Los archivos del pack completo mantienen las mismas entradas.
- En reposo y en carga, la máquina encadena gestos de vida (mirar alrededor, encogerse de hombros,
  mirar la carga…): Uko nunca se queda congelado. Más una capa de parpadeo.

| Entrada | Tipo | Función |
|---|---|---|
| `state` | Number | `0` idle · `2` loading |
| `welcome` | Trigger | saludo |
| `success` | Trigger | celebración (desde loading: transición dedicada) |

Tras una carga correcta: pon `state = 0` **y** dispara `success` a la vez.
Los números son los del pack completo (que añade `1` thinking, `3` sleep y los triggers `error`, `empty`).

**Colores** (data binding): view model `Appearance` con `bodyColor`, `lineColor`, `hairColor`.

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

Ejemplos en `examples/`: web, React, Flutter, iOS (Swift), Android (Kotlin).

---

## Licencia

Gratis, uso comercial incluido, sin reventa ni redistribución de los archivos: ver `LICENSE.md` (en francés; prevalece sobre cualquier traducción).
