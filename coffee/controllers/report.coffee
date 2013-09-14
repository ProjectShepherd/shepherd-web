
angular.module("app.report", [])

.controller "Report", ($scope, $http, $q, FormList) ->

  $scope.initForm = () ->
    $scope.eyeColors = FormList.eyes
    $scope.hairColors = FormList.hair
    $scope.raceChoices = FormList.race
    $scope.report = {}
    $scope.report.pics = []
    $scope.report.sex = "M"

  $scope.pickPhotos = () ->

    # initializes opitions lists for use
    upload_options = []
    convert_options = []
    store_options = []
    pics = {}
    initOptions = () ->
      upload_options =
        mimetypes  : 'image/*'
        maxsize   : 2000 * 1204
        persist   : true
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
      pics = []

    # uses one set of conversion options to convert an inkBlob
    # calls the passed in callback on completion w/ the new URL
    convert_blob_to_size = (blob, chosen_conv_options, callback) ->
      console.log 'converting a file to ' + chosen_conv_options.name
      filepicker.convert(blob, chosen_conv_options.options, store_options
        , (newInkblob) -> 
          console.log newInkblob
          url = {}
          url[chosen_conv_options.name] = newInkblob.url
          callback null, url
        , (FPError) ->
          console.log FPError
          null
        , (percent) ->
          null
      )

    # calls functions to convert the inkBlob to all conversion options
    convert_blot_to_all_sizes = (blob, conversion_options, finished_callback) ->
      # cheat using async to call everything synchronously
      async.parallel [
        (callback) ->
          convert_blob_to_size blob,conversion_options[0],callback
          null
      ,
        (callback) ->
          convert_blob_to_size blob,conversion_options[1],callback
          null
      ,
        (callback) ->
          convert_blob_to_size blob,conversion_options[2],callback
          null
      ],
      (err, results) ->
        console.log err
        console.log results

        picObj = {}
        for type,url of results
          picObj[type] = url
        $scope.report.pics.push picObj

    initOptions()
    # called on click
    # opens up the pick multiple dialog from filepicker
    filepicker.pickMultiple( upload_options, (Inkblobs) ->
      # called when files are picked
      console.log Inkblobs
      console.log 'in loop'
      for blob in Inkblobs
        console.log 'in inner loop'
        pics.push convert_blot_to_all_sizes blob, convert_options
        console.log blob.url
      null
    )

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
      initial_location :
        lat : report.latitude
        long : report.longitude
      submitter   : report.submitter
    console.log data

    output_data = 
      data : "{
      'fName': 'test',
      'mName': 'middle',
      'lName': 'user',
      'height': 72,
      'age': 20,
      'weight': 160,
      'sex': 'M',
      'complexion': 'fair',
      'description': 'sldkfjsldfjsldfj',
      'submitter': {
        'fName': 'ax',
        'mName': 'x',
        'lName': 'x',
        'phone': 'x',
        'email': 'x'
      },
      'pictures' : [
        {
          web: 'http://projectshepherd.herokuapp.com/test_photos/david-richardson.jpg',
          mobile: 'http://projectshepherd.herokuapp.com/test_photos/david-richardson.jpg'
          thumb: 'http://projectshepherd.herokuapp.com/test_photos/david-richardson.jpg'
        }
      ],
      'eyes': {
        'color': 'Gray'
      },
      'hair': {
        'color': 'Red'
      },
      'race': {
        'value': 'Other'
      }
    }"

    output_data = 
      data : JSON.stringify data
    $http.post('http://projectshepherd.herokuapp.com/missing_people', output_data)
      .success (response) ->
        null
      .error (err) ->
        null
    null

  null
  

