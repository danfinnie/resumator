resumator.service('linkedInDateParser', function () {
  function numToPaddedString(num) {
    if (num < 10)
      return "0" + num.toString();
    else
      return num.toString();
  }

  this.parse = function(linkedInDate) {
    if (typeof linkedInDate === "undefined")
      return null;

    var year = linkedInDate.year;
    var month = linkedInDate.month || 1;
    var day = linkedInDate.day || 1;

    return [year, month, day].map(numToPaddedString).join("-");
  };
});
