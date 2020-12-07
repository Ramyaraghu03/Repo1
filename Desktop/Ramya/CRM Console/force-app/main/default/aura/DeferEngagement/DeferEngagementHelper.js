({
	fetchdeferreason : function(component) {
	var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.EngagementReason"),
            'nullRequired': false // includes --None--
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                
                component.set("v.EngagementReasonPicklist", a.getReturnValue());
              
            } 
        });
        $A.enqueueAction(action);	
	},
    fetchselectedreason : function(component,event,helper) {
        var actId = component.get("v.recordId");
         var action = component.get("c.Fetchdeferredstatusmethod");
        action.setParams({ actId : actId, 
                         
                         });
        action.setCallback(this,function(response) {
             var state = response.getState();
            if(state === "SUCCESS"){
                //alert('Status is updated Successfully');
                var actdetail =response.getReturnValue();
               // alert(response.getReturnValue());
               var EngagementReason = actdetail.Ramyaraghu03__Defer_Engagement_Reason__c;
                var isDeferredstatus = actdetail.Ramyaraghu03__isDeferred__c;
               // var DateDeferred = actdetail.Ramyaraghu03__Deferred_Date__c;
               //alert('Engagement Reason',EngagementReason);
               // alert('deferred Date',DateDeferred);
                component.set("v.EngagementReason",EngagementReason);
                component.set("v.isDeferred",isDeferredstatus);
                alert('isDeferredcon',isDeferredstatus);
               // component.set("v.DeferredDate",DateDeferred); 
                
                
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
		
	} ,
    
    updateAccount : function(component,event,helper) {
        var acc = component.get("v.acc");
        var actId = component.get("v.recordId");
       
        var Reasonselected = component.get("v.selectedValue");
        
        var action = component.get("c.updateAccount");
        action.setParams({ aId : actId, 
                          Reason :Reasonselected
                         });
        action.setCallback(this,function(response) {
             var state = response.getState();
            if(state === "SUCCESS"){
 var toastEvent = $A.get("e.force:showToast");
              		toastEvent.setParams({
                     title : 'Success !',
                     message:'Success! Deferred engagement submitted on this participant.',
                     type: 'success',
                     mode: 'pester'
                 });
				 toastEvent.fire();
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
         this.firecompEvent(component,event,helper);
     $A.enqueueAction(action);
    },
    firecompEvent : function(component,event,helper) {
       // alert('Inside compEvent');
         var actId = component.get("v.recordId");
       
        var Reasonselected = component.get("v.selectedValue");
        var Ddate = actId.Ramyaraghu03__Deferred_Date__c;
         var compEvents = component.getEvent("DeferEvt");// getting the Instance of event
        
        compEvents.setParams({ "DeferredReason" : Reasonselected,
                              "DeferredDate" :Ddate });// setting the attribute of event
        compEvents.fire();
    },
    removedeferralhelper : function(component,event,helper) {
      var actId = component.get("v.recordId");  
        var action = component.get("c.removedeferral");
          action.setParams({ actId : actId, 
                         
                         });
        action.setCallback(this,function(response) {
             var state = response.getState();
            if(state === "SUCCESS"){
                $A.get("e.force:refreshView").fire();
                var result = response.getReturnValue();
                if(result) {
                    component.set("v.isDeferred",false);
                
 var toastEvent = $A.get("e.force:showToast");
              		toastEvent.setParams({
                     title : 'Success !',
                     message:'Success! Deferral on this participant.',
                     type: 'success',
                     mode: 'pester'
                 });
				 toastEvent.fire();
                }
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