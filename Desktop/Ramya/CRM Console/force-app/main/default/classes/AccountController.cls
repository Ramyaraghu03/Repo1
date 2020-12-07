public with sharing class AccountController {
 @AuraEnabled

    public static List<Account> findAll() {
    return [SELECT id, name
            FROM Account LIMIT 50];
    }


}