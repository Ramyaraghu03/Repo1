public class SampleleadController {
  @AuraEnabled
    public static void createLead(Lead objLead){
        String msg = '';
        try{
            //Insert Lead Record
            insert objLead; 
           }
        catch(DmlException e){
             for (Integer i = 0; i < e.getNumDml(); i++) {
                //Get Validation Rule & Trigger Error Messages
                msg =+ e.getDmlMessage(i) +  '\n' ;
            }
            //throw DML exception message
            throw new AuraHandledException(msg);
             
        }
        catch(Exception e){
            //throw all other exception message
            throw new AuraHandledException(e.getMessage());
        }
}
}