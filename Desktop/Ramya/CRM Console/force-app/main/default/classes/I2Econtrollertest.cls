@isTest
private class I2Econtrollertest {
    @isTest static void testgetselectOptions() {
        List<String> statusvalues = new List<String>();
        String recid = 'a170K00000bKSq5QAG';
        String fldName = 'Ramyaraghu03__Status__c';
        sObject obj = new Ramyaraghu03__TalkingPoints__c();
        statusvalues = I2Econtroller.getselectOptions(obj,fldName, recid);
        System.assertEquals(true, statusvalues.contains('Reviewed'));
    }

}