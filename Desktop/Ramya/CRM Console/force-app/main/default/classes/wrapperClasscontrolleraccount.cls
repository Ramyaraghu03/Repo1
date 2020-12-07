public class wrapperClasscontrolleraccount {

 public List<cAccount> AccountList {get;set;}
 
public List<cAccount> getaccounts()
{
  for(Account a: [select Name from Account limit 20])
 {
 AccountList.add(new cAccount (a));
   }
    return AccountList;
    }
public PageReference isSelected() 
{
List<Account> selectedAccount = new List<Account>();
for (cAccount cselect : getaccounts())
{
   if(cselect.selected == true)
       {
      selectedAccount.add(cselect.acct);
     }
}
System.debug( 'These are the selected accounts');
for (Account acct: selectedaccount)
 {
   System.debug(acct);
}
    AccountList=null;
    return null;
}
Public class cAccount {
public account acct{get;set;}
public Boolean selected {get;set;}
public cAccount (account at)
{
acct = at;
selected = false;
}
}  
}