@isTest 
public class TestForceForecasting {
    static testMethod void insertNewUser() {
       
       User userToCreate = new User();
       
       // Do you recognize these fields?
       userToCreate.FirstName = 'Lisa';
       userToCreate.LastName  = 'Lee';
       userToCreate.Email     = 'Lisale@gmail.com';
       userToCreate.Username  = 'Lisale@gmail.com';
       userToCreate.Alias     = 'Lisa';
        userToCreate.ProfileId = '00ei0000000rLoH';
       
insert userToCreate;
    }
}