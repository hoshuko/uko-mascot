# Adapter la mascotte à ton app avec l'IA

*English below · Español más abajo*

Le pack est une **base** : les mascottes, leurs états et une API documentée. Ce qui est propre à ton app
(quand la mascotte réagit, où elle se place, un comportement sur mesure comme grimper sur un formulaire)
se branche avec quelques lignes de code. Un assistant de code (Claude, ChatGPT, Cursor, Copilot…) le fait très bien.

**Comment faire :** ouvre ton projet dans ton assistant, ajoute les fichiers du pack au projet,
puis colle le prompt ci-dessous. Remplace ce qui est entre crochets si tu veux guider davantage.

> **Starter (gratuit) :** les trois personnages (Uko, Aituko, Meowuko), les coiffures `original`, `classique`, `chauve` et les 9 états, sans mouvements ni `lookAt()` ; les fichiers Rive gratuits ont 4 états.
> Le prompt le précise à l'assistant : il n'utilisera pas le reste.

---

## Prompt (français)

```text
Tu vas intégrer la mascotte animée Uko dans mon app.

Contexte
- Les fichiers du pack sont dans [dossier, ex. vendor/uko/] : README.md (la documentation de l'API),
  uko-mascot-engine.js (lisible, pour comprendre), uko-mascot-engine.min.js (à charger en production),
  rive/*.riv (pour une app mobile native : iOS, Android, Flutter, React Native).
- Lis d'abord README.md en entier. N'invente aucune méthode ni attribut : utilise seulement ceux documentés.
- Si le moteur indique edition "starter", les personnages uko, aituko, meowuko et les coiffures original, classique,
  chauve existent (les 9 états sont là) : n'utilise ni climb(), ni lookAt(). Les fichiers Rive gratuits n'ont que idle,
  welcome, loading et success.

Ce que je veux
1. Propose-moi d'abord un plan court : les moments de mon app (chargement, enregistrement réussi,
   formulaire invalide, liste vide, première visite, inactivité…) et l'état de la mascotte pour chacun.
   Dis-moi où tu places la mascotte à l'écran et pourquoi. Attends ma validation.
2. Puis intègre-la :
   - web : <uko-mascot> (ou UkoMascot.create) avec uko-mascot-engine.min.js ;
   - mobile natif : le fichier .riv avec le runtime Rive officiel de ma plateforme (machine à états "Uko").
3. Branche les états sur mon code existant : loading pendant les requêtes, success après une action réussie,
   error sur une erreur, empty sur une liste vide, welcome à l'arrivée, sleep après une longue inactivité.
4. Reprends les couleurs de ma marque : [couleurs, ex. #3B5BFF] (attributs brand, hair-color, accent,
   ou le view model du fichier Rive), et le thème clair/sombre de mon app.
5. Ne modifie pas le fichier du moteur. Tout le code spécifique à mon app va dans mes propres fichiers.
6. Garde l'app légère : une seule instance par écran si possible, pas de boucle d'animation à toi
   (le moteur ralentit déjà hors écran, se met en pause quand l'onglet est caché et respecte prefers-reduced-motion).
7. Termine par la liste des fichiers modifiés et comment tester chaque état à la main.

Mon app : [stack, ex. React + Vite / Next.js / Flutter / SwiftUI] — [ce qu'elle fait en une phrase].
```

---

## Prompt (English)

```text
You are going to add the animated Uko mascot to my app.

Context
- The pack files are in [folder, e.g. vendor/uko/]: README.en.md (the API documentation),
  uko-mascot-engine.js (readable, to understand it), uko-mascot-engine.min.js (to load in production),
  rive/*.riv (for a native mobile app: iOS, Android, Flutter, React Native).
- Read README.en.md in full first. Do not invent any method or attribute: only use the documented ones.
- If the engine reports edition "starter", the uko, aituko and meowuko characters and the original, classique,
  chauve hairstyles exist (all 9 states are there): do not use climb() or lookAt(). The free Rive files only have
  idle, welcome, loading and success.

What I want
1. First, propose a short plan: the moments of my app (loading, successful save, invalid form,
   empty list, first visit, inactivity…) and the mascot state for each. Tell me where you place
   the mascot on screen and why. Wait for my approval.
2. Then add it:
   - web: <uko-mascot> (or UkoMascot.create) with uko-mascot-engine.min.js;
   - native mobile: the .riv file with my platform's official Rive runtime (state machine "Uko").
3. Wire the states to my existing code: loading during requests, success after a successful action,
   error on an error, empty on an empty list, welcome on arrival, sleep after a long inactivity.
4. Use my brand colors: [colors, e.g. #3B5BFF] (brand, hair-color, accent attributes, or the Rive
   file's view model), and my app's light/dark theme.
5. Do not modify the engine file. All app-specific code goes in my own files.
6. Keep the app light: one instance per screen if possible, no animation loop of your own
   (the engine already slows down off screen, pauses in hidden tabs and respects prefers-reduced-motion).
7. Finish with the list of changed files and how to test each state by hand.

My app: [stack, e.g. React + Vite / Next.js / Flutter / SwiftUI] — [what it does in one sentence].
```

---

## Prompt (español)

```text
Vas a integrar la mascota animada Uko en mi app.

Contexto
- Los archivos del pack están en [carpeta, p. ej. vendor/uko/]: README.es.md (la documentación de la API),
  uko-mascot-engine.js (legible, para entenderlo), uko-mascot-engine.min.js (para cargar en producción),
  rive/*.riv (para una app móvil nativa: iOS, Android, Flutter, React Native).
- Lee primero README.es.md entero. No inventes ningún método ni atributo: usa solo los documentados.
- Si el motor indica edition "starter", existen los personajes uko, aituko y meowuko y los peinados original,
  classique, chauve (los 9 estados están): no uses climb() ni lookAt(). Los archivos Rive gratuitos solo tienen
  idle, welcome, loading y success.

Lo que quiero
1. Primero, propón un plan corto: los momentos de mi app (carga, guardado correcto, formulario
   no válido, lista vacía, primera visita, inactividad…) y el estado de la mascota para cada uno.
   Dime dónde colocas la mascota en pantalla y por qué. Espera mi validación.
2. Después intégrala:
   - web: <uko-mascot> (o UkoMascot.create) con uko-mascot-engine.min.js;
   - móvil nativo: el archivo .riv con el runtime oficial de Rive de mi plataforma (máquina de estados "Uko").
3. Conecta los estados a mi código: loading durante las peticiones, success tras una acción correcta,
   error ante un error, empty en una lista vacía, welcome al llegar, sleep tras una larga inactividad.
4. Usa los colores de mi marca: [colores, p. ej. #3B5BFF] (atributos brand, hair-color, accent,
   o el view model del archivo Rive), y el tema claro/oscuro de mi app.
5. No modifiques el archivo del motor. Todo el código propio de mi app va en mis archivos.
6. Mantén la app ligera: una sola instancia por pantalla si es posible, ningún bucle de animación propio
   (el motor ya se ralentiza fuera de pantalla, se pausa en pestañas ocultas y respeta prefers-reduced-motion).
7. Termina con la lista de archivos modificados y cómo probar cada estado a mano.

Mi app: [stack, p. ej. React + Vite / Next.js / Flutter / SwiftUI] — [qué hace en una frase].
```
