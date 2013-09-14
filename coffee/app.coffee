app = angular.module("app", ["app.home", "app.report", "app.search", "app.providers"])

app.config ["$routeProvider", ($routeProvider) ->

  $routeProvider

  .when "/create",
    templateUrl: "partials/report.html"
    controller: "Report"

  .when "/",
    templateUrl: "partials/home.html"
    controller: "Home"

  .when "/search",
    templateUrl: "partials/search.html"
    controller: "Search"
]

BASEURL = "XXXX"
