trigger duplicateleadtrigger on Lead (before insert,before update) {
    
    Set<String>Emailset = new set<String>();
    set<String> cEmailset = new Set<String>();
    if(Trigger.isInsert && Trigger.isBefore) { 
    for(Lead l : Trigger.new) {
        Emailset.add(l.Email) ;
    }
    List<Contact> conlist = new List<Contact>([Select Id,Name,Email from Contact where Email IN :Emailset]);

    for(Contact c: conlist) {
        
        cEmailset.add(c.Email);
    }
    for(Lead l :Trigger.new) {
        
        if((cEmailset.contains(l.Email))) {
            l.addError('Contact already exists with same Email address');
        }
            }
        
    }
    if(Trigger.isUpdate && Trigger.isBefore ){
        Set<string>dbemail = new set<String>();
        for (lead l : Trigger.new ) {
            Emailset.add(l.Email) ;
        }
        for (lead l : trigger.old) {
            dbemail.add(l.Email);
        }
        for(lead l : Trigger.new) {
            if(dbemail.contains(l.Email) ) {
                l.addError('lead already exists');          
            }

        }
    }
}