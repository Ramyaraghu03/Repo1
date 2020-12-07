public with sharing class addDeleteController {
   @AuraEnabled
    public static void saveAccount(List<Account> Listact){
        insert Listact;
    }
}