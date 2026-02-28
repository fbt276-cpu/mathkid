/* ============================================================
   Nom du programme : MathKid — Service Worker PWA
   Auteur           : ODET François
   Société          : NEXXAT
   Copyright        : © NEXXAT - ODET François 2025
   Version          : 1.2.0
   Date de création : 2025-02-28 10:00
   Langage          : JavaScript (Service Worker API)
   Chemin du fichier: https://fbt276-cpu.github.io/mathkid/sw.js
   Sourcé par       : Claude IA
   ------------------------------------------------------------
   Historique des versions :
     v1.2.0 - 2025-02-28 - URL GitHub Pages fbt276-cpu intégrée,
                            cache mis à jour
     v1.1.0 - 2025-02-28 - Conformité guide NEXXAT complète
     v1.0.0 - 2025-02-28 - Version initiale
============================================================ */

'use strict';

const CACHE_NAME  = 'mathkid-nexxat-v1.2.0';
const APP_VERSION = '1.2.0';
const BASE_URL    = 'https://fbt276-cpu.github.io/mathkid/';
const ASSETS_CORE = [
  BASE_URL,
  BASE_URL + 'index.html',
  BASE_URL + 'manifest.json',
  BASE_URL + 'icons/icon-192.png',
  BASE_URL + 'icons/icon-512.png',
  BASE_URL + '.well-known/assetlinks.json'
];
const ASSETS_CDN = [
  'https://fonts.googleapis.com/css2?family=Baloo+2:wght@400;500;600;700;800&family=Nunito:wght@400;600;700;800;900&display=swap',
  'https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js'
];

console.log(`[NEXXAT MathKid SW v${APP_VERSION}] © NEXXAT - ODET François 2025 | ${BASE_URL}`);

// ── INSTALL ──────────────────────────────────────────────────
self.addEventListener('install', event => {
  console.log(`[NEXXAT SW] Installation v${APP_VERSION}`);
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      cache.addAll(ASSETS_CDN).catch(e => console.warn('[SW] CDN cache warning:', e));
      return cache.addAll(ASSETS_CORE);
    }).then(() => self.skipWaiting())
  );
});

// ── ACTIVATE ─────────────────────────────────────────────────
self.addEventListener('activate', event => {
  console.log(`[NEXXAT SW] Activation v${APP_VERSION}`);
  event.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => {
        console.log(`[NEXXAT SW] Suppression ancien cache : ${k}`);
        return caches.delete(k);
      })))
      .then(() => self.clients.claim())
  );
});

// ── FETCH : Cache First, Network Fallback ────────────────────
self.addEventListener('fetch', event => {
  if (event.request.method !== 'GET') return;
  event.respondWith(
    caches.match(event.request).then(cached => {
      if (cached) return cached;
      return fetch(event.request).then(response => {
        if (!response || response.status !== 200 || response.type === 'opaque') return response;
        const clone = response.clone();
        caches.open(CACHE_NAME).then(cache => cache.put(event.request, clone));
        return response;
      }).catch(() => {
        if (event.request.destination === 'document') return caches.match('./index.html');
      });
    })
  );
});
