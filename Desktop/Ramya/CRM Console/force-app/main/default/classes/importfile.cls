public class importfile {
 
    //declare all class variables
    public Blob csvFileBody{get;set;}         //geter and setter methods for VF page less
    public string csvAsString{get;set;}
 
    public String[] csvFileLines;
    public string[] csvRecordData;
    public List<lead> l_lst;     
    public Map<String,Lead> l_map; //will be used to create a map from l_lst
 
    //define a wrapper class that will hold lead and the status!
    public class wrapLead {
        public Lead l {get;set;}
        public String csvStatus {get;set;}
 
        public wrapLead(Lead a, Map<String,Lead> l_map) {
            l = a;
            if(l_map.containsKey(a.Name)) {
                csvStatus = 'Duplicate';
            } else {
                csvStatus = 'Unique';
                //write you insert statement here (am commenting it to keep my DB clean :))
                insert a;
 
            }
 
        }
    }
 
    //wrapperobject to display on VF
    public List<wrapLead> wrapLead_lst {get;set;}
 
    public List<wrapLead> getLeads() {
        return wrapLead_lst;
    }
 
    //populate wrapperObject // **this is where the magic happens**
    public pagereference importCSVFile() {
        csvAsString = csvFileBody.toString();
        csvFileLines = csvAsString.split('\n');
        system.debug('csvFileLines= '+csvFileLines+' csvFileLines.size() = '+csvFileLines.size());
 
        //get all leads
        l_lst = new List<lead>([select Name from Lead]);
        //initialize the map
        l_map = new Map<String,Lead>();
        //populate the map
        for (lead a: l_lst) {
            system.debug('a = '+a);
            l_map.put(a.Name, a);
        }
 
        wrapLead_lst = new List<wrapLead>();
        for(Integer i=0;i<csvFileLines.size();i++) { //assuming no header in the CSV
            
           //read the csv row
        csvRecordData = csvFileLines[i].split(',');
        //get values from csv into the lead 
            Lead l = new Lead();
            l.FirstName = csvRecordData[0] ;
            l.LastName = csvRecordData[1];
            l.Email = csvRecordData[2];
            l.Company ='Target';
            wrapLead_lst.add(new wrapLead(l,l_map)); //use constructor to assign values to the wrap and add it to our wrapper list
 
            //if you dont like constructors, use the following
            //              wrapLead wa = new wrapLead();
            //              wa.l = a;
            //              wa.csvStatus = <build the logic here>
             
 
        }
        return null; 
    }
 
}