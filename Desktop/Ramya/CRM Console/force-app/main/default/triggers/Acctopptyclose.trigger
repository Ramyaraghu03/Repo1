trigger Acctopptyclose on Account (before update) {
    List<Opportunity> oplist = new List<Opportunity>();
    if(trigger.isUpdate && trigger.isBefore) {
        for(Account a: Trigger.new ) {
           Account oldactid = Trigger.oldMap.get(a.Id);
            if(a.OwnerId != oldactid.OwnerId ) {
              Opportunity op = new Opportunity();
                op.AccountId = a.Id;
                op.StageName ='Closed Lost';
                
oplist.add(op);                
                
            }
           insert oplist; 
        }
    }
}