
angular.module('app.report', [])

.controller('Report', function ($scope, FormList) {
    console.log('MAKING A REPORT');
    $scope.eyeColors = FormList.eyes;
    $scope.hairColors = FormList.hair;
    $scope.raceChoices = FormList.race;
    $scope.report = {};

    $scope.report.sex = 'M';

    $scope.makeReport = function () {
        console.log('REPORT MADE');
    };
});
