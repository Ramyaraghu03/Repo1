public class bulkoppupdate {
     @AuraEnabled
    public static List <Opportunity> fetchOpp() {
        //Qyery 10 accounts
        List<Opportunity> opplist = [SELECT Id,Name, Amount, CloseDate, StageName from Opportunity LIMIT 100];
        //return list of accounts
        return opplist;
    }

}