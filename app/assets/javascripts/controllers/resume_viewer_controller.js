resumator.controller('ResumeViewerController', ['$scope', '$http', '$sce', function($scope, $http, $sce) {
  function trustDescriptionHtml(ary) {
    angular.forEach(ary, function(item) {
      item.description.html = $sce.trustAsHtml(item.description.html);
    });
    return ary;
  };

  function loadData() {
    $http.get('/resumes/' + window.resume_id).then(function (response) {
      $scope.jobs = trustDescriptionHtml(response.data.jobs);
      $scope.educations = trustDescriptionHtml(response.data.educations);
    });
  }

  $scope.$on('resume:reload', loadData);
  loadData();
}]);
