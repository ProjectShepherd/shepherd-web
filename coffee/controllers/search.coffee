angular.module("app.search", [])

.controller "Search", ($scope, $http, $location) ->

  $scope.navigateToSearch = (params) ->
    if (params != undefined)
      $location.path('/search').search('q='+params.query)
    null

  $scope.initPeople = () ->
    #TODO replace this dummy GET request with the real one
    query = $location.search()
    console.log query

    $http.get('#/create')
      .success((data,status) ->
        $scope.people = [{firstname:'Abraham', lastname:"Lincoln", age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'John', lastname:'Doe', age:42, location:"San Francisco"},
                        {firstname: 'Bob', lastname:'Dole', age:42, location:"San Francisco"}
                        ]
        null
        )

      .error((data,status) ->
        console.log data)
