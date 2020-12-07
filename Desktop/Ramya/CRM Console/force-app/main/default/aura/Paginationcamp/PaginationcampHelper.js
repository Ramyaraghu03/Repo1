({
	getcampaigns : function(cmp,next,prev,offset) {
		offset = offset || 0;
        var action = cmp.get("c.getcamp");
        action.setParams({
            "next" : next,
            "prev" : prev,
            "off" : offset            
        });
        action.setCallback(this,function(res){
            var state = res.getState();            
            if(state=="SUCCESS"){
              var result = res.getReturnValue();
              cmp.set('v.offset',result.offst);
              cmp.set('v.Campaignlist',result.cam);
              cmp.set('v.hasnext',result.hasnext);
              cmp.set('v.hasprev',result.hasprev);
            }
        });        
        $A.enqueueAction(action);
	}
})