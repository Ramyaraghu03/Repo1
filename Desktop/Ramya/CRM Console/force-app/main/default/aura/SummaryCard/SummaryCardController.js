({
    doinit : function(component, event, helper) {
        var action = component.get("c.getSummarydetails");
        var aclist;
        action.setParams({"AccountId" : component.get("v.recordId")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert('Success State');
                // Alert the user with the value returned 
                // from the server
                aclist= response.getReturnValue();
alert("aclistdetails" + aclist);	
                component.set("v.Actlist",response.getReturnValue());
                // You would typically fire a event here to trigger 
                // client-side notification that the server-side 
                // action is complete
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        
    $A.enqueueAction(action);    
  },
    handleValueContactInterval : function (component,event,helper) {
        alert('inside picklistCIctrlr');
        helper.getPicklistValues(component,event,helper,'Ramyaraghu03__Contact_Intervals__c','cinterval');
        
    }
 })