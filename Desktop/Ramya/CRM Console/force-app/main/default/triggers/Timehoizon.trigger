trigger Timehoizon on Opportunity (before insert,before update) {
    public static integer dayscount;
    if(trigger.isinsert || trigger.isupdate  && trigger.isBefore ) {
        for(Opportunity o : trigger.new ) {
            if (o.CloseDate != null) {
               Dayscount = Date.today().daysBetween(o.CloseDate);
            if(Dayscount>=180){
                o.Ramyaraghu03__Opp_Time_Horizon__c='Long Term';
            }
            else {
             o.Ramyaraghu03__Opp_Time_Horizon__c='Short Term';  
            }
            }
        }
        }
}