@isTest
private class PEEmailbatchtest {
    private static testmethod void testsetup() {
        Account a = new Account(Name= 'BatchEmailTest');
        insert a;
        Participant__c P = new Participant__c();
        P.Ramyaraghu03__Available_Wealth__c = 1000;
        P.Ramyaraghu03__Potential_Wealth__c =2000;
        P.Ramyaraghu03__Client_Prospects__c=a.Id;
        insert P;
        Ramyaraghu03__Participant_Expiration__c  PE = new Ramyaraghu03__Participant_Expiration__c();
        PE.Ramyaraghu03__Client_Prospects__c = a.Id;
        PE.Ramyaraghu03__Expiration_Type__c = 'Auto';
        insert PE;
        Test.startTest();
            PEEmailbatch Pbatch = new PEEmailbatch();
            Database.executeBatch(Pbatch);
        Test.stopTest();
    List<Ramyaraghu03__Participant_Expiration__c> PEUpdatedlist = [Select Id,Name,Ramyaraghu03__Status__c from Ramyaraghu03__Participant_Expiration__c];
     System.assert(PEUpdatedlist.get(0).Ramyaraghu03__Status__c.contains('Processed'));       
        
        
    }

}