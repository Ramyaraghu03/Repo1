@isTest
private class birthdaybatchtest {
    @testSetup 
     static void setup() {
        List<Account> baccounts = new List<Account>();
          for (Integer i=0;i<10;i++) {
            baccounts.add(new Account(name='Account '+i, 
                billingcity='New York', billingcountry='USA',Ramyaraghu03__Birthdate__c = System.today() + 10  ));
        }
         insert baccounts;
    }
    static testmethod void test() {        
        Test.startTest();
        birthdaybatch bb = new birthdaybatch();
        Id batchId = Database.executeBatch(bb);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from Account where Ramyaraghu03__Birthdate__c >= NEXT_N_DAYS:15 ]);
    }
}