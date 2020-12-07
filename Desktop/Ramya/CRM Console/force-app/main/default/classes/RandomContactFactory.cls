public class RandomContactFactory {
    public static List<contact> generateRandomContacts(Integer noOfcontacts, String LName)
    {
        List<Contact> contactlist = new List<Contact>();
        for(Integer i=0;i<noOfcontacts;i++)
        {Contact con = new Contact(FirstName='Test'+i,LastName= LName);
         contactlist.add(con);   
        }
        insert contactlist;
        return contactlist;
        
    }

}