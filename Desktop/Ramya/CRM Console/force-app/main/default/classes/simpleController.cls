public with sharing class simpleController {
    
    public List<contactWrapper> wrappedObjects = new List<contactWrapper>(); //list for holding the wrapped Contacts and Integers to be displayed on the page
    
    //contructor for the page
    public simpleController() {
        Integer i = 0; //integer for tracking the row counter value we want to pass back in the wrapper
        for (Contact c : [SELECT Account.Name, Email, FirstName, Id, LastName, Phone FROM Contact ORDER BY LastName LIMIT 10]) { //start looping through a bunch of Contact records
            i++; //increment the integer
            contactWrapper wrappedObject = new contactWrapper(c, i); //wrap the Contact with the Integer, which calls the contactWrapper class below
            wrappedObjects.add(wrappedObject); //add the wrapper object to our list
        }
    }
    
    //allows for Visualforce page to request the list of contactWrapper records
    public List<contactWrapper> getWrappedObjects() {
        return wrappedObjects; //return the list of contactWrapper records
    }
    
    //wrapper class definition
    public class contactWrapper {
        
        public Contact contact {get; set;} //Contact object
        public Integer rowCounter {get; set;} //row Integer
        
        //constructor for wrapper
        public contactWrapper(Contact passedContact, Integer passedInteger) {
            contact = passedContact; //assign Contact
            rowCounter = passedInteger; 
        }
    }
}