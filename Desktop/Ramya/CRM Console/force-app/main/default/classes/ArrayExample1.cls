public class ArrayExample1 {

    public String name { get; set; }
    public Account[] myval {get;set;}
    public ArrayExample1()
    {
     Account  a1 = new Account(name='Sashi',Industry='Banking');  
      Account a2 = new Account(name='Sakshita',Industry='Insurance');  
       Account  a3 = new Account(name='Shaashith',Industry='Banking'); 
       myval = new Account[]{a1,a2,a3}; 
    }
    
}