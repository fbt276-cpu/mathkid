# MathKid — Application de calcul mental NEXXAT

**Auteur** : ODET François  
**Société** : NEXXAT  
**Copyright** : © NEXXAT - ODET François 2025  
**Sourcé par** : Claude IA  
**URL** : https://fbt276-cpu.github.io/mathkid/

---

## 📱 Installer l'application Android

### Option 1 — APK direct (recommandé)
Télécharge le dernier APK :  
👉 **[MathKid-v1.2.0.apk](../../releases/latest)**

Sur Android :
1. Télécharger le fichier `.apk`
2. Ouvrir le fichier → si demandé : autoriser les sources inconnues
3. Appuyer sur **Installer**
4. C'est tout ! 🎉

### Option 2 — PWA via Chrome Android
1. Ouvrir `https://fbt276-cpu.github.io/mathkid/` dans Chrome
2. Chrome affiche une bannière → **Installer**
3. MathKid s'ajoute à l'écran d'accueil

---

## Historique des versions

| Version | Date       | Description                                                          |
|---------|------------|----------------------------------------------------------------------|
| v1.2.0  | 2025-02-28 | GitHub Pages fbt276-cpu, APK Bubblewrap TWA, deploy_github.sh, assetlinks.json |
| v1.1.0  | 2025-02-28 | Conformité guide NEXXAT (en-têtes, splash, copyright, documentation) |
| v1.0.0  | 2025-02-28 - Version initiale PWA complète                                        |

---

## Structure du projet

```
mathkid/
├── index.html                              ← Application PWA complète
├── sw.js                                   ← Service Worker (offline)
├── manifest.json                           ← Métadonnées PWA
├── twa-manifest.json                       ← Config Bubblewrap APK
├── deploy_github.sh                        ← Script déploiement auto
├── README.md
├── .well-known/
│   └── assetlinks.json                     ← Liaison APK/site web
├── icons/
│   ├── icon-192.png
│   └── icon-512.png
└── Documentation/
    ├── SPECIFICATIONS_FONCTIONNELLES.md
    ├── SPECIFICATIONS_TECHNIQUES.md
    └── MANUEL_UTILISATEUR.md
```

---

*© NEXXAT - ODET François 2025 | Sourcé par Claude IA | v1.2.0*
