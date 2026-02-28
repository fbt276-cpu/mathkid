# SPECIFICATIONS FONCTIONNELLES — MathKid

**Nom du programme** : MathKid — Application de calcul mental  
**Auteur** : ODET François  
**Société** : NEXXAT  
**Copyright** : © NEXXAT - ODET François 2025  
**Version** : 1.2.1 | Date : 2025-02-28  
**Sourcé par** : Claude IA

---

## Historique des versions

| Version | Date       | Description |
|---------|------------|-------------|
| v1.2.1  | 2025-02-28 | Correction navbar Android 16, scroll mobile qrcode.html |
| v1.2.0  | 2025-02-28 | GitHub Pages, APK Bubblewrap, QR Code, assetlinks.json |
| v1.1.0  | 2025-02-28 | Conformité guide NEXXAT complète |
| v1.0.0  | 2025-02-28 - Version initiale |

---

## 1. Objectif

MathKid est une Progressive Web App (PWA) destinée aux enfants de tous niveaux scolaires (CP → CM2) permettant de s'entraîner au calcul mental de façon ludique, gamifiée et adaptative.

L'application est :
- **Accessible** via navigateur Chrome Android : `https://fbt276-cpu.github.io/mathkid/`
- **Installable** comme APK Android natif via Bubblewrap (Trusted Web Activity)
- **Distribuable** via QR Code, lien direct ou GitHub Releases
- **Hors-ligne** grâce au Service Worker (cache complet)

---

## 2. Fonctionnalités principales

### 2.1 Système de jeu

| Fonctionnalité | Description |
|----------------|-------------|
| Niveau 1 — QCM | 3 boutons de réponse avec distracteurs intelligents |
| Niveau 2 — Saisie libre | Pavé numérique personnalisé, sans clavier système |
| Chronomètre | Anneau SVG animé, couleur adaptative vert→orange→rouge |
| Score | Pondéré par le temps restant (max 10 pts par question) |
| Série (streak) | Compteur de bonnes réponses consécutives |
| Retour visuel | Emoji animé + confettis canvas si bonne réponse |
| Bannière démarrage | Splash screen NEXXAT (3 secondes) avec copyright |

### 2.2 Opérations mathématiques

| Opération | Contraintes |
|-----------|-------------|
| Addition | a + b, valeurs dans [0, maxVal] |
| Soustraction | a − b, b ≤ a (jamais de résultat négatif) |
| Multiplication | a × b, b limité à max(maxVal, 10) |
| Division | a ÷ b, résultat entier garanti, b ≥ 1 |

### 2.3 Paramètres configurables

| Paramètre | Plage | Pas | Défaut |
|-----------|-------|-----|--------|
| Opérations actives | 1 à 4 | — | Addition |
| Maximum de chaque nombre | 5 à 100 | 5 | 10 |
| Questions par session | 5 à 30 | 5 | 10 |
| Secondes par question | 10 à 60 | 5 | 30 |

### 2.4 Statistiques

- Taux de réussite global
- Nombre de sessions jouées
- Temps moyen par question
- Meilleure série (streak)
- Meilleur score en pourcentage
- Total bonnes réponses / questions
- Taux de réussite par opération (mini-barre colorée)
- Graphique progression 10 dernières sessions (Chart.js line)
- Répartition par tranche de score (Chart.js bar)
- Historique : 50 sessions max (localStorage)

---

## 3. Distribution et installation

### 3.1 PWA (Progressive Web App)

- URL : `https://fbt276-cpu.github.io/mathkid/`
- Hébergement : GitHub Pages (HTTPS gratuit)
- Installation : bannière native Chrome Android
- Mise à jour : automatique via Service Worker

### 3.2 APK Android (Trusted Web Activity)

- Package : `com.nexxat.mathkid`
- Généré avec : Bubblewrap CLI (Google)
- Signé avec : `mathkid-release.keystore`
- Distribution : GitHub Releases + QR Code
- Compatible : Android 5+ (API 21+)

### 3.3 Page QR Code

- URL : `https://fbt276-cpu.github.io/mathkid/qrcode.html`
- QR Code pointe vers : `https://fbt276-cpu.github.io/mathkid/`
- Contient : instructions d'installation, bouton téléchargement APK, lien PWA

### 3.4 GitHub Releases

- URL : `https://github.com/fbt276-cpu/mathkid/releases`
- APK disponible en téléchargement direct
- Lien permanent : `.../releases/latest`

---

## 4. Règles métier

- Au moins une opération doit rester active
- La soustraction ne produit jamais de résultat négatif
- La division est toujours entière (a = réponse × diviseur)
- Les distracteurs (niveau 1) sont toujours positifs et distincts
- La rotation entre opérations est équitable (cyclique)
- En cas de timeout, la bonne réponse est révélée
- Score = max(1, round(10 × temps_restant / timer_total))
- Le keystore ne doit jamais être publié sur GitHub

---

## 5. Cas d'usage

| Cas | Description |
|-----|-------------|
| UC-01 | L'enfant scanne le QR Code et installe l'application |
| UC-02 | L'enfant choisit niveau + opérations et lance une session |
| UC-03 | Répondre niveau 1 : toucher un des 3 boutons |
| UC-04 | Répondre niveau 2 : saisir via pavé numérique, valider OK |
| UC-05 | Fin de session : trophée + statistiques détaillées |
| UC-06 | Consulter les statistiques et graphiques de progression |
| UC-07 | Modifier les réglages (opérations, valeurs, timer) |
| UC-08 | Utiliser hors-ligne après première installation |
| UC-09 | Distribuer via QR Code ou lien GitHub |

---

## 6. Évolutions prévues

- [ ] Intégration dans NEXXAT Store
- [ ] Profils multiples (plusieurs enfants)
- [ ] Tables de multiplication dédiées
- [ ] Mode compétition (timer global)
- [ ] Export statistiques PDF
- [ ] Synchronisation cloud
- [ ] Mode enseignant
- [ ] Sons et musique

---

*© NEXXAT - ODET François 2025 | Sourcé par Claude IA | v1.2.1*
