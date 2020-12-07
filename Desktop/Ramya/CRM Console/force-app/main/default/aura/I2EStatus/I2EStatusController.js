({
	doInit : function(component, event, helper) {
       
     helper.getStatuspicklisthelper(component,'Ramyaraghu03__Status__c');
       // helper.getPicklistvalues(component, 'Ramyaraghu03__Status__c');
		
	},
onPicklistChange : function(component,event,helper) {
      
    var statusval=event.getSource().get("v.value");
    console.log('statusval' + statusval);
    var action = component.get("c.updateStatus");
    action.setParams({
            IdofRecord : component.get("v.recordId"),
            Statusvalue : statusval
        });
     action.setCallback(this,function(response){
           var state =response.getState();
            if(state === "SUCCESS") { 
                var updatelist = response.getReturnValue();
                component.set("v.statusSelected",statusval);
                
            }
        });
    $A.enqueueAction(action);  
    },
    onSingleSelectChange : function (component,event,helper){
        
    }
})