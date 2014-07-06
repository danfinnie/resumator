resumator.controller('ResumePdfViewerController', ['$scope', function($scope) {
  function randomString() {
    return Math.random().toString(36).slice(2);
  }

  function loadData() {
    $scope.pdfUrl = "/resumes/" + window.resume_id + ".pdf?cacheBuster=" + randomString();
  }

  $scope.$on('resume:reload', loadData);
  loadData();
}]);
