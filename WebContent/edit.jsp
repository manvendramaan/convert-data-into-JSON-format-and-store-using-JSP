<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>

<%
String id = null;
String url = null;
String image_link = null;
int image_width = 0;
int image_height = 0;
String device_type = null;
String os = null;
String site = null;
String image_url_fetch = null;;
String anchor_url_fetch = null;;
int width_fetch = 0;
int height_fetch = 0;
String device_type_fetch = null;
String site_fetch = null;
String os_fetch = null; 
LinkedHashMap<String, HashMap<String, Object>> outer = new LinkedHashMap<String, HashMap<String, Object>>();
HashMap<String, Object> inner = new HashMap<String, Object>();
ObjectMapper v_objObjectMapper = null;
v_objObjectMapper = new ObjectMapper();
HashMap<String, Object> gethashData = null;
LinkedHashMap<String, HashMap<String, Object>>  getData = null;
try {
	 id = request.getParameter("hashid");

	} catch (NumberFormatException e) {
	 
	}

 getData = v_objObjectMapper.readValue(new File("D:\\user.json"), LinkedHashMap.class);
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Pop Up</title>
<script type="text/javascript">


	function url_validate() {
		var url = document.forms["image_form"]["url"].value;
		if (url == null || url == "") {
			document.getElementById('url').style.border = '2px solid red';
			document.getElementById('url_errfn').style.display = 'block';
			document.getElementById('url_errfn').innerHTML = "Please provide URL.";
			return false;
		} else {
			document.getElementById('url').style.border = '2px solid green';
			document.getElementById('url_errfn').style.display = 'none';
		}
		var pattern = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		if (!pattern.test(url)) {
			document.getElementById('url').style.border = '2px solid red';
			document.getElementById('url_errfn').style.display = 'block';
			document.getElementById('url_errfn').innerHTML = "Url is invalid.";
			return false;
		} else {
			document.getElementById('url').style.border = '2px solid green';
			document.getElementById('url_errfn').style.display = 'none';
		}

	}

	function image_link_validate() {
		var image_link = document.forms["image_form"]["image_link"].value;
		if (image_link == null || image_link == "") {
			document.getElementById('image_link').style.border = '2px solid red';
			document.getElementById('image_link_errfn').style.display = 'block';
			document.getElementById('image_link_errfn').innerHTML = "Please provide Image Link.";
			return false;
		} else {
			document.getElementById('image_link').style.border = '2px solid green';
			document.getElementById('image_link_errfn').style.display = 'none';
		}
		var pattern = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		if (!pattern.test(image_link)) {
			document.getElementById('image_link').style.border = '2px solid red';
			document.getElementById('image_link_errfn').style.display = 'block';
			document.getElementById('image_link_errfn').innerHTML = "Image Link is invalid.";
			return false;
		} else {
			document.getElementById('image_link').style.border = '2px solid green';
			document.getElementById('image_link_errfn').style.display = 'none';
		}

	}

	function image_width_validate() {
		var image_width = document.forms["image_form"]["image_width"].value;
		if (image_width == null || image_width == "") {
			document.getElementById('image_width').style.border = '2px solid red';
			document.getElementById('image_width_errfn').style.display = 'block';
			document.getElementById('image_width_errfn').innerHTML = "Please provide Image Width.";
			return false;
		} else {
			document.getElementById('image_width').style.border = '2px solid green';
			document.getElementById('image_width_errfn').style.display = 'none';
		}
		if (isNumeric(image_width) == false) {
			document.getElementById('image_width').style.border = '2px solid red';
			document.getElementById('image_width_errfn').style.display = 'block';
			document.getElementById('image_width_errfn').innerHTML = "Provide integer value for width.";
			return false;
		} else {
			document.getElementById('image_width').style.border = '2px solid green';
			document.getElementById('image_width_errfn').style.display = 'none';
		}

	}

	function image_height_validate() {
		var image_height = document.forms["image_form"]["image_height"].value;
		if (image_height == null || image_height == "") {
			document.getElementById('image_height').style.border = '2px solid red';
			document.getElementById('image_height_errfn').style.display = 'block';
			document.getElementById('image_height_errfn').innerHTML = "Please provide Image Height.";
			return false;
		} else {
			document.getElementById('image_height').style.border = '2px solid green';
			document.getElementById('image_height_errfn').style.display = 'none';
		}
		if (isNumeric(image_height) == false) {
			document.getElementById('image_height').style.border = '2px solid red';
			document.getElementById('image_height_errfn').style.display = 'block';
			document.getElementById('image_height_errfn').innerHTML = "Provide integer value for height.";
			return false;
		} else {
			document.getElementById('image_height').style.border = '2px solid green';
			document.getElementById('image_height_errfn').style.display = 'none';
		}

	}

	function validateForm() {
		var url = document.forms["image_form"]["url"].value;
		var image_link = document.forms["image_form"]["image_link"].value;
		var image_width = document.forms["image_form"]["image_width"].value;
		var image_height = document.forms["image_form"]["image_height"].value;

		if (url == null || url == "") {
			// document.getElementById('url_errfn').innerHTML="Please provide URL.";
			return false;
		} else if (image_link == null || image_link == "") {
			//  alert("Please provide Image Link.");
			return false;
		} else if (image_width == null || image_width == "") {
			// alert("Please provide Image Width.");
			return false;
		} else if (image_height == null || image_height == "") {
			// alert("Please provide Image Height.");
			return false;
		}

		var pattern = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
		if (!pattern.test(url)) {
			// alert("Url is invalid");
			return false;
		}
		if (!pattern.test(image_link)) {
			// alert("Image link is invalid");
			return false;
		}

		if (isNumeric(image_width) == false && isNumeric(image_height) == false) {
			// alert("Provide integer value for width & height."); 
			return false;
		} else if (isNumeric(image_width) == false) {
			// alert("Provide integer value for width."); 
			return false;
		} else if (isNumeric(image_height) == false) {
			// alert("Provide integer value for height."); 
			return false;
		}
	}

	function showCheck() {
		if (document.getElementById('yesCheck').checked) {
			document.getElementById('ifyes').style.display = 'block';
		} else {
			document.getElementById('ifyes').style.display = 'none';
		}
	}

	function isNumeric(str) {
		var allowedChars = "0123456789"; //  For Checking Decimal , allowedChars = "0123456789.";
		var isDigit = true;
		var char;
		for (i = 0; i < str.length && isDigit == true; i++) {
			char = str.charAt(i);
			if (allowedChars.indexOf(char) == -1)
				isDigit = false;
		}
		return isDigit;

	}
	
	 
	
	
</script>
</head>
<body onload="executeJS()">

	<%

	

if(key.equals(id))
{
	
	%>
	<form action="" method="POST" name="image_form"
		onsubmit="return validateForm()">
		Anchor URL :<br> <input type="text" id="url"
			onblur="url_validate()" name="url" value="<%=anchor_url_fetch%>">
		<div id="url_errfn" style="display: none"></div>
		<br> <br> Image Link :<br> <input type="text"
			id="image_link" onblur="image_link_validate()"
			value="<%=image_url_fetch%>" name="image_link">
		<div id="image_link_errfn" style="display: none"></div>
		<br> <br> Image Width :<br> <input type="text"
			id="image_width" onblur="image_width_validate()"
			value="<%=width_fetch%>" name="image_width">
		<div id="image_width_errfn" style="display: none"></div>
		<br> <br> Image Height :<br> <input type="text"
			id="image_height" onblur="image_height_validate()"
			value="<%=height_fetch%>" name="image_height">
		<div id="image_height_errfn" style="display: none"></div>
		<br> <br><div>
			<input type="radio" name="device_type" id="desktop" value="desktop" onclick="javascript:showCheck();"> Desktop
		<input type="radio" name="device_type" value="mobile" id="yesCheck" onclick="javascript:showCheck();"> Mobile
	</div>
		<div id="ifyes" style="display: none">
			<br> <select name="os">
				<option value="select_os" id="select_os">Select OS</option>
				<option value="all_mobile" id="all_mobile">All Mobile</option>
				<option value="android" id="android">Android</option>
			</select>
		</div>	
		<br>
		<input type="radio" name="site" value="website" id="website"> Website
		<input type="radio" name="site" value="blog" id="blog"> Blog	
		<br> <br> <input type="submit" name="submit" value="Submit">
	</form>
	
	<script type="text/javascript">
		function executeJS() {
			
			<%
			if(device_type_fetch.equals("mobile")) { %>
			document.getElementById("yesCheck").checked = true;
				document.getElementById('ifyes').style.display = 'block';
			<% } else if(device_type_fetch.equals("desktop")){ %>
			document.getElementById("desktop").checked = true;
			<% } if(os_fetch.equals("all_mobile")){%>
			document.getElementById("all_mobile").selected = true;
			<% } else if(os_fetch.equals("android")){ %>
			document.getElementById("android").selected = true;
			<% } else if(os_fetch.equals("select_os")){ %>
			document.getElementById("select_os").selected = true;
		    <% } %>
		    <%if(site_fetch.equals("website")){ %>
		    document.getElementById("website").checked = true;
		    <%} else if(site_fetch.equals("blog")){ %>
		    document.getElementById("blog").checked = true;
		    <% } %>
			}
</script>
	
	<%
	if (request.getParameter("submit") != null) {
		
	url = request.getParameter("url");
	image_link = request.getParameter("image_link");
	if (request.getParameter("image_width") != null && request.getParameter("image_width").length() > 0 && request.getParameter("image_height") != null && request.getParameter("image_height").length() > 0) {
		image_width = Integer.parseInt(request.getParameter("image_width"));
		image_height = Integer.parseInt(request.getParameter("image_height"));
	}
	device_type = request.getParameter("device_type");
	os = request.getParameter("os");
    site = request.getParameter("site");
	
	gethashData.put("image_url", image_link);
	gethashData.put("anchor_url", url);
	gethashData.put("width", image_width);
	gethashData.put("height", image_height);
	gethashData.put("device_type", device_type);
	gethashData.put("site", site);
	if (!os.equals("select_os")) {
		gethashData.put("OS", os);
	}
	
}	

}

outer.put(key,gethashData);
}

try {
	String v_sWrite="";
	  File file = new File("D:\\user.json");
		v_objObjectMapper.writeValue(file, outer);
		v_sWrite = v_objObjectMapper.writeValueAsString(outer);
		if (request.getParameter("submit") != null) {
		out.println("Popup Updated.");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}





%>


</body>
</html>