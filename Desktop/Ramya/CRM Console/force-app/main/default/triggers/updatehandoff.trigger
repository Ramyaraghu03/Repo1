trigger updatehandoff on Top_Designation__c (after insert,after update,after delete) {
    if(trigger.isafter &&  trigger.isInsert || trigger.isafter && trigger.IsUpdate ) { 
        system.debug('insert trigger ');
    Set<Id> oppIDs = new set<Id>();
   
    for(Top_Designation__c t : Trigger.new) {
        oppIds.add(t.Opportunity__c);
        system.debug('oppid' + oppIds);
    }
    List<Opportunity> opplist = [Select Id,Name,Handoff_Attached__c,CloseDate from Opportunity where Id = :oppids];
        List<Opportunity> opupdate = new List<Opportunity>();
         for(Top_Designation__c t : Trigger.new) {
             for(Opportunity op: opplist){
              if(t.Ramyaraghu03__Document_Attached__c == True ) {
                  op.Handoff_Attached__c= true;
                  op.CloseDate = Date.today
                      ();
                                    opupdate.add(op);
                   system.debug('opupdate check');
              }
          
          }
         }
     update opupdate;
    }
        if(Trigger.isDelete) {
             Set<Id> oldoppIds = new set<Id>();
            List<Opportunity> opdeletelist = new List<Opportunity>();
            for(Top_Designation__c t : Trigger.old) {
               oldoppIds.add(t.Opportunity__c); 
                system.debug('delete trigger' + oldoppIds);
            }
            List<Opportunity> opd = [Select ID,Name from Opportunity where Id = : oldoppIds];
         for(Top_Designation__c t : Trigger.old) {
        for(Opportunity opold : opd) {
            opold.Ramyaraghu03__Handoff_Attached__c= false;
            opdeletelist.add(opold);
            system.debug('delete trigger deletelist' + opdeletelist);
        }
           
        }
             Database.update(opdeletelist,false);
        }


}