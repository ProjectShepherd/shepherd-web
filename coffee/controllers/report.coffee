
angular.module("app.report", [])

.controller "Report", ($scope, $http, FormList) ->

  $scope.eyeColors = FormList.eyes
  $scope.hairColors = FormList.hair
  $scope.raceChoices = FormList.race
  $scope.report = {}
  $scope.report.sex = "M"

  $scope.makeReport = ->
    console.log "REPORT MADE"
    data = $scope.report
    
    # processing

    $http.post(data)
      .success(response) ->
        console.log response
      .error(err) ->
        console.log err
