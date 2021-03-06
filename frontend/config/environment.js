/* jshint node: true */

// import Configuration from 'ember-simple-auth/configuration';

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'frontend',
    environment: environment,
    baseURL: '/frontend',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  ENV['ember-simple-auth'] = {
    authorizer: 'authorizer-token',
    authenticationRoute: 'login',               // default value
    routeAfterAuthentication: 'index',          // default value
    routeIfAlreadyAuthenticated: 'index',       // default value
  };

  ENV['ember-simple-auth-token'] = {
    serverTokenEndpoint: '/api/token-auth/',     // default value
    identificationField: 'user_email',
    passwordField: 'user_password',
    tokenPropertyName: 'user_token',
    authorizationPrefix: 'Bearer ',              // default value
    authorizationHeaderName: 'Authorization',    // default value
    headers: {},
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
    ENV.APP.API_HOST = "http://localhost:4000";
    ENV.APP.API_ID = 'munishapc@gmail.com';
    ENV.APP.API_TOKEN = 'EDqxKSvfQKswPZYf1wW7';
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {
    ENV.APP.API_HOST = "http://manage-words.herokuapp.com/";
    ENV.APP.API_ID = 'munishapc@gmail.com';
    ENV.APP.API_TOKEN = 'EDqxKSvfQKswPZYf1wW7';
  }

  return ENV;
};
