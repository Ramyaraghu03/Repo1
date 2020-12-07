public class SchemaEx{
    public List<SelectOption> options;
    
    public list<SelectOption> getOptions(){
        return options;
    }
    
    public SchemaEx(){
        options = new List<SelectOption>();
        Map<String, Schema.SObjectType> schemaMap = schema.getGlobalDescribe();
        Set<String> objectSet = schemaMap.keySet();
        for(String str:objectSet){
            //praparing label and values in selection option.
            SelectOption op =new SelectOption(str,str);
            options.add(op);
        }
    }
    
    

}