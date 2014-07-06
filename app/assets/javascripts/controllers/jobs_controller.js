resumator.controller('JobsController', ['$scope', '$http', '$sce', function($scope, $http, $sce) {
  $http.get('/jobs').then(function (response) {
    var jobs = response.data;
    angular.forEach(jobs, function(job) {
      job.description.html = $sce.trustAsHtml(job.description.html);
    });
    $scope.jobs = jobs;
  });

  $scope.$watch('jobs', function () {
    $scope.selected_jobs = $scope.jobs.filter(function (job) {
        return job.selected;
    });
  }, true);
}]);
