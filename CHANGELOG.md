# Changelog

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
