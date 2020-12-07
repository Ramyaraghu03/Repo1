({
    doInit: function(component, event, helper) {
        helper.fetchPickListVal(component, 'Status', 'CamStatus');
    },
    onPicklistChange: function(component, event, helper) {
        // get the value of select option
        alert(event.getSource().get("v.value"));
    },
})