public  class Petriggerhandler {
    public static final STRING AUTOEXPR = 'Auto';
    public static final String MANEXPR = 'Manual';
    public void handlebeforeinsert (List<Participant_Expiration__c> pelist) {
        List<Id> AccountIds = new List<Id>();
        Map<String,List<Participant__c>>Accounttoparticipantmap = new Map<String,List<Participant__c>>();
        for(Participant_Expiration__c pe: pelist) {
            if ((pe.Expiration_type__c == 'Auto') && (pe.Ramyaraghu03__Client_Prospects__c != null)) {
                AccountIds.add(pe.Ramyaraghu03__Client_Prospects__c);
                System.debug('AccountIDs' +AccountIds);
                Accounttoparticipantmap = getWealthInfo(AccountIds);
            }

            if((pe.Expiration_type__c.equalsIgnoreCase(AUTOEXPR))  || (pe.Expiration_type__c.equalsIgnoreCase(MANEXPR))) {
                pe.Ramyaraghu03__Available_Wealth__c =0;
                pe.Ramyaraghu03__Potential_Wealth__c =0;
                if(Accounttoparticipantmap.containskey(pe.Ramyaraghu03__Client_Prospects__c)) {
                    List<Participant__c> actparticipantlist = Accounttoparticipantmap.get(pe.Ramyaraghu03__Client_Prospects__c);
                    for(Participant__c P :actparticipantlist ) {
                        pe.Ramyaraghu03__Available_Wealth__c = pe.Ramyaraghu03__Available_Wealth__c+ p.Ramyaraghu03__Available_Wealth__c;
                        pe.Ramyaraghu03__Potential_Wealth__c = pe.Ramyaraghu03__Potential_Wealth__c + p.Ramyaraghu03__Potential_Wealth__c;
                        System.debug('Available wealth' + pe.Ramyaraghu03__Available_Wealth__c);
                        System.debug('Potetial Wealth' + pe.Ramyaraghu03__Potential_Wealth__c);
                    }
                }
                
            }
        }
        
    }
    public Map<String,List<Participant__c>> getWealthInfo(List<Id> AIds) {
        Map<String,List<Participant__c>>Actwealthmap = new Map<String,List<Participant__c>>();
        for(Participant__c p : [Select Id,Ramyaraghu03__Available_Wealth__c,Ramyaraghu03__Potential_Wealth__c,Ramyaraghu03__Client_Prospects__c from Participant__c where Ramyaraghu03__Client_Prospects__c IN :AIds ])
        {
            if(Actwealthmap.containsKey(p.Ramyaraghu03__Client_Prospects__c)) {
                Actwealthmap.get(p.Ramyaraghu03__Client_Prospects__c).add(p);
            }
            else {
                Actwealthmap.put(p.Ramyaraghu03__Client_Prospects__c,new List<Participant__c>{p});
            }
            
        } 
        System.debug('Actwealthmap' + Actwealthmap);
        return Actwealthmap;
        
    }
}