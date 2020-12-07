({
	doInit : function(component, event, helper) {
        var action = component.get("c.fetchleads");
        action.setCallback(this, function(a) {
            component.set("v.Myleadlist", a.getReturnValue());
        });
        $A.enqueueAction(action);
		var action = component.get("c.myleadscount");
         action.setCallback(this, function(a) {
            component.set("v.totalmyleads", a.getReturnValue());
        });
        $A.enqueueAction(action);
	},
    viewmyleads : function(component, event, helper) {
         var urlEvent1 = $A.get("e.force:navigateToURL");
    urlEvent1.setParams({
        "url": 'https://ramyaraghu-dev-ed.lightning.force.com/lightning/o/Lead/list?filterName=00B0K00000AyozkUAB'
    });
    urlEvent1.fire();
    },
    importlead : function(component, event, helper) {
        console.log('Enter Here');
        var evt = $A.get("e.force:navigateToComponent");
        console.log('evt'+evt);
        evt.setParams({
            componentDef: "c:importloader"
            //componentAttributes :{ }
        });
        
        evt.fire();
    }      
})