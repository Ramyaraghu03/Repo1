public class CreateProspectcontroller {
    @auraEnabled
    public static Account createperson(Account ain) {
              
        insert ain;
        system.debug('ain'+ain.name);
        return ain;
        
    } 
 @auraEnabled
    public static Account createentity(Account ein) {
              
        insert ein;
        system.debug('ein'+ein.name);
        return ein;
        
    } 
    @AuraEnabled
public static List<ListView> getListViews() {
    List<ListView> listviews =
        [SELECT Id, Name FROM ListView WHERE SobjectType = 'Account'];

    // Perform isAccessible() check here
    return listviews;
}
}