public class WSelectclass  {
    public List<wrappercbox> wc{get;set;}
    public List<wrappercbox> wcselected{get;set;}
    public Wselectclass() {
        wc= new List<wrappercbox>();
        wcselected = new List<wrappercbox>();
        
        List<Class__c> clist = [Select Name,Max_Deskcost__c,Min_Deskcost__c,No_of_Desks__c,Avg_Deskcost__c from Class__c];
         for(Integer i=0; i< clist.size();i++) {
             boolean check = false;
             if(clist[i].Max_Deskcost__c > =2000) {
                 check=true;
             }
          wc.add(new wrappercbox (check,String.valueof(i+1),clist[i])); 
          
        }
      }
      
     public PageReference Redirectselect() {
         for(wrappercbox wr: wc) {
             if(wr.checkbox==true) {
               wcselected.add(wr);
                }
         }
   return Page.Wselected;
        }
 public class wrappercbox {
        Public Class__c cl {get;set;}
        public Boolean checkbox {get;set;}
        public String slno{get;set;}
    
    public wrappercbox(boolean c,string s,class__c cla) {
      this.checkbox=c;
        this.slno=s;
        this.cl=cla;
    }
       public wrappercbox(string s,class__c cla) {
      this.checkbox= false;
        this.slno=s;
        this.cl=cla;
    }
 }

}