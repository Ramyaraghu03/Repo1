public class SummaryAccount {
public Integer getAcctstat() {
Integer accs =
[SELECT COUNT() FROM Account ];
return accs;
}
}