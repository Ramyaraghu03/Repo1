({
	doInit : function(component, event, helper) {
        $A.createComponent(
         "c:Topicreportingbutton",
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
"c:Reporttopics" ,

         {
          "res" : event.getParam("result")
         },
         function(newCmp1){
            if (component.isValid()) {
                component.set("v.body", newCmp1);
            }
         }
            
      );
    }
      
            
     
    
})