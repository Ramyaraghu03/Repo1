public with sharing class ImportCampaignmemberctrl {
    @AuraEnabled
    Public static List<Ramyaraghu03__MSVA_Team__c> getMSVATeams() {
        return [Select Id,Name from Ramyaraghu03__MSVA_Team__c ];
    }

}