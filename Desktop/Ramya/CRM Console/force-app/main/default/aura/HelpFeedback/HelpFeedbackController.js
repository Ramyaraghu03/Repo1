({
review : function(component, event, helper) {

  
   var urlEvent1 = $A.get("e.force:navigateToURL");
    urlEvent1.setParams({
        "url":' http://jive.ms.com/community/wm-digital/CRM/overview'
    });
    urlEvent1.fire();
},
     feed : function(component, event, helper) {
        var urlEvent2 = $A.get("e.force:navigateToURL");
urlEvent2.setParams({
        "url":'http://jive.ms.com/community/wm-digital/CRM/crm-feedback/overview'
    });
    urlEvent2.fire();
}

    

})