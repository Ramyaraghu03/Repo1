global class bulkImportbatch implements Database.Batchable<string>, Database.Stateful
{

   global final blob dataDocuments;
  
   global bulkImportbatch (blob data)
   {
             this.dataDocuments=data;
   }

   global Iterable<string>  start(Database.BatchableContext BC)
   {
       string nameFile=this.dataDocuments.toString();
       List<Lead> leadstoUpload = new List<Lead>();
     system.debug(' Batch started bankStatment new created ');
      return new CSVIterator(this.dataDocuments.toString(), '\n');
   }

   global void execute(Database.BatchableContext BC,List<String> scope)
   {
       //integer i=0;
       List<Lead> lst=new list<Lead>();
        for(String row : scope)
       {

         List<String> fields = row .split(',');
         IF(fields[0]!='*Date')
         {
             Lead li=new Lead();
          li.LastName = fields[0];
             li.MobilePhone=fields[1];
             li.Phone =fields[3];
                 
              lst.add(li);

              }
       }
       insert lst;

   }

   global void finish(Database.BatchableContext BC){
  
     system.debug(' Batch finish bankStatment new created ');
   }

  
  
}