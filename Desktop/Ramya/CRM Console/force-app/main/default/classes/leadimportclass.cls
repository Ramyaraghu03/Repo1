public with sharing class leadimportclass {
 public List < account > acclist {
  get;
  set;
 }
 public Blob csvFileBody {
  get;
  set;
 }
 public string csvAsString {
  get;
  set;
 }
 public String[] csvFileLines {
  get;
  set;
 }
 public leadimportclass() {
  csvFileLines = new String[] {};
  acclist = New List < Account > ();
 }
 public void yourCSVFile() {
  try {
   
   csvAsString = csvFileBody.toString();
  
   csvFileLines = csvAsString.split('\n');
  
   for (Integer i = 1; i < csvFileLines.size(); i++) {
    Account accObj = new Account();
    string[] csvRecordData = csvFileLines[i].split(',');
   
    accObj.name = csvRecordData[0];
    accObj.accountnumber = csvRecordData[1];
    accObj.Type = csvRecordData[2];
    accObj.AccountSource = csvRecordData[3];
    accObj.Industry = csvRecordData[4];
    acclist.add(accObj);
   }
  } catch (Exception e) {
   ApexPages.Message errorMessage = new ApexPages.Message( ApexPages.severity.ERROR, 'An error has occured while importing data.Please make sure input csv file is correct' );
   ApexPages.addMessage(errorMessage);
  }
 }
 public void insertYourAccount() {
  insert acclist;
 }
}