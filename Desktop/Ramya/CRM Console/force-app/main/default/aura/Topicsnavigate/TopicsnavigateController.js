({
NavigatetoTopic : function(component, event, helper) { 
    var opts= "top";
 var evt = $A.get("e.c:NavigateEvtreport");
        console.log('evt'+evt);
        evt.setParams({"ttype": opts});
        
        evt.fire();
            console.log('ramya1');
}
    
    	
        
        
        
});