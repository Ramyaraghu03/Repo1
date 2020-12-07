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
        
        var selectedt =event.getParam("ptype");
        var typeo ="ramya"
        console.log("typeselected"+  selectedt ); 
        
        if(selectedt == "radio-9") {
            console.log( "Person  Page");
        $A.createComponent(
         "c:NewProspectform",
         {
           "res" : event.getParam("ptype")
         },
         function(newCmp){
            if (component.isValid()) {
                component.set("v.body", newCmp);
            }
         }
            
      );
        }
    
        if(selectedt == "radio-10") {
            console.log( "person entityPage");
            $A.createComponent(
         "c:Entityprospectform",
         {
          "res1" : event.getParam("etype")
            
         },
         function(newCmp1){
            if (component.isValid()) {
                component.set("v.body", newCmp1);
            }
         }
            
      );
            
        }
          
            
     
    }
    })