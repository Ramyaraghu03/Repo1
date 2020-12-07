public class contactCheckbox
{
public contact selectedAccount{get;set;}

 public contactCheckbox(ApexPages.StandardController stdCtrl) {
selectedAccount=(Contact)stdCtrl.getRecord();
    }

     public List<SelectOption> getItems()
      {
   
      List<Contact> cntList=[select Name from Contact where AccountId=:selectedAccount.AccountID];
      List<SelectOption> options = new List<SelectOption>();
        
        for (Contact c:cntList) 
        {
            options.add(new SelectOption(c.Name,c.Name));
        }
        return options;
      }
      

}