public class TaskHistory {
    @AuraEnabled
    public static List<Task> gettaskhistory(Id actid)
    {
       
     return [Select Subject,ActivityDate,Status,CreatedById from Task where AccountId = :actid];
    }
    
}