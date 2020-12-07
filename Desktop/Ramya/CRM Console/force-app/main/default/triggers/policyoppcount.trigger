trigger policyoppcount on Ramyaraghu03__Policy__c (after insert,after update,before delete,after undelete) {
    Set<Id> avitypeoid = new Set<Id>();
    Set<Id> martypeoid = new Set<Id>();
     Set<Id> avitypid = new Set<Id>();
    Set<Id> martypid = new Set<Id>();
         Map<id,List<Ramyaraghu03__Policy__c>> mapc1 = new Map<id,List<Ramyaraghu03__Policy__c>>();
         Map<id,List<Ramyaraghu03__Policy__c>> mapc2 = new Map<id,List<Ramyaraghu03__Policy__c>>();
    List<Opportunity> opplist = [select id from opportunity ];
    List<Opportunity> updateaviopp = new List<Opportunity>();
    List<Opportunity> updatemaropp = new List<Opportunity>();
    Map<ID,Schema.RecordTypeInfo> rt_Map = Ramyaraghu03__Policy__c.sObjectType.getDescribe().getRecordTypeInfosById();
         for(Ramyaraghu03__Policy__c p : trigger.new) {
             string recordtypeName = rt_map.get(p.RecordTypeId).getName();
             system.debug('rect'+ RecordTypeName);
        if(recordtypeName == 'Aviation') {
          avitypeoid.add(p.Ramyaraghu03__Opportunity__c);
            avitypid.add(p.id);
            System.debug('avitype id' + avitypeoid );
        }
        else if (recordtypeName == 'Marine')
        {
            martypid.add(p.id);
            martypeoid.add(p.Ramyaraghu03__Opportunity__c);
            System.debug('martype id' + martypeoid );
        }
        
    }
    List<Ramyaraghu03__Policy__c> plist1 = [Select Id,Ramyaraghu03__Opportunity__c from Ramyaraghu03__Policy__c where id  in :avitypid];
    List<Ramyaraghu03__Policy__c> plist2 = [Select Id,Ramyaraghu03__Opportunity__c from Ramyaraghu03__Policy__c where id in :martypid];
    for(Ramyaraghu03__Policy__c p : plist1) {
        if(mapc1.containsKey(p.Ramyaraghu03__Opportunity__c)) {
         List<Ramyaraghu03__Policy__c> lstpolicy = mapc1.get(p.Ramyaraghu03__Opportunity__c);
            lstpolicy.add(p);
        }
        else {
            List<Ramyaraghu03__Policy__c> lstpolicy = new List<Ramyaraghu03__Policy__c>();
            lstpolicy.add(p);
            mapc1.put(p.Ramyaraghu03__Opportunity__c, lstpolicy);
        }
    }
        for(Ramyaraghu03__Policy__c p1 : plist2) {
        if(mapc2.containsKey(p1.Ramyaraghu03__Opportunity__c)) {
         List<Ramyaraghu03__Policy__c> lstpolicym = mapc2.get(p1.Ramyaraghu03__Opportunity__c);
            lstpolicym.add(p1);
        }
        else {
            List<Ramyaraghu03__Policy__c> lstpolicym = new List<Ramyaraghu03__Policy__c>();
            lstpolicym.add(p1);
            mapc2.put(p1.Ramyaraghu03__Opportunity__c, lstpolicym);
        }
    }
  List<Opportunity> oavi = [Select Id ,Ramyaraghu03__No_of_Aviation_policies__c,Ramyaraghu03__No_of_Marine_policies__c from Opportunity where ID in : mapc1.keySet()];  
  List<Opportunity> omar = [Select Id ,Ramyaraghu03__No_of_Aviation_policies__c,Ramyaraghu03__No_of_Marine_policies__c from Opportunity where ID in : mapc2.keySet()];  
    System.debug('opp avi list' + oavi);
            System.debug('opp mar list' + omar);
    List<Ramyaraghu03__Policy__c>avipolicycountlist = [Select id,Ramyaraghu03__Opportunity__c from Ramyaraghu03__Policy__c where Ramyaraghu03__Opportunity__c in : mapc1.keySet()];
    List<Ramyaraghu03__Policy__c>marpolicycountlist = [Select id,Ramyaraghu03__Opportunity__c from Ramyaraghu03__Policy__c where Ramyaraghu03__Opportunity__c in : mapc2.keySet()];
       
    for(Opportunity o : oavi) {
        AggregateResult[] groupedResults = [SELECT COUNT(Id) cid,Ramyaraghu03__Opportunity__c oid from Ramyaraghu03__Policy__c WHERE Ramyaraghu03__Opportunity__c IN: avitypeoid group by Ramyaraghu03__Opportunity__c];
        for(AggregateResult  ar: groupedResults)
     {
        
        o.id= (id)ar.get('oid');  
      o.Ramyaraghu03__No_of_Aviation_policies__c = (integer)ar.get('cid');                               
      updatemaropp.add(o);
      }
        }
      
    update updateaviopp;
      }