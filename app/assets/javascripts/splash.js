var splashControllers = angular.module('splashControllers');

splashControllers.controller("RouteController", ['$scope', '$location',
  function($scope, $location){
    $scope.route = function(route){
      $location.path(route);
    }
  }
]);

splashControllers.controller("IndexContoller", [ '$scope', '$routeParams', '$location', '$resource',
  function($scope, $routeParams, $location, $resource){

  }
]);

splashControllers.controller("SignupContoller", [ '$scope', '$routeParams', '$location', '$resource',
  function($scope, $routeParams, $location, $resource){
    $scope.user = {}
    User = $resource('/users/', {format: 'json'},
    {
        'save':   {method:'PUT'},
        'create': {method:'POST'}
    });

    $scope.signup = function(){
      onError = function(_httpResponse){
        console.log(_httpResponse);
        $scope.errors = _httpResponse.data;
        // flash.error = errors;
      }
      User.create($scope.user, function(response){
        window.location.href = "/"
      }, onError);
    }
  }
]);

splashControllers.controller("ExploreContoller", [ '$scope', '$routeParams', '$location', '$resource',
  function($scope, $routeParams, $location, $resource){

  }
]);

$(document).ready(function() {
  var loginUp = true;
  $('#login-click').on('click', function(){
    if(loginUp){
      $('#login-slider').animate({top: '65px'},400, function(){
        loginUp = false;
      });
    } else {
      $('#login-slider').animate({top: '-170px'},400, function(){
        loginUp = true;
      });
    }
  });
});