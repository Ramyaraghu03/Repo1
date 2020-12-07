@isTest
private class AccountProcessortTest {
    @testsetup
    private static void actcreate () {
        List<Contact>actcontact = new List<Contact>();
        List<Account>act = new List<Account>();
        for(Integer i=0;i<10;i++){
        Account a = new Account();
        a.Name ='Test'+i;
            act.add(a);
     }
        insert act;
        List<Id> acids =new List<Id>();
        for(Account a : act){
            acids.add(a.Id);
        }
        for(Account a : act) {
        for(integer j=0;j<10;j++){
     
            Contact c =new Contact();
            c.FirstName= 'FN'+j;
            c.LastName='LN'+j;
            c.AccountId=a.id;
            actcontact.add(c);
        }
          }
        insert actcontact; 
        
    }
static testmethod void test() { 
    List<Account> acs = [Select Id from Account where Name ='Test' Limit 10];
    List<Id>atids= new List<Id>();
    for(Account a : acs){
        atids.add(a.Id);
    }
 
    Test.startTest();
    AccountProcessor.countContacts(atids);
    Test.stopTest();
    
 System.assertEquals(100, [select count() from contact]);
}
}