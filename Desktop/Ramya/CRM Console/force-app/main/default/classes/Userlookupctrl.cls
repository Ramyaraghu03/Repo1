public class Userlookupctrl {
    public static List<User> fetchuserlookup(String searchKeyword) {
        String Skey = searchKeyword+ '%';
        List<User> returnlist = new List<User>();
        String sQuery = 'Select Id,Name from User Where Name LIKE : Skey LIMIT 5';
        List<User> userlist = Database.query(sQuery);
        for(User u :userlist) {
            returnlist.add(u);
        }
        return returnlist;
    }
}