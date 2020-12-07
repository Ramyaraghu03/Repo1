({
	validateNorthwell : function(component,event,helper) {
		var action = component.get("c.fetchLeadorigin");
        action.setParams({"LeadId": component.get("v.recordId")});
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var output = response.getReturnValue();
                if(output == 'Northwell'){
                component.set("v.northwelldata",output);
                component.set("v.isShow","true");
                }
                else {
            component.set("v.msg", "Not Northwell data");
                }
	}
        });
        $A.enqueueAction(action);
    }
})