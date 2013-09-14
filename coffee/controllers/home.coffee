angular.module("app.home", [])

.controller "Home", ($scope, $http) ->
  $scope.initPeople = () ->
    #TODO replace this dummy GET request with the real one
    $http.get('http://projectshepherd.herokuapp.com/missing_people')
      .success((data,status) ->
        $scope.people = data
        null
        )

      .error((data,status) ->
        console.log data)
