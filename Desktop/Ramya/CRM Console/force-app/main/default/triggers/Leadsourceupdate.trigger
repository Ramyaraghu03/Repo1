trigger Leadsourceupdate on Lead (after update) {
    Set<String> leadsourceset = new Set<String>();
      List<Account> actstoupdate = new List<Account>();
    Map<String,String> mapoldnewsource = new Map<String,String>();
    if (trigger.isUpdate ) {
        for(Lead l : Trigger.new ) {
            if (l.LeadSource != null && (l.LeadSource!= Trigger.oldMap.get(l.Id).LeadSource)) {
                mapoldnewsource.put(Trigger.oldMap.get(l.Id).LeadSource, l.LeadSource);
                leadsourceset.add(Trigger.oldMap.get(l.Id).LeadSource);
            }
         
            actstoupdate = [Select Id, Ramyaraghu03__Lead_Source_acc__c from  Account where Ramyaraghu03__Lead_Source_acc__c IN : leadsourceset ];
        }

        for(Account ac: actstoupdate ) {
            if(mapoldnewsource.containsKey(ac.Ramyaraghu03__Lead_Source_acc__c))
            ac.Ramyaraghu03__Lead_Source_acc__c = mapoldnewsource.get(ac.Ramyaraghu03__Lead_Source_acc__c);
        }
    }
    
}