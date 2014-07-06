resumator.controller('EverythingController', ['$scope', '$http', '$sce', function($scope, $http, $sce) {
  $http.get('/jobs').then(function (response) {
    var jobs = response.data;
    angular.forEach(jobs, function(job) {
      job.description.html = $sce.trustAsHtml(job.description.html);
    });
    $scope.jobs = jobs;
  });

  $http.get('/educations').then(function (response) {
    var educations = response.data;
    angular.forEach(educations, function(education) {
      education.description.html = $sce.trustAsHtml(education.description.html);
    });
    $scope.educations = educations;
  });

  $scope.$watch('jobs', function () {
    $scope.selected_jobs = $scope.jobs.filter(function (job) {
        return job.selected;
    });
  }, true);

  $scope.$watch('educations', function () {
    $scope.selected_educations = $scope.educations.filter(function (education) {
        return education.selected;
    });
  }, true);
}]);
