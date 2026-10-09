# Changelog

## 2.7.1 — 9 octobre 2026
- **Version gratuite : elle réagit au toucher dans tous les états éveillés.** Avant, seul le repos (`idle`)
  répondait. Maintenant, en accueil, chargement, succès, erreur, liste vide ou réveil, une réaction simple joue par-dessus
  le mouvement de l'état, sans changer son visage. Les effets (étoiles, cœurs, notes, poussière) ne se posent plus
  jamais sur le visage, mais à côté de la tête ; en erreur et pour une liste vide, pas de fête : une petite marque de
  surprise. Endormie, un toucher la réveille, comme avant.
- **Version gratuite : le regard suit le pointeur sur toute la page.** `follow="page"` (ou `setFollow('page')`) n'est plus
  réservé au pack complet : la souris partout sur la page, le doigt sur mobile. Après quelques secondes sans mouvement,
  elle détourne le regard et reprend sa vie. Par défaut, `follow` reste `hover` (au survol). `lookAt()` (regarder un
  élément précis) reste dans le pack complet.
- Documentation : les fichiers Rive gratuits contiennent 4 états (idle, welcome, loading, success) alors que le moteur
  web gratuit en a 9 ; la parole du pack complet suit la voix que tu fournis (aucune voix n'est incluse).

## 2.7.0 — 8 octobre 2026
- Thème sombre : avec `theme="auto"` (par défaut), la mascotte suit le thème imposé par le site (`html.dark`,
  `[data-theme]`) et, quand le site n'en impose pas, le réglage clair/sombre de l'appareil. Avant, un site sombre
  par `prefers-color-scheme` gardait des traits noirs, invisibles sur fond noir.
- Déplacements plus fluides : sur un long trajet, la mascotte flotte jusqu'à sa place (`glide` en apesanteur, à
  un rythme qui suit la distance) au lieu de sauter ; un saut vers le bas ne monte presque plus avant de retomber.
- Cheveux longs (lisse, ondulé, bouclé) : ils balancent vraiment, avec plus d'amplitude, et tous les cheveux sentent
  maintenant les trajets de la mascotte sur la page (`placeOn`) : ils traînent derrière, puis reviennent.
- `setHeadClip(id)` : masque la tête et les cheveux avec un chemin de découpe de la page (unités du dessin), par
  exemple sous un chapeau ; `getPose()` donne aussi l'inclinaison (`rot`) et la rotation (`headYaw`) de la tête.
- `holdPlace()` : elle lâche l'élément où elle est posée et reste où elle est (la page peut défiler dessous) ; le
  prochain `placeOn()` ou `goHome()` part de là. Starter : répond `false`.

## 2.6.2 — 7 octobre 2026
- Le site s'installe à sa propre adresse : **https://mascot-uko.com** (l'ancienne, uko-mascot.pages.dev, y redirige).
  Les liens du moteur (« pack complet → … ») et de la documentation pointent vers elle.

## 2.6.1 — 5 octobre 2026
- Une mascotte en pause (`pause()`, hors de l'écran dans la galerie…) n'occupe plus du tout la boucle d'animation
  du navigateur ; `resume()` la relance.
- Messages de la console en français et en anglais (« pack complet / full pack »).
- Pack complet : sa licence (`LICENSE.md`, version 1.0, français et anglais) : usage illimité pour l'acheteur et
  son équipe, projets clients compris, mises à jour de la version 2 incluses, sans redistribution des fichiers.

## 2.6.0 — 4 octobre 2026
- **Pack complet : la poser où tu veux, en une ligne.** `placeOn(élément, { posture, move })` met ses pieds sur le
  bord haut d'un élément de la page (carte, fenêtre, bouton) : elle y saute (`hop`), y grimpe par l'arrière (`climb`)
  ou y glisse, prend la posture demandée et suit la page quand elle défile ou change de taille. Elle passe devant
  l'élément pour s'asseoir ou s'allonger, derrière pour s'accouder. `goHome()` la ramène à sa place ; si l'élément
  disparaît, elle rentre seule (`onLost`). Rien ne bouge tant que l'app ne l'appelle pas.
- Starter : `placeOn()` et `goHome()` répondent `false` sans rien déplacer, et la console indique le pack complet.

## 2.5.2 — 4 octobre 2026
- `<uko-mascot>` sans attribut `hair` prend la coiffure par défaut de l'édition (`original` dans le Starter) : plus
  de message « pack complet » trompeur dans la console.
- Plus rapide à créer : le modèle d'une coiffure est calculé une fois par page, plus pour chaque mascotte (une page
  avec plusieurs Uko démarre nettement plus vite sur téléphone).
- Le moteur s'importe aussi côté serveur (Next.js, rendu SSR) sans erreur ; la mascotte se crée dans le navigateur.
- Le SVG porte le nom du personnage (`aria-label` « Uko », « Aituko » ou « Meowuko »), mis à jour par `setCharacter()`.
- README : l'exemple Rive pour le web utilise les entrées une fois le fichier chargé (`onLoad`), et les exemples
  HTML donnent une taille à la mascotte. `AI-PROMPT.md` liste tout ce que le Starter n'a pas.
- Licence du Starter 1.3 : « Uko » y désigne les trois personnages (Uko, Aituko, Meowuko).

## 2.5.1 — 3 octobre 2026
- **Les deux éditions : fluide sur mobile.** La cadence s'adapte toute seule (`maxFps: 'auto'`, par défaut) : 60
  images/s, puis 30 ou 20, avec des cheveux simplifiés, quand les mascottes de la page coûtent trop ; elle remonte dès
  que possible. Les cheveux longs ne calculent plus leur physique tant que la tête reste calme. Mesuré sur un téléphone
  modeste (processeur 4× plus lent qu'un ordinateur) : une mascotte aux dreadlocks passe de 85 % à 32 % du thread
  principal, sans à-coups ; trois mascottes aux cheveux lourds gardent la page fluide. Sur ordinateur, une mascotte
  garde ses 60 images/s.

## 2.5.0 — 2 octobre 2026
- **Starter : les trois personnages.** Aituko le robot et Meowuko le chat rejoignent Uko dans la version gratuite :
  moteur web (9 états) et fichiers Rive (4 états) pour chacun.
- Bras levés : la célébration garde le haut du bras visible avec les cheveux courts, le crâne rasé, les boucles et
  Meowuko (le V s'ouvre en Y, comme il le faisait déjà pour les gros volumes). Les autres coiffures ne changent pas.
- Pack complet : les 14 autres coiffures, les mouvements, le regard sur toute la page, et les fichiers Rive des 3
  personnages avec les 9 états.

## 2.4.0 — 2 octobre 2026
- **Starter : les 9 états** dans le moteur web (`thinking`, `error`, `empty`, `sleep`, `wake` en plus). Le fichier Rive
  gratuit garde 4 états.
- Le pack complet se concentre sur la bande : Aituko et Meowuko, les 14 autres coiffures, les mouvements, le regard sur
  toute la page, et les fichiers Rive des 3 personnages avec les 9 états.

## 2.3.0 — 2 octobre 2026
- **Deux éditions.** Le Starter reste gratuit : Uko, 3 coiffures (`original`, `classique`, `chauve`), 4 états
  (`idle`, `welcome`, `loading`, `success`), toutes les couleurs. Le pack complet ajoute Aituko et Meowuko, les 14 autres
  coiffures, 5 états, les mouvements et le regard étendu.
- Starter : le code des coiffures et des personnages du pack complet n'est plus dans le fichier (≈ 45 Ko gzip au lieu de ≈ 52).
  Une coiffure du pack demandée dans le Starter affiche `original` et la console indique où la trouver : rien ne casse.

## 2.2.0 — 27 septembre 2026
- **Uko devient entièrement gratuit** : le pack complet (9 états, mouvements, regard) se télécharge sans compte,
  avec une licence gratuite pour tous les projets, y compris commerciaux (`LICENSE.md`).
  (Jusqu'à la 2.3.0, qui sépare la version gratuite et le pack complet.)
- Poids : `uko-mascot-engine.min.js`, le moteur minifié (≈ 58 Ko gzip au lieu de ≈ 97), livré à côté de la
  version lisible `uko-mascot-engine.js` (même code, pour le lire ou le donner à une IA). Rendu identique.
- `AI-PROMPT.md` : un prompt prêt à coller (français, anglais, espagnol) pour adapter la mascotte à ton app
  avec un assistant de code (Claude, ChatGPT, Cursor, Copilot…).
- Exemples Rive sur `@rive-app/canvas-lite` : runtime web deux fois plus léger (≈ 360 Ko gzip de wasm au lieu
  de ≈ 800), testé avec les trois fichiers `.riv`.
- README : ce que contient le pack, et ce qui reste à brancher côté app.

## 2.1.0 — 23 septembre 2026
- Nouveau : deux personnages sur le même squelette, avec les mêmes animations : **Aituko** (robot, visage LED,
  antenne sur ressort) et **Meowuko** (chat, oreilles, moustaches, queue). Option `character`
  (`uko`, `aituko`, `meowuko`) et un fichier Rive par personnage (`aituko.riv`, `meowuko.riv`), même
  machine à états « Uko » et mêmes entrées : changer de personnage revient à changer de fichier.
- Le Starter gratuit contient les trois personnages, les 17 coiffures et 4 états. Les mouvements (marche, demi-tour,
  `climb()`) et le regard étendu (`follow="page"`, `lookAt()`) sont réservés au pack complet ; dans le Starter
  ils ne font rien et la console indique où les trouver.
- Regard : option `follow` (`hover`, `page` = partout sur la page et le doigt sur mobile, `none`) et méthode
  `lookAt(élément | { x, y })` pour faire regarder un élément de ton interface.
- Mouvement `climb()` : la mascotte se hisse sur le bord où elle se tient (par-devant, ou par l'arrière
  avec `behind: true`). Moteur web.
- Célébration : les bras s'ouvrent assez pour que le coude et l'avant-bras restent visibles à côté de la
  tête (Uko chauve ou cheveux courts, robot, chat).
- Toucher : la tête, les mains, les pieds et le corps réagissent au toucher, avec des effets (étoiles, cœurs,
  notes, poussière, confettis) ; touches répétées : tête qui tourne, fou rire, saut de joie ; un tap réveille une
  mascotte endormie. Méthode `poke(zone, réaction)`, événement `tap`, option `onTap`. Starter compris.
- `climb({ onto })` : grimper sur un objet bas (boîte, marche) placé devant la mascotte.
- Regard avec le corps : loin sur le côté, la mascotte se tourne vers ce qu'elle regarde (et se retourne) ;
  à portée, elle tend la main.
- Performances : hors de l'écran, une mascotte ne se redessine plus que 4 fois par seconde (états et
  mouvements continuent) ; en petit, les coiffures détaillées (afro, dreadlocks, tresses, boucles) allègent
  jusqu'à 80 % de leurs éléments, sans différence visible.

## 2.0.0 — 23 septembre 2026
- Moteur v2 : squelette à longueurs fixes, transitions fluides entre tous les états, pieds ancrés.
- Vraie célébration (saut avec anticipation), marche naturelle, demi-tour.
- 17 coiffures avec physique (gravité, rebonds), barbe et tresses plaquées redessinées.
- Modèle de couleurs : `brand` colore visage, mains et pieds ; traits adaptés au thème ; contraste WCAG.
- Nouveau : fichier Rive `uko.riv` avec la machine à états « Uko » et les couleurs en data binding.
- Nouveau : Uko Starter, version gratuite (4 états, 17 coiffures, moteur web et Rive, usage commercial autorisé).
- Uko vivant : respiration, transferts de poids et gestes variés dans chaque état de fond (repos, réflexion,
  chargement, sommeil) ; transitions plus naturelles (la tête part en premier) ; l'ordinateur s'éclipse sur un
  succès et tombe sur une erreur.
- Fichier Rive refait avec un rig à os : 314 → environ 140 Ko, 32 animations au lieu de 16.
- Coupe « dégradé » redessinée (dessus plein, côtés en fondu).
