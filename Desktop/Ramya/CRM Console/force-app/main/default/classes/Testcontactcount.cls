@isTest
private class Testcontactcount {
    @isTest 
    static void contactsinserted () {
        Account a = new Account(Name='Testact', No_of_locations__c = 2);
        Test.startTest();
        insert a;
        Test.stopTest();
     List<Contact> clist = new List<Contact>();
        clist=[Select Id,lastname from contact where AccountID = : a.Id];
        System.assertEquals(2, clist.size());
        
    }

}