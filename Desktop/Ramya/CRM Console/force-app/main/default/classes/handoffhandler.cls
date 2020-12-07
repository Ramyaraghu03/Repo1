public class handoffhandler {
     Set<Id> oldoppIds = new set<Id>();
    Set<Id> oppIDs = new set<Id>();
      List<Opportunity> opd = new List<Opportunity>();
         List<Opportunity> opplist = new List<Opportunity>();
            List<Opportunity> opdeletelist = new List<Opportunity>();
            List<Opportunity> opupdate = new List<Opportunity>();
    public void afterinsert(){
        initializeData();
        editopp();
        updatedata();
    }
    public void initializedata() {
        for(Top_Designation__c t : (List<Top_Designation__c>)Trigger.new) {
        oppIds.add(t.Opportunity__c);
        system.debug('oppid' + oppIds);
    }
    List<Opportunity> opplist = [Select Id,Name,Handoff_Attached__c,CloseDate from Opportunity where Id = :oppids];
List<Opportunity> opupdate = new List<Opportunity>();
 for(Top_Designation__c t : (List<Top_Designation__c>)Trigger.old) {
               oldoppIds.add(t.Opportunity__c); 
                system.debug('delete trigger' + oldoppIds);
            }
         List<Opportunity> opd = [Select ID,Name from Opportunity where Id = : oldoppIds];   
        List<Opportunity> opdeletelist = new List<Opportunity>();
    }
    public void editopp() {
        for(Top_Designation__c t :(List<Top_Designation__c>) Trigger.new) {
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
      for(Top_Designation__c t : (List<Top_Designation__c>) Trigger.old) {
                  for(Opportunity opold : opd) {
            opold.Ramyaraghu03__Handoff_Attached__c= false;
            opdeletelist.add(opold);
            system.debug('delete trigger deletelist' + opdeletelist);
        }
           
        }
        
    }
    public void updatedata() {
        update opupdate;
        Database.update(opdeletelist,false);
        
    }
}