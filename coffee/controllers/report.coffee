
angular.module("app.report", [])

.controller "Report", ($scope, $http, $q, FormList) ->
  
  $scope.eyeColors = FormList.eyes
  $scope.hairColors = FormList.hair
  $scope.raceChoices = FormList.race
  $scope.report = {}
  $scope.report.mName = null
  $scope.report.sex = "M"

  # TODO: delete
  $scope.report =
    fName : 'test'
    mName : 'middle'
    lName : 'user'
    height : 72
    age : 20
    weight : 160
    sex : 'M'
    complexion : 'fair'
    description : 'sldkfjsldfjsldfj'

  $scope.pickPhotos = () ->

    options =
      mimetypes  : 'image/*'
      maxsize   : 2000 * 1204
      persist   : true

    pics = []
    filepicker.pickMultiple(options, (Inkblobs) ->
      console.log Inkblobs
      console.log 'in loop'
      for blob in Inkblobs
        console.log 'in inner loop'
        pics.push convertBlob blob.url
        console.log blob.url
      null
    )


  # convert an InkBlob to thumbnail/mobile/web sizes
  convertBlob = (blob) ->
    console.log 'in ConvertBlob'
    # define intended file dimensions
    convert_options = [
      name    : 'thumbnail'
      options :
        width   : 100
        height  : 100
    ,
      name    : 'mobile'
      options : 
        width   : 400
        height  : 400
    ,
      name    : 'web'
      options:
        width   : 600
        height  : 600
    ]
    store_options = 
      location : 'S3'
      access  : 'public'

    pics = {}

    convert = (convOptions) ->
      filepicker.convert(blob, convOptions, store_options,
        (newInkblob) -> 
          console.log newInkblob
          # adding to pics object
          pics[conv.name] = newInkblob.url
          null
        , (FPError) ->
          null
        , (percent) ->
          # console.log percent/3
          null
      )


    # loop through conversion options
    for conv in convert_options 
      convert (conv.options)
      console.log 'in convert loop'
    return pics

  # create the report when the form is submitted
  $scope.makeReport = () ->
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
    # return # leave before breaking

    $http.post('http://projectshepherd.herokuapp.com/missing_people', data)
      .success (response) ->
        null
      .error (err) ->
        null
    null
  null
  

