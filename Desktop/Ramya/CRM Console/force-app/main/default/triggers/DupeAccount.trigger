trigger DupeAccount on Account (before insert,before update) {
    if(Trigger.isbefore && Trigger.isInsert|| trigger.isbefore && trigger.isUpdate)
    {
   List<Account> acts=Trigger.New;
        Actrelated.Dupeacts(acts);
        
}
    }