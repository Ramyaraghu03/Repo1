public class CampaignSavectrl {
    @AuraEnabled
    public static void saveCampaign(Campaign c,String s) {
        List<CampaignShare> cslist = new List<CampaignShare>();
        Campaign camp = new Campaign();
        camp.Id = c.Id;
        camp.Ramyaraghu03__CampaignShareUsers__c = s;
        update camp;
       
        
 }

}