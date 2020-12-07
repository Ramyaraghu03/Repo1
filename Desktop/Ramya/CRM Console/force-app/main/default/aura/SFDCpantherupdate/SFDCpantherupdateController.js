({
	doInit : function(component, event, helper) {
        
        helper.getContacts(component,event,helper);
        component.set("v.displaysection","viewrecord");
		
	},
    newContact : function(component,event,helper){
       var NewContact = $A.get("e.force:createRecord");
        NewContact.setParams({
            "entityApiName" : 'Contact',
            "defaultFieldValues" :{
                AccountId : component.get("v.recordId")
            }
        });
      NewContact.fire(); 
         $A.enqueueAction(action);
    },
    editContact : function(component,event,helper) {
        var btn = event.getSource();
        var name = btn.get("v.name"); 
        alert('button selected' + name);
       
        if(name =='edit') { 
            component.set("v.displaysection","editrecord");
            btn.set('v.name','save');
            btn.set('v.label','Save');
    
              
         }
        else if (name =='save') {
        alert('Your record will be saved');
            helper.savecontacts(component,event,helper);
        }
    },
 deleteContact : function(component,event,helper) {
        helper.deleteclist(component,event,helper);
        
 },
 closeModal : function(component,event,helper) {
     var modalsec = component.find("contactModal");
        var modalbackdropsec = component.find("contactModalBackdrop");
        $A.util.removeClass(modalsec,"slds-fade-in-open");
        $A.util.removeClass(modalbackdropsec,"slds-backdrop_open");
    },
 openModal : function (component,event,helper) {
        var modalsec = component.find("contactModal");
        var modalbackdropsec = component.find("contactModalBackdrop");
        $A.util.addClass(modalsec,"slds-fade-in-open");
        $A.util.addClass(modalbackdropsec,"slds-backdrop_open");
        
    },
createContact : function (component,event,helper){
        helper.createcontacthelper(component,event,helper);
    }    
        
    
})