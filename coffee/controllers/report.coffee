
angular.module("app.report", [])

.controller "Report", ($scope, $http, FormList) ->

  $scope.eyeColors = FormList.eyes
  $scope.hairColors = FormList.hair
  $scope.raceChoices = FormList.race
  $scope.report = {}
  $scope.report.mName = null
  $scope.report.sex = "M"

  $scope.report =
    fName : 'test'
    mName : 'middle'
    lName : 'user'
    height : 72
    age : 20
    weight : 160
    sex : 'M'
    eyes :
      color : 'Brown'
    hair :
      color : 'Brown'
    race : 
      value : 'Caucasian'
    complexion : 'fair'
    description : 'sldkfjsldfjsldfj'

  $scope.makeReport = ->
    console.log "REPORT MADE"
    report = $scope.report
   
    data = 
      first_name  : report.fName
      middle_name : report.mName
      last_name   : report.lName
      age         : report.height
      height      : report.height
      weight      : report.weight
      sex         : report.sex
      hair_color  : report.hair.color
      eye_color   : report.eyes.color
      race        : report.race.value
      description : report.description
      submitter   : report.submitter

    console.log data

    return

    $http.post('API/missing_persons', data)
      .success(response) ->
        console.log response
      .error(err) ->
        console.log err
