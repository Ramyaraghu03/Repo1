trigger AccountAddressTrigger on Account (before insert, before update) {
    if (Trigger.isInsert || Trigger.isUpdate)
    {
      List<Account> acts=Trigger.New;
        Actrelated.Actaddress(acts);
    }


}