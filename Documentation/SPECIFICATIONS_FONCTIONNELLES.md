# SPECIFICATIONS FONCTIONNELLES — MathKid

**Nom du programme** : MathKid — Application de calcul mental  
**Auteur** : ODET François  
**Société** : NEXXAT  
**Copyright** : © NEXXAT - ODET François 2025  
**Version** : 1.1.0 | Date : 2025-02-28  
**Sourcé par** : Claude IA

---

## 1. Objectif

MathKid est une Progressive Web App (PWA) destinée aux enfants de tous niveaux scolaires (CP → CM2) permettant de s'entraîner au calcul mental de façon ludique, gamifiée et adaptative. L'application fonctionne sur téléphone Android et peut être installée comme une application native.

---

## 2. Fonctionnalités principales

### 2.1 Système de jeu

| Fonctionnalité          | Description                                                       |
|-------------------------|-------------------------------------------------------------------|
| Niveau 1 — QCM          | 3 boutons de réponse générés automatiquement avec distracteurs intelligents |
| Niveau 2 — Saisie libre | Pavé numérique personnalisé, saisie sans clavier système          |
| Sélection du niveau     | Choix avant chaque session depuis l'écran d'accueil               |
| Chronomètre             | Anneau SVG animé par question, couleur adaptative (vert→orange→rouge) |
| Score                   | Pondéré par le temps restant à l'expiration du chronomètre        |
| Série (streak)          | Compteur de bonnes réponses consécutives                          |
| Retour visuel           | Emoji animé (correct / incorrect / timeout) + confettis           |

### 2.2 Opérations mathématiques

| Opération      | Contraintes                                        |
|----------------|----------------------------------------------------|
| Addition       | a + b, valeurs dans [0, maxVal]                    |
| Soustraction   | a − b, b ≤ a (jamais de résultat négatif)          |
| Multiplication | a × b, b limité à max(maxVal, 10)                  |
| Division       | a ÷ b, résultat entier garanti, b ≥ 1              |

### 2.3 Paramètres configurables (onglet Réglages)

| Paramètre              | Plage        | Pas | Défaut |
|------------------------|--------------|-----|--------|
| Opérations actives     | 1 à 4        | —   | Addition |
| Maximum de chaque nombre | 5 à 100    | 5   | 10     |
| Questions par session  | 5 à 30       | 5   | 10     |
| Secondes par question  | 10 à 60      | 5   | 30     |

### 2.4 Statistiques

- Taux de réussite global
- Nombre de sessions jouées
- Temps moyen par question
- Meilleure série (streak)
- Meilleur score en pourcentage
- Total bonnes réponses / questions
- Taux de réussite par opération (avec mini-barre de progression)
- Graphique de progression des 10 dernières sessions (Chart.js — type line)
- Répartition par tranche de score (Chart.js — type bar)
- Historique persistant : 50 sessions maximum (localStorage)

---

## 3. Règles métier

- Au moins une opération doit rester active (impossible de tout décocher)
- La soustraction ne produit jamais de résultat négatif (b toujours ≤ a)
- La division est toujours entière (a = réponse × diviseur)
- Les distracteurs (niveau 1) sont toujours positifs et distincts de la réponse
- La rotation entre opérations est équitable (répartition cyclique)
- En cas de timeout, la bonne réponse est révélée visuellement
- Le score est calculé comme : max(1, round(10 × temps_restant / timer_total))

---

## 4. Cas d'usage

| Cas                              | Description                                               |
|----------------------------------|-----------------------------------------------------------|
| UC-01 Lancer une session         | L'enfant choisit niveau + opérations et appuie sur GO !   |
| UC-02 Répondre (niveau 1)        | Toucher l'un des 3 boutons avant la fin du chronomètre    |
| UC-03 Répondre (niveau 2)        | Saisir la réponse via le pavé, valider avec OK            |
| UC-04 Fin de session             | Affichage des résultats avec trophée et statistiques      |
| UC-05 Rejouer                    | Relancer immédiatement une nouvelle session               |
| UC-06 Consulter les statistiques | Visualiser la progression, les graphiques, par opération  |
| UC-07 Modifier les réglages      | Changer opérations, valeurs max, nombre de questions      |
| UC-08 Installer la PWA           | Bannière native Chrome → ajout à l'écran d'accueil Android |
| UC-09 Utiliser hors-ligne        | L'application fonctionne sans connexion après installation |

---

## 5. Interface utilisateur

### Navigation par onglets (barre inférieure)
- 🏠 Accueil : choix niveau, opérations rapides, prénom enfant, GO !
- 📊 Stats : statistiques globales, graphiques, par opération
- ⚙️ Réglages : configuration complète + sauvegarde

### Écrans supplémentaires
- Jeu : question, chronomètre, réponses
- Résultats : score, statistiques de session, trophée

### Design
- Thème sombre spatial (fond #0F0A1E)
- Polices : Baloo 2 (titres, chiffres) + Nunito (texte)
- Palette colorée et accessible
- Animations : confettis, emojis flottants, bounce
- Écran de démarrage NEXXAT (bannière ASCII monospace)

---

## 6. Évolutions prévues

- [ ] Profils multiples (plusieurs enfants)
- [ ] Mode compétition (timer global)
- [ ] Tables de multiplication dédiées
- [ ] Export des statistiques en PDF
- [ ] Synchronisation cloud (Google Drive)
- [ ] Mode enseignant avec définition d'objectifs
- [ ] Sons et musique (toggle)

---

*© NEXXAT - ODET François 2025 | Sourcé par Claude IA | v1.1.0*
