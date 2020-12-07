public class lookUpController {
   @AuraEnabled
 public static List < account > fetchAccount(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List < Account > returnList = new List < Account > ();
  List < Account > lstOfAccount = [select id, Name from account where Name LIKE: searchKey];
 
  for (Account acc: lstOfAccount) {
     returnList.add(acc);
     }
  return returnList;
 }
}