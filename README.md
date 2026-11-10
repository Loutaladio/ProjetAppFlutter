# BankFlow — devoir Flutter

BankFlow est une reproduction Flutter autonome de la planche bancaire fournie : connexion, inscription, compte, ajout de carte, QR, transfert, transactions, paiements, change et calculatrice finale. L’identité de LOUTALADIO Danick Arcel et de DG Club est intégrée dans l’écran d’accueil et le tableau de bord, avec le logo fourni dans `assets/dg_club.png`.

## Lancer le projet

Depuis la racine du projet :

```bash
flutter pub get
flutter run -d chrome
```

Le code est regroupé autour de composants réutilisables dans `lib/main.dart`, sans package UI externe ni effet génératif. Le responsive est prévu pour une largeur mobile et le navigateur.

## Build web

```bash
flutter build web --release
```

La sortie à publier est `build/web`. Le fichier `manus-routes.json` contient les routes fonctionnelles de l’application. L’hébergement nécessite un serveur statique qui renvoie `web/index.html` pour les routes Flutter inconnues.

## Parcours de démonstration

Depuis Welcome, `LOG IN` ouvre le compte. Le tableau de bord expose ensuite les vues Account, Add Card, Payment, Exchange, Calculator et Scan QR. `TRANSFER` ouvre le formulaire d’envoi, tandis que `more >>` ouvre la liste complète des transactions.

## Déploiement GitHub Pages

Le workflow `.github/workflows/deploy.yml` construit et publie automatiquement l’application sur GitHub Pages à chaque push sur `main`. Après le premier workflow réussi, l’adresse sera :

```text
https://loutaladio.github.io/ProjetAppFlutter/
```

Dans GitHub, ouvrir `Settings > Pages` et sélectionner `GitHub Actions` comme source si GitHub ne l’active pas automatiquement.
