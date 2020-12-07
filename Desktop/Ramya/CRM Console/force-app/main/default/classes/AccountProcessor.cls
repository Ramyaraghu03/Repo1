public class AccountProcessor {
    public AccountProcessor() {
    List<Id> actids = new List<Id>();
    List<Account> ac = new List<Account>([Select Id,Name from Account LIMIT 10]);
    for(Account a : ac) {
        actids.add(a.Id);
    }
        AccountProcessor.countContacts(actids);
    } 
@future
    public static void countContacts(List<Id> actids) {
        List<Account>actoprocess = [Select Id,(Select Id from Contacts) from Account where Id = :actids];
        for(Account a : actoprocess) {
            List<Contact>con =a.contacts;
            a.Ramyaraghu03__NumberofLocations__c = con.size();
            
        }
        update actoprocess;
        
    }

}