({
	getPicklistvalues : function(component,fieldName) {
      var rcId =component.get("v.recordId")
        alert('Ideaid' + rcId);
        var action = component.get("c.getselectOptions");
        action.setParams({
            "objObject" : component.get("v.objInfo"),
            "fld":fieldName,
            "recId" : component.get("v.recordId")
            });
        
        action.setCallback(this,function(response){
           var state =response.getState();
            if(state === "SUCCESS") {
                component.set("v.Spinner",false);
                var result = response.getReturnValue();
                var statusmap= [];
                 for(var key in result){
                    statusmap.push({key: key, value: result[key]});
                }
               component.set("v.statusMap", statusmap); 
                
            }
            else{
                
                component.set("v.displayMsg",'Error in getting status details');
            }
        });
        $A.enqueueAction(action);
		
	},
getStatuspicklisthelper : function(component,fieldName) {
 var rcId =component.get("v.recordId")
        
        var action = component.get("c.getStatuspicklist");
        action.setParams({
            "objObject" : component.get("v.objInfo"),
            "fld":fieldName,
            "recId" : component.get("v.recordId")
            });
        
        action.setCallback(this,function(response){
           var state =response.getState();
            if(state === "SUCCESS") {
                component.set("v.Spinner",false);        
                var allvalues = response.getReturnValue();
                component.set('v.statusValues',allvalues); 
                console.log('allvalues===='+allvalues);
    }
             else {	
                component.set("v.Spinner", false);
                component.set("v.displayMsg",'Error in getting status details');
            }
});
$A.enqueueAction(action);
    }
})