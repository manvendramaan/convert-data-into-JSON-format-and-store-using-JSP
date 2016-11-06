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
<title>Show PopUps</title>
</head>
<body>
<%
String image_url_fetch = null;;
String anchor_url_fetch = null;;
int width_fetch = 0;
int height_fetch = 0;
String device_type_fetch = null;
String site_fetch = null;
String os_fetch = null; 
ObjectMapper v_objObjectMapper = null;
v_objObjectMapper = new ObjectMapper();
HashMap<String, Object> gethashData = null;
LinkedHashMap<String, HashMap<String, Object>> outer = new LinkedHashMap<String, HashMap<String, Object>>();
HashMap<String, Object> inner = new HashMap<String, Object>();
out.println("<div style='border: 2px solid black; padding:15px; width:100%; height:auto; margin:10px;'>");
LinkedHashMap<String, HashMap<String, Object>>  getData = v_objObjectMapper.readValue(new File("D:\\user.json"), LinkedHashMap.class);
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
}%>
<form action="postpopup.jsp" method="post">
<input type="radio" name="radiopopup" value="<%=key %>">Post<br>

<%
out.println("<a href='edit.jsp?hashid="+key+"'>Edit</a>");

out.println("</div><br><hr>");

}
out.println("</div>");



%>
 <input type="submit" name="post" value="Post">
</form>

</body>
</html>