resumator.controller('LinkedInController', ['$scope', 'linkedIn', 'linkedInDateParser', '$http', function ($scope, linkedIn, linkedInDateParser, $http) {
  linkedIn.getPromise().then(function(linkedInData) {
    $scope.linkedInData = linkedInData;

    linkedInData["0"]["values"][0]["positions"]["values"].forEach(function(position) {
      $http.post('/jobs', {
        place: position.company.name,
        title: position.title,
        description: position.summary,
        started_at: linkedInDateParser.parse(position.startDate),
        ended_at: linkedInDateParser.parse(position.endDate),
      });
    });

    linkedInData["0"]["values"][0]["educations"]["values"].forEach(function(education) {
      $http.post('/educations', {
        place: education.schoolName,
        title: education.fieldOfStudy,
        description: education.notes,
        obtained_at: linkedInDateParser.parse(education.endDate),
        gpa: null,
      });
    });
  });
}]);
