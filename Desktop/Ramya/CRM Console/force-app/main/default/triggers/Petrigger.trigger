trigger Petrigger on Participant_Expiration__c (before insert,before update) {
    if(Trigger.isInsert || trigger.isupdate) {
for(Participant_Expiration__c pe : trigger.New) {
    Petriggerhandler pt = new Petriggerhandler();
pt.handlebeforeinsert(Trigger.New);

}
    }
}