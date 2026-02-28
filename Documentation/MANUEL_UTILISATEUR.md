# MANUEL UTILISATEUR — MathKid

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
| v1.2.1  | 2025-02-28 | Correction navbar Android 16, scroll mobile |
| v1.2.0  | 2025-02-28 | Installation APK, QR Code, GitHub Pages |
| v1.1.0  | 2025-02-28 | Conformité guide NEXXAT |
| v1.0.0  | 2025-02-28 | Version initiale |

---

## 1. Installation

### Option A — QR Code (recommandé)

1. Ouvre la caméra de ton téléphone Android
2. Scanne le QR Code sur la page : **https://fbt276-cpu.github.io/mathkid/qrcode.html**
3. Chrome s'ouvre sur l'application
4. Une bannière apparaît en bas → **Installer**
5. MathKid s'ajoute à ton écran d'accueil ✅

### Option B — Lien direct

1. Ouvre Chrome Android
2. Va sur : **https://fbt276-cpu.github.io/mathkid/**
3. Chrome propose d'installer → **Installer**

### Option C — APK

1. Télécharge le fichier `MathKid-v1.2.0.apk`
2. Ouvre le fichier depuis le gestionnaire de fichiers
3. Si demandé : **Paramètres → Autoriser les sources inconnues**
4. Appuie sur **Installer**

---

## 2. Démarrage

Au lancement, une bannière NEXXAT s'affiche 3 secondes :

```
╔══════════════════════════════════════════════════╗
║         NEXXAT — MathKid                        ║
║   © NEXXAT - ODET François 2025 | v1.2.1        ║
║   Sourcé par Claude IA                          ║
╚══════════════════════════════════════════════════╝
```

Puis l'écran d'accueil apparaît.

---

## 3. Écran d'accueil

### Saisir son prénom
Tape ton prénom dans le champ en haut. Il sera mémorisé pour les prochaines fois.

### Choisir le niveau
- **Niveau 1** : 3 boutons de réponse au choix (plus facile)
- **Niveau 2** : Pavé numérique pour saisir la réponse (plus difficile)

### Choisir les opérations
Coche une ou plusieurs opérations :
- ➕ Addition
- ➖ Soustraction
- ✖️ Multiplication
- ➗ Division

### Lancer la partie
Appuie sur le bouton **GO !** 🚀

---

## 4. Pendant la partie

### Le chronomètre
Un anneau coloré tourne autour de l'opération :
- 🟢 **Vert** → beaucoup de temps restant
- 🟠 **Orange** → dépêche-toi !
- 🔴 **Rouge** → plus que quelques secondes !

### Niveau 1 — QCM
Trois boutons apparaissent avec la réponse et deux distracteurs. Appuie sur le bon !

### Niveau 2 — Pavé numérique
Saisit ta réponse avec le pavé numérique, puis appuie sur **OK**.  
Le bouton ⌫ efface le dernier chiffre.

### Retour visuel
- ✅ **Bonne réponse** → emoji animé + confettis 🎉
- ❌ **Mauvaise réponse** ou timeout → la bonne réponse s'affiche en vert

### Le score
Chaque bonne réponse rapporte des points selon le temps restant.  
Plus tu réponds vite, plus tu marques de points !

---

## 5. Écran de résultats

À la fin de la session, tu vois :

- 🏆 **Trophée** selon ton score :
  - 🥇 Or : 90% et plus
  - 🥈 Argent : 70% à 89%
  - 🥉 Bronze : 50% à 69%
  - 📚 Encouragement : moins de 50%
- Ton score en points et en pourcentage
- Le nombre de bonnes réponses
- Ton temps moyen par question
- Ta meilleure série de bonnes réponses

**Boutons disponibles :**
- **Rejouer** → nouvelle partie avec les mêmes réglages
- **Accueil** → retour au menu principal

---

## 6. Statistiques

Accède aux statistiques via l'onglet **📊** en bas.

### Statistiques globales
- Taux de réussite global
- Nombre de sessions jouées
- Temps moyen par question
- Meilleure série (streak)
- Meilleur score

### Par opération
Une barre colorée indique ton taux de réussite pour chaque opération.

### Graphiques
- **Progression** : courbe de tes scores sur les 10 dernières sessions
- **Répartition** : histogramme de tes tranches de score

### Réinitialiser
Le bouton 🗑️ efface tout l'historique (une confirmation est demandée).

---

## 7. Réglages

Accède aux réglages via l'onglet **⚙️** en bas.

| Réglage | Plage | Description |
|---------|-------|-------------|
| Opérations | 1 à 4 | Choisir quelles opérations activer |
| Maximum | 5 à 100 | Valeur maximale des nombres |
| Questions | 5 à 30 | Nombre de questions par session |
| Timer | 10 à 60 s | Temps accordé par question |

Les réglages sont sauvegardés automatiquement.

---

## 8. Utilisation hors-ligne

MathKid fonctionne **sans connexion internet** après la première installation !  
Le Service Worker met en cache tous les fichiers nécessaires.

---

## 9. Navigation

La barre de navigation en bas contient 3 onglets :
- 🏠 **Accueil** → écran principal
- 📊 **Stats** → statistiques et graphiques
- ⚙️ **Réglages** → paramètres

---

## 10. FAQ

**L'application ne s'installe pas ?**  
Vérifie que tu utilises Chrome (pas Firefox ou un autre navigateur) et que tu es sur Android 5 ou supérieur.

**Les réponses sont effacées ?**  
Les données sont stockées localement sur ton téléphone. Si tu désinstalles l'application, les données sont perdues.

**Le QR Code ne fonctionne pas ?**  
Ouvre directement le lien : `https://fbt276-cpu.github.io/mathkid/`

**La navbar n'apparaît pas en bas ?**  
Assure-toi d'avoir la version v1.2.1 (visible dans les réglages en bas de page).

**Comment mettre à jour ?**  
L'application se met à jour automatiquement via le Service Worker. Ferme et rouvre l'application pour appliquer la mise à jour.

---

*© NEXXAT - ODET François 2025 | Sourcé par Claude IA | v1.2.1*  
*https://fbt276-cpu.github.io/mathkid/*
