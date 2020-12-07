public class Accountdisplay {

private ApexPages.StandardSetController standardController;

    public Accountdisplay(ApexPages.StandardSetController standardController) {
     this.standardController = standardController;

    }

 public PageReference editacct()
    {       
        // Get the selected records (optional, you can use getSelected to obtain ID's and do your own SOQL)
        List<Account> selectedaccts = (List<Account>) standardController.getSelected();
return null;
}
public PageReference isSelected()
    {       
       
        return standardController.save();   
    }
}