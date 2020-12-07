public class CommonPicklistController {
     @AuraEnabled
    public static List<String> getPicklistvalues(String objectName, String field_apiname,Boolean nullRequired){
        List<String> optionlist = new List<String>();       
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Map<String, Schema.SObjectField> field_map = gd.get(objectName.toLowerCase()).getDescribe().fields.getMap();        
        List<Schema.PicklistEntry> picklistValues = field_map.get(field_apiname).getDescribe().getPickListValues();       
        if(nullRequired == true){
            optionlist.add('--None--');
        }       
        for (Schema.PicklistEntry pv : picklistValues) {
            optionlist.add(pv.getValue());
        }
        return optionlist;
    }
    @AuraEnabled
    public static Account Fetchdeferredstatusmethod(Id actId) {
        Account a = [Select Id,Name,Ramyaraghu03__Defer_Engagement_Reason__c,Ramyaraghu03__Deferred_Date__c from Account where Id = :actId];
        System.debug('Actdetails' + a);
        return a;   
    }
    @AuraEnabled
    public static Account updateAccount(Id aId, String Reason) {
        Account acttobeupdated = [Select Id,Name,Ramyaraghu03__Defer_Engagement_Reason__c,Ramyaraghu03__Deferred_By__c,Ramyaraghu03__Deferred_Date__c from Account where Id = :aId];
        acttobeupdated.Ramyaraghu03__Defer_Engagement_Reason__c = Reason;
        acttobeupdated.Ramyaraghu03__Deferred_By__c = Userinfo.getUserId();
        acttobeupdated.Ramyaraghu03__Deferred_Date__c = System.today();
        acttobeupdated.Ramyaraghu03__isDeferred__c	= true;
        
    try {
            update acttobeupdated;
            System.debug('Account update' + acttobeupdated);
        }
        catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return acttobeupdated;
    }
  @AuraEnabled
    public static boolean removedeferral(Id aId) {
        Boolean res;
         Account acttobedeferred = [Select Id,Name,Ramyaraghu03__Defer_Engagement_Reason__c,Ramyaraghu03__Deferred_By__c,Ramyaraghu03__Deferred_Date__c from Account where Id = :aId];
        acttobedeferred.Ramyaraghu03__isDeferred__c	= false;
         acttobedeferred.Ramyaraghu03__Defer_Engagement_Reason__c = '';
        acttobedeferred.Ramyaraghu03__Deferred_By__c = '';
          try {
            update acttobedeferred;
              res =true;
            System.debug('Account deferred' + acttobedeferred);
              
        }
        catch(Exception e) {
            res = false;
            throw new AuraHandledException(e.getMessage());
            
        }
        return res;
       // return true;
    }

}