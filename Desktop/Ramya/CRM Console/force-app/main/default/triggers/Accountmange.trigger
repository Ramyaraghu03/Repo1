trigger Accountmange on Ramyaraghu03__customerteam__c (after insert) {
    AccountTeammember atm = new AccountTeammember(); 
    List<AccountTeamMember> atmlist = new List<AccountTeammember>();
    if (trigger.isinsert) 
    {
        for (customerteam__c c:Trigger.new) {
            if(c.Account_Manager__c!= null) {
                AccountTeammember atm = new AccountTeammember();
                atm.AccountId = c.Account__c;
                atm.TeamMemberRole= 'Account Manager';
                atm.UserId = c.Ramyaraghu03__Account_Manager__c;
                  atmlist.add(atm);
             }
            Database.insert(atmlist,false);
            
        }   
    }
   

}