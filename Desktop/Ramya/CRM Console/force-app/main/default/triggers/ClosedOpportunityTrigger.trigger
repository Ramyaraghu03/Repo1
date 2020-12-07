trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> tasks = new List<Task>();
     
    for (Opportunity opp: Trigger.New) {
        If (Trigger.isUpdate){
        if(opp.StageName!=trigger.oldMap.get(opp.Id).stageName && opp.StageName == 'Closed Won'){
            tasks.add(new Task(Subject = 'Follow Up Test Task',WhatId = opp.Id)) ;
        }
    } 
   
    If (Trigger.isInsert){
        if(opp.StageName == 'Closed Won'){
            tasks.add(new Task(Subject = 'Follow Up Test Task',WhatId = opp.Id)) ;
        } 
    } 
}    
    if (tasks.size()> 0){
        insert tasks;
    }
}