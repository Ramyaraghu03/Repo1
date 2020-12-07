public class selectdyn {
    public String[] values { get; set; }
    public SelectOption[] valueList { get; set; }

    public selectdyn() {
        valueList = new SelectOption[0];
        values = new String[0];
        for(Account record: [select id, name from account limit 100])
            valuelist.add(new selectoption(record.id, record.name));
    }

    public string getOutputText() {
        return String.join(values, ',');
    }
}