({
   
doinit:function(component, event, helper) {
        var action = component.get("c.fetchtopics");
     action.setParams({
            			 "recid" : component.get("v.recordid")});
         action.setCallback(this, function(response) {
           
               console.log(response.getReturnValue());  
                component.set("v.ListOftopics" ,response.getReturnValue());
          });
        $A.enqueueAction(action);
    },
    
checkboxSelect: function(component, event, helper) {
  // get the selected checkbox value  
  var selectedRec = event.getSource().get("v.value");
  // get the selectedCount attrbute value(default is 0) for add/less numbers. 
  var getSelectedNumber = component.get("v.selectedCount");
  // check, if selected checkbox value is true then increment getSelectedNumber with 1 
  // else Decrement the getSelectedNumber with 1     
  if (selectedRec == true) {
   getSelectedNumber++;
  } else {
   getSelectedNumber--;
  }
  // set the actual value on selectedCount attribute to show on header part. 
  component.set("v.selectedCount", getSelectedNumber);
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
        "url":'https://ramyaraghu-dev-ed.lightning.force.com/lightning/r/Report/00O0K00000A5EM6UAN/view?queryScope=userFolders&0.source=alohaHeader'
    });
    urlEvent1.fire();
         }
         }
    

    
});