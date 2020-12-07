@isTest
private class TestRestrictContactByName {
    @isTest static void Testcontact()
    {
        Contact con = new Contact (LastName='INVALIDNAME');
        Test.startTest();
        insert con;
         Test.stopTest();
    }
     @isTest static void Testcontact1()
    {
        Contact con1 = new Contact (LastName='VALIDNAME');
       Test.startTest();
        insert con1;
        con1.LastName='INVALIDNAME';
            update con1;
         Test.stopTest();
        }
    }