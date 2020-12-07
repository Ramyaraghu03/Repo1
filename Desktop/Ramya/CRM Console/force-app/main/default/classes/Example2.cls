public class Example2 
{
 public Integer avalue {get;set;}
 public Integer bvalue {get;set;}
 public Integer result {get;set;}
 public String operation {get;set;}
 public Pagereference Add()
 {
 Operation = 'Addition';
 result = avalue + bvalue;
 return null;
 }
 
 public Pagereference Sub()
 {
 Operation = 'Subtraction';
 result = avalue-bvalue;
 return null;
 }
 }