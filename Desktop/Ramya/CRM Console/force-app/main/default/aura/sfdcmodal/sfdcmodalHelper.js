({
onLoad: function(component, event) {
  console.log('onLoad call');
  //call apex class method
  var action = component.get('c.fetchtopics');
  action.setCallback(this, function(response) {
   //store state of response
   var state = response.getState();
   if (state === "SUCCESS") {
    //set response value in ListOfContact attribute on component.
    component.set('v.ListOftopics', response.getReturnValue());
    // set deafult count and select all checkbox value to false on load 
    component.set("v.selectedCount", 0);
    
   }
  });
  $A.enqueueAction(action);
}
})