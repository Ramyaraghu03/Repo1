trigger t1 on Account (before insert)
 {
 for(Account a:Trigger.New)
  {
  if(a.Industry=='Technology')
  a.Description = 'Technology Account';
  a.Phone = '90938';
}
}