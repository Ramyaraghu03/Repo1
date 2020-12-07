({
	Topicslist : function(component, event, helper) {
                var res= 'res1';
        console.log('res'+ res);
        var evt = $A.get("e.c:NavigateEvtreport");
        console.log('evt'+evt);
        evt.setParams({
            "result": res });
        evt.fire();
    }
});