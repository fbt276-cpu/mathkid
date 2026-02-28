#!/bin/bash
# ============================================================
# Nom du programme : MathKid — Déploiement GitHub + APK
# Auteur           : ODET François
# Société          : NEXXAT
# Copyright        : © NEXXAT - ODET François 2025
# Version          : 1.2.0
# Date de création : 2025-02-28 10:00
# Langage          : Bash
# Chemin du fichier: /MathKid/deploy_github.sh
# Sourcé par       : Claude IA
# ------------------------------------------------------------
# Historique des versions :
#   v1.2.0 - 2025-02-28 - Déploiement GitHub Pages + APK Bubblewrap
#   v1.1.0 - 2025-02-28 - Déploiement local
#   v1.0.0 - 2025-02-28 - Version initiale
# ============================================================

set -e

# ── Bannière NEXXAT ──────────────────────────────────────────
clear
echo '╔══════════════════════════════════════════════════════╗'
echo '║       NEXXAT — MathKid · Déploiement GitHub         ║'
echo '║   Chemin : /MathKid/deploy_github.sh                ║'
echo '║   © NEXXAT - ODET François 2025 | v1.2.0            ║'
echo '║   Sourcé par Claude IA                              ║'
echo '╚══════════════════════════════════════════════════════╝'
echo ''

# ── Variables fixes (compte GitHub configuré) ────────────────
GITHUB_USER="fbt276-cpu"
REPO_NAME="mathkid"
GITHUB_PAGES_URL="https://${GITHUB_USER}.github.io/${REPO_NAME}/"
PACKAGE_ID="com.nexxat.mathkid"
VERSION="1.2.0"
VERSION_CODE="1"

echo "   Compte GitHub   : $GITHUB_USER"
echo "   Dépôt           : $REPO_NAME"
echo "   GitHub Pages    : $GITHUB_PAGES_URL"
echo "   Package Android : $PACKAGE_ID"
echo ''

# ── Étape 0 : Chemin du projet ───────────────────────────────
read -p '📁 Chemin complet du dossier MathKid (ex: /home/francois/Projets/MathKid) : ' PROJET

if [ ! -d "$PROJET" ]; then
  echo "❌ Dossier introuvable : $PROJET"
  exit 1
fi

if [ ! -f "$PROJET/index.html" ]; then
  echo "❌ index.html absent dans $PROJET — vérifie le chemin."
  exit 1
fi

echo "   ✅ Dossier trouvé : $PROJET"
echo ''

# ── Étape 1 : Vérifications des outils ──────────────────────
echo '🔍 Vérification des outils installés...'
MISSING=""

check_tool() {
  if command -v "$1" &>/dev/null; then
    echo "   ✅ $1 : $(command -v $1)"
  else
    echo "   ❌ $1 : NON INSTALLÉ"
    MISSING="$MISSING $1"
  fi
}

check_tool git
check_tool node
check_tool npm

if [ -n "$MISSING" ]; then
  echo ''
  echo "⚠️  Outils manquants :$MISSING"
  echo '   Installe-les puis relance ce script.'
  echo ''
  echo '   Git   : sudo apt install git -y'
  echo '   Node  : curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt install nodejs -y'
  exit 1
fi

echo ''

# ── Étape 2 : Configuration Git ──────────────────────────────
echo '⚙️  Configuration Git...'
git config --global user.name  "ODET François" 2>/dev/null || true
echo "   ✅ user.name  : ODET François"

CURRENT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")
if [ -z "$CURRENT_EMAIL" ]; then
  read -p '   📧 Ton email GitHub : ' GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
  echo "   ✅ user.email : $GIT_EMAIL"
else
  echo "   ✅ user.email : $CURRENT_EMAIL"
fi

echo ''

# ── Étape 3 : Init dépôt Git ─────────────────────────────────
echo '🐙 Initialisation du dépôt Git...'
cd "$PROJET"

if [ ! -d ".git" ]; then
  git init
  echo "   ✅ Dépôt Git initialisé"
else
  echo "   ✅ Dépôt Git existant détecté"
fi

# Créer .gitignore si absent
if [ ! -f ".gitignore" ]; then
cat > .gitignore << 'GITEOF'
# NEXXAT MathKid - .gitignore
*.DS_Store
node_modules/
*.log
GITEOF
  echo "   ✅ .gitignore créé"
fi

echo ''

# ── Étape 4 : Commit et push ─────────────────────────────────
echo '📤 Publication sur GitHub...'
echo ''
echo '   ⚠️  Assure-toi d'\''avoir créé le dépôt sur GitHub :'
echo "   → https://github.com/new"
echo "   → Nom du dépôt : $REPO_NAME (PUBLIC)"
echo "   → NE PAS cocher 'Add a README file' si le dossier n'est pas vide"
echo ''
read -p '   Dépôt GitHub créé ? (o pour continuer) : ' CONFIRM
if [[ "$CONFIRM" != "o" && "$CONFIRM" != "O" ]]; then
  echo 'Crée le dépôt puis relance le script.'
  exit 0
fi

# Ajouter le remote si absent
REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
if ! git remote get-url origin &>/dev/null; then
  git remote add origin "$REMOTE_URL"
  echo "   ✅ Remote ajouté : $REMOTE_URL"
else
  git remote set-url origin "$REMOTE_URL"
  echo "   ✅ Remote mis à jour : $REMOTE_URL"
fi

git add .
git commit -m "MathKid v${VERSION} NEXXAT - © ODET François 2025 - Sourcé par Claude IA" || \
  echo "   ℹ️  Rien à committer (déjà à jour)"

git branch -M main
echo ''
echo '   🔐 GitHub va demander ton Personal Access Token.'
echo '   Si tu n'\''en as pas : https://github.com/settings/tokens/new'
echo '   → Coche "repo" → Génère → Copie le token → Colle-le comme mot de passe'
echo ''
git push -u origin main

echo ''
echo '   ✅ Fichiers publiés sur GitHub !'
echo ''

# ── Étape 5 : Instructions GitHub Pages ──────────────────────
echo '🌐 Activation de GitHub Pages...'
echo ''
echo '   Fais ces étapes dans le navigateur :'
echo "   1. Va sur : https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
echo '   2. Source : Deploy from a branch'
echo '   3. Branch : main | Folder : / (root)'
echo '   4. Clique Save'
echo ''
echo "   ⏳ Attends ~2 minutes, puis teste :"
echo "   → $GITHUB_PAGES_URL"
echo ''
read -p '   GitHub Pages activé et testé ? (o pour continuer vers APK) : ' PAGES_OK
if [[ "$PAGES_OK" != "o" && "$PAGES_OK" != "O" ]]; then
  echo ''
  echo '✅ Reprends ici quand GitHub Pages est actif.'
  echo "   Lance ensuite la partie APK du script : ./deploy_github.sh --apk"
  exit 0
fi

# ── Étape 6 : Installation Bubblewrap ───────────────────────
echo ''
echo '📦 Installation de Bubblewrap (APK generator)...'

if ! command -v bubblewrap &>/dev/null; then
  npm install -g @bubblewrap/cli
  echo '   ✅ Bubblewrap installé'
else
  echo '   ✅ Bubblewrap déjà installé'
fi

# ── Étape 7 : Génération du projet TWA ───────────────────────
echo ''
echo '🔧 Génération du projet APK (Trusted Web Activity)...'
echo ''

APK_DIR="$HOME/MathKid-APK"
mkdir -p "$APK_DIR"
cd "$APK_DIR"

# Copier le twa-manifest.json préconfiguré
if [ -f "$PROJET/twa-manifest.json" ]; then
  cp "$PROJET/twa-manifest.json" "$APK_DIR/twa-manifest.json"
  echo "   ✅ twa-manifest.json copié"
fi

echo ''
echo '   📝 Initialisation Bubblewrap...'
echo "   → Manifest PWA : ${GITHUB_PAGES_URL}manifest.json"
echo ''
echo '   ⚠️  Bubblewrap va poser des questions. Utilise ces réponses :'
echo "   ┌─────────────────────────────────────────────────────────┐"
echo "   │ Application name   : MathKid NEXXAT                    │"
echo "   │ Short name         : MathKid                           │"
echo "   │ Package name       : com.nexxat.mathkid                │"
echo "   │ Version code       : 1                                 │"
echo "   │ Version name       : 1.2.0                             │"
echo "   │ Status bar color   : #6C3CE1                           │"
echo "   │ Nav bar color      : #0F0A1E                           │"
echo "   │ Key store path     : ./mathkid-release.keystore        │"
echo "   │ Key alias          : mathkid                           │"
echo "   │ ⚠️  MOT DE PASSE : CHOISIS ET NOTE-LE BIEN !           │"
echo "   └─────────────────────────────────────────────────────────┘"
echo ''
read -p '   Prêt ? (o pour lancer Bubblewrap) : ' BWR_OK

if [[ "$BWR_OK" == "o" || "$BWR_OK" == "O" ]]; then
  bubblewrap init --manifest "${GITHUB_PAGES_URL}manifest.json"
fi

# ── Étape 8 : Récupération SHA-256 + assetlinks ──────────────
echo ''
echo '🔑 Récupération du SHA-256 du keystore...'
echo ''

KEYSTORE="$APK_DIR/mathkid-release.keystore"
if [ -f "$KEYSTORE" ]; then
  echo '   Exécution de keytool...'
  SHA256=$(keytool -list -v \
    -keystore "$KEYSTORE" \
    -alias mathkid \
    2>/dev/null | grep "SHA256:" | awk '{print $2}' || echo "")

  if [ -n "$SHA256" ]; then
    echo "   ✅ SHA-256 trouvé : $SHA256"
    # Mettre à jour assetlinks.json automatiquement
    ASSETLINKS="$PROJET/.well-known/assetlinks.json"
    cat > "$ASSETLINKS" << ASSETEOF
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "$PACKAGE_ID",
      "sha256_cert_fingerprints": [
        "$SHA256"
      ]
    }
  }
]
ASSETEOF
    echo "   ✅ assetlinks.json mis à jour avec le SHA-256 réel"

    # Republier sur GitHub
    cd "$PROJET"
    git add .well-known/assetlinks.json
    git commit -m "Ajout assetlinks.json SHA-256 pour TWA - NEXXAT v${VERSION}"
    git push
    echo "   ✅ assetlinks.json publié sur GitHub Pages"
  else
    echo '   ⚠️  SHA-256 non récupéré automatiquement.'
    echo "   Lance manuellement : keytool -list -v -keystore $KEYSTORE -alias mathkid"
    echo "   Puis édite : $PROJET/.well-known/assetlinks.json"
  fi
else
  echo "   ⚠️  Keystore absent ($KEYSTORE)"
  echo '   Relance Bubblewrap init puis reviens ici.'
fi

# ── Étape 9 : Build APK ──────────────────────────────────────
echo ''
echo '🔨 Construction de l'\''APK...'
echo ''
cd "$APK_DIR"

read -p '   Lancer bubblewrap build ? (o/n) : ' BUILD_OK
if [[ "$BUILD_OK" == "o" || "$BUILD_OK" == "O" ]]; then
  bubblewrap build
  echo ''
  APK_FILE=$(find "$APK_DIR" -name "*.apk" | head -1)
  if [ -n "$APK_FILE" ]; then
    # Copier l'APK dans le projet pour distribution
    cp "$APK_FILE" "$PROJET/MathKid-v${VERSION}.apk"
    echo "   ✅ APK généré : $APK_FILE"
    echo "   ✅ APK copié  : $PROJET/MathKid-v${VERSION}.apk"
    APK_SIZE=$(du -h "$APK_FILE" | cut -f1)
    echo "   📦 Taille APK : $APK_SIZE"
  fi
fi

# ── RÉSUMÉ FINAL ─────────────────────────────────────────────
echo ''
echo '╔══════════════════════════════════════════════════════╗'
echo '║            🎉 DÉPLOIEMENT TERMINÉ !                 ║'
echo '╚══════════════════════════════════════════════════════╝'
echo ''
echo "   🌐 PWA accessible : $GITHUB_PAGES_URL"
echo "   📱 APK Android    : $PROJET/MathKid-v${VERSION}.apk"
echo ''
echo '   ── Distribution de l'\''APK ────────────────────────────'
echo '   Option A : Envoyer l'\''APK par WhatsApp / Telegram / email'
echo "   Option B : Créer une release GitHub :"
echo "              https://github.com/${GITHUB_USER}/${REPO_NAME}/releases/new"
echo "              → Tag : v${VERSION} | Uploader l'APK"
echo "   Lien direct : https://github.com/${GITHUB_USER}/${REPO_NAME}/releases/latest"
echo ''
echo '   ── Pour l'\''utilisateur final ───────────────────────────'
echo '   1. Télécharger l'\''APK'
echo '   2. Paramètres → Sécurité → Sources inconnues → Activer'
echo '   3. Ouvrir le fichier .apk → Installer'
echo '   4. Profiter de MathKid ! 🧮'
echo ''
echo '© NEXXAT - ODET François 2025 | Sourcé par Claude IA'
