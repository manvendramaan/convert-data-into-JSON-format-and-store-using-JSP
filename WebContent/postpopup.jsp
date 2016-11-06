<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.IOException"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.io.File"%>
	<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Popup</title>

</head>
<body>
<%LinkedHashMap<String, HashMap<String, Object>> outer = new LinkedHashMap<String, HashMap<String, Object>>();
HashMap<String, Object> inner = new HashMap<String, Object>();
ObjectMapper v_objObjectMapper = null;
LinkedHashMap<String, HashMap<String, Object>> getalData = null;
LinkedHashMap<String, HashMap<String, Object>> getData = null;
HashMap<String, Object> getdData = null;
HashMap<String, Object> gethashData = null;
String v_sWrite="";
String image_url_fetch = null;;
String anchor_url_fetch = null;;
int width_fetch = 0;
int height_fetch = 0;
String device_type_fetch = null;
String site_fetch = null;
String os_fetch = null; 
if(request.getParameter("radiopopup") != null)
{
String hashkey = request.getParameter("radiopopup");
v_objObjectMapper = new ObjectMapper();
	if((new File("D:\\user.json")).exists() && !(new File("D:\\user.json")).isDirectory())
	{
     getalData = v_objObjectMapper.readValue(new File("D:\\user.json"), LinkedHashMap.class);
	for ( String key : getalData.keySet() ) {
		

    		if(key.equals(hashkey))
    		{
    			inner = (HashMap<String,Object>) getalData.get(key);
	            outer.put(key,inner);    
    					
    				}	    				
        }
   
	}
	
	try {
		
		
		  File file = new File("D:\\work\\popup_image\\WebContent\\post.json");
			v_objObjectMapper.writeValue(file, outer);
			v_sWrite = v_objObjectMapper.writeValueAsString(outer);
			out.println("Posted!!");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
}
else
{
	out.println("Select any popup to post.");
}

if((new File("D:\\work\\popup_image\\WebContent\\post.json")).exists() && !(new File("D:\\work\\popup_image\\WebContent\\post.json")).isDirectory())
{
 getData = v_objObjectMapper.readValue(new File("D:\\work\\popup_image\\WebContent\\post.json"), LinkedHashMap.class);
for ( String key : getData.keySet() ) {
	gethashData = (HashMap<String,Object>) getData.get(key);
	image_url_fetch = (String) gethashData.get("image_url");
	anchor_url_fetch = (String) gethashData.get("anchor_url");
	width_fetch = (Integer) gethashData.get("width");
	height_fetch = (Integer) gethashData.get("height");
	device_type_fetch = (String) gethashData.get("device_type");
	site_fetch = (String) gethashData.get("site");
	os_fetch = ""; 
	if(gethashData.get("OS") != null)
	{
	  os_fetch = (String) gethashData.get("OS");
	}

    }

}


%>
</body>
</html>