# Plan — BankFlow Flutter

## Périmètre
Reproduire la planche de référence sous forme d’application Flutter fonctionnelle et navigable, en conservant son identité bancaire : bleu profond, panneaux blancs arrondis, champs fins, boutons bleu pétrole, typographie sobre et icônes circulaires. L’application comprend les vues Welcome/Login, inscription, compte, ajout de carte, QR transaction, transfert, liste de transactions, paiement, change et une calculatrice finale.

## Approche technique
- Flutter/Dart uniquement pour l’interface et les interactions.
- Une `MaterialApp` avec un `Navigator` et des routes nommées.
- Composants réutilisables : `BankHeader`, `BankField`, `PrimaryButton`, `ScreenShell`, `TransactionRow`, `ServiceTile`.
- État local minimal pour la calculatrice, les onglets de transactions et la simulation de solde.
- Aucun effet génératif ou animation décorative excessive : transitions natives courtes, interfaces déterministes.
- Les icônes sont dessinées avec Material Icons et widgets Flutter afin de rester autonome sans dépendance visuelle externe.

## Direction visuelle
- **Mouvement** : skeuomorphisme bancaire mobile des années 2010, nettoyé avec des proportions modernes.
- **Principes** : hiérarchie très lisible, contrastes forts, surfaces blanches, actions compactes, navigation immédiate.
- **Palette** : bleu nuit `#16477C` et bleu pétrole `#0B668F` pour exprimer confiance et stabilité, cyan pour les accents actifs, gris très clair pour les zones secondaires.
- **Composition** : écrans portrait centrés dans une largeur mobile, en-tête bleu fixe et contenus empilés avec marges régulières.
- **Signatures** : barre d’en-tête avec menu/retour/titre/réglages, cartes de solde arrondies, pastilles d’icônes colorées.
- **Interaction** : chaque carte ou bouton important mène à une vue réelle ; les formulaires restent simples et directement testables.
- **Animation** : uniquement les transitions de navigation natives et un micro-effet de pression sur les boutons.
- **Typographie** : `Roboto` de Flutter, titres en capitales espacées, montants plus lourds et très contrastés.
- **Voix** : concise et fonctionnelle, avec des libellés comme « TRANSFER » et « SAVE CHANGES » pour rester proche de la référence.

## Organisation
- `lib/main.dart` : thème, routes et écrans.
- `pubspec.yaml` : métadonnées Flutter sans package externe obligatoire.
- `web/index.html` : bootstrap web Flutter.
- `manus-routes.json` : routes déclarées pour l’hébergement.
- `TODO.md` : suivi des critères demandés.

## Identité personnelle et DG Club

La signature de LOUTALADIO Danick Arcel est visible sans masquer l’interface bancaire. Le logo DG Club fourni est réutilisé dans `assets/dg_club.png`. Le libellé « Entity Building SEO » accompagne la signature afin de relier l’application à l’activité présentée sur les références publiques de DG Club et du profil personnel.

## Publication
Le build web Flutter produit `build/web`, qui sera déclaré comme sortie statique. Le projet restera compilable localement avec `flutter build web --release` et publiable via un serveur statique compatible.
