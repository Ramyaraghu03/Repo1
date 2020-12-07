public class PassNonPrimitiveTypeExample {
     public static void createTemperatureHistory() {
        List<Integer> fillMe = new List<Integer>();        
        reference(fillMe);
        // The list is modified and contains five items
        // as expected.
        System.assertEquals(fillMe.size(),5);  
         
        
        List<Integer> createMe = new List<Integer>();
        referenceNew(createMe);
        // The list is not modified because it still points
        // to the original list, not the new list 
        // that the method created.
        System.assertEquals(createMe.size(),0);  
         System.debug(createMe);
    }
            
    public static void reference(List<Integer> m) {
        // Add rounded temperatures for the last five days.
        m.add(70);
        m.add(68);
        m.add(75);
        m.add(80);
        m.add(82);
    }    
        
    public static void referenceNew(List<Integer> m) {
        // Assign argument to a new List of
        // five temperature values.
        m = new List<Integer>{55, 59, 62, 60, 63};
    }

}