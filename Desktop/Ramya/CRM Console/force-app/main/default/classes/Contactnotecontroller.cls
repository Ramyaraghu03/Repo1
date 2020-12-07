public class Contactnotecontroller {
    
    @AuraEnabled
    public static List<String> getCategory(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Ramyaraghu03__Client_Contact_Note__c.Ramyaraghu03__Category__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            options.add(p.getLabel());
        }
        System.debug('options' + options);
        return options;
    }
}