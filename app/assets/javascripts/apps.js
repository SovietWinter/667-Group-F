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
  }
]);

splashControllers = angular.module('splashControllers',[]);

var read = angular.module('read',[
  'templates',
  'ngRoute',
  'ngResource',
  'readControllers'
]);

// READ LOGGED IN

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
  }
]);

readControllers = angular.module('readControllers',[]);

// COMPOSE LOGGED IN
// ...