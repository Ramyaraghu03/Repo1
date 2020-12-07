({
	fetchAccounts : function(component, event, helper) {
		 component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text', sortable: true},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'Text'}
        ]);
        var action = component.get("c.geta2c");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acclist", response.getReturnValue());
                console.log("Inside init");
               helper.sortData(component, component.get("v.sortby"), component.get("v.sortDirection"));
            }
        });
        $A.enqueueAction(action);
	},
      updateColumnSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortby", fieldName);
        cmp.set("v.sortDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    }
})