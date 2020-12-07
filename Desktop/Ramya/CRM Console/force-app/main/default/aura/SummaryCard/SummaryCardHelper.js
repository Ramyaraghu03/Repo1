({
	getPicklistValues : function(component,event,helper,fieldApiName,fieldid) {
		var action = component.get("c.getfieldpicklists");
        action.setParams({fieldApiName : fieldApiName
                         });
        var opts =[];
        action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS")  {
                alert('Picklistsr retrived');
                var pValues = response.getReturnValue();
                opts[0] = {
                    class: "OptionClass",
                    label : "--None--",
                    value: ""
                };
                if(pValues != undefined && pValues.length>0){
                    for(var i=0;i<pValues.length;i++) {
                        opts[i+1] = {
                           class: "OptionClass",
                           label : "pValues[i]",
                           value: "pValues[i]" 
                        };  
                    }
                    
                }
            } 
            component.find(fieldid).set("v.options", opts);
                            
                           });
	}
})