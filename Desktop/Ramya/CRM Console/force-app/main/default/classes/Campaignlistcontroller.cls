public class Campaignlistcontroller {
    @AuraEnabled
    public static List<Campaign> camplist() {
        
        return [Select Id,Name,Status,Ramyaraghu03__No_of_CampaignMembers__c,EndDate from Campaign where OwnerId = :UserInfo.getUserId()  ];
    }
   @AuraEnabled
    public static Integer campmemlist() {
        List<Campaign> clist = [Select Id,Name from Campaign LIMIT 20];
        List<AggregateResult>cmlist = new List<AggregateResult>();
        Integer count =0;
        for(Campaign c: clist) {
            cmlist =[Select count(Id) from CampaignMember where CampaignId = : clist ];
        } 
        return cmlist.size();
    }
    @AuraEnabled
    public static Map<Campaign,Integer> mapcampaignmember ()
         {
             Map<Campaign,Integer> memcampmap = new   Map<Campaign,Integer>();
        List<Campaign> clist = [Select Id,Name,Status,(Select ID from CampaignMembers) from Campaign LIMIT 20];
      
             for(Campaign c : clist) {
                 
                 memcampmap.put(c,5 );
             }
    return memcampmap;
         }
    
}