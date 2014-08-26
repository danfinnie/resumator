resumator.controller('LinkedInController', ['$scope', 'linkedIn', function ($scope, linkedIn) {
  linkedIn.getPromise().then(function(linkedInData) {
    $scope.linkedInData = linkedInData;
  });
}]);
