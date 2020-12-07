({
	openModel: function(component, event, helper) {
      // for Display Model,set the "isOpen" attribute to "true"
      helper.checkboxSelect(component,event);
      component.set("v.isOpen", true);
   },
  Cancel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);
   },
   TopicSelect:function(component, event, helper) {
    var action = component.get("c.fetchtopics");
  action.setParams({
            EId : component.get("v.recordId")
        });
    var rd = component.get("v.recordId");
    console.log('recorid' + rd);
       
      action.setCallback(this, function(response) {
           
               console.log(response.getReturnValue());  
                component.set("v.ListOftopics" ,response.getReturnValue());
          });
        $A.enqueueAction(action);
    },

 runreport : function(component, event, helper) {
        
        var getSelectedNumber = component.get("v.selectedCount");
        console.log('total run re' +getSelectedNumber);
        if (getSelectedNumber > 5) {
              var toastEvent = $A.get("e.force:showToast");
 toastEvent.setParams({
            title : 'Error Message',
            message:'Please select only 5 topics',
            messageTemplate: 'Mode is pester ,duration is 5sec and Message is overrriden',
            duration:'5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'});
           toastEvent.fire();
        }
         else  {
       var urlEvent1 = $A.get("e.force:navigateToURL");
             
            
    urlEvent1.setParams({

 "url":'https://ramyaraghu-dev-ed.lightning.force.com/lightning/r/Report/00O0K00000A5O2BUAV/view?pv0={!Account.Id}'

    });
    urlEvent1.fire();
         }
         },

    
});