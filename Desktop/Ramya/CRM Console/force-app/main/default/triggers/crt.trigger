trigger crt on Contact (after insert,after update,before delete) {
    
        if(Trigger.isAfter&& Trigger.IsInsert) {
            Conhandler.onafterinsert(Trigger.new);
        }
    else if(Trigger.isAfter&& Trigger.Isupdate) {
        Conhandler.onAfterupdate(Trigger.new,Trigger.oldMap);
    }
    else if (Trigger.isBefore && Trigger.isDelete) {
        Conhandler.onbeforedelete(Trigger.old);
    }
    
    
}