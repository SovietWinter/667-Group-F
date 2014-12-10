var composeControllers = angular.module('composeControllers');

composeControllers.controller("RouteController", ['$scope', '$location', '$http',
  function($scope, $location, $http){
    $scope.nav = {}
    $scope.route = function(route){
      $location.path(route);
    }
    $scope.logout = function(){
      $http.delete("/logout").success(function(d, s, h, c) {
        window.location.href = "/";
      }).error(function(d,s,h,c){
        console.log(d);
      });
    }
  }
]);

composeControllers.controller("SynthsController", ['$scope', '$location', '$resource',
  function($scope, $location, $resource){
    $scope.nav.left = "home";
    $scope.nav.Left  = function(){window.location.href = "/";}
    $scope.nav.right = "new synth";
    $scope.nav.Right = function(){$scope.route('/edit')};

    Posts = $resource('/drafts', {format: 'json'});
    Posts.query(function(results){
      $scope.posts = results;
    });

    $scope.edit = function(postid){
      $location.path('/edit/' + postid);
    }

  }
]);

composeControllers.controller("ComposeController", ['$scope', '$location', '$resource', '$routeParams',
  function($scope, $location, $resource, $routeParams){
    $scope.nav.left = "save & exit";
    $scope.nav.Left  = function(){$location.path('/');}
    $scope.nav.right = "review & publish";
    $scope.nav.Right = function(){$scope.route('/publish/')};

  }
]);

$(document).ready(function() {
  var userUp = true;
  $('#user-click').on('click', function(){
    if(userUp){
      $('#user-menu').animate({top: '85px'},400, function(){
        userUp = false;
      });
    } else {
      $('#user-menu').animate({top: '-75px'},400, function(){
        userUp = true;
      });
    }
  });
});