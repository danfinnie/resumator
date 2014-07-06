resumator.controller('JobsController', ['$scope', '$resource', function($scope, $resource) {
  var Job = $resource('/jobs/:jobId')
  $scope.jobs = Job.query();
}]);
