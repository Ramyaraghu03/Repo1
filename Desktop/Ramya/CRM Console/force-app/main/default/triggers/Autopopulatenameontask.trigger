trigger Autopopulatenameontask on Task (before insert) {
    for (Task t : trigger.new) {
        Id relatedaccount;
      
        relatedaccount= t.AccountId;
        System.debug('relatedaccount'+ relatedaccount );
        t.whoID = t.AccountId ;
       
    }

}