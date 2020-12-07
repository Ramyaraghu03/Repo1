({
	doInit : function(component, event, helper) {
		helper.fetchusers(component,event,helper);
	},
    updateSelect :function(component, event, helper) {
       var suer = component.find("userpicklist").get("v.value");
        component.set('v.selecteduser', suer );
    },
    changeOwner :  function(component, event, helper) {
        helper.chgownerhelper (component, event, helper);
    },
    cancel : function(component,event,helper){
        var navigateEvent = $A.get("e.force:navigateToSObject");
    navigateEvent.setParams({ "recordId": component.get('v.recordId') });
    navigateEvent.fire();
    }
})