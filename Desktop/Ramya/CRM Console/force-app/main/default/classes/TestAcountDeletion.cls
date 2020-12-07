@isTest
private class TestAcountDeletion {
    @isTest static void TestAccountdeletionWithOneOpportunity()
    {
        Account acct =new Account( Name= 'RM');
        insert acct;
        Opportunity opp = new Opportunity(Name =acct.Name +'Opportunity', StageName ='Prospecting',CloseDate = System.Today().addMonths(1),AccountId= acct.Id);
        insert opp;
        Test.startTest();
        Database.DeleteResult Result = Database.delete(acct,False);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().Size()>0);
        System.assertEquals('Cannot delete account with opportunities', result.getErrors()[0].getMessage());
         }
}