'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "888483df48293866f9f41d3d9274a779",
"icons/Icon-512.png": "bbb3f5fd0d19278f6ba8bd5156437755",
"icons/Icon-maskable-512.png": "bbb3f5fd0d19278f6ba8bd5156437755",
"icons/Icon-192.png": "d4f5df96c57ff18aae89434bc677b167",
"icons/apple-touch-icon.png": "2599ba4937b414fe49b837e09a59ad66",
"icons/android-chrome-512x512.png": "bbb3f5fd0d19278f6ba8bd5156437755",
"icons/android-chrome-192x192.png": "d4f5df96c57ff18aae89434bc677b167",
"icons/Icon-maskable-192.png": "d4f5df96c57ff18aae89434bc677b167",
"manifest.json": "029cb8b3c7745047fc31f9917698de3d",
"index.html": "1a476f4f8300a23d2dab4fca88c546fb",
"/": "1a476f4f8300a23d2dab4fca88c546fb",
"firebase-messaging-sw.js": "b86d8dc407c6ae1e8d54577a28a4d82b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "ad31b6611c93a6e02b56d514b45c62a2",
"assets/assets/images/Instagram_logo.png": "4056ff53689bc9eea291520f45bba46b",
"assets/assets/images/kakaologo.png": "f1c446995817ea1e441ad46a20254136",
"assets/assets/images/circle_default_image.png": "e12f045f743050debeb2dbc1c72b00c1",
"assets/assets/images/phonelogo.svg": "20f4cb31c636215a74a8a63942f9704a",
"assets/assets/images/profile.svg": "3ea6dfbc0859c83aa4b07af2efa6e47f",
"assets/assets/images/pumpkin.png": "80e731e680cd94c103fe997dc433aba9",
"assets/assets/images/splash_image.png": "c0d38a672a1bd0cbc57d9843fbd64e04",
"assets/assets/images/splash_image_android_12.png": "80038226246e100742ee1ba6e0e273f3",
"assets/assets/images/ic_back_arrow.svg": "57fbb31f5af2725160d292d89a452855",
"assets/assets/images/ghost.png": "ef59a757121abd83b519deb8b742fa5f",
"assets/assets/images/map_marker.png": "c25cf10c78e4306f7a8ab79173ac12b1",
"assets/assets/images/ic_pen.svg": "0a7ead526f197b65ed6410858478d507",
"assets/assets/images/dongurami.png": "c5d2b297dafe6516455419725db16a78",
"assets/assets/images/ic_close.svg": "944bb2d6ac0c1b3cf91d904c3f823a71",
"assets/assets/html/privacy_policy.html": "80d1482ffab9f835d12e273261f489a3",
"assets/assets/html/terms_of_service.html": "a6178b7b36e252036069e53f06d369e7",
"assets/assets/html/personal_information_collection_and_usage_agreement.html": "7c77b9b5be65f9ad2712b99e0ded6420",
"assets/assets/fonts/Jalnan2TTF.ttf": "e3aded05a6b31f9b9f0d4db557dd7935",
"assets/assets/fonts/SUIT-Thin.ttf": "a1cb78e8ca24f92db1ace2d25425a360",
"assets/assets/fonts/MainIcons.ttf": "98830516fe658944e98a28da7c172c62",
"assets/assets/fonts/SignUpIcons.ttf": "da07dec083fc2598998e884e481f163d",
"assets/assets/fonts/SUIT-Regular.ttf": "8bae3ed6724cbc8b2803c1d6868c6f9c",
"assets/assets/fonts/SUIT-Heavy.ttf": "352f857d94514e5326f9ec6c4e9a149c",
"assets/assets/fonts/SUIT-Medium.ttf": "96b657e72ecbabe0180908fa3e127c0a",
"assets/assets/fonts/SUIT-Light.ttf": "2185e45eb4f33131c2b92d63f16042f0",
"assets/assets/fonts/SUIT-SemiBold.ttf": "38149f1e21b2885dc2a8f3255a0447da",
"assets/assets/fonts/SUIT-Bold.ttf": "f4d7e66643bf584cb3f8f69acb6197af",
"assets/assets/fonts/SUIT-ExtraBold.ttf": "128eca73bbbd272aa834a6a48c7f6e08",
"assets/assets/fonts/SUIT-ExtraLight.ttf": "fda5779417c6fede085d081902dee959",
"assets/fonts/MaterialIcons-Regular.otf": "4667bae1e84a6514b4c01193727d47b1",
"assets/NOTICES": "db50d943dbc56ad6d0d0a191aa1965cf",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "552fb38507bb414fac78b093b4c5d8d8",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/FontManifest.json": "c09212502713b60631d9bc3155809ea5",
"assets/AssetManifest.bin": "c1ccd9372125899ccfccd61d52d57f61",
"assets/AssetManifest.json": "081813aa9d3a573c3c822cef2d03fa3d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"favicon.ico": "7b9dfd781a82f8d626ab36a15f9f9284",
"flutter_bootstrap.js": "f61b2ee3ba4cc434682616b988e3801a",
"version.json": "3be0fc023c66c0452066a5b8686bb807",
"main.dart.js": "fe8c9e4f7be4c1997670390bc294c6ea"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
!function(){try{var e="undefined"!=typeof window?window:"undefined"!=typeof global?global:"undefined"!=typeof globalThis?globalThis:"undefined"!=typeof self?self:{},n=(new e.Error).stack;n&&(e._sentryDebugIds=e._sentryDebugIds||{},e._sentryDebugIds[n]="da270aff-b9d6-5148-b285-1b66d47ba19a")}catch(e){}}();
//# debugId=da270aff-b9d6-5148-b285-1b66d47ba19a
