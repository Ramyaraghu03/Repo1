public class Ctextension {
 private final Account acct;
 public Ctextension() {
 acct =[Select id,Name from Account where id =: ApexPages.currentPage().getParameters().get('id')];
 }
    public List<Opportunity> childOpps {
 get {
 if (childOpps == null)
 {
 childOpps = [Select Name, Amount, StageName, CloseDate,
OwnerId, IsClosed
 From Opportunity
 Where AccountId = :acct.Id
 and (IsWon = true or IsClosed = false)];
 }
 return childOpps;
 }
 set;
}
 public PageReference save() {
 update acct;
 return new PageReference('/' + acct.Id);
 }
}