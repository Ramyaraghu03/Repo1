public class myControllerExtension {
private final Account acct;
// controller.
public myControllerExtension(ApexPages.StandardController stdController) {
this.acct = (Account)stdController.getRecord();
}
public String getGreeting() {
return 'Hello ' + acct.name +  '(' +  acct.id  +  ')';
}
}