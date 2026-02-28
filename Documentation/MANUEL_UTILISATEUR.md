# MANUEL UTILISATEUR — MathKid

**Nom du programme** : MathKid — Application de calcul mental  
**Auteur** : ODET François  
**Société** : NEXXAT  
**Copyright** : © NEXXAT - ODET François 2025  
**Version** : 1.1.0 | Date : 2025-02-28  
**Sourcé par** : Claude IA

---

## 🚀 Démarrage de l'application

À l'ouverture, une bannière NEXXAT s'affiche brièvement :

```
╔══════════════════════════════════════╗
║      NEXXAT — MathKid               ║
║  Chemin : /MathKid/index.html       ║
║  © NEXXAT - ODET François 2025      ║
║  Version : 1.1.0 | 2025-02-28       ║
║  Sourcé par Claude IA               ║
╚══════════════════════════════════════╝
```

Après 3 secondes, l'écran d'accueil apparaît.

---

## 🏠 Écran d'accueil

### Ton prénom
Touche le champ et tape ton prénom. Il sera mémorisé pour les prochaines fois.

### Niveau de jeu
Touche pour choisir :
- **Niveau 1 🎯** — Choisis parmi 3 réponses proposées
- **Niveau 2 ✏️** — Écris toi-même la réponse avec le clavier affiché

### Opérations rapides
Touche les symboles pour activer ou désactiver les opérations :
- **＋** Addition
- **－** Soustraction (jamais de résultat négatif)
- **×** Multiplication
- **÷** Division (résultat toujours entier)

Tu peux activer plusieurs opérations en même temps !

### Bouton GO !
Touche **▶ GO !** pour démarrer la session.

---

## 🎮 Pendant le jeu

### La question
La question s'affiche en grand au centre de l'écran.

### Le chronomètre (anneau en haut à droite)
- **Vert** → tu as encore du temps
- **Orange** → dépêche-toi !
- **Rouge** → plus que quelques secondes !

Si le temps est écoulé, la bonne réponse s'affiche et on passe à la question suivante.

### Niveau 1 — 3 boutons de réponse
Touche le bouton avec la bonne réponse.
- ✅ Correct → bouton vert + emoji animé + confettis
- ❌ Incorrect → bouton rouge, bonne réponse affichée en vert

### Niveau 2 — Pavé numérique
- Tape les chiffres de ta réponse
- **⌫** efface le dernier chiffre
- **OK** valide ta réponse

### Le score ⭐
Ton score augmente pour chaque bonne réponse. Plus tu répondas vite, plus tu gagnes de points !

### La barre de progression
En haut de l'écran, la barre montre ta progression dans la session.

---

## 🏆 Écran de résultats

À la fin de la session, tu vois :
- **Ton trophée** selon ton score
- **Tes bonnes réponses** sur le total
- **Ton taux de réussite** en %
- **Ton temps moyen** par question
- **Ta meilleure réponse** (la plus rapide)
- **Ta meilleure série** (bonnes réponses d'affilée)

| Score       | Trophée | Message                    |
|-------------|---------|----------------------------|
| ≥ 90%       | 🏆      | Incroyable ! Champion(ne) !|
| 70% – 89%   | 🥇      | Excellent ! Bravo !        |
| 50% – 69%   | 🥈      | Bien joué !                |
| 30% – 49%   | 🥉      | C'est un bon début !       |
| < 30%       | 😅      | Continue à t'entraîner !   |

### Boutons
- **🏠 Accueil** → retour à l'écran principal
- **🔄 Rejouer** → relancer une nouvelle session avec les mêmes réglages

---

## 📊 Statistiques

Touche l'onglet **📊 Stats** pour voir :

### Chiffres globaux
- Taux de réussite global (toutes sessions)
- Nombre de sessions jouées
- Temps moyen par question
- Meilleure série de bonnes réponses
- Meilleur score obtenu
- Total bonnes réponses / questions

### Graphique de progression
Courbe bleue montrant tes scores sur les 10 dernières sessions.
Les points jaunes indiquent chaque session.

### Par opération
Taux de réussite pour chaque type de calcul (addition, soustraction, multiplication, division) avec une barre de progression colorée.

### Répartition des résultats
Histogramme montrant combien de sessions tu as obtenu dans chaque tranche de score.

### Effacer les statistiques
Bouton rouge en bas de page pour remettre à zéro toutes les données.

---

## ⚙️ Réglages

Touche l'onglet **⚙️ Réglages** pour personnaliser :

### Opérations actives
Active ou désactive chaque opération avec les interrupteurs.
⚠️ Tu ne peux pas désactiver toutes les opérations en même temps.

### Maximum de chaque nombre
Curseur de 5 à 100. Par exemple, avec 10, les nombres seront dans [0, 10].

### Questions par session
Curseur de 5 à 30 questions.

### Secondes par question
Curseur de 10 à 60 secondes.

### Enregistrer
Touche **💾 Enregistrer** pour sauvegarder tes réglages.

---

## 📲 Installer MathKid sur Android

Si Chrome affiche une bannière en bas de l'écran :
1. Touche **Installer**
2. Confirme l'installation
3. MathKid apparaît sur ton écran d'accueil comme une vraie application !

L'application fonctionne ensuite **sans connexion internet**.

---

## ❓ Questions fréquentes

**La soustraction peut-elle donner un résultat négatif ?**
Non, MathKid garantit que le résultat est toujours ≥ 0.

**La division peut-elle avoir un reste ?**
Non, MathKid génère uniquement des divisions avec un résultat entier exact.

**Mes statistiques sont-elles sauvegardées ?**
Oui, automatiquement dans le téléphone. Elles restent après fermeture de l'application.

**Puis-je utiliser MathKid sans internet ?**
Oui, après la première utilisation. Le Service Worker met tout en cache.

---

*© NEXXAT - ODET François 2025 | Sourcé par Claude IA | v1.1.0*
