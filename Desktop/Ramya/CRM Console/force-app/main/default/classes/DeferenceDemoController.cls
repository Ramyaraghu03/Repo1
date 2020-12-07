Public with sharing class DeferenceDemoController {
 Public List<opportunity> optyList {get;set;}
 Public List<lead> leaList{get;set;}
 Public List<contact> conList{get;set;}
 Public List<account> accList{get;set;}
   Public DeferenceDemoController(){
   }
 
  Public void soslDemo_method(){
   optyList = New List<opportunity>();
   leaList = New List<lead>();
   conList = New List<contact>();
   accList = New List<account>();
   List<list <sObject>> searchList = [FIND 'test' IN ALL FIELDS RETURNING  Account (Id,Name,type),Contact(name,email),Opportunity(name,StageName),Lead(company,name,status) ];
   accList = ((List<account>)searchList[0]);
   conList  = ((List<contact>)searchList[1]);
   optyList = ((List<opportunity>)searchList[2]);
   leaList  = ((List<lead>)searchList[3]);
  }
}