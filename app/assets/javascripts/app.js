var synth = angular.module('synth',[
  'templates',
  'ngRoute',
  'ngResource',
  'splashControllers'
]);

synth.config([ '$routeProvider',
  function($routeProvider){
    $routeProvider
      .when('/', {
        templateUrl: "splash.html",
        controller: 'SplashContoller'
      });
  }
]);

home_controllers = angular.module('splashControllers',[]);