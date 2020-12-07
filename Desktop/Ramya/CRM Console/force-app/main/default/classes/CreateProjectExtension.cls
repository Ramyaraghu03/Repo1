public class CreateProjectExtension {

    private ApexPages.StandardController sc;
    public Sprints__c sprints{get;set;} 
    public List<Sprints__c> sprintlist{get;set;}
     public Story__c story{get;set;} 
    public List<Story__c> storylist{get;set;}
    public string SelectedSprint{get;set;}
    public CreateProjectExtension(ApexPages.StandardController std){
        sc=std;
        sprints=new Sprints__c();
        sprintlist = new List<Sprints__c>();
       }
    
    public PageReference ToSprint(){
        System.debug('url'+ApexPages.CurrentPage().GetURL());
        if(ApexPages.CurrentPage().GetURL().StartsWith('/apex/ramyaraghu03__createproject'))
        {            
            sc.save();
        }
        return Page.CreateSprint;
    }
     public PageReference ToPage1()
        {
            return Page.CreateProject;
        }
    
    public PageReference Savesprints()
    {
        Projects__c proj = (Projects__c)sc.getrecord();
        Sprints.Projects__c =proj.Id;
        insert sprints;
         sprintlist.add(sprints);
        sprints= new sprints__c();
        return null;
    }
    public PageReference ToPage3()
    {
        return Page.Createstory;
    }
    public Pagereference Savestory()
    {   
        story.Sprints__c= selectedSprint;
     insert story;
     storylist.add(story);
     story=new story__c();
        return null;
    }
}