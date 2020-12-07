global class AccountService {
WebService static String createAccount(String Name, String Phone) {
Account a = new Account();
a.Name= Name;
a.Phone =Phone;

insert a;
if(a.ID != NULL) { return 'SUCCESS';
} else {
return 'FAILURE';
}
}
}