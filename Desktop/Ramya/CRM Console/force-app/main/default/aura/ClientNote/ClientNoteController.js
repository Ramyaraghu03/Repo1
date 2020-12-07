({
     cancel : function(component,event,helper){
        var navigateEvent = $A.get("e.force:navigateToSObject");
    navigateEvent.setParams({ "recordId": component.get('v.recordId') });
    navigateEvent.fire();
    }
})