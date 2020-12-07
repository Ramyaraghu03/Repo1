({
	 fetchdeferreasonvalue : function(component) {
        var actId = component.get("v.recordId");
        var action = component.get("c.Fetchdeferredstatusmethod");
        action.setParams({ actId : actId, 
                         
                         });
        action.setCallback(this,function(response) {
             var state = response.getState();
            if(state === "SUCCESS"){
                //alert('Status is updated Successfully');
                var actdetail =response.getReturnValue();
               var EngagementReason = actdetail.Ramyaraghu03__Defer_Engagement_Reason__c;
                var DateDeferred = actdetail.Ramyaraghu03__Deferred_Date__c;
               //alert('Engagement Reason',EngagementReason);
               // alert('deferred Date',DateDeferred);
                component.set("v.EngagementReason",EngagementReason);
                component.set("v.DeferredDate",DateDeferred); 
                
                
            } else if(state === "ERROR"){
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                }
            }else if (status === "INCOMPLETE") {
                alert('No response from server or client is offline.');
            }
                     });
     $A.enqueueAction(action);
		
	} 
})