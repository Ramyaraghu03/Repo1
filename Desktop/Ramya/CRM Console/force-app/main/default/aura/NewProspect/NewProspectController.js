({ 
    
	Create : function(component, event, helper) {
        console.log('beforesave set paream');
        var opts = document.querySelector('input[name="options"]:checked').value;
        
        console.log('selectedType' +opts);
      
        var evt = $A.get("e.c:NavigateEvt");
        console.log('evt'+evt);
        evt.setParams({ "ptype": opts});
        evt.setParams({"etype": opts});
        evt.fire();
            console.log('ramya1');
        
      
        
        
		
	},
    openModel: function(component, event, helper) {
         
        component.set("v.isOpen", true);
      // for Display Model,set the "isOpen" attribute to "true"
      
       
      
   },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      
      component.set("v.isOpen", false);
   }
})