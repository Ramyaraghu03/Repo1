public class SummaryCardcntrlr {
    @AuraEnabled
    public static Account getSummarydetails (Id AccountId) {
        Account aclist = new Account();
        aclist = [Select Id,Name,Ramyaraghu03__Email__c,Ramyaraghu03__Comments__c,Ramyaraghu03__Contact_Intervals__c,Ramyaraghu03__Preferred_Contact_Method__c,Ramyaraghu03__Preferred_Contact_Time__c,Ramyaraghu03__Prospect_Conversion_Date__c from Account where Id =:AccountId];
        System.debug('Actlist for Summary Card' + aclist); 
        return aclist;
    }
    @AuraEnabled
    public static List<String> getfieldpicklists(String fieldApiName) {
       List<String> options = new List<String>();
        Map<String, Schema.SObjectField> accountObjectFieldDescribeMap = Schema.SObjectType.Account.fields.getMap();
        Schema.DescribeFieldResult fieldResult = accountObjectFieldDescribeMap.get( fieldApiName ).getDescribe();
        
        for( Schema.PicklistEntry picklist : fieldResult.getPicklistValues()){
            options.add(picklist.getValue());
        }       
        return options;
    }

}