({
	getTalkingPoints : function(component,event,helper) {
        var action = component.get("c.getTalkingpoints");
        var accId = component.get("v.recordId");
        alert('accountId'+ accId );
       
        action.setParams({accountId : accId });
        action.setCallback(this,function(response) {
            console.log(response.getReturnValue());
          var state = response.getState();
           if(state === "SUCCESS") {
               var Talkingpointsinfo = response.getReturnValue();
           component.set("v.ListTalkingPoints",Talkingpointsinfo);
               console.log('TalkingpointsInfo' + JSON.stringify(Talkingpointsinfo));
           }
              else {
                
                component.set("v.displayMsg",'Error in getting ideas to engage details');
            }
        });
     $A.enqueueAction(action);
		
	},
    

})