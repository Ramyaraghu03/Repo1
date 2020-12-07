public class wizard_class {
 Account a = new Account();
 Contract c= new Contract();
 Order o = new Order();
    Public Account geta(){
        return a;
    }
   Public Contract getc(){
        return c;
    }
    Public Order geto(){
        return o;
    }
    Public Pagereference gotopage1(){
        return page.Page1;
    }
    Public Pagereference gotopage2(){
        return page.Page2;
    }
     Public Pagereference gotopage3(){
        return page.Page3;
    }
    Public Pagereference gotopage4(){
        return page.Page4;
    }
     Public Pagereference SaveAccount(){
         insert a;
         return null;
     }
     Public Pagereference SaveContract(){
         c.AccountId = a.Id;
         insert c;
         return null;
     }
        Public Pagereference Saveorder(){
         o.AccountId = a.Id;
         o.ContractId = c.Id;
         insert o;
        return null;
     }   

    }