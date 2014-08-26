function onLinkedInLoad() {
  IN.Event.on(IN, "auth", function() {
    onLinkedInLogin();
  });
  IN.Event.on(IN, "logout", function() {
    onLinkedInLogout();
  });
}

function onLinkedInLogin() {
  // pass user info to angular
  angular.element($("#yolo")).scope().$apply(
    function($scope) {
      $scope.getLinkedInData();
    }
  );
}

resumator.controller('LinkedInController', ['$scope', '$http', '$rootScope', '$q', function ($scope, $http, $rootScope, $q) {
  $scope.test = "hello bob";

  var linkedInThings = [
    // 'last-modified-timestamp',
    // 'proposal-comments',
    'associations',
    'interests',
    'publications',
    'patents',
    'languages',
    'skills',
    // 'certifications',
    // 'educations',
    // 'courses',
    // 'volunteer',
    // 'three-current-positions',
    // 'three-past-positions',
    // 'num-recommenders',
    // 'recommendations-received',
    // 'mfeed-rss-url',
    // 'following',
    // 'job-bookmarks',
    // 'suggestions',
    // 'date-of-birth',
    // 'member-url-resources',
    // 'member-url-resources:(url)',
    // 'member-url-resources:(name)',
    // 'related-profile-views',
    // 'honors-awards',
  ]

  $scope.getLinkedInData = function () {
    IN.API.Profile("me").fields(linkedInThings).result(function(){debugger; console.log(arguments[0].values[0])});
  };
}]);
