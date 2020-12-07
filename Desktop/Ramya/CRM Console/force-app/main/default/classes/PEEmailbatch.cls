global class PEEmailbatch implements Database.Batchable <sobject> {
    global String [] email = new String[] {'ramyaraghu03@gmail.com'};
         
  // Start Method
   global Database.Querylocator start (Database.BatchableContext BC) {
      return Database.getQueryLocator('Select Id,Name,Ramyaraghu03__Status__c,Ramyaraghu03__Reason_Code__c from Ramyaraghu03__Participant_Expiration__c');
      // Query which will be determine the scope of Records fetching the same
   }
   global void execute (Database.BatchableContext BC, List<sobject> scope) {
       List<Ramyaraghu03__Participant_Expiration__c> PElisttoupdate = new List<Ramyaraghu03__Participant_Expiration__c>();
       for(sObject objScope : scope) {
           Ramyaraghu03__Participant_Expiration__c PE = (Ramyaraghu03__Participant_Expiration__c)objScope;
           	PE.Ramyaraghu03__Status__c = 'Processed';
           PE.Ramyaraghu03__Reason_Code__c = 'Expired';
           PElisttoupdate.add(PE);
           System.debug('PElistupdated' +PElisttoupdate);
       }
     if(PElisttoupdate.size() >0 && PElisttoupdate != null) {
           Database.update(PElisttoupdate,false);
           System.debug('List Size'+ PElisttoupdate.size());

       }
       
   }
   global void finish(Database.BatchableContext BC) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      
      // Below code will fetch the job Id
      AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors,
      a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById,
      a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
      
      // get the job Id
      System.debug('$$$ Jobid is'+BC.getJobId());
      
      // below code will send an email to User about the status
      mail.setToAddresses(email);
      mail.setReplyTo('ramyaraghu03@gmail.com'); // Add here your email address
      mail.setSenderDisplayName('Auto Expiration Notification');
      mail.setSubject('Participant Expiration Notification');
      mail.setPlainTextBody('The following Participants have been expired from your Queue in Salesforce');
      Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
   }
       
   }