/* 
 * SAMPLE JSON 
 {
  "AccountId": "0600080090",
  "officeFA": {"officeNo": "405","faNo": "002"},
   "assignToMSVA" :false,
}


*/
@RestResource(urlMapping ='/AccountCreate/*')
global without sharing class AccountCreateAPI {
  public static final string CLASSNAME = 'Prospect Creation';
    public static final string HTTPPOSTMETHOD = 'Creation of prospects';
    public static final string ERRSTATUS = 'error';
    public static final string SUCCSTATUSFORCREATION = 'Account has been created successfully';
    public static final string STRINGPAD = '0';
    public static final INTEGER INTEPAD= 3;
    public static List<Account> updateAccList = new List<Account>();
    
    
@HttpPost
    global static String CreateProspect() {
       
        RestRequest req = RestContext.request;
        String reqbody = req.requestBody.toString();
        Accountwrapper d  = (Accountwrapper) JSON.deserialize(reqbody,Accountwrapper.class);
       String status = Cprospectmthd(d);
        return status;
    }
    
    global static String Cprospectmthd (Accountwrapper aw){
        String AccountId;
        String newOffice;
        String newFA;
        try{
            if (aw.AId != null) {
                AccountId = aw.AId;
            }
            if(aw.offfajpn != null) {
              newOffice = (aw.offfajpn.OfficeNo).leftPAD(INTEPAD,STRINGPAD);
              newFA = (aw.offfajpn.faNo).leftPAD(INTEPAD,STRINGPAD);  
            }
            System.debug('AccountId' +AccountId );
            Account a = new Account();
            a.Id = AccountId;
            a.Ramyaraghu03__off__c =newOffice;
            update a;
           System.debug('Account Details' + a.Name); 
        }
        catch (Exception e){
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        return 'Success';
    }
    global without sharing class Accountwrapper {
        public string AId;
        public boolean AssigntoMSVA;
        public officeFAModel offfajpn;
    }
    global without sharing class officeFAModel {
        public string OfficeNo;
        public string faNo;
    }
}