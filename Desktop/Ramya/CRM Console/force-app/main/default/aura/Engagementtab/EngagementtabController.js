({
	doInit : function(component, event, helper) {
//helper.fetchStatus(component,event,helper);        
helper.getcamphelper(component,event,helper);
//helper.fetchStatus(component,event,helper);   
//helper.fetchPickListVal(component,'Status','Inputstatus');
   

    },     
    NavigaetetoAcc : function(component, event, helper) {
        var CId = component.get("v.cam");
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": CId,
             "slideDevName": "detail"
            
        });
        navEvt.fire();

    },
    onPicklistChange : function(component, event, helper) {
      //get the value of select option
        var selectedStatus = component.find("Inputstatus");
        alert(selectedStatus.get("v.value"));
    },
		
	
})