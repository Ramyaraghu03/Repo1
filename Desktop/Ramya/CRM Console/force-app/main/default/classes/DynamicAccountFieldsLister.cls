public class DynamicAccountFieldsLister {
public DynamicAccountFieldsLister(ApexPages.StandardController controller) {
controller.addFields(editableFields);
}
public List<String> editableFields {
get {
if (editableFields == null) {
editableFields = new List<String>();
editableFields.add('Industry');
editableFields.add('AnnualRevenue');
editableFields.add('BillingCity');
}
return editableFields ;
}
private set;
}
}