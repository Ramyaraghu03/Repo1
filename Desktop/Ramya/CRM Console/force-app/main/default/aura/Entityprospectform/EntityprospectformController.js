({ 
     saveprospect : function(component, event, helper) {
        var checkField = component.find("fieldstovalidate").reduce(function (validSoFar, inputCmp) {

            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();

            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
 

        console.log('beforesave set paream');
        
        
        var action = component.get("c.createentity");
console.log('createentity');
        
        action.setParams({"ein":component.get("v.newprose")});
        console.log('createentity');

        action.setCallback(this, function(response) {
           
               console.log(response.getReturnValue());  
                component.set("v.newprose" ,response.getReturnValue());
          });
          $A.enqueueAction(action);
         var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Entity Prospect Created",
                "message": "Entity Prospect created successfully"});
            resultsToast.fire();
        $A.get("e.force:closeQuickAction").fire(); 
    },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      
      component.set("v.isOpen", false);
   }
})