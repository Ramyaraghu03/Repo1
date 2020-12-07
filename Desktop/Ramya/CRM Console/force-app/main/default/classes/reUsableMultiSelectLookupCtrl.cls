public class reUsableMultiSelectLookupCtrl {
  @AuraEnabled
    public static List <sObject> fetchLookUpValues(String searchKeyWord, String ObjectName, List<sObject> ExcludeitemsList) {
        String searchKey = '%' + searchKeyWord + '%';
        List <sObject> returnList = new List <sObject> ();
 
        List<string> lstExcludeitems = new List<string>();
        for(sObject item : ExcludeitemsList ){
            lstExcludeitems.add(item.id);
        }
        
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5 and exclude already selected records  
        String sQuery =  'Select id,Name from User WHERE Name LIKE: searchKey AND Id NOT IN : lstExcludeitems order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
   @AuraEnabled
    public static boolean shareCampaign(Id cID,List<User> ulist) {
        List<CampaignShare> cslist = new List<CampaignShare>();
        for(User u : ulist) {
        CampaignShare camp = new CampaignShare();
        camp.CampaignId = cId;
        camp.UserOrGroupId = u.Id;
        camp.CampaignAccessLevel ='Edit'; 
            cslist.add(camp);
        }
       Database.SaveResult[] sr = Database.insert(cslist,false);
        System.debug('cslist' + cslist);
		return true; 
    }
}