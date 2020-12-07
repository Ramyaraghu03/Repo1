public class SelectOptionController {
 public List<SelectOption> countrieLst {get;set;}
 public List<SelectOption> hobbiesLst {get;set;}
 public List<SelectOption> genderLst {get;set;}

 public String selectedCountry{get;set;}
 public String selectedHobby {get;set;}
 public String selectedGender {get;set;}
 public String selectedValues {get;set;}


 public SelectOptionController(){
  countrieLst = new List<SelectOption>();
  hobbiesLst = new List<SelectOption>();
  genderLst = new List<SelectOption>();
  
  countrieLst.add(new SelectOption('','--None--'));
  countrieLst.add(new SelectOption('India','India'));
  countrieLst.add(new SelectOption('China','China'));
  countrieLst.add(new SelectOption('US','US'));
  
  /* preparing picklist values in VF page.
  hobbiesLst.add(new SelectOption('','--None--'));
  hobbiesLst.add(new SelectOption('Swimming','Swimming'));
  hobbiesLst.add(new SelectOption('Reading','Reading'));
  hobbiesLst.add(new SelectOption('Cricket','Cricket'));
  */

  genderLst.add(new SelectOption('Male','Male'));
  genderLst.add(new SelectOption('Female','Female'));
   
 }

 public pageReference show(){
  selectedValues = 'Selected country:'+selectedCountry +'-->Selected Hobbies:'+selectedHobby+' Gender: -->'+selectedGender;
  return null;

 }


}