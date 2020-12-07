({
	doInit : function(component, event, helper) {
	component.set("v.myColumn",[
            {label : 'SNo.',fieldName :'sno', type : 'number'},
            {label :'Name of Source',fieldName :'source', type : 'text'},
            {label :'Amount', fieldName : 'amount' , type : 'number'},
            ]);
    component.set("v.Income",[
            { sno : 1,source: 'Job1',amount: 50000},
            { sno : 2,source: 'Job2',amount: 80000}
            ]);	
	},
    Toggle : function(component, event, helper) {
        var toggleText = component.find('incomeform');
        $A.util.toggleClass(toggleText, 'hide');
    },
    addIncome : function(component,event,helper) {
        var incomes = component.get('v.Income');
        var newIncome = {sno : incomes.length+1,
                         source : component.find('source').get('v.value'),
                         amount : component.find('amount').get('v.value')
                        }
        if(newIncome.source!= null && newIncome.source!= '') {
          incomes.push(newIncome);  
          component.set('v.Income', incomes);
            component.find('source').set('v.value','');
            component.find('amount').set('v.value','');
        }
        
    },
    CalcTotalIncomehandler : function (component,event,helper) {
       alert('handler fired'); 
    },
    calculateincomefire : function (component,event,helper) {
        var incomes = component.get('v.Income');
        var totalIncome = 0;
        for(var i=0;i< incomes.length; i++) {
        totalIncome = totalIncome+ incomes[i].amount; 
            }
        var TotalIncomeEvent = component.getEvent('TotalIncomeEvt');
        TotalIncomeEvent.setParams({"totalIncome": totalIncome});
        TotalIncomeEvent.fire();
        
    }
})