public class AccountTriggerHandler {
    
    public static void CreateAccounts (List<Account> acct)
    {
      //List<Account> accts = [Select ID From Account where Billingstate = 'CA'];
        for(Account a : acct)
        {
            
            if (a.Shippingstate != a.Billingstate)
                a.Shippingstate = a.Billingstate;
            //a.ParentId = '0012800000NZ76T';
        }
    }

}