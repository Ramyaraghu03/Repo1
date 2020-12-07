public with sharing class Searchaccts {
public String Searchstring{get;set;}
public List<Account> accList {get;set;}

public Searchaccts(ApexPages.Standardcontroller controller)
 {
}

public void SearchAcc()
{
accList = New List<Account>();
accList = [Select Id,name,accountnumber,Industry from Account where name = : Searchstring limit 5];
}
}