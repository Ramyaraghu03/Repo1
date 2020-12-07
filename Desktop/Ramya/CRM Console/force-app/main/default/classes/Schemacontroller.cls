public class Schemacontroller {
    public List<SelectOption> objects {get;set;}
    public List<String> objlist {get;set;}
        public Map<String, Schema.SObjectType> mobjs {get;set;}
    public String selectedobj {get;set;}
    public String res{get;set;}
    public Schemacontroller(){
        objects = new List<SelectOption>();
         objlist = new List<String>();
       Map<String, Schema.SObjectType> mobjs = Schema.getGlobalDescribe();
        System.debug('mobjkeyset' + mobjs.keySet());
        objlist.addAll(mobjs.keySet());
       objlist.sort();
        System.debug('objlist' + objlist);
        SelectOption sp = new SelectOption ('None', '-None-');
        objects.add(sp);
        for (String s : objlist) {
            SelectOption op = new SelectOption(s,s);
            objects.add(op);
        }
        System.debug('Objects'+ Objects);
    }
    public void details() {
        Schema.DescribeSObjectResult sresult = mobjs.get(selectedobj).getDescribe();
    res = ''+ sresult;
    }
    
    

}