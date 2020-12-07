public with sharing class Leadattestcontroller {
 @AuraEnabled
    public static String fetchLeadorigin (String LeadId) {
        Lead l = [Select Id,Ramyaraghu03__Lead_Origin__c from Lead Where Id = :LeadId];
        String s = l.Ramyaraghu03__Lead_Origin__c;
        return s;
    }

}