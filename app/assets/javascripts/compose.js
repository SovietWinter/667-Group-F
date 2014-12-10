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

composeControllers.controller("SynthsController", ['$scope', '$location', '$resource', '$http',
  function($scope, $location, $resource, $http){
    $scope.nav.left = "home";
    $scope.nav.Left  = function(){window.location.href = "/";}
    $scope.nav.right = "new synth";
    $scope.nav.Right = function(){$scope.route('/edit')};

    Posts = $resource('/drafts', {format: 'json'});
    Posts.query(function(results){
      $scope.posts = results;
    });

    Bookmarks = $resource('/users/bookmarks', {format: 'json'});
    Bookmarks.query(function(results){
      $scope.bookmarks = results;
    });

    $scope.edit = function(postid){
      $location.path('/edit/' + postid);
    }

    $scope.delete = function(p){
      $http.delete("/posts/" + p.id).success(function(d, s, h, c) {
        window.location.href = "/compose/";
      }).error(function(d,s,h,c){
        console.log(d);
      });
    }

    $scope.read = function(postId){
      window.location.href = "/#/posts/" + postId;
    }

  }
]);

composeControllers.controller("ComposeController", ['$scope', '$location', '$resource', '$routeParams',
  function($scope, $location, $resource, $routeParams){
    $scope.nav.left = "save & exit";
    $scope.nav.Left  = function(){$scope.save();}
    $scope.nav.right = "publish";
    $scope.nav.Right = function(){$scope.publish();};

    Post = $resource('/posts/:postId', {postId: '@id', format: 'json'},
    {
      'create': {method:'POST'},
      'save':   {method:'PUT'}
    });


    $scope.publish = function(){
      $scope.post.published = true;
      onError = function(_httpResponse){
        console.log(_httpResponse);
        $scope.errors = _httpResponse.data;
        window.scrollTo(0,document.body.scrollHeight);
      }
      if($scope.post.id){
        $scope.post.$save(function(){
          window.location.href = "/#/posts/" + $scope.post.id;
        }, onError);
      } else {
        Post.create($scope.post, function(response){
          window.location.href = "/#/posts/" + response.id;
        }, onError);
      }
    }

    $scope.save = function(){
      onError = function(_httpResponse){
        console.log(_httpResponse);
        $scope.errors = _httpResponse.data;
        window.scrollTo(0,document.body.scrollHeight);
      }
      if($scope.post.id){
        $scope.post.$save(function(){
          $location.path('/');
        }, onError);
      } else {
        $scope.post.published = false;
        Post.create($scope.post, function(response){
          $location.path('/');
        }, onError);
      }
    }

    if ($routeParams.postId){
      Post.get({postId: $routeParams.postId}, function(post){
        $scope.post = post;
      }, function(h){
        $scope.errors = "No post of id: " + $routeParams.postId;
      });
    } else {
      $scope.post = {};
    }
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

composeControllers.controller("AccountContoller", ['$scope', '$resource', '$location',
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