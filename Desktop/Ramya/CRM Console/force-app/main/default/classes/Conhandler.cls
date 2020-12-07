public class Conhandler {
   List<Contact_Relationship__c> crlist = new List<Contact_Relationship__c>();
    List<Contact_Relationship__c> crdelete = new List<Contact_Relationship__c> ();
    public static void onAfterInsert (List<Contact> cons) {
        List<Contact_Relationship__c> crlist = new List<Contact_Relationship__c>();
        for(Contact c: cons ) {
            if(c.contact_Relationship__c == true) {
            Contact_Relationship__c cr = new Contact_Relationship__c();
            cr.Name = c.LastName;
            cr.contact__c =c.id;
                crlist.add(cr);
            }
        
        }
       Database.insert(crlist,false);
        system.debug('check insert crlist' + crlist);
}
    public static void onafterupdate (List<contact> cons ,Map<Id,Contact>oldmap) {
        List<Contact_Relationship__c> crlist = new List<Contact_Relationship__c>();
         for(contact con : cons ) {
             
              if (con.Contact_Relationship__c != oldMap.get(con.ID).Contact_Relationship__c  && con.Contact_Relationship__c == true) {
                Contact_Relationship__c cr = new Contact_Relationship__c();
              cr.Name = con.LastName;
            cr.contact__c =con.id;
                crlist.add(cr);
               }
         }
         Database.insert(crlist,false);
        system.debug('check update crlist' + crlist);
    }
    public static void onbeforedelete(List<Contact> oc) {
        Set<Id> conIds = new Set<Id>();
        for(Contact c : oc) {
            conIds.add(c.id);
        }
        
        List<Contact_Relationship__c> crdelete = [Select id from Contact_Relationship__c where Contact__c IN : conIds];
        Database.delete(crdelete,false);
        }
    }