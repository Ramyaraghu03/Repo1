({
	doinit : function(cmp, event, helper) {
	var next = true;
        var prev =false;
        helper.getcampaigns(cmp,next,prev);
	},
    Next:function(cmp,event,helper){
        var next = true;
        var prev = false;
        var offset = cmp.get("v.offset");
        helper.getcampaigns(cmp,next,prev,offset); 
    },
    Previous:function(cmp,event,helper){
        var next = false;
        var prev = true;
        var offset = cmp.get("v.offset");
        helper.getcampaigns(cmp,next,prev,offset); 
    },
    navigateToCamp:function(component) {
        var cId = component.get("v.Camp");
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": cId,
             "slideDevName": "detail"
            
        });
        navEvt.fire();

  
    },
})