public class FetchDeferredReason {
@AuraEnabled
    public static Account Fetchdeferredstatusmethod(Id actId) {
        Account a = [Select Id,Name,Ramyaraghu03__Defer_Engagement_Reason__c,Ramyaraghu03__Deferred_Date__c from Account where Id = :actId];
        System.debug('Actdetails' + a);
        return a;   
    }
}