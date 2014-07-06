resumator.controller('ResumeUpdaterController', ['$scope', '$http', '$rootScope', function ($scope, $http, $rootScope) {
  $http.get('/jobs').then(function (response) {
    $scope.jobs = response.data;
  });

  $http.get('/educations').then(function (response) {
    $scope.educations = response.data;
  });

  $http.get('/resumes/' + window.resume_id).then(function (response) {
    $scope.resume = response.data;
  });

  function findSelectedIds(ary) {
    return ary.filter(function(item) {
      return item.selected;
    }).map(function(item) {
      return item.id;
    });
  }

  $scope.updateServer = function () {
    $http.put($scope.resume.url, {
      resume: {
        name: $scope.resume.name,
        job_ids: findSelectedIds($scope.jobs),
        education_ids: findSelectedIds($scope.educations)
      }
    }).then(function () {
      $rootScope.$broadcast('resume:reload');
    });
  };
}]);
