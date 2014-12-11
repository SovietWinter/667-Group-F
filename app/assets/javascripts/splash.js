var splashControllers = angular.module('splashControllers');

splashControllers.controller("RouteController", ['$scope', '$location',
  function($scope, $location){
    $scope.route = function(route){
      $location.path(route);
    }
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
        window.scrollTo(0,document.body.scrollHeight);
      }
      User.create($scope.user, function(response){
        window.location.href = "/";
      }, onError);
    }
  }
]);

splashControllers.controller("ExploreContoller", [ '$scope', '$routeParams', '$location', '$resource',
  function($scope, $routeParams, $location, $resource){
    Tops = $resource('/posts/', {format: 'json'});
    Tops.query(function(results){
      var sorted = results.sort(function(a, b){
        if (a.num_recommends+a.bookmarkings.length >= b.num_recommends + b.bookmarkings.length)
          return -1;
        else
          return 1;
      });
      $scope.posts = sorted;
    });
  }
]);

splashControllers.controller("ReadContoller", [ '$scope', '$routeParams', '$location', '$resource',
  function($scope, $routeParams, $location, $resource){
    Post = $resource('/posts/:postId', {postId: '@id', format: 'json'});
    Post.get({postId: $routeParams.postId}, function(post){
      $scope.post = post;
    }, function(h){
      $scope.errors = "No post of id: " + $routeParams.postId;
    });
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
      $('#login-slider').animate({top: '-195px'},400, function(){
        loginUp = true;
      });
    }
  });
});