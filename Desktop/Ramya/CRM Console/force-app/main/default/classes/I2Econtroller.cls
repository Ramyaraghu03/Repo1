global with sharing class I2Econtroller {
@AuraEnabled 
    public static List<Ramyaraghu03__TalkingPoints__c> getTalkingpoints (String accountId) {
        List<Ramyaraghu03__TalkingPoints__c> tpointslist = new List<Ramyaraghu03__TalkingPoints__c>();
        tpointslist = [Select Id,Name,Ramyaraghu03__Client_Prospects__c from Ramyaraghu03__TalkingPoints__c Where Ramyaraghu03__Client_Prospects__c = : accountId ORDER BY Ramyaraghu03__Score__c DESC ];

        return tpointslist;
      
    }
@AuraEnabled
    public static List<String> getStatuspicklist(sObject objObject,String fld, String recId)  {
        
        List <String> statuspicklist = new List <String>();
        // Get the object type of the SObject.
        Schema.sObjectType Tobjtype = objObject.getSObjectType();
        System.debug('recID' +recId);
        Ramyaraghu03__TalkingPoints__c rts = [Select Id,Ramyaraghu03__Status__c	from Ramyaraghu03__TalkingPoints__c where Id = :recId];
        // Describe sObject using its type(talking Point-Type)
        Schema.DescribeSObjectResult TobjResult = Tobjtype.getDescribe();
        
        //Get fields for described sObject
        Map<String,Schema.sObjectField> fieldMap =	TobjResult.fields.getMap();
        List<Schema.PicklistEntry> svalues = fieldMap.get(fld).getDescribe().getPickListValues();
        if(rts.Ramyaraghu03__Status__c != NULL)  {
            statuspicklist.add(rts.Ramyaraghu03__Status__c);
        }
        else {
            statuspicklist.add('Select an Option');
        }
        for (Schema.PicklistEntry a: svalues) {
            String s=a.getValue();
            if(!statuspicklist.contains(s)){
                statuspicklist.add(s);}
        }
         
        return statuspicklist;
        
    }  
@AuraEnabled
public static Map<String, String> getselectOptions (sObject objObject,String fld, String recId)   {
    List<Ramyaraghu03__TalkingPoints__c> returnList;
    Map<String, String> options = new Map<String, String>();
        List <String> allpicklistval = new list <String> ();
    
Ramyaraghu03__TalkingPoints__c rts = [Select Id,Ramyaraghu03__Status__c,Ramyaraghu03__IdeaDescription__c from Ramyaraghu03__TalkingPoints__c where Id = :recId limit 1 ];
       System.debug('rts' + rts);
        //Get the object type of sObject
        Schema.SObjectType objType = objObject.getSObjectType();
System.debug('objtype' + objType );
    //Describe sObject using it s object type
        Schema.DescribeSObjectResult objDescribe =objType.getDescribe();
        //Map of fields for the sobject
       Map<String,Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
        //Get picklist values for the status field 
        List<Schema.PickListEntry> valueslist = fieldMap.get(fld).getDescribe().getPicklistValues();
       
        for(Schema.PicklistEntry a: valueslist) {
            options.put(a.getValue(), a.getLabel());
             }
        
    System.debug('options' + options);
        return options;
        } 
@AuraEnabled  
    public static boolean updateStatus (String IdofRecord, String Statusvalue) {
        System.debug('In update method apex');
        Ramyaraghu03__TalkingPoints__c relatedrecord =  [Select Id,Ramyaraghu03__Status__c	from Ramyaraghu03__TalkingPoints__c where Id =:IdofRecord limit 1];
        if(relatedrecord!= null){
      relatedrecord.Ramyaraghu03__Status__c = Statusvalue;
            update relatedrecord;
            System.debug('relatedrecord' + relatedrecord);
            return true;
        }
        else {
            return false;
        }
        
    }
    }