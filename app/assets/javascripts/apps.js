// SPLASH NOT LOGGED IN

var splash = angular.module('splash',[
  'templates',
  'ngRoute',
  'ngResource',
  'splashControllers'
]);

splash.config([ '$routeProvider',
  function($routeProvider){
    $routeProvider
      .when('/', {
        templateUrl: "splash.html",
        controller: 'IndexContoller'
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
  }
]);

splashControllers = angular.module('splashControllers',[]);

// READ LOGGED IN

var read = angular.module('read',[
  'templates',
  'ngRoute',
  'ngResource',
  'readControllers'
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
  }
]);

readControllers = angular.module('readControllers',[]);

// COMPOSE LOGGED IN
// ...