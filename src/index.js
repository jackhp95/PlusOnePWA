import './main.css';
import { Main } from './elm/Main.elm';
import registerServiceWorker from './registerServiceWorker';

registerServiceWorker();

// Auth Ports
const homeUri = window.location.href;
console.log(homeUri);
var webAuth = new auth0.WebAuth({
    domain: 'plusonedatingapp.auth0.com', // e.g., you.auth0.com
    clientID: 'V9DXVz9ylA_oLNRcHimDzU-haA__LCKm',
    responseType: 'token id_token',
    //redirectUri: 'http://localhost:8000/index.html',
    // redirectUri: 'http://plusone.dating/index.html'
    redirectUri: homeUri
});
var storedProfile = localStorage.getItem('profile');
var storedToken = localStorage.getItem('token');
var storedIdToken = localStorage.getItem('idtoken');
var authData = storedProfile && storedToken && storedIdToken ? { profile: JSON.parse(storedProfile), token: storedToken, idtoken: storedIdToken } : null;

//Removes splash and starts elm app.
while (document.getElementById('splash')) {
    if ((Date.now() - start) > 1500) {
        document.body.removeChild(document.getElementById('splash'));
    }
}
var root = document.getElementById('root');
var elmApp = Main.embed(root, authData);


// Auth0 authorize subscription
elmApp.ports.auth0authorize.subscribe(function (opts) {
    webAuth.authorize();
});


// Log out of Auth0 subscription
elmApp.ports.auth0logout.subscribe(function (opts) {
    localStorage.removeItem('profile');
    localStorage.removeItem('token');
    localStorage.removeItem('idtoken');
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
            var sub = authResult.idTokenPayload.sub;

            if (err) {
                result.err = err.details;
                // Ensure that optional fields are on the object
                result.err.name = result.err.name ? result.err.name : null;
                result.err.code = result.err.code ? result.err.code : null;
                result.err.statusCode = result.err.statusCode ? result.err.statusCode : null;
            }
            if (authResult) {
                result.ok = { profile: profile, token: token, idtoken: sub };
                localStorage.setItem('profile', JSON.stringify(profile));
                localStorage.setItem('token', token);
                localStorage.setItem('idtoken', sub);
            }
            elmApp.ports.auth0authResult.send(result);
        });
        window.location.hash = '';
    }
});