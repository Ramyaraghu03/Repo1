public class Actrelated {
    public static void Dupeacts(List<Account> acts){
        for(Account a:acts){
        List<account> acc=[Select id, Name from Account where Name =: a.Name];
        if(acc.size()>0){
            a.Name.addError('You Cannot create the Duplicate');
        }
    }
        
    }
    public static void Actaddress(List<Account> acts){
        for(Account a : acts)
        {
             if ( a.BillingPostalCode != NULL )
        {
           a.ShippingPostalcode = a.BillingPostalcode;
          
        }
    }
}
}