trigger contactcount on Account (after insert, after update) {
    Map<Id,Decimal> mapacc = new Map<Id,Decimal>();
    List<Contact> clist = new List<Contact>();
    if(Trigger.IsInsert && Trigger.isAfter)
    {
        for(Account a : [Select Id, No_of_locations__c from Account where ID IN : Trigger.New] ) {
            
            mapacc.put(a.id, a.Ramyaraghu03__No_of_locations__c);
        }
        
        for(Id aId : mapacc.keySet()) {
            for (Integer i=0 ;i< mapacc.get(aId); i++) {
                Contact c = new contact();
                c.AccountId = aId;
                c.LastName ='locations'+i;
                clist.add(c);
                    
            }
        }
        insert clist;
    }
    if(Trigger.IsUpdate && Trigger.isAfter){
        for(Account a : [Select Id,No_of_locations__c,(SELECT Contact.ID, Contact.LastName FROM Account.Contacts ) from Account where ID IN : Trigger.new]){
            if(a.Ramyaraghu03__NumberofLocations__c != Trigger.oldMap.get(a.Id).Ramyaraghu03__NumberofLocations__c) {
                
                
            }
        }
        
        
        
        
        
        
    }
}