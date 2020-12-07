public class ParentChild {
public List<Account> acc {get;set;}
public PageReference show()
{
acc= [Select Name,Industry,(Select Email from contacts) from Account];
return null;
}
}