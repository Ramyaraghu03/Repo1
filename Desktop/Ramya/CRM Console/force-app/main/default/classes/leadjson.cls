public class leadjson {
    
    public static boolean mjsonl()
        
    {
        String requestJSON;
       List<Lead> leadRec = new List<Lead>();
        leadRec = [Select Id,Salutation, FirstName, LastName from Lead Limit 1]; 
                 
            if(!leadRec.isEmpty()) {
                System.debug('lead Record ' + leadRec[0]);
                requestJSON = JSON.serializePretty(leadRec[0]);
                System.debug('requestJSON ' + requestJSON);
            }
        return true;
    }
}