package org.nxum.medicine.util;

import java.util.HashMap;
import java.util.Map;

public class JsonResponseData {
   public  static Map<String,Object> JsonMapResponse(Object object,Integer rowCount){
	   Map<String,Object> JsonMap  =  new HashMap<String, Object>();
       JsonMap.put("rows",object);
       JsonMap.put("total",rowCount);
       return  JsonMap;
   }
}
