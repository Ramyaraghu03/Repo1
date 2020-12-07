public class PaginationCamplist {
     @AuraEnabled
     public list<Campaign> cam;
      
     @AuraEnabled
     public integer offst;
      
     @AuraEnabled
     public integer total;
      
     @AuraEnabled
     public boolean hasprev;
      
     @AuraEnabled
     public boolean hasnext;
      
     private static integer pagesize=8;
     private static integer offset;
      
     @AuraEnabled
     public static PaginationCamplist getcamp(boolean next,boolean prev,decimal off){
        offset = (integer)off;
        list<Campaign> li = new list<Campaign>();
        integer listlength = [Select count() from Campaign LIMIT 100];
        if(!schema.sobjecttype.Campaign.isaccessible()){
            li = new list<Campaign>();
        }else{
         if(next==false && prev==false){
         li = [Select Id,Name,Status,Ramyaraghu03__No_of_CampaignMembers__c,EndDate from Campaign  LIMIT :pagesize OFFSET :offset];
         }else if(next==true && (offset+pagesize)<=listlength){
              offset=offset+pagesize;
          li = [Select Id,Name,Status,Ramyaraghu03__No_of_CampaignMembers__c,EndDate from Campaign LIMIT :pagesize OFFSET :offset];
         }else if(prev==true && offset>0){
          offset=offset-pagesize;
          li = [Select Id,Name,Status,Ramyaraghu03__No_of_CampaignMembers__c,EndDate from Campaign  LIMIT :pagesize OFFSET :offset];
         }
        }
        PaginationCamplist pg = new PaginationCamplist();
        pg.cam = li;
    pg.offst = offset;
    pg.hasprev = hasprev(offset);   
        pg.hasnext = hasnxt(offset,listlength,pagesize);
         
        return pg;
     }
    @Testvisible  
     private static boolean hasprev(integer off){
        if(off>0)
            return false;
        return true; 
    }
   @Testvisible 
     private static boolean hasnxt(integer off,integer li,integer ps){
        if(off+ps<li)
            return false;
        return true;
    }    
}