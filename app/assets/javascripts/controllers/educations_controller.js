resumator.controller('EducationsController', ['$scope', '$http', '$rootScope', '$q', function ($scope, $http, $rootScope, $q) {
  $scope.newEducation = {};

  function updateData() {
    $http.get('/educations').then(function (response) {
      $scope.educations = response.data;
    });
  }

  $scope.delete = function (education) {
    $http.delete('/educations/' + education.id).then(function() {
      updateData();
    });
  };

  $scope.toggleShowAddForm = function () {
    $scope.showAddForm = !$scope.showAddForm;
  };

  $scope.save = function () {
    $http.post('/educations', $scope.newEducation).then(function () {
      updateData();
    });
    $scope.showAddForm = false;
  }

  updateData();
}]);
