({
navigate : function(component, event, helper) {

   var printoption = component.get("v.recordId");
   var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
        "url":'https://www.google.com'
    });
    urlEvent.fire();
}
})