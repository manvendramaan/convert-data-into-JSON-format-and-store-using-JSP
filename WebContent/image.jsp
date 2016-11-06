<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@ page import="java.security.MessageDigest"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Image Update</title>
</head>
<body>

	<%
	LinkedHashMap<String, HashMap<String, Object>> outer = new LinkedHashMap<String, HashMap<String, Object>>();
	HashMap<String, Object> inner = new HashMap<String, Object>();
	String v_sWrite="";
	ObjectMapper v_objObjectMapper = null;
	String url = null;
	String image_link = null;
	int image_width = 0;
	int image_height = 0;
	String device_type = null;
	String os = null;
	String site = null;
	String concatInput = null;
	MessageDigest md = null;
	LinkedHashMap<String, HashMap<String, Object>> getalData = null;
    HashMap<String, Object> getdData = null;
	HashMap<String, Object> gethmData = null;
    HashMap<String, Object> gethashData = null;
    String image_url_fetch = null;;
    String anchor_url_fetch = null;;
    int width_fetch = 0;
    int height_fetch = 0;
    String device_type_fetch = null;
    String site_fetch = null;
    String os_fetch = null; 
	
	if (request.getParameter("submit") != null) {
		out.println("<div style='border: 2px solid black; padding:15px; width:100%; height:auto; margin:10px;'>");
	    url = request.getParameter("url");
		image_link = request.getParameter("image_link");
		if (request.getParameter("image_width") != null && request.getParameter("image_width").length() > 0 && request.getParameter("image_height") != null && request.getParameter("image_height").length() > 0) {
			image_width = Integer.parseInt(request.getParameter("image_width"));
			image_height = Integer.parseInt(request.getParameter("image_height"));
		}
		device_type = request.getParameter("device_type");
		os = request.getParameter("os");
		site = request.getParameter("site");
		
	    concatInput = url+image_link+image_width+image_height+device_type+os+site;
	    md = MessageDigest.getInstance("MD5");
		md.update(concatInput.getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
		String hashId = sb.toString();
	    v_objObjectMapper = new ObjectMapper();
	    int count = 0;
		if((new File("D:\\user.json")).exists() && !(new File("D:\\user.json")).isDirectory())
		{
	     getalData = v_objObjectMapper.readValue(new File("D:\\user.json"), LinkedHashMap.class);
		for ( String key : getalData.keySet() ) {
			

	    		if(key.equalsIgnoreCase(hashId))
	    		{
	    					out.println("Popup already exists.");
	    					count++;
	    				}	    				
	        }
	   
		}
		
if(count == 0)		
{ 
		
	    inner.put("image_url", image_link);
		inner.put("anchor_url", url);
		inner.put("width", image_width);
		inner.put("height", image_height);
		inner.put("device_type", device_type);
		inner.put("site", site);
		if (!os.equals("select_os")) {
			inner.put("OS", os);
		}
		outer.put(hashId,inner);

		if(getalData == null)
		{
		try {
		    File file = new File("D:\\user.json");
			v_objObjectMapper.writeValue(file, outer);
			v_sWrite = v_objObjectMapper.writeValueAsString(outer);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		else
		{
		try {
			 for ( String key : getalData.keySet() ) {
		        	gethmData = (HashMap<String,Object>) getalData.get(key);
		            outer.put(key,gethmData);    
		        }

		try {
			
		
			  File file = new File("D:\\user.json");
				v_objObjectMapper.writeValue(file, outer);
				v_sWrite = v_objObjectMapper.writeValueAsString(outer);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		LinkedHashMap<String, HashMap<String, Object>> getData = v_objObjectMapper.readValue(new File("D:\\user.json"), LinkedHashMap.class);
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
		
		out.println("<div style='display:inline-block; align: center;vertical-align: middle;'><a href='"+anchor_url_fetch+"' > <img class='imgDetails' width='"+width_fetch+"' height='"+height_fetch+"' src='"+image_url_fetch+"' /></a></div>");
		out.println("<div style='display:inline-block;vertical-align: middle;'>Image URL : "+image_url_fetch+"<br>");
		out.println("Anchor URL : "+anchor_url_fetch+"<br>");
		out.println("Image Width : "+width_fetch+"<br>");
		out.println("Image Height : "+height_fetch+"<br>");
		out.println("Device Type : "+device_type_fetch+"<br>");
		out.println("Site : "+site_fetch+"<br>");
		if(os_fetch != "")
		{
		out.println("OS : "+os_fetch+"<br>");
		}
		%>
		<form action="postpopup.jsp" method="post">
		<input type="radio" name="radiopopup" value="<%=key %>">Post<br>

		<%
     	out.println("<a href='edit.jsp?hashid="+key+"'>Edit</a>");
		out.println("</div><br><hr>");	
		}
	    out.println("</div>");
	}
	}
	
	%>
 <input type="submit" name="post" value="Post">
</form>

</body>
</html>