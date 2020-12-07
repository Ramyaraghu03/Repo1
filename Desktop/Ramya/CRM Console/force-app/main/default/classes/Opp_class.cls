public class Opp_class {
    
   public static void op_check(List<Opportunity>ops)
   {
       Double Total_amt=0;
       for(Opportunity o1:[Select Amount from Opportunity where createdDate=Today 
                           and CreatedById = :UserInfo.getUserID()])
           Total_amt+=o1.amount;
           
   
    for(Opportunity o2:Ops)
    {
        Total_amt+=o2.Amount;
        if(Total_amt>10000)
            o2.addError('Opportunity amount cannot exceed 10000 based on your limit');
    }
   }

}