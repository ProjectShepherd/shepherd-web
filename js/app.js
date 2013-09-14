
var app = angular.module('app', [
    'app.home'
]);

app.config( ['$routeProvider', function ($routeProvider) {
    $routeProvider

        .when('/',      {templateUrl: 'partials/home.html',     controller: 'Home'});
}]);
