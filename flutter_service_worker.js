'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1d17cca7d79c47a89ca6e406cb91d520",
"assets/AssetManifest.bin.json": "d70809fda7378be36c5d142f9af41b8a",
"assets/AssetManifest.json": "2fcd2f60e028f9143db4ae34c24235df",
"assets/assets/icons/add_document.svg": "d824f74ab10641cb7a755e9b03973f3a",
"assets/assets/icons/add_mail.svg": "15dc0b2e20e9d07b1938170b9641780d",
"assets/assets/icons/description.svg": "b9ed3fffd31f745441d4aac7316a6df9",
"assets/assets/icons/edit.svg": "2a7a7216c7a6d45e44339b864e5b0d77",
"assets/assets/icons/filter.svg": "67100e82742961bcb4cb7daecded76a4",
"assets/assets/icons/home.svg": "86a5c31d6cba5c771720bd77b44ab621",
"assets/assets/icons/inbox.svg": "0b40f9ceae2e146e9e7ca48b0fa97b5b",
"assets/assets/icons/key.svg": "20a2faf27cee39cd95c16945ca1521fb",
"assets/assets/icons/key_filled.svg": "ed853161f3c20890734c0abdc5f40667",
"assets/assets/icons/mail.svg": "154d00dd7232ea5c97fd99d6ff579fd0",
"assets/assets/icons/mail_filled.svg": "9fb8ce2352323d111b2ab70bf609ede5",
"assets/assets/icons/more_vertical.svg": "3c6e2f4fa10a15716f00af505e243c76",
"assets/assets/icons/name.svg": "a8125fb41993265d9ebd27688e07afd9",
"assets/assets/icons/privacy.svg": "9dc9ea292b3419b011b05f9c6a771536",
"assets/assets/icons/search.svg": "a51b9dd8e50b8a485315cb85c17b5e11",
"assets/assets/icons/share.svg": "d1ad9614b46be76a3a7beff01d182513",
"assets/assets/icons/show.svg": "596292d063c230335b669dcafcdb0408",
"assets/assets/icons/small_key_filled.svg": "3b2fa8543d4cd8bd143baf039a71e123",
"assets/assets/icons/small_mail.svg": "9fc6dfd18a0905b87109e09eabf65be3",
"assets/assets/icons/star.svg": "4d65a0622622559d252844803e53ea3e",
"assets/assets/icons/trash.svg": "5fe4afc54b298be66f89333003f20c00",
"assets/assets/icons/value.svg": "8282b4c23148dc6142a79d571f1bc26d",
"assets/assets/icons/virtual.svg": "3788bb43cd9e7ca76e6923e23d8bdcba",
"assets/assets/images/example.png": "7f66cb0b9bfadea3a7581869df4e6e01",
"assets/FontManifest.json": "2242c12f7422bcf57ad354dfcf87b813",
"assets/fonts/MaterialIcons-Regular.otf": "70a6ce517985e43655adb2910566bc41",
"assets/fonts/Pretendard/Pretendard-Black.ttf": "295efec41b5eccc61c6ba8e96cb816ed",
"assets/fonts/Pretendard/Pretendard-Bold.ttf": "0723ee5b938e98ab35833119ed9f973d",
"assets/fonts/Pretendard/Pretendard-ExtraBold.ttf": "8298442ed6b520e029dcbaeca0303393",
"assets/fonts/Pretendard/Pretendard-ExtraLight.ttf": "a7d69d904689baca1840e3cefe7c43c7",
"assets/fonts/Pretendard/Pretendard-Light.ttf": "b6b67941c3e77f24e4417129c9de8945",
"assets/fonts/Pretendard/Pretendard-Medium.ttf": "57a61eff81918a74f97ba593d08937eb",
"assets/fonts/Pretendard/Pretendard-Regular.ttf": "ad426f85daf320344fef4fb90d8c87d7",
"assets/fonts/Pretendard/Pretendard-SemiBold.ttf": "e911263ecc4de952c7c9704d522bf7fb",
"assets/fonts/Pretendard/Pretendard-Thin.ttf": "f150ad74a1f028fbe97b7de90039e817",
"assets/NOTICES": "d1e0346ade9e1a15b2d0259b2ee8fc83",
"assets/packages/fluttertoast/assets/toastify.css": "910ddaaf9712a0b0392cf7975a3b7fb5",
"assets/packages/fluttertoast/assets/toastify.js": "18cfdd77033aa55d215e8a78c090ba89",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cdebc8f7cffa68c49e38c2335e26906e",
"/": "cdebc8f7cffa68c49e38c2335e26906e",
"main.dart.js": "304c9102f1d3d83c94da28d92c94c824",
"manifest.json": "c6a7101cd7b3c485a6f62f7e98cd7732",
"version.json": "7628fdadf27a91414851060cd6cb3021"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
