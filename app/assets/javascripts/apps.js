// SPLASH NOT LOGGED IN

var splash = angular.module('splash',[
  'templates',
  'ngRoute',
  'ngResource',
  'splashControllers',
  'ngAnimate'
]);

splash.config([ '$routeProvider',
  function($routeProvider){
    $routeProvider
      .when('/', {
        templateUrl: "splash.html"
      });
    $routeProvider
      .when('/signup', {
        templateUrl: "signup.html",
        controller: 'SignupContoller'
      });
    $routeProvider
      .when('/explore', {
        templateUrl: "explore.html",
        controller: 'ExploreContoller'
      });
    $routeProvider
      .when('/posts/postId', {
        templateUrl: "post.html",
        controller: 'PostContoller'
      });
  }
]);

splashControllers = angular.module('splashControllers',[]);

// READ LOGGED IN

var read = angular.module('read',[
  'templates',
  'ngRoute',
  'ngResource',
  'readControllers',
  'btford.markdown',
  'ngAnimate',
  'naif.base64'
]);

read.config([ '$routeProvider',
  function($routeProvider){
    $routeProvider
      .when('/', {
        templateUrl: "home.html",
        controller: "HomeContoller"
      });
    $routeProvider
      .when('/posts/:postId', {
        templateUrl: "post.html",
        controller: "PostContoller"
      });
    $routeProvider
      .when('/blogs/:userId', {
        templateUrl: "blog.html",
        controller: "BlogContoller"
      });
    $routeProvider
      .when('/follow', {
        templateUrl: "follow.html",
        controller: "FollowContoller"
      });
    $routeProvider
      .when('/explore', {
        templateUrl: "explore.html",
        controller: "ExploreContoller"
      });
    $routeProvider
      .when('/account', {
        templateUrl: "account.html",
        controller: "AccountContoller"
      });
  }
]);

readControllers = angular.module('readControllers',[]);

// COMPOSE LOGGED IN

var compose = angular.module('compose',[
  'templates',
  'ngRoute',
  'ngResource',
  'composeControllers',
  'btford.markdown',
  'ngAnimate',
  'naif.base64'
]);

compose.config([ '$routeProvider',
  function($routeProvider){
    $routeProvider
      .when('/', {
        templateUrl: "synths.html",
        controller: "SynthsController"
      });
    $routeProvider
      .when('/edit/:postId', {
        templateUrl: "compose.html",
        controller: "ComposeController"
      });
    $routeProvider
      .when('/compose/:userId/publish', {
        templateUrl: "public.html",
        controller: "PublishContoller"
      });
    $routeProvider
      .when('/account', {
        templateUrl: "account.html",
        controller: "AccountContoller"
      });
    $routeProvider
      .when('/edit', {
        templateUrl: "compose.html",
        controller: "ComposeController"
      });
  }
]);

composeControllers = angular.module('composeControllers',[]);