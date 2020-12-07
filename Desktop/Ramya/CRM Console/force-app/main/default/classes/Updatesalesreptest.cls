@isTest
private class Updatesalesreptest {
    static testmethod void salesrep(){
        Account a =new Account();
        a.name='Account 1';
        a.Sales_Rep__c='';
        insert a;
        System.debug(a.Sales_Rep__c);
    }

}