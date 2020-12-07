trigger ExampleTrigger on Contact (after insert ,after delete) 
{
    if (Trigger.isInsert)
    {
        Integer recordcount = Trigger.new.size();
        EmailManager.sendMail('ramyaraghu03@gmail.com', 'Trailheadtrigger tutorial', recordCount + 'contacts were inserted.');   
    }
    else If(Trigger.isDelete)
    {
        //Process after delete
    }
}