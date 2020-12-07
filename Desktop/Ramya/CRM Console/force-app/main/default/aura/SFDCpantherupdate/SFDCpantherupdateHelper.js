({
	getContacts : function(component,event,helper) {
        var actId = component.get("v.recordId");
        
        var action = component.get("c.getContactlist");
        
        
        action.setParams({AIds : actId });
       action.setCallback(this,function(response) {
            console.log(response.getReturnValue());
          var state = response.getState();
           if(state === "SUCCESS") {
               var Contactls = response.getReturnValue();
           component.set("v.contactlist",Contactls);
               console.log('Contactls' + JSON.stringify(Contactls));
           }
            else {
                alert('Error in fetching Contactlist');
            }
        });
     $A.enqueueAction(action);   
	},
 savecontacts : function(component,event,helper) {
        alert('In save method updated1');
     var contactliststosave = component.get("v.contactlist");
     var toastEvt = $A.get("e.force.showToast");
         var action = component.get("c.saveContactList");
        action.setParams({
            Clisttosave : contactliststosave 
        });
        action.setCallback(this,function(response) {
              var state = response.getState();
              if(state === "SUCCESS") {
                 var dataMap = response.getReturnValue();
                  if(dataMap.status == 'Success') {
                 toastEvt.setParams({
                     'title' : 'Success!',
                     'type': 'success',
                     'mode' : 'dismissible',
                     'message':dataMap.message
                 });
                 toastEvt.fire();
             }
              
            else if(dataMap.status == 'error') {
                 toastEvt.setParams({
                     'title' : 'Error!',
                     'type' : 'error',
                     'message': dataMap.message,
                     'mode' : 'pester'
                 });
                 toastEvt.fire();
                
            }
                else {
                    alert('Error in data');
                }
              }
        });
  $A.enqueueAction(action);    
       },
  deleteclist : function(component,event,helper) {
      alert('In delete controller');
      var contactsToDelete = component.find("ckbox");
      var idsToDelete=[];
      if(contactsToDelete.length!=undefined) {
          for(var i=0;i<contactsToDelete.length;i++){
              if(contactsToDelete[i].get('v.checked')) {
                  idsToDelete.push(contactsToDelete[i].get('v.value'));
              }  
          }
      }
      else {
          if(contactsToDelete.get('v.checked'))
              idsToDelete.push(contactsToDelete.get('v.value'));
      }
      var tEvent = $A.get('e.force:showToast');
      var action = component.get("c.deleteContactList");
      action.setParams({
          contactIds : idsToDelete
      });
      action.setCallback(this,function(response) {
         console.log(response.getReturnValue());
          var state = response.getState();
          if(state === "SUCCESS") {  
              var deleteMap = response.getReturnValue();
                  if(deleteMap.status == 'Success') {
                 tEvent.setParams({
                     'title' : 'Success!',
                     'type': 'success',
                     'mode' : 'dismissible',
                     'message':deleteMap.message
                 });
                 tEvent.fire();
             }
          }  
          else if(deleteMap.status == 'error') {
                 tEvent.setParams({
                     'title' : 'Error!',
                     'type' : 'error',
                     'message': deleteMap.message,
                     'mode' : 'pester'
                 });
                 tEvent.fire();
              }
           else {
                alert('Error in deleting data');
               }
       });
  $A.enqueueAction(action);      
    },
createcontacthelper : function (component,event,helper) {
    alert('in creaatecontacthelperr');
        var con = component.get("v.contact");
    con.AccountId = component.get("v.recordId");
         var tEvent = $A.get('e.force:showToast');
        var action = component.get("c.CreateContact");
        action.setParams({
            newCon : con
        });
        action.setCallback(this,function(response) {
         var state = response.getState();
          if(state === "SUCCESS") {  
              var createMap = response.getReturnValue();
                  if(createMap.status == 'Success') {
                 tEvent.setParams({
                     'title' : 'Success!',
                     'type': 'success',
                     'mode' : 'dismissible',
                     'message':'Contact created successfully'
                 });
                 tEvent.fire();
                 window.location.reload();
             }
          }  
          else if(createMap.status == 'error') {
                 tEvent.setParams({
                     'title' : 'Error!',
                     'type' : 'error',
                     'message': createMap.message,
                     'mode' : 'pester'
                 });
                 tEvent.fire();
              }
           else {
                alert('Error in creating data');
               }   
        
      });
 $A.enqueueAction(action);
    }   
})