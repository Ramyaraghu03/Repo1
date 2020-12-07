({
    getcamphelper : function(component,event,helper) {
     
 var action = component.get("c.getCamps");
        action.setCallback(this,function(response) {
            var state = response.getState();
            if(state === "SUCEESS") {
                alert("From server" + response.getReturnValue )
        component.set("v.Camplist", a.getReturnValue());
            }

        });
    $A.enqueueAction(action);
        },

})