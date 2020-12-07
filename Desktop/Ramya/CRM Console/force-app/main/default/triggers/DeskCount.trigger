trigger DeskCount on Ramyaraghu03__Desk__c (after insert,after update,before delete,after undelete) {
      Set<Id> cId = new Set<Id>();
    if(Trigger.isInsert || Trigger.isUndelete){
        for(Desk__c d : Trigger.New){
            cId.add(d.Class__c);
        }
        List<Class__c> cr = [select id,No_of_Desks__C from Class__c where Id in:cId];
    List<Desk__c> dno = [select id from Desk__c where Class__c in :cId];
               
       for(Class__c c : cr){
           for(aggregateresult ag: [select class__c c, max(Cost__c)mac ,min(Cost__c)mic ,avg(Cost__c) avc from Desk__c where Class__c in :cId group By Class__c]) {
              c.No_of_Desks__c=dno.size();
          c.Ramyaraghu03__Max_Deskcost__c = (Decimal)ag.get('mac');
               c.Ramyaraghu03__Min_Deskcost__c = (Decimal)ag.get('mic');
               c.Ramyaraghu03__Avg_Deskcost__c = (Decimal)ag.get('avc');
           }
             
           update cr;

}
    }

        if(Trigger.isUpdate)  {
           Set<Id> ocId = new Set<Id> ();
              for(Desk__c d : Trigger.new ) {
            cId.add(d.Class__c);
            ocID.add(Trigger.oldMap.get(d.ID).Class__c);
List<Class__c> cr = [select id,No_of_Desks__C from Class__c where Id in:cId];
    List<Desk__c> dno = [select id from Desk__c where Class__c in :cId];

for(Class__c c : cr){
           for(aggregateresult ag: [select class__c c, max(Cost__c)mac ,min(Cost__c)mic ,avg(Cost__c) avc from Desk__c where Class__c in :cId group By Class__c]) {
              c.No_of_Desks__c=dno.size();
          c.Ramyaraghu03__Max_Deskcost__c = (Decimal)ag.get('mac');
               c.Ramyaraghu03__Min_Deskcost__c = (Decimal)ag.get('mic');
               c.Ramyaraghu03__Avg_Deskcost__c = (Decimal)ag.get('avc');
           }
             
           update cr;
               List<Class__c> ocr = [select id,No_of_Desks__C from Class__c where Id in:ocId];
               List<Desk__c> odno = [select id from Desk__c where Class__c in :ocId];
      
       for(Class__c oc : ocr) {
           for(aggregateresult ag: [select class__c c, max(Cost__c)mac ,min(Cost__c)mic ,avg(Cost__c) avc from Desk__c where Class__c in :ocId group By Class__c]) {
              oc.No_of_Desks__c=odno.size();
          oc.Ramyaraghu03__Max_Deskcost__c = (Decimal)ag.get('mac');
               oc.Ramyaraghu03__Min_Deskcost__c = (Decimal)ag.get('mic');
               oc.Ramyaraghu03__Avg_Deskcost__c = (Decimal)ag.get('avc');
           }
             
           update ocr;

            
        }
           
            }
       
    }
}
     if(Trigger.isDelete){
        for(Desk__c d : Trigger.old){
            cId.add(d.Class__c);
        }
     List<Class__c> cr = [select id,No_of_Desks__C from Class__c where Id in:cId];
    List<Desk__c> dno = [select id from Desk__c where Class__c in :cId];
for(Class__c c : cr){
           for(aggregateresult ag: [select class__c c, max(Cost__c)mac ,min(Cost__c)mic ,avg(Cost__c) avc from Desk__c where Class__c in :cId group By Class__c]) {
              c.No_of_Desks__c=dno.size();
          c.Ramyaraghu03__Max_Deskcost__c = (Decimal)ag.get('mac');
               c.Ramyaraghu03__Min_Deskcost__c = (Decimal)ag.get('mic');
               c.Ramyaraghu03__Avg_Deskcost__c = (Decimal)ag.get('avc');
           }
             
           update cr;
    }
     }
}