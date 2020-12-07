({
	doInit : function(component, event, helper) {
        $A.createComponent(
         "c:NewProspect",
         {
 
         },
         function(newCmp){
            if (component.isValid()) {
               component.set("v.body", newCmp);
            }
         }
      );
		
	},
    
    Navigatepage :function(component, event, helper) {
        
           $A.createComponent(
         "c:Entityprospectform",
         {
           "Selectedtype" : event.getParam("ptype")
         },
         function(newCmp){
            if (component.isValid()) {
                component.set("v.body", newCmp);
            }
         }
            
      );
    }
      
            
     
    
})