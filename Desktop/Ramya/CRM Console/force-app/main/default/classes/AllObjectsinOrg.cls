public class AllObjectsinOrg {
 Public string ObjectSelected{get;set;}
 Public Map<String, Schema.SObjectType> AllObjmap;
 Public AllObjectsinOrg(){
    AllObjmap = New Map<String, Schema.SObjectType>();
    AllObjmap = Schema.getGlobalDescribe();
    System.debug('******All object Names :'+ AllObjmap.keyset());
}
Public List<selectoption> getObjList(){
    List<selectoption> objList = new List<selectoption>();
    for(string s:AllObjmap.keyset()){
        objList.add(new selectoption(s,s));
    }
  return objList;   
 }
}