angular.module("app.home", [])

.controller "Home", ($scope, $http) ->

  $scope.test = "TEST"
    
  $scope.loadInitial ->
    $http.post(data)
    .success((response) ->)
    .error((err) ->)
