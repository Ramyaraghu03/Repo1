({
	doInit : function(component, event, helper) {
        var recordId = component.get( "v.recordId" );
console.log( recordId );
alert( recordId );
        helper.validateNorthwell(component, event,helper);
		
	},
    OnCancel : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
    },
})