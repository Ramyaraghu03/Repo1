({
            
    doInit : function(component, event, helper) {
        helper.getTalkingPoints(component);
       
        
    },
    onPicklistChange : function(component,event,helper) {
        
    },
    OpenView: function(component,event,helper) {
        var tId = component.get("v.recordId");
        
      var navEvt = $A.get("e.force:navigateSObject");
       navEvt.setParams({ 
                        "recordId": tId,
                         "slideDevName": "related"
                            
                       }); 
     navEvt.fire();            
  },
    AddNewPoint : function(component,event,helper){
        var Newtalkingpoint = $A.get("e.force:createRecord");
        Newtalkingpoint.setParams({
            "entityApiName" : 'Ramyaraghu03__TalkingPoints__c',
            "defaultFieldValues" :{
                Ramyaraghu03__Client_Prospects__c : component.get("v.recordId")
            }
        });
      Newtalkingpoint.fire();  
    }
    });