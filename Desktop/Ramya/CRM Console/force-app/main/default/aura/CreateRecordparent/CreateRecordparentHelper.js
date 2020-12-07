({
    createObjectData: function(component, event) {
        // get the contactList from component and add(push) New Object to List  
        var RowItemList = component.get("v.AccountList");
        RowItemList.push({
            'sobjectType': 'Account',
            'Name': '',
            'Industry': '',
            'Phone': ''
        });
        // set the updated list to attribute (contactList) again    
        component.set("v.AccountList", RowItemList);
    },
    // helper function for check if first Name is not null/blank on save  
    validateRequired: function(component, event) {
        var isValid = true;
        var allaccountRows = component.get("v.AccountList");
        for (var indexVar = 0; indexVar < allaccountRows.length; indexVar++) {
            if (allaccountRows[indexVar].FirstName == '') {
                isValid = false;
                alert('First Name Can\'t be Blank on Row Number ' + (indexVar + 1));
            }
        }
        return isValid;
    },
})