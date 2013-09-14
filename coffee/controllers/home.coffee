angular.module("app.home", [])

.controller "Home", ($scope, $http) ->

  $scope.initPeople () ->
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

