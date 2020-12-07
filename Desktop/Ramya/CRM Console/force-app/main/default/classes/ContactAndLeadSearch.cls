public class ContactAndLeadSearch {

public static List<List<sobject>> searchContactsAndLeads (String lname)

{

List<List<sobject>> conlead = [FIND :lname IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
return conlead;
}
}