public class topichandler {
    public void assigntopfield(List<TopicAssignment> topicsets,Map<Id,TopicAssignment> tmap )  {
        Map<Id,TopicAssignment> topicassign = new Map<Id,TopicAssignment>([Select Id,EntityId,EntityType,TopicId,Topic.Name from TopicAssignment where ID=: tmap.keyset()]);
    Map<Id,Id> tideid = new Map<Id,Id>();
    for(TopicAssignment t : topicsets) {
        tideid.put(t.id, t.EntityId);
    }
   // List<List<sObject>> sresults = new List<List<sObject>>{[Select Id,Ramyaraghu03__Topicrelated__c from Account where Id IN :tideid.values()],[Select Id,Ramyaraghu03__Topicrelated__c from Ramyaraghu03__Financial_Account__c where Id IN :tideid.values()]};
List<Account>acctlist = new List<Account>([Select Id,Ramyaraghu03__Topicrelated__c from Account where Id IN :tideid.values()]);
    List<Account> uplist = new List<Account>();
        //acctlist = ((List<Account>) sresults [0]);
    
    for(Id tId : tideid.keySet()){
       for (Account a: acctlist) {
          
        TopicAssignment tr = topicassign.get(tId);
           String topfield = tr.Topic.Name;
           System.debug('topfield'+ topfield);
           String topfield1 = '|'+tr.Topic.Name +'|' ;
           System.debug('topfield1'+ topfield1);
           if(a.Ramyaraghu03__Topicrelated__c == null) {
           a.Ramyaraghu03__Topicrelated__c = topfield1;
             System.debug('Topic related' + a.Ramyaraghu03__Topicrelated__c );
           uplist.add(a);
           }
           else {
               a.Ramyaraghu03__Topicrelated__c = a.Ramyaraghu03__Topicrelated__c + topfield1;
               uplist.add(a);
           }
    }
    }
    update uplist;
    }

}