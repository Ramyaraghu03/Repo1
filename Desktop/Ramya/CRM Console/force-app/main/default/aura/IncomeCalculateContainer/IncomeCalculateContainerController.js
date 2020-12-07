({
	CalcTotalIncomehandlerparent : function(component, event, helper) {
	alert('parent controller called');
        var Tincome = event.getParam("totalIncome");
        component.set("v.TotalIncome",Tincome);
	}
})