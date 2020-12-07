public with sharing class samplePagerCtrl {
   @AuraEnabled
 public static CampaignPagerWrapper fetchCampaign (Decimal pageNumber ,Integer recordToDisply) {
      Integer pageSize = recordToDisply;
      Integer offset = ((Integer)pageNumber - 1) * pageSize;
    
    // create a instance of wrapper class.
    CampaignPagerWrapper obj =  new CampaignPagerWrapper();
    // set the pageSize,Page(Number), total records and accounts List(using OFFSET)   
        obj.pageSize = pageSize;
        obj.page = (Integer) pageNumber;
        obj.total = [SELECT count() FROM account];
        obj.camplist = [Select Id,Name,Status,Ramyaraghu03__No_of_CampaignMembers__c,EndDate from Campaign where OwnerId = :UserInfo.getUserId()];
    // return the wrapper class instance .
        return obj;
     }
    
 // create a wrapper class with @AuraEnabled Properties    
 public class CampaignPagerWrapper {
    @AuraEnabled public Integer pageSize {get;set;}
    @AuraEnabled public Integer page {get;set;}
    @AuraEnabled public Integer total {get;set;}
    @AuraEnabled public List<Campaign> camplist {get;set;}
   }
}