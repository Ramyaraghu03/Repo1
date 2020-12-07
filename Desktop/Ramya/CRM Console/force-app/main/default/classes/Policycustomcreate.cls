public class Policycustomcreate {
    private Ramyaraghu03__Policy__c p;
    public Policycustomcreate() {
        
        p=  new Ramyaraghu03__Policy__c();
            }
    public PageReference save() {
        try {
            insert p;
        }
        catch(System.DmlException e) {
            ApexPages.addMessages(e);
            return null;
        }
       PageReference redirectSuccess = new ApexPages.StandardController(p).view();
        return (redirectSuccess);
    }

}