public class Accountstock {
 @AuraEnabled
    public static List <Account> fetchAccounts() {
        //Qyery 10 accounts
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry, Type from Account LIMIT 3];
        //return list of accounts
        return accList;
    }
    @AuraEnabled
    public static List <Ramyaraghu03__StockOptionsData__c> fetchStockoptionsData() {
        //Qyery 10 accounts
        List<Ramyaraghu03__StockOptionsData__c> stockoptionsdatalist = [SELECT Name,Ramyaraghu03__Shares_Excercisable__c,Ramyaraghu03__Shares_Outstanding__c,Ramyaraghu03__Total_Shares_Granted__c,OwnerId FROM Ramyaraghu03__StockOptionsData__c ] ;
        //return list of accounts
        return stockoptionsdatalist;
    } 
}