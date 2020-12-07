@isTest 
private class TestVerifyDate {
    @isTest static void testcheckdates()
    {
        Date d1 = Date.newInstance(2016,03,21);
        Date d2 = Date.newInstance(2016,03,24);
        date d =   VerifyDate.CheckDates(d1,d2);
        System.debug(d+' Run1: Date1: ' + d1+ 'Date2: ' + d2);
    }
@isTest static void testcheckdates2()
    {
        Date d1 = Date.newInstance(2016,03,10);
        Date d2 = Date.newInstance(2016,03,20);
        date d =   VerifyDate.CheckDates(d1,d2);
        System.debug(d+' Run1: Date1: ' + d1+ 'Date2: ' + d2);
    }
    @isTest static void testcheckdates3()
    {
        Date d1 = Date.newInstance(2016,03,01);
        Date d2 = Date.newInstance(2016,04,24);
        date d =   VerifyDate.CheckDates(d1,d2);
        System.debug(d+' Run1: Date1: ' + d1+ 'Date2: ' + d2);
    }
}