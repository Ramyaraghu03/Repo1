public class MSVAOPP {

    public static void createandassignOpp (Account acc) {
        List<Ramyaraghu03__MSVA__c> msvlist = new List< Ramyaraghu03__MSVA__c>();
        msvlist = [Select Ramyaraghu03__Sequence__c,Ramyaraghu03__FA__c,Ramyaraghu03__Next__c from Ramyaraghu03__MSVA__c ORDER By Ramyaraghu03__Sequence__c ];
        for (Ramyaraghu03__MSVA__c a : msvlist )
            if(a.Next__c == 'True' ){
                
                Opportunity op = new Opportunity ();
                op.OwnerID = a.Ramyaraghu03__FA__c;
                op.Amount = 5000;
                op.AccountID = acc.Id;
                op.CloseDate = date.today().addDays(90);
                insert op;
                
                
            }
    }
}