({
 loadUsers : function(component, event, helper) {
    var action = component.get("c.listUser");
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.Userlist", a.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
       
 },
changeOwner : function(component,event,helper){
        var action = component.get("c.chgOwner");
        
         action.setParams({
            			 "oname" : component.get("v.selecteduser"),
            			 "opId" : component.get("v.recordId")
        				});
        
        console.log(component.get("v.selecteduser"));
         action.setCallback(this, function(response) {
           
               console.log(response.getReturnValue());  
                component.set("v.Ownerupdated" ,response.getReturnValue());
                
            
        });
          $A.get('e.force:refreshView').fire();
    var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Opportunity Changed",
                "message": "Opportunity owner is successfully changed"});
            resultsToast.fire();

            // Navigate back to the record view
            var navigateEvent = $A.get("e.force:navigateToSObject");
            navigateEvent.setParams({ "recordId": component.get('v.recordId') });
            navigateEvent.fire();
        
      $A.enqueueAction(action);
         
    },
    cancel : function(component,event,helper){
        var navigateEvent = $A.get("e.force:navigateToSObject");
    navigateEvent.setParams({ "recordId": component.get('v.recordId') });
    navigateEvent.fire();
    }
 });