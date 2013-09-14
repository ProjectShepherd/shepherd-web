
var app = angular.module('app', [
    'app.home',
    'app.report'
]);

app.config( ['$routeProvider', function ($routeProvider) {
    $routeProvider

        .when('/',      {templateUrl: 'partials/home.html',     controller: 'Home'});
}]);
