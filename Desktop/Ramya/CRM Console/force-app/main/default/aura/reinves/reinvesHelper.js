({
	fetchAccHelper : function(component,event,helper) {
		component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text',sortable: true},
                {label: 'Industry', fieldName: 'Industry', type: 'text',sortable: true},
                {label: 'Phone', fieldName: 'Phone', type: 'Phone',sortable: true},
                {label: 'Website', fieldName: 'Website', type: 'url',sortable: true}
            ]);
        var action = component.get("c.fetchAccounts");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acctList", response.getReturnValue());
                 helper.sortData(component, component.get("v.sortedBy"), component.get("v.sortedDirection"));
            }
        });
        $A.enqueueAction(action);
	},
  fetchStockDataHelper : function(component,event,helper) {
    component.set('v.mystockoptionscolumns', [
            {label: 'Plan/Product Type', fieldName: 'Name', type: 'text'},
                {label: 'Shares Excercisable', fieldName: 'Ramyaraghu03__Shares_Excercisable__c',type: 'number' },
                {label: 'Shares OutStanding', fieldName: 'Ramyaraghu03__Shares_Outstanding__c', type: 'number'},
                {label: 'Total Shares Granted', fieldName: 'Ramyaraghu03__Total_Shares_Granted__c',type: 'number'},
                {  label: 'Owner', fieldName : 'OwnerId'}
            ]);

 var action = component.get("c.fetchStockoptionsData");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Stockoptionsdata", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
    sortData: function (cmp, fieldName, sortDirection) {
        var data = cmp.get("v.acctList");
        var reverse = sortDirection !== 'asc';
        data.sort(this.sortBy(fieldName, reverse))
        cmp.set("v.acctList", data);
    },
    sortBy: function (field, reverse, primer) {
        var key = primer ?
            function(x) {return primer(x[field])} :
            function(x) {return x[field]};
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
        }
    }
})