trigger Tasktrigger on Task (before insert,after update) {
    if(trigger.isBefore && trigger.isInsert ) {
     
Recurrencetaskclass.updateenddatebeforeevent(Trigger.new);
       Recurrencetaskclass.validationred(Trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate) {
        
    }
}