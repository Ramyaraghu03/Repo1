trigger topicassigntrigger on TopicAssignment (after insert,after update) {
    List<TopicAssignment> topl =Trigger.New;
    Map<Id,TopicAssignment> mapl =Trigger.newmap;
    if (trigger.isInsert && trigger.isAfter) {
        topichandler t = new topichandler();
        t.assigntopfield(topl,mapl);
    }
        }