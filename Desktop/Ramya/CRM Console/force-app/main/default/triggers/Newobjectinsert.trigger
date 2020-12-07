trigger Newobjectinsert on Ramyaraghu03__Territory_c__c (after insert) {
    Set<Integer> Territotyzipcodes = new Set<Integer> ();
    List<Ramyaraghu03__objfortrigger__c> lisobj = new List<Ramyaraghu03__objfortrigger__c>();
    Map<Integer,Ramyaraghu03__objfortrigger__c> mapofobj = new Map <Integer,Ramyaraghu03__objfortrigger__c>();
    for(Ramyaraghu03__Territory_c__c r : Trigger.new ) {
        Territotyzipcodes.add(Integer.valueOf((r.Ramyaraghu03__Zip__c)));
    }
lisobj = [Select Id,Ramyaraghu03__Zip__c,Ramyaraghu03__Territory__c from Ramyaraghu03__objfortrigger__c where Ramyaraghu03__Zip__c IN :Territotyzipcodes];
   List<Ramyaraghu03__objfortrigger__c> objupdate = new List<Ramyaraghu03__objfortrigger__c>();
    for(Ramyaraghu03__Territory_c__c rt :Trigger.new ) {
    for(Ramyaraghu03__objfortrigger__c o : lisobj ) {
        if(rt.Ramyaraghu03__Zip__c == o.Ramyaraghu03__Zip__c ) {
            o.Ramyaraghu03__Territory__c= rt.id;
            objupdate.add(o);
        }
        }
    }
    update objupdate;
    }