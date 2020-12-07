trigger populatename on Task (before insert) {
List<Task> ttoupdate = new List<Task>();
for (Task t: Trigger.new) {
t.WhoId= t.AccountId;
ttoupdate.add(t);

}

}