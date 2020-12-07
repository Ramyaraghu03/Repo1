({
    doInit : function (component,event,helper) {
         var action = component.get("c.fetchMSVATeam");       

        action.setCallback(this, function(a){

            component.set("v.Teamlist",a.getReturnValue());

        });       

        $A.enqueueAction(action);

                },
    
	openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
   },
  
   closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   },
    Upload: function (component,event,helper) {
        helper.readcsv(component);
    }
})