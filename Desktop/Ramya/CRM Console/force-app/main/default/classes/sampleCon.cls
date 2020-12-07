/*** Controller: ***/
public class sampleCon {

    public String  countries {get;set;}
    public String selectedvalues {get;set;}
                                       
public PageReference test() {
 Selectedvalues = countries; 
return null;
}
    public String getcountries(){
        return countries;
    }
    public void setCountries(String c)
    {
      this.countries = c;  
    }
public List<SelectOption> getItems() {
List<SelectOption> options = new List<SelectOption>();
options.add(new SelectOption('US','US'));
options.add(new SelectOption('CANADA','Canada'));
options.add(new SelectOption('MEXICO','Mexico'));
return options;
}

}