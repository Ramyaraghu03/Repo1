({
    download : function(component, event, helper) {

  
   var urlEvent1 = $A.get("e.force:navigateToURL");
    urlEvent1.setParams({
        "url":' http://jive.ms.com/community/wm-digital/CRM/overview'
    });
    urlEvent1.fire();
},
 FAQ : function(component, event, helper) {
        var urlEvent2 = $A.get("e.force:navigateToURL");
urlEvent2.setParams({
        "url":'www.google.com'
    });
    urlEvent2.fire();
     },
    validateInput : function(component, event, helper) { 
   
        component.set("v.Spinner", true);
        var Office = component.get('v.Office');
        var FA = component.get('v.FA');
        var file = component.get('v.fileName')
        if(Office != null && FA != null && file != null ) {
            component.set("v.Spinner", false);
            alert('valid');
            $A.enqueueAction(component.get('c.handleFileValdations'));
        }
 },
    handleFileValdations :function(component, event, helper) { }
});