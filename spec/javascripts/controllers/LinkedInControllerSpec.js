describe("LinkedInController", function() {
  var ctrl, scope;

  beforeEach(function() {
    module('resumator');

    inject(['$controller', '$rootScope', function($controller, $rootScope) {
      scope = $rootScope.$new();
      ctrl = $controller('LinkedInController', { $scope: scope });
    }]);
  });

  it("should be able to get into Angular land", function() {
    expect(scope.test).toBe("hello bob");
  });
});
