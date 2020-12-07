({
    loadsub:function(component, event, helper) {
        var action = component.get("c.getsub");
         action.setCallback(this, function(response) {
           
               console.log(response.getReturnValue());  
                component.set("v.subject" ,response.getReturnValue());
          });
        $A.enqueueAction(action);
    },
    loadctype:function(component, event, helper) {
        var action = component.get("c.getctype");
         action.setCallback(this, function(response) {
           
               console.log(response.getReturnValue());  
                component.set("v.contacttype" ,response.getReturnValue());
          });
        $A.enqueueAction(action);
    },
     loadcat:function(component, event, helper) {
        var action = component.get("c.getcat");
         action.setCallback(this, function(response) {
           
               console.log(response.getReturnValue());  
                component.set("v.category" ,response.getReturnValue());
          });
        $A.enqueueAction(action);
    },
     validatefields :function(component, event, helper) {
        var fsc= component.find('fieldstovalidate').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // Returning Validate contact result in boolen
        return fsc;
    },

    clickCreate: function(component, event, helper) {
         
        var validfsc= component.find('fieldstovalidate').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
    
        if(validfsc) {
    var action = component.get("c.createclient");
      action.setParams({
            			 "Sub" : component.get("v.selectedsubject"),
            "ctype" : component.get("v.selectedctype"),
             "cat" : component.get("v.selectedcat"),
             "Eattest" : component.get("v.Attest"),
             "cdate": component.get("v.ClientContactDate")
        				});
        console.log('Sub');
        
         action.setCallback(this, function(response) {
           
               console.log(response.getReturnValue());  
                component.set("v.newnotetask" ,response.getReturnValue());
          });
          $A.enqueueAction(action);
      var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Client contact Note Created",
                "message": "Client contact note created successfully"});
            resultsToast.fire();
        $A.get("e.force:closeQuickAction").fire(); 
        }
    },          
   
        
        cancel: function(component,event,helper){
      $A.get("e.force:closeQuickAction").fire(); 
    },
     
               
    
                                                           
   
});