public class oapex {
    List<Opportunity> op = [Select name,Amount,stageName from Opportunity LIMIT 20];
    public List<Opportunity> getops(){
        return op;
    }
    
}