import Elm from '../src/Main.elm'

// Auth Ports
  var webAuth = new auth0.WebAuth({
    domain: 'plusonedatingapp.auth0.com', // e.g., you.auth0.com
    clientID: 'V9DXVz9ylA_oLNRcHimDzU-haA__LCKm',
    responseType: 'token',
    //redirectUri: 'http://localhost:8000/index.html',
    redirectUri: 'http://plusone.dating/index.html'
  });
  var storedProfile = localStorage.getItem('profile');
  var storedToken = localStorage.getItem('token');
  var authData = storedProfile && storedToken ? { profile: JSON.parse(storedProfile), token: storedToken } : null;
  
    //Removes splash and starts elm app.
    while (document.body.firstChild) {
        if ((Date.now() - start) > 1500) {
          document.body.removeChild(document.body.firstChild);
        }
      }
      //var app = Elm.Main.fullscreen();
  var elmApp = Elm.Main.fullscreen(authData);

  // Auth0 authorize subscription
  elmApp.ports.auth0authorize.subscribe(function (opts) {
    webAuth.authorize();
  });

  // Log out of Auth0 subscription
  elmApp.ports.auth0logout.subscribe(function (opts) {
    localStorage.removeItem('profile');
    localStorage.removeItem('token');
  });

  // Watching for hash after redirect
  webAuth.parseHash({ hash: window.location.hash }, function (err, authResult) {
    if (err) {
      return console.error(err);
    }
    if (authResult) {
      webAuth.client.userInfo(authResult.accessToken, function (err, profile) {
        var result = { err: null, ok: null };
        var token = authResult.accessToken;

        if (err) {
          result.err = err.details;
          // Ensure that optional fields are on the object
          result.err.name = result.err.name ? result.err.name : null;
          result.err.code = result.err.code ? result.err.code : null;
          result.err.statusCode = result.err.statusCode ? result.err.statusCode : null;
        }
        if (authResult) {
          result.ok = { profile: profile, token: token };
          localStorage.setItem('profile', JSON.stringify(profile));
          localStorage.setItem('token', token);
        }
        elmApp.ports.auth0authResult.send(result);
      });
      window.location.hash = '';
    }
  });