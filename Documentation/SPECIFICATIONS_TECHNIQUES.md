# SPECIFICATIONS TECHNIQUES — MathKid

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
| v1.2.1  | 2025-02-28 | Fix Android 16 : position:fixed, -webkit-fill-available, safe-area renforcé |
| v1.2.0  | 2025-02-28 | GitHub Pages, Bubblewrap TWA, assetlinks.json, twa-manifest.json |
| v1.1.0  | 2025-02-28 | Conformité guide NEXXAT complète |
| v1.0.0  | 2025-02-28 | Version initiale |

---

## 1. Architecture

```
ARCHITECTURE COMPLÈTE
─────────────────────────────────────────────────────────
  Utilisateur Android
       │
       ├── QR Code → https://fbt276-cpu.github.io/mathkid/
       │                         │
       │              ┌──────────┴──────────┐
       │              │                     │
       │         Chrome PWA            APK (TWA)
       │         (installation          com.nexxat.mathkid
       │          bannière)             (Bubblewrap)
       │              │                     │
       └──────────────┴─────────────────────┘
                      │
              GitHub Pages (HTTPS)
              fbt276-cpu.github.io/mathkid/
                      │
              ┌───────┴────────┐
              │                │
         index.html          sw.js
         (PWA app)      (Service Worker)
              │                │
         localStorage     Cache local
         (données)        (offline)
```

---

## 2. Stack technique

| Composant | Technologie | Version |
|-----------|-------------|---------|
| Langage principal | JavaScript | ES2022 |
| Markup | HTML | HTML5 |
| Styles | CSS | CSS3 |
| Graphiques | Chart.js (CDN) | 4.4.0 |
| Polices | Google Fonts (CDN) | — |
| Cache offline | Service Worker API | — |
| Installation PWA | Web App Manifest | — |
| Persistance | localStorage | — |
| APK | Bubblewrap CLI (Google TWA) | 1.24.1 |
| JDK | OpenJDK | 17.0.11 |
| Android SDK | Google | API 21+ |
| Hébergement | GitHub Pages | — |
| CI/CD | Git + gh CLI | — |

---

## 3. Fichiers du projet

| Fichier | Rôle | Versionné |
|---------|------|-----------|
| `index.html` | Application PWA complète | ✅ |
| `sw.js` | Service Worker — cache-first | ✅ |
| `manifest.json` | Métadonnées PWA | ✅ |
| `qrcode.html` | Page de distribution QR Code | ✅ |
| `twa-manifest.json` | Config Bubblewrap APK | ✅ |
| `deploy_github.sh` | Script déploiement automatisé | ✅ |
| `.well-known/assetlinks.json` | Liaison APK ↔ site (SHA-256) | ✅ |
| `icons/icon-192.png` | Icône PWA 192×192 | ✅ |
| `icons/icon-512.png` | Icône PWA 512×512 | ✅ |
| `mathkid-release.keystore` | Signature APK | ❌ (.gitignore) |
| `MathKid-v1.2.0.apk` | APK de distribution | ❌ (.gitignore) |

---

## 4. Hébergement GitHub Pages

| Paramètre | Valeur |
|-----------|--------|
| Compte | fbt276-cpu |
| Dépôt | mathkid (public) |
| Branche | main |
| Dossier | / (root) |
| URL PWA | https://fbt276-cpu.github.io/mathkid/ |
| URL QR Code | https://fbt276-cpu.github.io/mathkid/qrcode.html |
| URL assetlinks | https://fbt276-cpu.github.io/mathkid/.well-known/assetlinks.json |
| HTTPS | Automatique (Let's Encrypt via GitHub) |

---

## 5. APK Android (Trusted Web Activity)

| Paramètre | Valeur |
|-----------|--------|
| Package | com.nexxat.mathkid |
| Version name | 1.2.0 |
| Version code | 1 |
| Min SDK | API 21 (Android 5.0) |
| Host | fbt276-cpu.github.io |
| Start URL | /mathkid/index.html |
| Keystore | mathkid-release.keystore |
| Alias | mathkid |
| SHA-256 | 59:79:51:52:21:3B:8B:EE:20:5C:EF:5E:E0:E5:46:7B:04:8C:4A:E2:BB:16:96:D9:44:0F:FE:A2:12:26:F6:4A |
| Outil | Bubblewrap CLI v1.24.1 |
| JDK | OpenJDK 17.0.11 |

---

## 6. Service Worker

**Stratégie** : Cache-first avec fallback réseau  
**Nom du cache** : `mathkid-nexxat-v1.2.1`

```
FETCH → Cache local ?
  OUI → Retourner depuis cache (offline OK)
  NON → Fetch réseau → Mettre en cache → Retourner
  ERREUR → Fallback index.html
```

**Ressources cachées** :
- Fichiers locaux : index.html, sw.js, manifest.json, icônes, assetlinks.json
- CDN : Google Fonts, Chart.js 4.4.0

---

## 7. Corrections Android 16 (v1.2.1)

Problème : la navbar inférieure était coupée sur Android 16.

**Causes identifiées :**
- `height: 100vh` ne prend pas en compte la barre système Android 16
- `overflow: hidden` sur body bloquait le rendu de la navbar
- `env(safe-area-inset-bottom)` insuffisant seul

**Solutions appliquées :**
```css
/* Fix viewport Android 16 */
html {
  height: -webkit-fill-available;
}
body {
  position: fixed;
  width: 100%;
  min-height: -webkit-fill-available;
}

/* App shell */
#app {
  position: fixed;
  top: 0; left: 0; right: 0; bottom: 0;
}

/* Navbar renforcée */
.navbar {
  padding-bottom: max(env(safe-area-inset-bottom, 8px), 8px);
  min-height: 60px;
  position: relative;
  z-index: 10;
}

/* Pages */
.page {
  flex: 1;
  overflow: hidden;
}
```

---

## 8. Persistance localStorage

| Clé | Type | Description | Taille max |
|-----|------|-------------|------------|
| `mk_name` | string | Prénom de l'enfant | 20 chars |
| `mk_settings` | JSON | Paramètres | ~200 bytes |
| `mk_history` | JSON[] | 50 dernières sessions | ~10 KB |

---

## 9. Compatibilité

| Plateforme | Navigateur | Statut |
|-----------|------------|--------|
| Android 5+ | Chrome 80+ | ✅ Complet |
| Android 16 | Chrome | ✅ Corrigé v1.2.1 |
| Android 5+ | Firefox | ✅ Complet |
| iOS 14+ | Safari | ⚠️ PWA limitée |
| Desktop Zorin/Linux | Chrome/Firefox | ✅ Complet |

---

## 10. Environnement de développement

| Outil | Version | Emplacement |
|-------|---------|-------------|
| OS | Zorin Linux | PC développement |
| Node.js | 18.x | `/usr/bin/node` |
| npm | — | `~/.npm-global/` |
| Bubblewrap | 1.24.1 | `~/.npm-global/bin/` |
| JDK | OpenJDK 17 | `~/.bubblewrap/jdk/` |
| Android SDK | API 21+ | `~/.bubblewrap/android_sdk/` |
| Git | — | `/usr/bin/git` |
| gh CLI | — | `/usr/bin/gh` |
| Projet | — | `~/Bureau/DOSSIER/MATH_KID/` |
| APK build | — | `~/MathKid-APK/` |

---

## 11. Commandes utiles

```bash
# Mettre à jour et publier
cd ~/Bureau/DOSSIER/MATH_KID
git add . && git commit -m "MathKid vX.Y.Z" && git push

# Rebuilder l'APK
cd ~/MathKid-APK && bubblewrap build

# Publier une release
gh release create vX.Y.Z MathKid-vX.Y.Z.apk --title "MathKid vX.Y.Z NEXXAT"

# Vérifier le keystore
keytool -list -v -keystore ~/MathKid-APK/mathkid-release.keystore -alias mathkid
```

---

*© NEXXAT - ODET François 2025 | Sourcé par Claude IA | v1.2.1*
