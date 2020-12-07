({
	handlelogacall : function(component, event, helper) {
	var createRecordEvent = $A.get('e.force:createRecord');
        if ( createRecordEvent ) {
            createRecordEvent.setParams({
                'entityApiName': 'Task',
                'defaultFieldValues': {
                    
                }
                
            });
            createRecordEvent.fire();
        }
    }
        })