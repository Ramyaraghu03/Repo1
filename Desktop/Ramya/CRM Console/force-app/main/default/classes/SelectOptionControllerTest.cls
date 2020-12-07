@isTest
Public class SelectOptionControllerTest {
 static testmethod void testSelectOptionController(){
  //Test converage for the myPage visualforce page
  PageReference pageref = Page.SelectOption;
  Test.setCurrentPageReference(pageref);
  
  // create an instance of the controller
  SelectOptionController sop= new SelectOptionController ();
  sop.selectedCountry ='India';
  sop.selectedHobby='Swimming';
  sop.selectedGender ='Male';
  sop.show();
  
  system.assertEquals('India',sop.selectedCountry);
  system.assertEquals('Swimming',sop.selectedHobby);
  system.assertEquals('Male',sop.selectedGender);
  }
}