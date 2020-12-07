public class leadlist {
    @AuraEnabled
    public static List<Lead>fetchleads() {
        User u =[Select Id from User where ID = : UserInfo.getUserId()];
        List<Lead> llist = new List <Lead>([Select Id,Name,Rating,CreatedDate from Lead where OwnerID =: u.Id AND Status != 'Closed - No Interest'LIMIT 5]);
        return llist;
        
    }
    @AuraEnabled
    public static integer myleadscount() {
        User u =[Select Id from User where ID = : UserInfo.getUserId()];
        Integer MCount = 0;
         List<Lead> llistcount = new List <Lead>( [select id, name,status from Lead where OwnerID =: u.Id AND status !='Closed - No Interest' AND ISConverted =False ]); 
       MCount = llistcount.size();
        return MCount;
    }

}