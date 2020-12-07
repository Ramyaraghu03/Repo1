trigger rpolicyrollup on Ramyaraghu03__Policy__c (after insert,after update,before delete,after undelete) {
List<Ramyaraghu03__Policy__c> policiesEntered = new List<Ramyaraghu03__Policy__c>();
List<Ramyaraghu03__Policy__c> totalPolicies = new List<Ramyaraghu03__Policy__c>();
List<Opportunity> oppList = new List<Opportunity>();    
List<Opportunity> oppListToUpdate = new List<Opportunity>();    
Set<Id> oppId = new Set<Id>();    
Map<Id,List<Ramyaraghu03__Policy__c>> oppAviPolCount = new Map<Id,List<Ramyaraghu03__Policy__c>>();
Map<Id,List<Ramyaraghu03__Policy__c>> oppMarPolCount = new Map<Id,List<Ramyaraghu03__Policy__c>>();    
    for(Ramyaraghu03__Policy__c p : trigger.new){
        policiesEntered.add(p);
        oppId.add(p.Ramyaraghu03__Opportunity__c);
    }
    oppList = [select Id, Ramyaraghu03__No_of_Aviation_policies__c, Ramyaraghu03__No_of_Marine_policies__c from Opportunity where id in :oppId];
    totalPolicies = [Select Id,Ramyaraghu03__Opportunity__c,RecordType.Name from Ramyaraghu03__Policy__c where Ramyaraghu03__Opportunity__c  in :oppId];
    for(Ramyaraghu03__Policy__c p: totalPolicies){
        if(p.RecordType.name == 'Aviation'){
            if(oppAviPolCount.containsKey(p.Ramyaraghu03__Opportunity__c)){
                List<Ramyaraghu03__Policy__c> aviPol = oppAviPolCount.get(p.Ramyaraghu03__Opportunity__c);
                aviPol.add(p);
                oppAviPolCount.put(p.Ramyaraghu03__Opportunity__c, aviPol);
            } else {
                oppAviPolCount.put(p.Ramyaraghu03__Opportunity__c, new List<Ramyaraghu03__Policy__c> { p });
            }
        } else {
            if(oppMarPolCount.containsKey(p.Ramyaraghu03__Opportunity__c)){
                List<Ramyaraghu03__Policy__c> marPol = oppMarPolCount.get(p.Ramyaraghu03__Opportunity__c);
                marPol.add(p);
                oppMarPolCount.put(p.Ramyaraghu03__Opportunity__c, marPol);
            } else {
                oppMarPolCount.put(p.Ramyaraghu03__Opportunity__c, new List<Ramyaraghu03__Policy__c> { p });
            }
        }
    }
    system.debug('avimap'+oppAviPolCount);
    system.debug('marmap'+oppMarPolCount);
    for(Opportunity o:oppList){
        if(oppAviPolCount.get(o.Id) != null){
        o.Ramyaraghu03__No_of_Aviation_policies__c = oppAviPolCount.get(o.Id).size();
            }
        if(oppMarPolCount.get(o.Id) != null){
        o.Ramyaraghu03__No_of_Marine_policies__c = oppMarPolCount.get(o.id).size();
        }
        oppListToUpdate.add(o);
    }    
    system.debug('oppup'+oppListToUpdate);
    update oppListToUpdate;
}