angular.module("app.home", [])

.controller "Home", ($scope, $http) ->

  $scope.initPeople = () ->
    #TODO replace this dummy GET request with the real one
    $http.get('#/create')
      .success((data,status) ->
        console.log data
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
