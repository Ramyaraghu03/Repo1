public with sharing class CasesController 
{
    private ApexPages.StandardSetController standardController;
    set<id> ids = new set<id>();
     public string selectedFiles { get; set; }
    public string parentName{get;set;} 
    public Id parentId{get;set;}
    list<Attachment> lstAttach{get;set;}
    public CasesController(ApexPages.StandardSetController standardController)
    {
        this.standardController = standardController;
    }
    public PageReference bumpCases()
    {       
        // Get the selected records (optional, you can use getSelected to obtain ID's and do your own SOQL)
        List<Account> selectedAccounts = (List<Account>) standardController.getSelected();
        lstAttach = new list<Attachment>([select id, name from Attachment where parentid=:ids]);

        // Update records       
        for(Account selectedAccount : selectedAccounts)
        {
            ids.add(selectedAccount.id);
        } 
        /*PageReference p= new PageReference('/apex/TestChatter');
        p.setRedirect(true);*/
        return null;        
    }
}