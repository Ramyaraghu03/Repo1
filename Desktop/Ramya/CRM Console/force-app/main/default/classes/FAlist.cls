public with sharing class FAlist {
@AuraEnabled
    public static List<User> getFAusers() {
        List<User> FAusers = 
                [SELECT FirstName,LastName FROM User LIMIT 2];

        //Add isAccessible() check
        return FAUSers;
    }
}