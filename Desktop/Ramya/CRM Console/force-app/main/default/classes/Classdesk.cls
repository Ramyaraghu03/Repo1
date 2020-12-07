public class Classdesk {
    List<Desk__c> de=[Select Name,Cost__c,class__C from Desk__c];
    List<Class__c> cl=[select Name,No_of_Desks__c,Max_Deskcost__c from Class__c];
    public List<Class__c> getclasslist(){
        return cl;
    }
        public List<desk__c> getdesklist(){
        return de;
    }
    

}