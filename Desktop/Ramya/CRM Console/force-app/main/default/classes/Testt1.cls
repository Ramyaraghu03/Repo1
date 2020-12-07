@isTest
public class Testt1 {
    static testmethod void tm1()
    {
    List<Account> acct = new List<Account>();
    for(Integer i=0; i<50;i++)
    {
         Account a= new Account(Name='Test Acccount' + i,Industry='Technology');
        acct.add(a);
    }
    Test.startTest();
    insert acct;
    Test.stopTest();
List<Account> insertedact= [Select Name,Industry,Description,Phone from Account where ID in :acct];
        for(Account i : insertedact)
        {
            System.assertEquals('90938',i.Phone);
        }
        }
}