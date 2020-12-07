public with sharing class pantherupdatectrlr {
@AuraEnabled
    public static List<Contact> getContactlist(List<Id> AIds) {
        List<Contact> clist = [Select Id,FirstName,LastName,Phone,AccountId from Contact where AccountId IN :AIds];
        return clist;
    }    
@AuraEnabled
 public static Map<String,String> saveContactList (List<Contact> Clisttosave) {
       Map<String,String> resultMap = new Map<String,String>(); 
    
     System.debug('Save method in apex' + Clisttosave);
        try {
            
            update Clisttosave;
            resultMap.put('status','Success');
            resultMap.put('message','Contact saved successfully');
            System.debug('cList details' + Clisttosave);
         }
        catch (Exception e) {
           resultMap.put('status','error');
            resultMap.put('message',e.getMessage()); 
        }
    return resultMap;
}
@AuraEnabled
    public static Map<String,String> deleteContactList (List<Id> contactIds) {
        List<Contact> contactsToDelete = [Select Id From Contact where Id in : contactIds];
        Map<String,String> resultMap = new Map<String,String>(); 
        System.debug('In delete method');
        try{
            delete contactsToDelete;
             resultMap.put('status','Success');
            resultMap.put('message','Contact deleted successfully');
            System.debug('cList details delete' + contactsToDelete);
        }
        catch(Exception e){
            resultMap.put('status','error');
            resultMap.put('message',e.getMessage()); 
            
        }
        return resultMap;
    }
@AuraEnabled
    public static Map<String,String> CreateContact (Contact newCon)  {
         Map<String,String> resultMap = new Map<String,String>(); 
        System.debug('In Create new Contact method' + newCon);
        try{
            insert newCon;
             resultMap.put('status','Success');
            resultMap.put('message','Contact created successfully');
            System.debug('cList details delete' + newCon);
        }
        catch(Exception e){
            resultMap.put('status','error');
            resultMap.put('message',e.getMessage()); 
            
        }
        return resultMap;
        
    }  
}