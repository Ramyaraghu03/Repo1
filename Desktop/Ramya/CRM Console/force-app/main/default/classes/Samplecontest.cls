@isTest
public class Samplecontest {
   static testmethod void testSamplecontest(){
  //Test converage for the myPage visualforce page
  PageReference p = Page.checkbox;
  Test.setCurrentPageReference(p);
    
    Samplecon sc = new Samplecon();
    sc.countries = 'India';
    sc.test();
       system.assertEquals('India',sc.countries);

}
}