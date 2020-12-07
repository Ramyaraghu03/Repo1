public class SelectExample {

    public String myval { get; set; }
    public selectOption[] myoption{get;set;}
    public SelectExample()
    {
        selectOption op1 = new Selectoption('Jan','one');
        selectoption op2 = new Selectoption('Feb','Two');
        myoption = new selectoption[] {op1,op2};
    }
}