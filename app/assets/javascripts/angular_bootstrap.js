resumator = angular.module('resumator', ['ngSanitize']);

resumator.run(['$http', function($http) {
  $http.defaults.headers.common.Accept = 'application/json';
}]);
