public class OffsetController {
    Public List<account> accAllList{get;set;}
    Public List<account> accOffsetList{get;set;}
    Public OffsetController(){
        accAllList = new List<account>();
        accOffsetList = new List<account>();
        accAllList = [select name,accountnumber from account ];
        accOffsetList = [select name,accountnumber from account OFFSET 7 ];
    }
}