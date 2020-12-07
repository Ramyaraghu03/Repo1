trigger MSVAOpportunity on Account (before insert, before update) {
    if(trigger.isInsert && trigger.isBefore ) {
    List<Opportunity> oplist = new List<Opportunity>();
    for(Account a : Trigger.new) {
        if(a.Ramyaraghu03__Office__c == '574') {
            Opportunity op = new Opportunity();
            op.Name = a.Name + 'MSVAOpp';
            op.AccountId = a.Id;
            op.StageName ='New';
            op.CloseDate = Date.today() + 30;
            oplist.add(op);
            system.debug('oplist'+ oplist);
        }
        insert oplist;
        
    }
    }
}