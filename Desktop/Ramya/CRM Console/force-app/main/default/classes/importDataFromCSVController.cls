public class importDataFromCSVController {
public Blob csvFileBody{get;set;}
public string csvAsString{get;set;}
public String[] csvFileLines{get;set;}
    public string[] csvRecordData;
public List<Lead> llist{get;set;}

@AuraEnabled
public static List<Lead> importCSVFile(string csvFileBody) {
        String myFile = EncodingUtil.urlDecode(csvFileBody, 'UTF-8');
           String csvAsString;
           String[] csvFileLines ;
           List<Lead>llist = new List<Lead>();
           
           csvFileLines = csvFileBody.split('\n'); 
            
           for(Integer i=1;i<csvFileLines.size();i++) {
               Lead lObj = new Lead() ;
               string[] csvRecordData = csvFileLines[i].split(',');
               lObj.FirstName=csvRecordData[0];
               lObj.lastName = csvRecordData[1] ;
               lObj.Email = csvRecordData[2];
               lObj.Phone = csvRecordData[3];
               lObj.MobilePhone = csvRecordData[4];
               lObj.Website = csvRecordData[5];   
                  
                                                                                         
               llist.add(lObj);   
           }
       insert llist;
    System.debug('llist' + llist);
       return llist;    
        }
        
  }