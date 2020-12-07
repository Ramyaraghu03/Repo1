public class CsvParser
{
    //This method accepts the CSV file body converted into String as a parameter and returns the parsed CSV.
    public static List<List<String>> parseCSV(String contents, Boolean skipHeaders)
    {
        List<List<String>> allFields = new List<List<String>>();

         contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');
        contents = contents.replaceAll('""','DBLQT');
        
        List<String> lines = new List<String>();
        try 
        {
            lines = contents.split('\n');
        } 
        catch (System.ListException e) 
        {
            System.debug('Limits exceeded?' + e.getMessage());
        }
        Integer num = 0;
        for(String line : lines) 
        {
            if (line.replaceAll(',','').trim().length() == 0) break;
            
            List<String> fields = line.split(',');   
            List<String> cleanFields = new List<String>();
            String compositeField;
            Boolean makeCompositeField = false;
            for(String field : fields) 
            {
                if (field.startsWith('"') && field.endsWith('"')) 
                {
                    cleanFields.add(field.replaceAll('DBLQT','"'));
                } 
                else if (field.startsWith('"')) 
                {
                    makeCompositeField = true;
                    compositeField = field;
                }
                else if (field.endsWith('"'))
                {
                    compositeField += ',' + field;
                    cleanFields.add(compositeField.replaceAll('DBLQT','"'));
                    makeCompositeField = false;
                } 
                else if (makeCompositeField)
                {
                    compositeField +=  ',' + field;
                }
                else
                {
                    cleanFields.add(field.replaceAll('DBLQT','"'));
                }
            }
            allFields.add(cleanFields);
        }
        if (skipHeaders) allFields.remove(0);
        return allFields;
    }
    
    //This method accepts the parsed CSV received from the above method and the Object name as the parameters and returns
    //the list of sObject type which can be inserted directly.
    public static list<sObject> csvTosObject(List<List<String>> parsedCSV, string objectType)
    {
        Schema.sObjectType objectDef = Schema.getGlobalDescribe().get(objectType).getDescribe().getSObjectType();
        system.debug(objectDef);
        Map<String, Schema.SObjectField> fieldMap = objectDef.getDescribe().fields.getMap();
        
        list<sObject> objects = new list<sObject>();
        list<string> headers = new list<string>();
        
        for(list<string> row : parsedCSV)
        {
            for(string col : row)
            {
                headers.add(col);
            }
            break;
        }
        system.debug('========================= File Column Headers'+headers);
            
        integer rowNumber = 0;
        for(list<string> row : parsedCSV)
        {
            system.debug('========================= Row Index' + rowNumber);
            if(rowNumber == 0)
            {
                rowNumber++;
                continue;
            }
            else
            {
                sObject thisObj = objectDef.newSobject();
                integer colIndex = 0;
                for(string col : row)
                {                   
                    string headerName = headers[colIndex].trim();
                    system.debug('========================= Column Name ' + headerName);
                    if(headerName.length() > 0)
                    {                  
                        try
                        {                       
                            //Finding the data type of a field and type casting the CSV value accordingly.
                            string FielddataType = String.Valueof(fieldMap.get(headerName).getDescribe().getType());
                            if(FielddataType == 'DOUBLE' || FielddataType == 'CURRENCY')
                            {
                                thisObj.put(headerName, Decimal.ValueOf(col.trim()));
                            }
                            else if(FielddataType == 'DATE')
                            {
                                thisObj.put(headerName, Date.parse(col.trim()));
                            }
                            else
                            {
                                thisObj.put(headerName, col.trim());
                            }
                        }
                        catch(exception e)
                        {
                            system.debug('============== Invalid field specified in header ' + headerName);                           
                        }
                        colIndex++;
                    }
                } 
                objects.add(thisObj);
                rowNumber++;
            }       
        }
        return objects;
    }

}