
app = angular.module("app", ["app.home", "app.report", "app.providers"])

app.config ["$routeProvider", ($routeProvider) ->

  $routeProvider

  .when "/create",
    templateUrl: "partials/report.html"
    controller: "Report"

  .when "/",
    templateUrl: "partials/home.html"
    controller: "Home"
]

BASEURL = "XXXX"
