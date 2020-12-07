public class Topiccontroller {
    @AuraEnabled
     public static List<TopicAssignment> fetchtopics (Id EId) {
      
         List<TopicAssignment> toplist =[Select Topic.Name from TopicAssignment where EntityId= : EId];
             return toplist;
       
    }
  @AuraEnabled
    public static string topicfield (String tops, Id recid) {
        Account a = new Account();
        a.id =recid;
        a.Ramyaraghu03__Topicrelated__c= tops;
         upsert a;
        System.debug('topic field' +a.Ramyaraghu03__Topicrelated__c );
        return a.Id;
        
    }
   
}