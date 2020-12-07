trigger ActManager on Ramyaraghu03__customerteam__c (after insert,after update,before delete) {
    List<AccountTeammember> atmlists = new List<AccountTeammember>();
    List<AccountShare> newShare = new List<AccountShare>();
     AccountTeammember atm = new AccountTeammember();
    if( Trigger.isAfter && Trigger.isInsert) {
    AccountTeammember atm = new AccountTeammember();
            for(customerteam__c c : Trigger.new ) {
             if(c.Account_Manager__c != null) {
            atm = new AccountTeammember();
            atm.accountid = c.Account__c;
            atm.TeamMemberRole = 'Account Manager';
            atm.UserId = c.Account_Manager__c;
            atmlists.add(atm);
 
        }
        Database.insert(atmlists,False);
    }
    }
    if(Trigger.isAfter && Trigger.isUpdate ) {
         List<Id> actids = new List<Id>();
        List<AccountTeammember>atmidsdel = new List<AccountTeammember>();
        for(customerteam__c c : Trigger.new ) {
            actids.add(Trigger.oldMap.get(c.Id).Account__c);
        }
         atmidsdel= [Select Id from AccountTeammember where ID in : actids];
        for(customerteam__c c : Trigger.new ) {
            if(c.Account_Manager__c!= Trigger.oldMap.get(c.Id).Account_Manager__c ) {
            atm = new AccountTeammember();
            atm.accountid = c.Account__c;
            atm.TeamMemberRole = 'Account Manager';
            atm.UserId = c.Account_Manager__c;
            atmlists.add(atm);
 

            }
            
                
        }
        delete atmidsdel;
         Database.insert(atmlists,False);
        
    }

    if(Trigger.isBefore && Trigger.isDelete) {
        List<AccountTeammember> atmdellist = new List<AccountTeammember>();
        Set<Id>accountid = new Set<Id>();
        for(customerteam__c c : Trigger.old) {
            accountid.add(c.Account__c);
            AccountTeamMember atmdel = new AccountTeammember();
            atmdel = [Select Id from AccountTeammember where AccountID IN : accountid];
            atmdellist.add(atmdel);
        }
        Database.delete(atmdellist,false);
    }
}