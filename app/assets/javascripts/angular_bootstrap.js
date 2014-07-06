resumator = angular.module('resumator', ['ngResource']);

resumator.run(['$http', function($http) {
  $http.defaults.headers.common.Accept = 'application/json';
}]);
