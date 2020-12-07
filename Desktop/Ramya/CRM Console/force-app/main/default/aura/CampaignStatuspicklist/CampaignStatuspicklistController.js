({
	doInit : function(component, event, helper) {
		component.getStatusPicklist();
	},
 getStatus : function(component, event, helper) {
        var params = event.getParam('arguments');
        console.log('check1' + params);
        var action = component.get("c.getStatus");
        var inputStatus = component.find("Inputstatus");
        var opts=[];
        action.setCallback(this, function(a) {
            opts.push({
                class: "optionClass",
                label: "--- None ---",
                value: ""
            });
            for(var i=0;i< a.getReturnValue().length;i++){
                opts.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
            }
            inputStatus.set("v.options", opts);
             
        });
        $A.enqueueAction(action);
    },
    
})