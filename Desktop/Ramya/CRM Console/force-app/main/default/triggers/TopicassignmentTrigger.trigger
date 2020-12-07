trigger TopicassignmentTrigger on TopicAssignment (after insert, after update,before delete) {
    set <Id> taids = new set<Id>();
    
    for(TopicAssignment ta : trigger.new ) {
       taids.add(ta.EntityId);
    }
  List<TopicAssignment>etype = new List<TopicAssignment>([Select  EntityId,EntityType,TopicId,Topic.Name
FROM TopicAssignment where EntityId =: taids]);


    
    
    
}