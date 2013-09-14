angular.module("app.search", [])

.controller "Search", ($scope, $http, $location) ->

  $scope.checkResults = () ->
    if $scope.people
      return false
    else
      return true

  $scope.web = (person) ->
    if(!person)
      'http://lorempixel.com/400/400/business/2'
    else
      if(!person.pictures[0])
        'http://lorempixel.com/400/400/business/2'
      else 
        person.pictures[0].web

  $scope.navigateToSearch = (params) ->
    if (params != undefined)
      $location.path('/search').search('q='+params.query)
    null

  $scope.initPeople = () ->
    #TODO replace this dummy GET request with the real one
    params = $location.search()

    $http({
      url: 'http://projectshepherd.herokuapp.com/missing_people',
      method: "GET",
      params: {q: params.q}
    }).success((data,status) ->
        $scope.people = data 
        null)

      .error((data,status) ->
        console.log data)
