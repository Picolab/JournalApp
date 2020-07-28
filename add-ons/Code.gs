function doPost(e) {
  recordReading(e.parameter);
}

function recordReading(data) {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName('2020');
  sheet.appendRow([data.timestamp,data.entry,data.comment]);
}
