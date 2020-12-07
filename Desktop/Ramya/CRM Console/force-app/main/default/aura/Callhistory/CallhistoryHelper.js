({
	gettaskforAccount : function(component, event, helper) {
        var action = component.get("c.gettaskhistory");
         action.setParams({
            actid : component.get("v.recordId")
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
		
	
})