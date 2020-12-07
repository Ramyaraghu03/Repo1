public class SOQLPaginationController1 {
private Integer CountTotalRecords;
    private Integer OffsetSize = 0;
    private Integer QueryLimit = 10;
    public list <Account> lstAccount{get;set;}
    public SOQLPaginationController1 (){
        CountTotalRecords= [select count() from Account];
    }
  
    public list <Account> getAccounts(){
        lstAccount = new list  <Account> ();
        lstAccount = [Select id, Name, Industry, BillingState, Phone from Account order by Name limit :QueryLimit offset :OffsetSize];
        return lstAccount;
    }
    public PageReference Next() {
        OffsetSize += QueryLimit;
        return null;
    }
    public PageReference Previous() {
        OffsetSize -= QueryLimit;
        return null;
    }
  
    public Boolean getDisablePrevious(){
        if(OffsetSize>0){
            return false;
        }
        else return true;
    }
    public Boolean getDisableNext() {
        if (OffsetSize + QueryLimit < countTotalRecords){
            return false;
        }
        else return true;
    }
}