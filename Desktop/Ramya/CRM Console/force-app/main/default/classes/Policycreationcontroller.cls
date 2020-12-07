public class Policycreationcontroller {
    
    public ApexPages.StandardSetController c {
        get {
            if(c== null) {
                c=new ApexPages.StandardSetController(Database.getQueryLocator([Select Ramyaraghu03__Address__c,Ramyaraghu03__Broker__c,Ramyaraghu03__Country__c,Ramyaraghu03__Opportunity__c from Ramyaraghu03__Policy__c]));    
            }
         return c;   
        }
        set;
    }
public List<Ramyaraghu03__Policy__c>getpolicies() {
        return (List<Ramyaraghu03__Policy__c>)c.getRecords(); 
    }
}