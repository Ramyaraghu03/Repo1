({
	onGroup : function(component, event, helper) {
		console.log('beforesave set paream');
      
        var opts = document.querySelector('input[name="options"]:checked').value;
        console.log('options selscted' + opts);
	}
})