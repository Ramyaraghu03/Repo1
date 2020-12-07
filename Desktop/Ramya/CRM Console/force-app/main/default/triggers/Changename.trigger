trigger Changename on Ramyaraghu03__Contact_Relationship__c (before update) {
    Set<ID> crids = new set<ID>();
    map<id,String>umap = new map<Id,string>();
    for(Contact_Relationship__c cn: Trigger.new ) {
        crids.add(cn.OwnerId);
    }
    List<User> uname = [Select Name from User where ID in :crids];
    for(User u: uname) {
        umap.put(u.id,u.Name);
    }
    for(Contact_Relationship__c cn: Trigger.new ) {
        cn.Name= umap.get(cn.ownerid);
    }

}