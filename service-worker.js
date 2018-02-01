// The SW will be shutdown when not in use to save memory,
// be aware that any global state is likely to disappear
console.log("SW startup");

self.addEventListener('install', function (event) {
  console.log("SW installed");
});

self.addEventListener('activate', function (event) {
  console.log("SW activated");

  // START CACHE CODE
  event.waitUntil(
    caches.open('PlusOne').then(function (cache) {
      return cache.addAll([
        'index.html',
        'Styles/plusOne.css',
        'Styles/tachyons.css',
        'PlusOnePWA.js',
        'Assets/WhitePlusOneLogo.svg'
      ]);
    })
  );
  // END CACHE CODE

});

self.addEventListener('fetch', function (event) {
  console.log("Caught a fetch!");
});
