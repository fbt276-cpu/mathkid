# SPECIFICATIONS TECHNIQUES — MathKid

**Nom du programme** : MathKid — Application de calcul mental  
**Auteur** : ODET François  
**Société** : NEXXAT  
**Copyright** : © NEXXAT - ODET François 2025  
**Version** : 1.1.0 | Date : 2025-02-28  
**Sourcé par** : Claude IA

---

## 1. Architecture

MathKid est une **Progressive Web App (PWA) monopage** entièrement statique. Aucun serveur applicatif n'est requis — uniquement un serveur de fichiers statiques (nginx, Apache, GitHub Pages, Python http.server).

```
ARCHITECTURE
─────────────────────────────────────────────
  Navigateur Android (Chrome / Edge)
       │
       ├── index.html        (HTML + CSS + JS intégré)
       ├── sw.js             (Service Worker — cache offline)
       ├── manifest.json     (métadonnées PWA)
       └── icons/            (icônes 192 et 512px)
             │
             ├── LocalStorage  (paramètres + historique 50 sessions)
             └── CDN externes
                   ├── Google Fonts (Baloo 2 + Nunito)
                   └── Chart.js 4.4.0 (graphiques)
```

---

## 2. Stack technique

| Composant          | Technologie             | Version   |
|--------------------|-------------------------|-----------|
| Langage principal  | JavaScript              | ES2022    |
| Markup             | HTML                    | HTML5     |
| Styles             | CSS                     | CSS3      |
| Graphiques         | Chart.js (CDN)          | 4.4.0     |
| Polices            | Google Fonts (CDN)      | —         |
| Cache offline      | Service Worker API      | —         |
| Installation       | Web App Manifest (PWA)  | —         |
| Persistance        | localStorage            | —         |
| Icônes             | PNG (192 + 512px)       | —         |

---

## 3. Fichiers du projet

| Fichier                                         | Rôle                                        |
|-------------------------------------------------|---------------------------------------------|
| `index.html`                                    | Application complète (HTML + CSS + JS)      |
| `sw.js`                                         | Service Worker — cache-first + offline      |
| `manifest.json`                                 | Métadonnées PWA (nom, icônes, thème)        |
| `deploy.sh`                                     | Script Bash de déploiement automatisé       |
| `icons/icon-192.png`                            | Icône PWA (écran d'accueil Android)         |
| `icons/icon-512.png`                            | Icône PWA (splash screen Android)           |
| `Documentation/SPECIFICATIONS_FONCTIONNELLES.md`| Spécifications fonctionnelles               |
| `Documentation/SPECIFICATIONS_TECHNIQUES.md`   | Ce fichier                                  |
| `Documentation/MANUEL_UTILISATEUR.md`           | Guide d'utilisation enfant/parent           |
| `README.md`                                     | Installation, usage, historique versions    |

---

## 4. Service Worker — Stratégie de cache

**Stratégie** : Cache-first avec fallback réseau

```
FETCH → Cache local ?
  OUI → Retourner depuis le cache (offline OK)
  NON → Fetch réseau → Mettre en cache → Retourner
  ERREUR RÉSEAU → Fallback index.html (pour les routes document)
```

**Ressources mises en cache** :
- Fichiers locaux : index.html, sw.js, manifest.json, icônes
- CDN : Google Fonts, Chart.js 4.4.0

**Nom du cache** : `mathkid-nexxat-v1.1.0`  
Incrémentation à chaque mise à jour de version.

---

## 5. Persistance des données (localStorage)

| Clé           | Type    | Description                                | Taille max |
|---------------|---------|--------------------------------------------|------------|
| `mk_name`     | string  | Prénom de l'enfant                         | 20 chars   |
| `mk_settings` | JSON    | Paramètres (ops, maxVal, count, timer)     | ~200 bytes |
| `mk_history`  | JSON[]  | Historique des 50 dernières sessions       | ~10 KB     |

**Structure d'une session sauvegardée** :
```json
{
  "correct": 8,
  "total": 10,
  "pct": 80,
  "avgTime": 4.2,
  "bestStreak": 5,
  "ops": ["add", "mul"],
  "date": "2025-02-28T10:30:00.000Z"
}
```

---

## 6. Générateur de questions

### Addition
```
a ∈ [0, maxVal]
b ∈ [0, maxVal]
réponse = a + b
```

### Soustraction (sans négatif)
```
a ∈ [0, maxVal]
b ∈ [0, a]         ← garantit a - b ≥ 0
réponse = a - b
```

### Multiplication
```
a ∈ [0, maxVal]
b ∈ [0, min(maxVal, 10)]
réponse = a × b
```

### Division (entière)
```
diviseur b ∈ [1, min(maxVal, 10)]
quotient q ∈ [0, floor(maxVal / b)]
dividende a = q × b          ← garantit division exacte
réponse = q
```

### Distracteurs (niveau 1)
```
pool = {réponse}
while |pool| < 3:
  offset = rand(1, max(5, ceil(réponse × 0.4) + 2))
  candidat = réponse ± offset  (aléatoire)
  if candidat ≥ 0: pool.add(candidat)
```

---

## 7. Calcul du score

```
score_question = max(1, round(10 × temps_restant / timer_total))
```
- Réponse correcte → bonus ajouté au score total
- Réponse incorrecte ou timeout → +0

---

## 8. Compatibilité

| Plateforme         | Navigateur          | Statut     |
|--------------------|---------------------|------------|
| Android 8+         | Chrome 80+          | ✅ Complet  |
| Android 8+         | Firefox 90+         | ✅ Complet  |
| Android 8+         | Edge 80+            | ✅ Complet  |
| iOS 14+            | Safari              | ⚠️ Partiel (PWA limitée sur iOS) |
| Desktop Linux/Win  | Chrome / Firefox    | ✅ Complet  |

**Prérequis installation PWA** : HTTPS obligatoire (sauf localhost).

---

## 9. Sécurité

- Aucune donnée transmise à un serveur externe
- Données stockées uniquement en local (localStorage navigateur)
- Aucune authentification requise
- Aucun cookie
- CSP non défini (application statique sans backend)

---

## 10. Performance

- Taille totale : < 30 KB (sans polices et Chart.js CDN)
- Premier chargement : dépend du CDN (~200 KB avec Chart.js)
- Chargements suivants : 100% offline depuis cache SW
- Pas de framework JS (Vanilla JS pur) → temps de démarrage < 100ms

---

## 11. Déploiement sur Unraid (192.168.1.180)

```bash
# Copier les fichiers sur le serveur
scp -r MathKid/* root@192.168.1.180:/mnt/user/appdata/mathkid/

# Configuration nginx (conteneur Docker)
# server {
#   listen 443 ssl;
#   root /mnt/user/appdata/mathkid;
#   index index.html;
#   location / { try_files $uri $uri/ /index.html; }
# }
```

**Prérequis** : Certificat SSL (Let's Encrypt) pour HTTPS.

---

*© NEXXAT - ODET François 2025 | Sourcé par Claude IA | v1.1.0*
