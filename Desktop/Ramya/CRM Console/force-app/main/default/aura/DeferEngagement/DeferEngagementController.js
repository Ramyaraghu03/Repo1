({
   openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
  // helper.fetchselectedreason(component);
   var Dfstatus = component.get("v.isDeferred");
       alert('Dfsta',Dfstatus);
       if(!Dfstatus)  {
      component.set("v.isModalOpen2",true);
       }
       else {
           component.set("v.isModalOpen1", true);
       }
       
       
   },
  
   closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen2", false);
       component.set("v.isModalOpen1", false);
   },
  doInit : function(component,event,helper)
    {
       /*  var Reasonselectedinpicklist = component.get("v.selectedValue");
        console.log ('SelectedValue',Reasonselectedinpicklist);
       if(Reasonselectedinpicklist == null) {
       helper.fetchdeferreason(component); 
        }
        else {
            helper.fetchselectedreason(component);
            component.set("v.EngagementReason",'');
        } */
        helper.fetchdeferreason(component);
    },
    handleReasonchange : function(component,event,helper) {
        var reasonselected = component.get("v.acc.Ramyaraghu03__Defer_Engagement_Reason__c");
        //alert(event.getSource().get("v.value"));
        var selectepicklist = event.getSource().get("v.value");
        component.find("myReason").set("v.value",selectepicklist);
        component.set("v.selectedValue",selectepicklist);
    },
    submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen1", false);
       
       helper.updateAccount(component,event,helper);
       
   },
    removedeferral: function(component,event,helper) {
        //Add your code to call apex method or do some processing
      component.set("v.isModalOpen2", false);
       
       helper.removedeferralhelper(component,event,helper);
        
    }
})