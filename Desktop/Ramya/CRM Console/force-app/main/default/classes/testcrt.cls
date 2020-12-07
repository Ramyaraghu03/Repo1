@isTest
private class testcrt {
   private static testmethod void ctestinsert() {
       Contact c = new Contact ();
       c.LastName = 'msd';
       c.Ramyaraghu03__Contact_Relationship__c = true;
       Test.startTest();
      insert c;
       Test.stopTest();
       Contact b = [select LastName, (Select Name from Contact_Relationship__r) from Contact where ID= :c.Id  LIMIT 1];
       
              
    }
    private static testmethod void ctestupdate() {
       Contact c = new Contact ();
       c.LastName = 'msd1';
       c.Ramyaraghu03__Contact_Relationship__c = true;
       insert c;
        c.LastName = 'msd1edit';
        Test.startTest();
      update c;
       Test.stopTest();
         
        
    }
    

}