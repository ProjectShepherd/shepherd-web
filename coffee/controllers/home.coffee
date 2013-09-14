angular.module("app.home", [])

.controller "Home", ($scope, $http) ->

  $scope.web = (person) ->
    if(!person)
      'http://lorempixel.com/400/400'
    else
      if(!person.pictures[0])
        'http://lorempixel.com/400/400'
      else 
        person.pictures[0].web

  $scope.initPeople = () ->
    query = 'http://projectshepherd.herokuapp.com/missing_people'
    #TODO replace this dummy GET request with the real one
    $http.get('http://projectshepherd.herokuapp.com/missing_people')
      .success((data,status) ->
        console.log data
        $scope.people = data
        null
        )

      .error((data,status) ->
        console.log data)
