public class ChangeOwnerClass {

 @AuraEnabled   
    public static List<User> listUser() {
       
 System.debug('listuser method called');
       List<User> ulist = [SELECT Id,Name FROM User];
        
      return ulist;
        }
@AuraEnabled
    public static String chgOwner(String oname,String opId){
        system.debug('oname'+oname);
        system.debug('opId'+opId);
       
	Opportunity op = [select Id,OwnerId from opportunity where id = :opId];
       List<User> u = [Select Id,Name from User where Id = :oname Limit 1];

        
        
	op.OwnerId =u[0].Id;
            update op;
        
        System.debug('updated owner Id'+ u[0].Id);
        System.debug('update owner name'+ u[0].Name);
 System.debug('Opid'+ op.Id); 
  System.debug('op ownerId' + op.OwnerId);  
          
	
 return op.OwnerId;       
   
    }
   
}