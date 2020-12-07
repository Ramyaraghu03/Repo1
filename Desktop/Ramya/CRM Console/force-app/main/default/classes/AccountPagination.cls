public with sharing class AccountPagination{
private final Account acct;
public AccountPagination(ApexPages.StandardSetController controller)
{
this.acct = (Account)Controller.getRecord();
}
public ApexPages.StandardsetController accountRecords {

get {

if(accountRecords == null) {
accountRecords = new ApexPages.StandardSetController(
Database.getQueryLocator([SELECT Name FROM Account WHERE Id NOT IN
(SELECT AccountId FROM Opportunity WHERE IsClosed = true)]));
}
return accountRecords;
}
private set;
}
public List<Account> getAccountPagination() {
return (List<Account>) accountRecords.getRecords();
}
}