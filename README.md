# MathKid — Application de calcul mental NEXXAT

**Auteur** : ODET François  
**Société** : NEXXAT  
**Copyright** : © NEXXAT - ODET François 2025  
**Sourcé par** : Claude IA  
**URL PWA** : https://fbt276-cpu.github.io/mathkid/  
**QR Code** : https://fbt276-cpu.github.io/mathkid/qrcode.html  
**GitHub** : https://github.com/fbt276-cpu/mathkid  

---

## 📱 Installer l'application Android

### Option 1 — QR Code (le plus simple)
Scanne ce lien avec ton téléphone :  
👉 **https://fbt276-cpu.github.io/mathkid/qrcode.html**

### Option 2 — PWA via Chrome Android
1. Ouvrir **https://fbt276-cpu.github.io/mathkid/** dans Chrome
2. Chrome affiche une bannière → **Installer**
3. MathKid s'ajoute à l'écran d'accueil

### Option 3 — APK direct
1. Télécharger **[MathKid-v1.2.0.apk](../../releases/latest)**
2. Ouvrir le fichier → autoriser les sources inconnues si demandé
3. Appuyer sur **Installer**

---

## Historique des versions

| Version | Date       | Description |
|---------|------------|-------------|
| v1.2.1  | 2025-02-28 | Correction navbar Android 16 (position:fixed, -webkit-fill-available), correction scroll qrcode.html mobile, QR code pointe vers PWA |
| v1.2.0  | 2025-02-28 | Intégration GitHub Pages fbt276-cpu, URLs absolues, twa-manifest.json, deploy_github.sh automatisé, assetlinks.json SHA-256, release GitHub, page QR Code |
| v1.1.0  | 2025-02-28 | Conformité guide NEXXAT : en-têtes complets, bannière splash, copyright tous affichages, deploy.sh, documentation complète |
| v1.0.0  | 2025-02-28 | Version initiale PWA complète : 2 niveaux, 4 opérations, statistiques, graphiques, mode hors-ligne |

---

## Structure du projet

```
mathkid/
├── index.html                              ← Application PWA complète (v1.2.1)
├── sw.js                                   ← Service Worker (cache offline)
├── manifest.json                           ← Métadonnées PWA
├── qrcode.html                             ← Page QR Code de distribution
├── twa-manifest.json                       ← Configuration Bubblewrap APK
├── deploy_github.sh                        ← Script déploiement automatisé
├── README.md                               ← Ce fichier
├── .gitignore                              ← Exclusions Git (APK, keystore)
├── .well-known/
│   └── assetlinks.json                     ← Liaison APK ↔ GitHub Pages
├── icons/
│   ├── icon-192.png                        ← Icône PWA 192×192
│   └── icon-512.png                        ← Icône PWA 512×512
└── Documentation/
    ├── SPECIFICATIONS_FONCTIONNELLES.md
    ├── SPECIFICATIONS_TECHNIQUES.md
    └── MANUEL_UTILISATEUR.md
```

---

## Fichiers sensibles (non versionnés)

| Fichier | Emplacement | Usage |
|---------|-------------|-------|
| `mathkid-release.keystore` | `~/Bureau/DOSSIER/MATH_KID/` | Signature APK |
| `mathkid-release.keystore` | `~/MathKid-APK/` | Original Bubblewrap |
| `MathKid-v1.2.0.apk` | `~/Bureau/DOSSIER/MATH_KID/` | APK de distribution |

⚠️ **Ne jamais publier le keystore sur GitHub !**

---

## Générer un nouvel APK (mise à jour)

```bash
# Incrémenter versionCode dans twa-manifest.json, puis :
cd ~/MathKid-APK
bubblewrap build

# Publier la nouvelle release
cd ~/Bureau/DOSSIER/MATH_KID
cp ~/MathKid-APK/app-release-signed.apk ./MathKid-vX.Y.Z.apk
gh release create vX.Y.Z MathKid-vX.Y.Z.apk --title "MathKid vX.Y.Z NEXXAT"
```

---

## Déploiement rapide (mise à jour du code)

```bash
cd ~/Bureau/DOSSIER/MATH_KID
git add .
git commit -m "MathKid vX.Y.Z NEXXAT - description"
git push
# GitHub Pages se met à jour automatiquement en ~1 minute
```

---

*© NEXXAT - ODET François 2025 | Sourcé par Claude IA | v1.2.1*  
*https://fbt276-cpu.github.io/mathkid/*
