'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "4aba0b49bffc7c76557f0803be07f1a3",
"assets/assets/button_add.png": "546ac0c4dbd95c7045e75d6091afc4d8",
"assets/assets/button_chat.png": "27c582b906d7d72570a6367790906ed7",
"assets/assets/button_close.png": "eedc05f30b6ccd8f1dfc9ee4641cd4b5",
"assets/assets/button_exit.png": "e59eb95b71926b6537768d25932dabf7",
"assets/assets/button_min.png": "e056c58fa2f23b68e1dccbe4fd19e7ae",
"assets/assets/button_send.png": "37a12aca703b32735ddef6c5af695198",
"assets/assets/button_wishlist.png": "e86eadc67afe17336338db181708af0b",
"assets/assets/button_wishlist_blue.png": "ce27e9769fbbee5a976a7357d4b0eaaa",
"assets/assets/icon_cart.png": "2f5e5a34bbd7c7d34742477b83f5b840",
"assets/assets/icon_chat.png": "74d7e066b9f70198cf0c77c288303305",
"assets/assets/icon_email.png": "906a121c9e3e1a6b9c18bc43a5edac93",
"assets/assets/icon_empty_cart.png": "f4f6419b34b73d32b64e0da8521c76be",
"assets/assets/icon_headset.png": "991196c23226412b7e9e3bbd07c799bc",
"assets/assets/icon_home.png": "f2c980deb289fa01b255dc231fdc0c8b",
"assets/assets/icon_line.png": "98a4be9739ed14c632a2a3f9324fad46",
"assets/assets/icon_name.png": "846f8063adc70cacc5e0e1ee83b92c68",
"assets/assets/icon_password.png": "cf20af729cf4cbe963a85b4d427f3b76",
"assets/assets/icon_profile.png": "66558e8ad53034c308d2bc8c8060295f",
"assets/assets/icon_remove.png": "8e0dca7c94fc5ce561a050ea827e972c",
"assets/assets/icon_store_location.png": "a5f5e73ba434d432893b89bdc9e53ffe",
"assets/assets/icon_submit.png": "b0ec0a69fbeec99543cded879ec4513c",
"assets/assets/icon_success.png": "f6f2b6caa1200022623d1b3ebac9455d",
"assets/assets/icon_username.png": "95617f85d7137b8d0d8df268be2c5584",
"assets/assets/icon_wishlist.png": "ea0df63bc253b62d7456373ba6c91e6e",
"assets/assets/icon_your_address.png": "0d6a6480e37f55c1329f2c134a4cb39a",
"assets/assets/image_profile.png": "b5e7b792d926bc9a0b798456b276ec63",
"assets/assets/image_shoes.png": "e43aaf3246013ee1d901760c0c526c2c",
"assets/assets/image_shoes2.png": "6367c2c3d88a9523b48d1541f835af88",
"assets/assets/image_shoes3.png": "4344a4ebb032dd6fb9907cae4bc3e130",
"assets/assets/image_shoes4.png": "68908abcab821541b4d0e3b54ec2af31",
"assets/assets/image_shoes5.png": "b6d3dbaca6032b710ea0b9660a5e139e",
"assets/assets/image_shoes6.png": "e940386044124a483d5e632a17184ca9",
"assets/assets/image_shoes7.png": "c7b1e3cdafeb72a9f5c358f35d83e3c1",
"assets/assets/image_shoes8.png": "61d7aae9d7e432573c68d679593ab49d",
"assets/assets/image_shop_logo.png": "ba49db23b3bd0bbf507fdf195554d8b2",
"assets/assets/image_shop_logo_online.png": "a5eaab5d98e76c636ef7c13bd193b2a8",
"assets/assets/image_splash.png": "efb770a7ac3c9e39bbf9335524a24da1",
"assets/assets/image_wishlist.png": "8763ac01404db55ce6a715ae7aa5b34f",
"assets/assets/logonotif.png": "f775ed03c72bb4e4c1e2c7fc115925b2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "69badbeacf1585d9ceea3f25c3284ae7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "24cd4e35ac06f22580c47869814c70af",
"/": "24cd4e35ac06f22580c47869814c70af",
"main.dart.js": "043e0440905114503e12aa8c7cf5ceb7",
"manifest.json": "37d380b21b8da49ff68ab33ac5678cf4",
"version.json": "322dfa94430cc69aa45ce83495f46466"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
