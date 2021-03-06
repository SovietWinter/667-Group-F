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

readControllers.controller("HomeContoller", ['$scope', '$resource', '$location', '$http',
  function($scope, $resource, $location, $http){
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

    $scope.bookmark = function(post){
      $http.post("/bookmarks/create", {post_id: post.id}).success(function(d, s, h, c){
        post.bookmarkings.length++;
      });
    }

    $scope.read = function(index){
      $location.path('/posts/' + $scope.posts[index].id);
    }
    $scope.blog = function(index){
      $location.path('/blogs/' + $scope.posts[index].user_id);
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
  }
]);

readControllers.controller("BlogContoller", ['$scope', '$resource', '$routeParams', '$location', '$http',
  function($scope, $resource, $routeParams, $location, $http){

    User = $resource('/users/:userId', {userId: '@id', format: 'json'});
    User.get({userId: $routeParams.userId}, function(user){
      $scope.user = user;
    }, function(h){
      $scope.errors = "No user of id: " + $routeParams.userId;
    });

    $scope.following = {};
    $scope.following.state = false;
    $scope.following.label = "follow";

    $http.get('/isfollowing/' + $routeParams.userId, {format: 'json'}).success(function(d,s,h,c){
      $scope.following.state = true;
      $scope.following.label = "following";
    }).error(function(){});

    $scope.recommend = function(index){
      $scope.posts[index].num_recommends++;
      Post.save($scope.posts[index], function(){},function(error){
        console.log(error);
        $scope.posts[index].num_recommends--;
        alert('Sorry, something went wrong!');
      });
    }

    $scope.bookmark = function(post){
      $http.post("/bookmarks/create", {post_id: post.id}).success(function(d, s, h, c){
        post.bookmarkings.length++;
      });
    }

    $scope.read = function(index){
      $location.path('/posts/' + $scope.posts[index].id);
    }

    $scope.follow = function(){
      if(!$scope.following.state){
        $http.post("/follow/" + $routeParams.userId, {user_id: $routeParams.userId}).success(function(d, s, h, c){
          $scope.following.state = !$scope.follow.state;
          $scope.following.label = "following"
        });
      } else {
        $http.delete("/unfollow/" + $routeParams.userId, {user_id: $routeParams.userId}).success(function(d, s, h, c){
          $scope.following.state = !$scope.follow.state;
          $scope.following.label = "follow"
        });
      }
    }
  }
]);

readControllers.controller("FollowContoller", ['$scope', '$resource', '$location',
  function($scope, $resource, $location){

  }
]);

readControllers.controller("ExploreContoller", [ '$scope', '$routeParams', '$location', '$resource',
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

readControllers.controller("AccountContoller", ['$scope', '$resource', '$location',
  function($scope, $resource, $location){
    User = $resource('/users/:userId', {userId: '@id',format: 'json'},
    {
        'save':   {method:'PUT'},
    });

    $scope.newUser = {}
    var newUser = {};
    User.get({userId: 'current'}, function(results){
      $scope.user = results;
      $scope.newUser.id = results.id;
    });

    $scope.updateInfo = function(){
      onError = function(_httpResponse){
        console.log(_httpResponse);
        $scope.errors = _httpResponse.data;
        window.scrollTo(0,document.body.scrollHeight);
      }
      console.log($scope.newUser);
      User.save($scope.newUser, function(response){
        window.location.href = "/#/account";
      }, onError);
    }
  }
]);

$(document).ready(function() {
  var userUp = true;
  $('#user-click').on('click', function(){
    if(userUp){
      $('#user-menu').animate({top: '-30px'},400, function(){
        userUp = false;
      });
    } else {
      $('#user-menu').animate({top: '-225px'},400, function(){
        userUp = true;
      });
    }
  });
});