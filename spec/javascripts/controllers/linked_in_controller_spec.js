describe("LinkedInController", function() {
  var ctrl, scope, linkedInDeferred, $rootScope, $httpBackend;

  beforeEach(function() {
    module('resumator');

    inject(['$controller', '$rootScope', '$httpBackend', '$q', function($controller, _$rootScope_, _$httpBackend_, $q) {
      $httpBackend = _$httpBackend_;
      $rootScope = _$rootScope_;
      scope = $rootScope.$new();
      linkedInDeferred = $q.defer();

      var linkedIn = {
        getPromise: function() { return linkedInDeferred.promise; }
      };

      // Mock object
      var linkedInDateParser = {
        parse: function(arg) { return arg; }
      };
      ctrl = $controller('LinkedInController', { $scope: scope, linkedIn: linkedIn, linkedInDateParser: linkedInDateParser });
    }]);
  });

  it("puts the raw LinkedIn data on the scope", function() {
    expect(scope.linkedInData).not.toBeDefined();

    $httpBackend.whenPOST('/jobs').respond(201);
    $httpBackend.whenPOST('/educations').respond(201);

    linkedInDeferred.resolve(bigSample);
    $rootScope.$apply();

    expect(scope.linkedInData).toBe(bigSample);
  });

  it("imports the jobs", function () {
    $httpBackend.whenPOST('/jobs').respond(201);
    $httpBackend.whenPOST('/educations').respond(201);

    $httpBackend.expectPOST('/jobs', {
      place: "Noise Marketing",
      title: "Web Developer",
      description: "Implement browser-based video chatting and appointment scheduling, interface with third-party POS system for promotion that increased same-store sales by 25% over stores without promotion.\n\nGrow video library microsite to maintainable platform designed to easily support limited-time campaigns",
      started_at: "NOISE START DATE",
      ended_at: "NOISE END DATE"
    }).respond(201);

    $httpBackend.expectPOST('/jobs', {
      place: "Plum Analytics",
      title: "Backend Data Munger",
      description: "(contract) Harvest and crawl 20+ web APIs (REST, data dumps, and screen scraping) in a reliable and scalable manner.  Merge similar records across data streams and transform data to fit internal schemas and classifications.",
      started_at: "PLUM START DATE",
      ended_at: "PLUM END DATE"
    }).respond(201);

    linkedInDeferred.resolve(bigSample);
    $rootScope.$apply();
    $httpBackend.flush();

    // A fake expectation to make Jasmine not throw a warning
    expect(true).toBeTruthy();
  });

  it("imports the educations", function () {
    $httpBackend.whenPOST('/jobs').respond(201);
    $httpBackend.whenPOST('/educations').respond(201);

    $httpBackend.expectPOST('/educations', {
      place: "Lehigh University",
      title: "Computer Science and Business",
      description: "Developed long-term mobility strategy for Fortune 500 medical products manufacturer as part of senior project\n\nDetermined current IT leaders\u2019 levels of investment in utility computing through analysis of financial statements, government filings, and product offerings. Presented findings to project sponsor, a \u201cstealth-mode\u201d startup.",
      obtained_at: "LEHIGH END DATE",
      gpa: null
    }).respond(201);

    $httpBackend.expectPOST('/jobs', {
      place: "Plum Analytics",
      title: "Backend Data Munger",
      description: "(contract) Harvest and crawl 20+ web APIs (REST, data dumps, and screen scraping) in a reliable and scalable manner.  Merge similar records across data streams and transform data to fit internal schemas and classifications.",
      started_at: "PLUM START DATE",
      ended_at: "PLUM END DATE"
    }).respond(201);

    linkedInDeferred.resolve(bigSample);
    $rootScope.$apply();
    $httpBackend.flush();

    // A fake expectation to make Jasmine not throw a warning
    expect(true).toBeTruthy();
  });

  var bigSample = {
      "0": {
        "_total": 1,
        "values": [
          {
            "_key": "~",
            "associations": "",
            "educations": {
              "_total": 2,
              "values": [
                {
                  "degree": "Bachelor of Science (B.S.)",
                  // "endDate": {
                    // "year": 2012
                  // },
                  "endDate": "LEHIGH END DATE",
                  "fieldOfStudy": "Computer Science and Business",
                  "id": 43085766,
                  "notes": "Developed long-term mobility strategy for Fortune 500 medical products manufacturer as part of senior project\n\nDetermined current IT leaders\u2019 levels of investment in utility computing through analysis of financial statements, government filings, and product offerings. Presented findings to project sponsor, a \u201cstealth-mode\u201d startup.",
                  "schoolName": "Lehigh University",
                  "startDate": {
                    "year": 2009
                  }
                },
                {
                  "endDate": {
                    "year": 2009
                  },
                  "id": 102620112,
                  "schoolName": "Ridge High School",
                  "startDate": {
                    "year": 2006
                  }
                }
              ]
            },
            "interests": "",
            "positions": {
              "_total": 7,
              "values": [
                {
                  "company": {
                    "id": 76331,
                    "industry": "Marketing and Advertising",
                    "name": "Noise Marketing",
                    "size": "11-50 employees",
                    "type": "Privately Held"
                  },
                  "id": 356444053,
                  "isCurrent": true,
                  // "startDate": {
                    // "year": 2012
                  // },
                  "startDate": "NOISE START DATE",
                  "endDate": "NOISE END DATE",
                  "summary": "Implement browser-based video chatting and appointment scheduling, interface with third-party POS system for promotion that increased same-store sales by 25% over stores without promotion.\n\nGrow video library microsite to maintainable platform designed to easily support limited-time campaigns",
                  "title": "Web Developer"
                },
                {
                  "company": {
                    "id": 2442446,
                    "industry": "Information Technology and Services",
                    "name": "Plum Analytics",
                    "size": "1-10 employees",
                    "type": "Privately Held"
                  },
                  // "endDate": {
                    // "month": 11,
                    // "year": 2012
                  // },
                  "endDate": "PLUM END DATE",
                  "id": 359041146,
                  "isCurrent": false,
                  // "startDate": {
                    // "month": 8,
                    // "year": 2012
                  // },
                  "startDate": "PLUM START DATE",
                  "summary": "(contract) Harvest and crawl 20+ web APIs (REST, data dumps, and screen scraping) in a reliable and scalable manner.  Merge similar records across data streams and transform data to fit internal schemas and classifications.",
                  "title": "Backend Data Munger"
                },
                {
                  "company": {
                    "id": 164707,
                    "industry": "Higher Education",
                    "name": "Lehigh University International Multimedia Resource Center",
                    "size": "1001-5000 employees",
                    "type": "Educational Institution"
                  },
                  // "endDate": {
                    // "month": 11,
                    // "year": 2012
                  // },
                  "endDate": "IMRC END DATE",
                  "id": 171886106,
                  "isCurrent": false,
                  // "startDate": {
                    // "month": 1,
                    // "year": 2010
                  // },
                  "startDate": "IMRC START DATE",
                  "summary": "Determine needs of web development clients, estimate cost and time to completion, delegate work amongst staff\n\nCreate web sites for University departments from scratch and using the Drupal content management system. Integrate sites with University systems to access user and course data.",
                  "title": "Web Developer and System Administrator"
                },
                {
                  "company": {
                    "id": 1044,
                    "industry": "Accounting",
                    "name": "PwC (formerly PricewaterhouseCoopers)",
                    "size": "10,001+ employees",
                    "type": "Partnership"
                  },
                  "endDate": {
                    "month": 8,
                    "year": 2012
                  },
                  "id": 305329088,
                  "isCurrent": false,
                  "startDate": {
                    "month": 6,
                    "year": 2012
                  },
                  "summary": "Selected vendors to develop consumer-facing tools (videos, calculators, etc.) for top 3 life and health insurance company in tandem with one senior associate. Acted as vendor\u2019s point of contact, and developed RFP questions and RFP scoring process encompassing score collection and reporting. \n\nConducted competitive analysis and uncovered industry analyst reports to determine competitive parity level and most effective tool presentation format. Explained results in high-level, quantitative presentation.",
                  "title": "Financial Services CIO Advisory Intern"
                },
                {
                  "company": {
                    "id": 1044,
                    "industry": "Accounting",
                    "name": "PwC (formerly PricewaterhouseCoopers)",
                    "size": "10,001+ employees",
                    "type": "Partnership"
                  },
                  "endDate": {
                    "month": 7,
                    "year": 2011
                  },
                  "id": 305331331,
                  "isCurrent": false,
                  "startDate": {
                    "month": 5,
                    "year": 2011
                  },
                  "summary": "Independently developed graphical tool that integrates with content management system to find outdated links and branding. Tool was shared with 20 countries across Central and Eastern Europe.\n\nCreated video about Prague for Managing Partner\u2019s presentation to 200+ partners at region\u2019s yearly conference",
                  "title": "Marketing & Communications Webmaster Intern"
                },
                {
                  "company": {
                    "id": 17921,
                    "industry": "Computer Software",
                    "name": "Antenna Software",
                    "size": "201-500 employees",
                    "type": "Privately Held"
                  },
                  "endDate": {
                    "month": 8,
                    "year": 2010
                  },
                  "id": 171886125,
                  "isCurrent": false,
                  "startDate": {
                    "month": 6,
                    "year": 2010
                  },
                  "summary": "Brainstormed and prototyped novel yet practical mobile applications using cutting-edge HTML5 technologies",
                  "title": "Product Development intern"
                },
                {
                  "company": {
                    "id": 17921,
                    "industry": "Computer Software",
                    "name": "Antenna Software",
                    "size": "201-500 employees",
                    "type": "Privately Held"
                  },
                  "endDate": {
                    "month": 8,
                    "year": 2009
                  },
                  "id": 171886315,
                  "isCurrent": false,
                  "startDate": {
                    "month": 6,
                    "year": 2009
                  },
                  "summary": "Designed and developed a cross-platform generic application to serve as a starting point for custom client applications with several easy-to-use and well-documented frameworks\n\nPrototyped an internal web application that allows employees to update and view the high-level status of various projects, ran QA tests with potential users and enhanced application from data gathered",
                  "title": "Professional Services intern"
                }
              ]
            },
            "skills": {
              "_total": 14,
              "values": [
                {
                  "id": 13,
                  "skill": {
                    "name": "Programming"
                  }
                },
                {
                  "id": 14,
                  "skill": {
                    "name": "Databases"
                  }
                },
                {
                  "id": 15,
                  "skill": {
                    "name": "System Administration"
                  }
                },
                {
                  "id": 16,
                  "skill": {
                    "name": "Mobile Product Development"
                  }
                },
                {
                  "id": 17,
                  "skill": {
                    "name": "Ruby"
                  }
                },
                {
                  "id": 18,
                  "skill": {
                    "name": "C++"
                  }
                },
                {
                  "id": 19,
                  "skill": {
                    "name": "PHP"
                  }
                },
                {
                  "id": 20,
                  "skill": {
                    "name": "Intel 8085"
                  }
                },
                {
                  "id": 21,
                  "skill": {
                    "name": "Linux"
                  }
                },
                {
                  "id": 22,
                  "skill": {
                    "name": "Drupal"
                  }
                },
                {
                  "id": 23,
                  "skill": {
                    "name": "SQLite"
                  }
                },
                {
                  "id": 24,
                  "skill": {
                    "name": "MySQL"
                  }
                },
                {
                  "id": 25,
                  "skill": {
                    "name": "Oracle SQL"
                  }
                },
                {
                  "id": 26,
                  "skill": {
                    "name": "HTML 5"
                  }
                }
              ]
            }
          }
        ]
      }
    };
});
