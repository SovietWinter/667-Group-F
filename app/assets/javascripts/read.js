var readControllers = angular.module('readControllers');

readControllers.controller("RouteController", ['$scope', '$location', '$http',
  function($scope, $location, $http){
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

readControllers.controller("HomeContoller", ['$scope', '$resource', '$location',
  function($scope, $resource, $location){
    Posts = $resource('/posts/recent', {format: 'json'});
    Posts.query(function(results){
      $scope.posts = results;
    });
    Post = $resource('/posts/:postId', {postId: '@id', format: 'json'},
    {
      'save':   {method:'PUT'}
    });
    $scope.recommend = function(index){
      console.log("hey");
      $scope.posts[index].num_recommends++;
      Post.save($scope.posts[index], function(){},function(error){
        console.log(error);
        $scope.posts[index].num_recommends--;
        alert('Sorry, something went wrong!');
      });
    }
    $scope.read = function(index){
      $location.path('/posts/' + $scope.posts[index].id);
    }
  }
]);

readControllers.controller("PostContoller", ['$scope', '$resource', '$routeParams', '$location',
  function($scope, $resource, $routeParams, $location){
    Post = $resource('/posts/:postId', {postId: '@id', format: 'json'});
    Post.get({postId: $routeParams.postId}, function(post){
      $scope.post = post;
    }, function(h){
      $scope.errors = "No post of id: " + $routeParams.postId;
    });
    $scope.de = function(s){
      console.log(s);
    }
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

readControllers.controller("ExploreContoller", ['$scope', '$resource', '$location',
  function($scope, $resource, $location){

  }
]);

$(document).ready(function() {
  var userUp = true;
  $('#user-click').on('click', function(){
    if(userUp){
      $('#user-menu').animate({top: '75px'},400, function(){
        userUp = false;
      });
    } else {
      $('#user-menu').animate({top: '-75px'},400, function(){
        userUp = true;
      });
    }
  });
});