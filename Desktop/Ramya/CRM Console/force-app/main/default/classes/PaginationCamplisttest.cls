@isTest
private class PaginationCamplisttest {
@isTest
    private static void testgetcamp() {
        PaginationCamplist pgt = PaginationCamplist.getcamp(false,false,8);
        System.assertEquals(false, pgt.hasprev);
    }   
@isTest
    private static void testgetcamp1() {
        PaginationCamplist pgt = PaginationCamplist.getcamp(true,true,10);
        
    } 
    @isTest
    private static void testhasprev() {
        boolean a = PaginationCamplist.hasprev(10);
        System.assertEquals(false, a);
    }
       @isTest
    private static void testhasprevneg() {
        boolean a = PaginationCamplist.hasprev(-1);
        System.assertEquals(true, a);
    }
    
    @isTest
    private static void testhasnext() {
       
        boolean b =PaginationCamplist.hasnxt(5,7,10);
        System.assertEquals(true, b);
        
    }
      @isTest
    private static void testhasnext1() {
       
        boolean b =PaginationCamplist.hasnxt(1,10,8);
        System.assertEquals(false, b);
        
    }
}