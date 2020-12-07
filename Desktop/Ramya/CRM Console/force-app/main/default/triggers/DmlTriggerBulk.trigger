trigger DmlTriggerBulk on Account (before insert) {

    List<Opportunity>Opstoupdate = new List<Opportunity>();
    for(Opportunity opp : [Select ID,Name,Probability From Opportunity where AccountID IN :Trigger.New])
    {
        if ((opp.Probability >=50) && (opp.probability<100))
        {
            opp.Description = 'New Description for Opportunity';
            Opstoupdate.add(opp);
        }
        update Opstoupdate;
        }
}