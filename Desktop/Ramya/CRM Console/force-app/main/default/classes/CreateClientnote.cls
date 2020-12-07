public class CreateClientnote {
    @AuraEnabled
    public static List<string> getsub(){
        List<string> sublist= new List<String>();
        sublist.add('New Account');
        sublist.add('Edit Account Details');
        sublist.add('Approval Request');
        sublist.add('Payment');
        sublist.add('Others');
        return sublist;
    }
     @AuraEnabled
    public static List<string> getctype(){
        List<string> ctypelist= new List<String>();
        ctypelist.add('Email');
        ctypelist.add('InPerson');
        ctypelist.add('Phone');
        return ctypelist;
    }
       @AuraEnabled
    public static List<string> getcat(){
        List<string> catlist= new List<String>();
        catlist.add('C1');
        catlist.add('C2');
        catlist.add('C3');
        return catlist;
    }
    
    @AuraEnabled
    public static string createclient(String Sub,String ctype,String cat,Boolean Eattest,string cdate) {
        
        Ramyaraghu03__Client_Contact_Note__c cn = new Ramyaraghu03__Client_Contact_Note__c ();
        cn.Ramyaraghu03__Subject__c = Sub;
        cn.Ramyaraghu03__ContactType__c=ctype;
        cn.Ramyaraghu03__Client_Contact_Date__c=Date.valueof(cdate);
        cn.Ramyaraghu03__Category__c=cat;
        cn.Ramyaraghu03__Employee_Attestation__c=Eattest;
        insert cn;
        System.debug('cndetails'+ cn.ID);
        return cn.Id;
    }

}