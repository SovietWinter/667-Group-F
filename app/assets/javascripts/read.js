var readControllers = angular.module('readControllers');

readControllers.controller("HomeContoller", ['$scope', '$resource', '$location',
  function($scope, $resource){
    Post = $resource('/posts/', {format: 'json'});
    Post.query(function(results){
      $scope.posts = results;
    })
  }
]);

readControllers.controller("PostContoller", ['$scope', '$resource', '$routeParams', '$location',
  function($scope, $resource, $routeParams, $location){

  }
]);

readControllers.controller("BlogContoller", ['$scope', '$resource', '$routeParams', '$location',
  function($scope, $resource, $routeParams, $location){

  }
]);

readControllers.controller("FollowContoller", ['$scope', '$resource', '$location',
  function($scope, $resource, $location){

  }
]);