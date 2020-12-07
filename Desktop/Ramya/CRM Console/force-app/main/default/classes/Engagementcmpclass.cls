public class Engagementcmpclass {
    @AuraEnabled
    public static List<Campaign> getCamps() {
        return [Select Id,Name,StartDate,EndDate,Type,Status from Campaign LIMIT 10];
    }
 @AuraEnabled
 public static List <String> getselectOptions(sObject objObject,string fld) {
  system.debug('objObject --->' + objObject);
  system.debug('fld --->' + fld);
  List < String > allOpts = new list < String > ();
  // Get the object type of the SObject.
  Schema.sObjectType objType = objObject.getSObjectType();
 
  // Describe the SObject using its object type.
  Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
 
  // Get a map of fields for the SObject
  map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
 
  // Get the list of picklist values for this field.
  list < Schema.PicklistEntry > values =
   fieldMap.get(fld).getDescribe().getPickListValues();
 
  // Add these values to the selectoption list.
  for (Schema.PicklistEntry a: values) {
   allOpts.add(a.getValue());
  }
  system.debug('allOpts ---->' + allOpts);
  allOpts.sort();
  return allOpts;
 }
 @AuraEnabled
    public static List<String> getStatus(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Campaign.Status.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            options.add(p.getLabel());
        }
        system.debug('Statusoptions ---->' + options);
        return options;
    }
}