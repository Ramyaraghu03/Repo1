public class Recurrencetaskclass {
    public static void updateenddatebeforeevent (List<Task> newtasks) {
        List<Task> recTasks = new List<Task>();
        for(Task t :  newtasks) {
            if(t.isRecurrence == TRUE ) {
               recTasks.add(t);
               }
             setRecurringTasksDueDate(recTasks, true);
            
          
        }
        
    }
    public static void validationred (List<Task> nt) {
        for(Task t0 : nt) {
        if(!t0.IsRecurrence && t0.Ramyaraghu03__Recurrence_End_Date__c != NULL && String.isBlank(t0.RecurrenceActivityId)) {
            t0.addError('Select Create Recurrence checkbox');
        }
        }
    }
    public static void updateparentafterupdate (Map<Id,Task> ntask, Map<Id,Task> oTask) {
        Map<Id,Task> childTaskMap = new Map <Id,Task>();
        Map<Id,Task> parentMap = new Map <Id,Task>();
      List<Task> parenttaskupdaterecurrence = new List<Task>();
        for(Task t : ntask.values()) {
            /* for completed child task */
            if(t.RecurrenceActivityID != NULL && !oTask.get(t.Id).status.equalsIgnoreCase('Completed') && ntask.get(t.Id).status.equalsIgnoreCase('Completed')) {
                childTaskMap.put(t.RecurrenceActivityId,t);
            }
            //If the status is completed in child task update RecurrenceEnddateonly on parent
            for (Task p : [Select Id,RecurrenceActivityId,Ramyaraghu03__Recurrence_End_Date__c from Task where RecurrenceActivityID in :childTaskMap.keyset() ]) {
                parenttaskupdaterecurrence.add(p);
            }
            if(t.RecurrenceActivityId!= NULL && oTask.get(t.id).Ramyaraghu03__Recurrence_End_Date__c != nTask.get(t.Id).Ramyaraghu03__Recurrence_End_Date__c) {
                parentMap.put(t.RecurrenceActivityId,t);
            }
            
        }
        setRecurringTasksDueDate(childTaskMap.values(), false);
            setRecurringTasksDueDate(parenttaskupdaterecurrence ,true);
    }
        @testvisible
  private static void setRecurringTasksDueDate(List<Task> taskList, boolean isMasterTask) { 
      for(Task t1 : Tasklist) {
              /** Store the actual End date in the Parent tasks - custom Recurrence End date field*/
          if(isMasterTask && t1.RecurrenceStartDateOnly !=NULL ) {
              t1.Ramyaraghu03__Recurrence_End_Date__c = t1.RecurrenceEndDateOnly;
          }
              if(t1.RecurrenceType.equalsIgnoreCase('RecursDaily')) {
                  t1.RecurrenceEndDateOnly = t1.RecurrenceStartDateOnly;
                  
              }
          else if(t1.RecurrenceType.equalsIgnoreCase('RecursMonthly')) {
              if(t1.RecurrenceStartDateOnly.day() == t1.RecurrenceEndDateOnly.day()) {
                  t1.RecurrenceEndDateOnly = t1.RecurrenceStartDateOnly.addMonths(1) - 1;
              }
              else {
                  t1.RecurrenceEndDateOnly = t1.RecurrenceStartDateOnly.addMonths(1);
              }
          }
              
              
          }
      }
    
 
       
    }