trigger SPIndicatorvalidate on Ramyaraghu03__Participant__c (after insert,after update) {
    Set<String> acctID = new set<String>();
    if(trigger.isInsert && trigger.isAfter) {
    for(Ramyaraghu03__Participant__c p : Trigger.new) {
        if (p.Ramyaraghu03__Client_Prospects__c !=NULL) {
            acctID.add(p.Ramyaraghu03__Client_Prospects__c);
        }
    }
    if(acctID.size()>0) {
        List<Account> updatespindicator = new List<Account>();
        for(Account ac : [Select Id,Name,Ramyaraghu03__Stock_Plan_Indicator__c from Account where ID in  :acctID ]) {
            
            ac.Ramyaraghu03__Stock_Plan_Indicator__c= True ;
            updatespindicator.add(ac);
        
        }
        update updatespindicator;
        
    }
   }
    
    if(trigger.isUpdate && trigger.isAfter) {
        for(Ramyaraghu03__Participant__c p : Trigger.new) {
            if ( p.Ramyaraghu03__Client_Prospects__c != NULL  && trigger.OldMap.get(p.Id).Ramyaraghu03__Client_Prospects__c != p.Ramyaraghu03__Client_Prospects__c) {
                acctID.add(p.Ramyaraghu03__Client_Prospects__c);
            }
             if(acctID.size()>0) {
        List<Account> spindicatorup = new List<Account>();
        for(Account ac : [Select Id,Name,Ramyaraghu03__Stock_Plan_Indicator__c from Account where ID in  :acctID ]) {
            
            ac.Ramyaraghu03__Stock_Plan_Indicator__c= False ;
            spindicatorup.add(ac);
        
        }
        update spindicatorup;
        }
    }
}
}