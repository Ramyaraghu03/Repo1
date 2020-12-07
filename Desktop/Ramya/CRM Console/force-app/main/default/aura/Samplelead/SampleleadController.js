({
	handleLeadSave : function(component, event, helper) {
		var objLead = component.get("v.objLead");
        var action = component.get("c.createLead");
        action.setParams({
            objLead : objLead
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                alert('Record is Created Successfully');
            }
        });
        $A.enqueueAction(action);
	}
})