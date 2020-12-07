public with sharing class CasesControllerselect
{
    private ApexPages.StandardSetController standardController;

    public CasesControllerselect(ApexPages.StandardSetController standardController)
    {
        this.standardController = standardController;
    }

    public PageReference bumpCases()
    {       
        // Get the selected records (optional, you can use getSelected to obtain ID's and do your own SOQL)
        List<Case> selectedCases = (List<Case>) standardController.getSelected();

        // Update records       
        for(Case selectedCase : selectedCases)
        {
            if(selectedCase.Priority == null) 
                selectedCase.Priority = 'Low';
            else if(selectedCase.Priority == 'Low')
                selectedCase.Priority = 'Medium';
            else if(selectedCase.Priority == 'Medium')
                selectedCase.Priority = 'High';
        }       

        return null;        
    }

    public PageReference updateCases()
    {       
        // Call StandardSetController 'save' method to update (optional, you can use your own DML)
        return standardController.save();   
    }
}