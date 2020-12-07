public class EOppcontroller {
    @AuraEnabled
    public static Opportunity getOppdetails(Id OppId) {
        Opportunity EOpp  = [Select Id,Name,Amount from Opportunity where Id = : OppId];
        return EOpp;
    }

}