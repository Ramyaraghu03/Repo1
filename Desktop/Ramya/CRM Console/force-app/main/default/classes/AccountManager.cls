@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the AccountId from the end of the URL
        String AccountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account result =  [SELECT Id,Name,(Select Id from Contacts) from Account
                        WHERE Id = :AccountId];
        return result;
    }
}