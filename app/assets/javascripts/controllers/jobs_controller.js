resumator.controller('JobsController', ['$scope', '$http', '$rootScope', '$q', function ($scope, $http, $rootScope, $q) {
  $scope.newJob = {};

  function updateData() {
    $http.get('/jobs').then(function (response) {
      $scope.jobs = response.data;
    });
  }

  $scope.delete = function (job) {
    $http.delete('/jobs/' + job.id).then(function() {
      updateData();
    });
  };

  $scope.toggleShowAddForm = function () {
    $scope.showAddForm = !$scope.showAddForm;
  };

  $scope.save = function () {
    $http.post('/jobs', $scope.newJob).then(function () {
      updateData();
    });
    $scope.showAddForm = false;
  }

  updateData();
}]);
