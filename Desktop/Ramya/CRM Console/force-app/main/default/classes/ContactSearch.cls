public class ContactSearch {
public static List<contact> searchForContacts(string lname,string postalcode)

{

return [select ID,Name,LastName,MailingPostalcode from contact where LastName=:lname AND MailingPostalcode =:postalcode];
}
}