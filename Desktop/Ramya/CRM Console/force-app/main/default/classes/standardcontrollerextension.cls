public class standardcontrollerextension {
   public Account acct;
    Public List<Opportunity> childopps {get;set;}
    
public standardcontrollerextension (ApexPages.standardcontroller controller)
{
  acct =[select Name,Rating from Account where id=: ApexPages.currentPage().getParameters().get('id')];
}
public List<Opportunity> getChildOpps() {
 return [Select Name, Amount, StageName, CloseDate
 From Opportunity
 Where AccountId = :acct.ID
 and (IsWon = true or IsClosed = false)];
}
private void createTaskOnChildOpps() {
 List<Task> tasksToInsert = new List<Task>();
 for (Opportunity opp : childOpps) {
 if (!opp.isClosed) {
 tasksToInsert.add(
 new Task(
 WhatId = opp.Id,
 OwnerId = opp.OwnerId,
 ActivityDate = Date.today() + 3,
 Status = 'Not Started',
 Subject = 'Send follow-up email to primary contact'));

 }
 if (tasksToInsert.size() > 0) insert tasksToInsert;
}
}
public PageReference updat() {
 if (acct.Rating == 'Hot') {
 createTaskOnChildOpps();
 }
 upsert acct;
 return new PageReference('/' + acct.Id);
      }

}