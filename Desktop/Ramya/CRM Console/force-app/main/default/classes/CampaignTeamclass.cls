public class CampaignTeamclass {
 @AuraEnabled
public static list<Ramyaraghu03__MSVA_Team__c> fetchMSVATeam()
{

        return [Select Id, name,Ramyaraghu03__Active_Members__c,Ramyaraghu03__Total_Members__c from Ramyaraghu03__MSVA_Team__c ];             

    }
}