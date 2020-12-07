({
	init : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Opportunity Name', fieldName: 'Name', type: 'text',sortable: true},
            {label: 'Amount', fieldName: 'Amount', type: 'Number',sortable: true},
            {label: 'Anticipated Close Date', fieldName: 'CloseDate', type: 'Number',sortable: true},
            {label: 'Stage', fieldName: 'StageName', type: 'Number',sortable: true},
           
            ]);
        var action = component.get("c.fetchOpp");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Opplist", response.getReturnValue());
                 
            }
             });
       $A.enqueueAction(action);   
  },
  updateSelectedText : function(component, event, helper) {
            var srow = event.getParam('SelectedRows');
        console.log('selectedRows'+selectedRows);
       for (var i = 0; i < srow.length; i++){
            alert(srow [i].Opportunities+" are selected");
        }
              $A.enqueueAction(action);
}
            
            })