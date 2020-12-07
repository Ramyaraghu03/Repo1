public class A2Ccontroller {
    @AuraEnabled
    public static List<Account> geta2c() {
        return [Select Id,Name,Industry,Type from Account LIMIT 10];
    }

}