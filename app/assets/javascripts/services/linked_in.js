resumator.service('linkedIn', ['$q', '$window', function ($q, $window) {
  var linkedInThings = [
    'associations',
    'interests',
    'publications',
    'patents',
    'languages',
    'skills',
    'positions',
    'educations',
    // 'last-modified-timestamp',
    // 'proposal-comments',
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
  ];

  var deferred = $q.defer();

  $window.onLinkedInLoad = function() {
    IN.Event.on(IN, "auth", function() {
      IN.API.Profile("me").fields(linkedInThings).result(function() {
        deferred.resolve(arguments);
      });
    });

    // IN.Event.on(IN, "logout", function() {
      // onLinkedInLogout();
    // });
  };

  this.getPromise = function() {
    return deferred.promise;
  };
}]);
