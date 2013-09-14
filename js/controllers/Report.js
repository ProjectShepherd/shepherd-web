
angular.module('app.report', [])

.controller('Report', function ($scope, $http, FormList) {
    console.log('MAKING A REPORT');
    $scope.eyeColors = FormList.eyes;
    $scope.hairColors = FormList.hair;
    $scope.raceChoices = FormList.race;
    $scope.report = {};

    $scope.report.sex = 'M';

    $scope.makeReport = function () {
        console.log('REPORT MADE');
        var data = $scope.report;

        // processing

        $http.post(data)
            .success( function (response) {
                
            })
            .error( function (err) {
                
            });
    };
});
