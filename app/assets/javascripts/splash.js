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

splashControllers.controller("LoginContoller", [ '$scope', '$routeParams', '$location', '$resource',
  function($scope, $routeParams, $location, $resource){

  }
]);

splashControllers.controller("ExploreContoller", [ '$scope', '$routeParams', '$location', '$resource',
  function($scope, $routeParams, $location, $resource){

  }
]);