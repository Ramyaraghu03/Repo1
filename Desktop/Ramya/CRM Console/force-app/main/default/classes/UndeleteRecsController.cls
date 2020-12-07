public with sharing class UndeleteRecsController {
Public List<Account> accList{get;set;}
 Public UndeleteRecsController(){
  accList = New List<account>();
  accList = [select id,name from account where isdeleted =: true ALL rows];
 }
  
 Public void UndeleteRecs(){
  undelete accList;
 } 
}