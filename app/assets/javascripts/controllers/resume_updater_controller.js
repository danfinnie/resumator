resumator.controller('ResumeUpdaterController', ['$scope', '$http', '$rootScope', '$q', function ($scope, $http, $rootScope, $q) {
  var jobsPromise = $http.get('/jobs');
  var educationsPromise = $http.get('/educations');
  var resumePromise = $http.get('/resumes/' + window.resume_id);

  resumePromise.then(function (response) {
    $scope.resume = response.data;
  });

  $q.all([jobsPromise, resumePromise]).then(function(results) {
    var jobs = results[0].data;
    var resume = results[1].data;

    var selectedJobIds = resume.jobs.map(function(jobs) {
      return jobs.id;
    });

    $scope.jobs = jobs.map(function(job) {
      job.selected = selectedJobIds.indexOf(job.id) > -1;
      return job;
    });
  });

  $q.all([educationsPromise, resumePromise]).then(function(results) {
    var educations = results[0].data;
    var resume = results[1].data;

    var selectedEducationIds = resume.educations.map(function(educations) {
      return educations.id;
    });

    $scope.educations = educations.map(function(education) {
      education.selected = selectedEducationIds.indexOf(education.id) > -1;
      return education;
    });
  });

  function findSelectedIds(ary) {
    return ary.filter(function(item) {
      return item.selected;
    }).map(function(item) {
      return item.id;
    });
  }

  $scope.updateServer = function () {
    $http.put($scope.resume.url, {
      resume: {
        name: $scope.resume.name,
        personal_website: $scope.resume.personal_website,
        first_name: $scope.resume.first_name,
        last_name: $scope.resume.last_name,
        phone: $scope.resume.phone,
        email: $scope.resume.email,
        job_ids: findSelectedIds($scope.jobs),
        education_ids: findSelectedIds($scope.educations)
      }
    }).then(function () {
      $rootScope.$broadcast('resume:reload');
    });
  };
}]);
