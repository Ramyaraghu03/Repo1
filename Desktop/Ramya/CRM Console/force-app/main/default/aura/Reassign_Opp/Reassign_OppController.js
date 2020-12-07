({
	doInit : function(component,event) {
        var action = component.get("c.getFAusers");
		action.setCallback(this, function(a) {
            component.set("v.FAusers", a.getReturnValue());
        });
        $A.enqueueAction(action);
    
	}
})