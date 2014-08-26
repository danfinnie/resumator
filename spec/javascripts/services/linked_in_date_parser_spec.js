describe("linkedInDateParser", function() {
  var parser;

  beforeEach(function() {
    module('resumator');

    inject(['linkedInDateParser', function(_linkedInDateParser_) {
      parser = _linkedInDateParser_;
    }]);
  });

  describe("when passed undefined", function() {
    it("returns null", function () {
      expect(parser.parse(undefined)).toBe(null);
    });
  });

  describe("when passed only a year", function() {
    it("returns the first day of the year", function () {
      expect(parser.parse({year: 2012})).toBe("2012-01-01");
    });
  });

  describe("when passed a year and a month", function() {
    it("returns the first day of that month", function () {
      expect(parser.parse({year: 2012, month: 3})).toBe("2012-03-01");
    });
  });

  describe("when passed a full day", function() {
    it("returns that date as YYYY-MM-DD", function () {
      expect(parser.parse({year: 2012, month: 3, day: 5})).toBe("2012-03-05");
    });
  });
});
