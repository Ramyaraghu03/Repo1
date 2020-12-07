({
	AddNewRow : function(component, event, helper) {
	var RowItemList = component.get("v.contactList");
        RowItemList.push({
            'sobjectType': 'Contact',
            'FirstName': '',
            'LastName': '',
            'Phone': '' 
        });
        component.set("v.contactList", RowItemList);
	},
    removeRow: function(component, event, helper) {
		
	},
    Save: function(component, event, helper) {
		
	},
})