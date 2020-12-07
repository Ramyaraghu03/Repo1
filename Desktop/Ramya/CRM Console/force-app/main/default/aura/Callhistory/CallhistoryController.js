({
	doInit : function(component, event, helper) {    
        var artId = component.get("v.recordId");
        component.set('v.columns', [
            {label: 'Subject', fieldName: 'Subject', type: 'Picklist'},
            {label: 'Due Date', fieldName: 'ActivityDate',  type: 'Date'},
            {label: 'Status', fieldName: 'Status', editable:'true', type: 'text'},
            {label: 'Created By', fieldName: 'CreatedById'}
        ]);        
        helper.gettaskforAccount(component, helper);
    },
})