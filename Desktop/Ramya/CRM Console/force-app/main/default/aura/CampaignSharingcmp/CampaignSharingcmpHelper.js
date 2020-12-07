({
	searchHelper : function(component,event,getInputkeyWord) {
        // call the apex class method 
        var action = component.get("c.fetchLookUpValues");
        // set param to method  
        action.setParams({
            'searchKeyWord': getInputkeyWord,
            'ObjectName' : component.get("v.objectAPIName"),
            'ExcludeitemsList' : component.get("v.lstSelectedRecords")
        });
        // set a callBack    
        action.setCallback(this, function(response) {
            $A.util.removeClass(component.find("mySpinner"), "slds-show");
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // if storeResponse size is equal 0 ,display No Records Found... message on screen.                }
                if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Records Found...');
                } else {
                    component.set("v.Message", '');
                    // set searchResult list with return value from server.
                }
                component.set("v.listOfSearchRecords", storeResponse); 
            }
        });
        // enqueue the Action  
        $A.enqueueAction(action);
    },
sharecampaignhelper : function(component,event,helper) {
        console.log('Share ');
         var rID = component.get("v.recordId");
        var ulist = component.get("v.lstSelectedRecords");
        var action = component.get("c.shareCampaign");
       
        console.log('Campaign record ID', rID);
         action.setParams({
            'cID': component.get("v.recordId"),
            'ulist' : component.get("v.lstSelectedRecords"),
           });
        action.setCallback(this, function(response) {
             if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                 if(storeResponse){
                    alert('Campaign Shared Successfully');
                
                  }
                
             }
    });
  $A.enqueueAction(action);
        }
})