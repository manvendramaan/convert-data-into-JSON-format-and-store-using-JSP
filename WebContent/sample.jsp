<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ page import="java.io.FileWriter"%>
	<%@ page import="java.io.File"%>
	<%@ page import="java.security.MessageDigest"%>
	<%@ page import="java.io.IOException"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.io.File"%>
	<%@ page import="java.util.List"%>
	<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if (request.getParameter("submit") != null) {

		LinkedHashMap<String, HashMap<String, Object>> outer = new LinkedHashMap<String, HashMap<String, Object>>();
		HashMap<String, Object> inner = new HashMap<String, Object>();
		String v_sWrite="";
		ObjectMapper v_objObjectMapper = null;
		
		
		String url = request.getParameter("url");
		String image_link = request.getParameter("image_link");
		int image_width = 0;
		int image_height = 0;
		if (request.getParameter("image_width") != null && request.getParameter("image_width").length() > 0 && request.getParameter("image_height") != null && request.getParameter("image_height").length() > 0) {
			image_width = Integer.parseInt(request.getParameter("image_width"));
			image_height = Integer.parseInt(request.getParameter("image_height"));
		}
		String device_type = request.getParameter("device_type");
		String os = request.getParameter("os");
		String site = request.getParameter("site");
		
		//Convert object to JSON string and save into file directly 
		LinkedHashMap<String, HashMap<String, Object>> getalData = null;
	    v_objObjectMapper = new ObjectMapper();
	    
	    String concatInput = url+image_link+image_width+image_height+device_type+os+site;
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(concatInput.getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
		String hashId = sb.toString();
	    
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

		try {
		
		  // FileWriter file = new FileWriter("D:\\user.json",true);
		  File file = new File("D:\\user.json");
			v_objObjectMapper.writeValue(file, outer);
			v_sWrite = v_objObjectMapper.writeValueAsString(outer);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if((new File("D:\\user.json")).exists() && !(new File("D:\\user.json")).isDirectory())
		{
	     getalData = v_objObjectMapper.readValue(new File("D:\\user.json"), LinkedHashMap.class);
	     HashMap<String, Object> getdData = null;
		// Iterator itr = getalData.iterator();
		
			for ( String key : getalData.keySet() ) {
				getdData = (HashMap<String,Object>) getalData.get(key);
			}
			out.println(getdData);
		}
		
}
	    
	    %>
</body>
</html>