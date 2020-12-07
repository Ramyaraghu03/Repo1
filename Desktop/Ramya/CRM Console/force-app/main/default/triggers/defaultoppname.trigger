trigger defaultoppname on Opportunity (before insert,before update) {
Set<Id>oppowner = new Set<Id>();
for(Opportunity o : Trigger.new) {
oppowner.add(o.ownerId);
}

Map<Id,User> mapoppuser =new Map<Id,User>([Select Id,Name from User where Id in : oppowner]);
 for(Opportunity o: Trigger.new) {
 System.debug('Opp new entry');
 User u =mapoppuser.get(o.ownerId);
 o.Name= 'Opportunity for'+u.name;
 }
}