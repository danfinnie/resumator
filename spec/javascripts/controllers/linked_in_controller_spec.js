describe("LinkedInController", function() {
  var ctrl, scope, linkedInDeferred, $rootScope;

  beforeEach(function() {
    module('resumator');

    inject(['$controller', '$rootScope', '$q', function($controller, _$rootScope_, $q) {
      $rootScope = _$rootScope_;
      scope = $rootScope.$new();
      linkedInDeferred = $q.defer();
      var linkedIn = {
        getPromise: function() { return linkedInDeferred.promise; }
      };
      ctrl = $controller('LinkedInController', { $scope: scope, linkedIn: linkedIn });
    }]);
  });

  it("should handle LinkedIn data with aplomb", function() {
    expect(scope.linkedInData).not.toBeDefined();

    linkedInDeferred.resolve("hello");
    $rootScope.$apply();

    expect(scope.linkedInData).toBe("hello");
  });
});
