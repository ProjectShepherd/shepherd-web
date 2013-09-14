angular.module("app.home", [])

.controller "Home", ($scope, $http) ->

  $scope.geocoder = new google.maps.Geocoder()

  $scope.geoCodeLatLng = (lat, lng) ->
    latlng = new google.maps.LatLng(lat, lng)
    result = $scope.geocoder.geocode({'latLng': latlng}, (results, status) ->
      if (status == google.maps.GeocoderStatus.OK)
        if (results[1])
          console.log(results[1].formatted_address)
          return results[1].formatted_address
        else
          console.log('Unknown location')
          return 'unknown location'
      else
        console.log('Geocoder failed due to: ' + status)
        return 'failure'
    )

  $scope.web = (person) ->
    if(!person)
      'http://lorempixel.com/400/400/business/2'
    else
      if(!person.pictures[0])
        'http://lorempixel.com/400/400/business/2'
      else 
        person.pictures[0].web

  $scope.initPeople = () ->
    query = 'http://projectshepherd.herokuapp.com/missing_people'
    #TODO replace this dummy GET request with the real one
    $http.get('http://projectshepherd.herokuapp.com/missing_people')
      .success((data,status) ->
        console.log data
        $scope.people = data
        null
        )

      .error((data,status) ->
        console.log data)
