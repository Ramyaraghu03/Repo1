({
	doInit : function(component, event, helper) {
       // alert('inside init');
	 helper.fetchdeferreasonvalue(component); 
     var EngagementReason = event.getParam("DeferredReason");
        //alert('Eng',EngagementReason);
        var DateDeferred = event.getParam("DeferredDate");
                component.set("v.EngagementReason", EngagementReason);
                //component.set("v.DeferredDate",DateDeferred); 
	}
})