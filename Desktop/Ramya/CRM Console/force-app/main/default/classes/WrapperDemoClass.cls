public with sharing class WrapperDemoClass {
 Public List<WrapperClassEx> WrapperList{get;set;}
    public WrapperDemoClass(ApexPages.StandardController controller) {
      
    }
   
   Public List<WrapperClassEx> getwrapperObj(){
      List<Account> accList = [Select id,name from account limit 5];
      WrapperList = New List<WrapperClassEx>();
      for(Account acc: accList){
        WrapperList.add(New WrapperClassEx(acc,false)); 
      }
      return WrapperList;
   } 
  
   Public Class WrapperClassEx{
     Public Account accObj{get;set;}
     Public Boolean checkBox{get;set;}
    
     Public WrapperClassEx(Account accRec, boolean SelectBox){
        accObj = accRec;
        checkBox = SelectBox;
     }
   }
}