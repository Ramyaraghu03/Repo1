global class birthdaybatch  implements Database.Batchable<sObject>, Database.Stateful {
      global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
        'Select Id,Ramyaraghu03__Birthdate__c from Account where Ramyaraghu03__Birthdate__c >= NEXT_N_DAYS:15 ');

     }
     global void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of records
        List<Account> bupdate = new List<Account>();
        for (Account a: scope) {
           
       a.Ramyaraghu03__Isbirthday_upcoming__c = True;
            bupdate.add(a);
         recordsProcessed = recordsProcessed + 1;       
                       
        }
    update bupdate;
}
     
     global void finish(Database.BatchableContext bc) {
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        
    } 
}