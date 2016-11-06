
function BaggoutInterstitial () {}
//BaggoutInterstitial.getInstance().start();
document.g_objBaggoutInterstitial = null;

BaggoutInterstitial.getInstance = function () {
	if (null == document.g_objBaggoutInterstitial) {
		document.g_objBaggoutInterstitial = new BaggoutInterstitial();
	}
	return document.g_objBaggoutInterstitial;
};

BaggoutInterstitial.prototype.writeCookie = function (prm_sKey, prm_sValue, prm_iHours) {
	var prm_objNow = this.getTimeAfterHours(1);
	var v_sValue = escape(prm_sValue) + "; ";
	var v_objDate = prm_objNow.toUTCString();
	document.cookie = prm_sKey + "=" + v_sValue + "expires=" + v_objDate + "; path=/";
};

BaggoutInterstitial.prototype.doesCookieExist = function (prm_sKey, prm_sValue) {
	var v_bReturn = false;
	var v_sKey = "";
	var v_sValue = "";
	var v_objAllcookies = "";
	try {
		v_objAllcookies = document.cookie;
		if(typeof v_objAllcookies != "undefined" && v_objAllcookies != "") {
			var v_objCookieArray = v_objAllcookies.split(';');
			for(var i = 0; i < v_objCookieArray.length; i++){
				try {
					if(v_objCookieArray[i].split('=').length > 1) {
						v_sKey = v_objCookieArray[i].split('=')[0].trim();
						v_sValue = v_objCookieArray[i].split('=')[1].trim();
						if(prm_sKey == v_sKey && prm_sValue == v_sValue) {
							v_bReturn = true;
							break;
						}
					}
				} catch (Exception) {}
			}
		}
	} catch (Exceptions) {
	}
	return v_bReturn;
};

BaggoutInterstitial.prototype.start = function () {
	try {
		var v_ptrThis = this;
		var v_objUserAgent = navigator.userAgent.toLowerCase();
		var v_bIsMobile = v_ptrThis.checkMobile();

		if(v_bIsMobile == true) {
			v_ptrThis.setStyle();
			v_ptrThis.createDiv();
			v_ptrThis.analyticDataAction("Mobile Popup - Opened");
		}
	} catch (exception) {}	
};

BaggoutInterstitial.prototype.checkBlog = function () {
	var v_bCheck = false;
	var v_sLocation;
	var v_iIndex = 0;
	try {
		v_sLocation = window.location.href;
		v_iIndex = v_sLocation.indexOf("blog");
		if(v_iIndex > 0 && v_iIndex < 50) {
			v_bCheck = true;
		}
	} catch (exception) {}
	return v_bCheck;
};

BaggoutInterstitial.prototype.checkMobile = function () {
  var v_bCheck = false;
  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))v_bCheck = true})(navigator.userAgent||navigator.vendor||window.opera);
  return v_bCheck;
};

BaggoutInterstitial.prototype.getTimeAfterHours = function (prm_iHours) {
	var v_objDateToday = new Date();
	var v_objDateTimeAfterHours = new Date(v_objDateToday.setTime(v_objDateToday.getTime()+(3600000 * prm_iHours)));
	return v_objDateTimeAfterHours;
};

BaggoutInterstitial.prototype.closeBaggoutInterstitialOuterDiv = function () {
	this.analyticDataAction('Mobile Popup - Closed via OuterDiv');
	var v_objElement = window.parent.document.getElementById('BaggoutInterstitialDivId');
	v_objElement && v_objElement.parentNode && v_objElement.parentNode.removeChild(v_objElement);
};

BaggoutInterstitial.prototype.closeBaggoutInterstitialButton = function () {
	this.analyticDataAction('Mobile Popup - Closed via Button');
	var v_objElement = window.parent.document.getElementById('BaggoutInterstitialDivId');
	v_objElement && v_objElement.parentNode && v_objElement.parentNode.removeChild(v_objElement);
};

BaggoutInterstitial.prototype.moveToHyperLink = function (prm_site_data,prm_device_type_data,prm_anchor_url_data) {
	this.analyticDataAction('Mobile Popup - Clicked');
	if(this.checkBlog() && prm_site_data === "blog" && prm_device_type_data === "mobile"){
		window.open(prm_anchor_url_data);
	} else if(prm_device_type_data === "mobile") {
		window.open(prm_anchor_url_data);
	}
};

BaggoutInterstitial.prototype.analyticDataAction = function (prm_sAction) {
	try {
		if(this.checkBlog()){
			__gaTracker('send', 'event', 'Click', "blog "+prm_sAction, '');
		} else {
			_gaq.push(['_trackEvent', 'Click', "website "+prm_sAction, '']);
		}
	} catch (exception) {}
};

BaggoutInterstitial.prototype.showBaggoutInterstitial = function (prm_sUIData) {
	var v_sBaggoutInterstitial = prm_sUIData;
	var div = document.createElement('div');
	div.innerHTML = v_sBaggoutInterstitial;
	document.body.appendChild(div.firstChild);
};

BaggoutInterstitial.prototype.setStyle = function() {
	var v_objThis = this;
	var newStyle = document.createElement('style');
	newStyle.appendChild(document.createTextNode(v_objThis.createStyle()));
	document.head.appendChild(newStyle);
};

BaggoutInterstitial.prototype.createStyle = function() {
	var v_sReturn = ".divElement {" +
                    "\tposition: absolute;\n" +
                    "\ttop: 50%;\n" +
                    "\tleft: 50%;\n" +
                    "\tmargin-top: -150px;\n" +
                    "\tmargin-left: -150px;\n" +
                    "\twidth: 300px;\n" +
                    "\theight: 300px;\n" +
                    "\tbackground-color: #ffffff;\n" +
                    "}\n" +
                    ".divOuter {\n" +
                    "\tposition: fixed;\n" +
                    "\tz-index: 7371832;\n" +
                    "\ttop: 0px;\n" +
                    "\tleft: 0px;\n" +
                    "\twidth: 100%;\n" +
                    "\theight: 100%;\n" +
                    "\tmargin: 0px;\n" +
                    "\tpadding: 0px;\n" +
                    "\tdisplay: block;\n" +
                    "\toverflow: scroll;\n" +
                    "\tbackground-color: rgba(0, 0, 0, 0.7);\n" +
                    "}\n" +
                    ".closeButton {\n" +
                    "\twidth: 40px;\n" +
                    "\theight: 55px;\n" +
                    "\tbackground: url(http://share.baggout.com/Ad_Creatives/interstitial/images/sprite.png);\n" +
                    "\tbackground-size: cover;\n" +
                    "\tbackground-position: -240px -8px;\n" +
                    "\tbackground-repeat: no-repeat;\n" +
                    "\tdisplay: inline-block;\n" +
                    "\tvertical-align: middle;\n" +
                    "}\n" +
                    ".closeOuterDiv {\n" +
                    "\tposition: absolute;\n" +
                    "\tz-index: 7371832;\n" +
                    "\tright: -5px;\n" +
                    "\ttop: -5px;\n" +
                    "\tpadding-right: 10px;\n" +
                    "\tpadding-top: 10px;\n" +
                    "\tpadding-bottom: 40px;\n" +
                    "\tpadding-left: 40px;\n" +
                    "\toverflow: hidden;\n" +
                    "}\n" +
                    ".tableDiv {\n" +
                    "\tdisplay: table;\n" +
                    "\theight: 300px;\n" +
                    "\toverflow: hidden;\n" +
                    "\twidth: 100%;\n" +
                    "}\n" +
                    ".tableCellDiv {\n" +
                    "\tdisplay: table-cell;\n" +
                    "\tvertical-align: middle;\n" +
                    "\ttext-align: center;\n" +
                    "}";
	return v_sReturn;
};


BaggoutInterstitial.prototype.createDiv = function() {
	var ptr_this;
	var v_sReturn;
	var site_data = null;
	var width_data = 0;
	var height_data = 0;
	var image_url_data = null;
	var anchor_url_data = null;
	var device_type_data = null;
	var OS_data = null;
	var v_sImageLink;
	ptr_this = this;
	$.getJSON('post.json', function (data) {
		$.each(data, function(key, value) {
			ptr_this.site_data = value.site;
			ptr_this.width_data = value.width;
			ptr_this.height_data = value.height;
			ptr_this.image_url_data = value.image_url;
			ptr_this.anchor_url_data = value.anchor_url;
			ptr_this.device_type_data = value.device_type;
			ptr_this.OS_data = value.OS;
	
			if(ptr_this.checkBlog() && ptr_this.site_data === "blog" && ptr_this.device_type_data === "mobile") {
				ptr_this.v_sImageLink = ptr_this.image_url_data;
			} else if(ptr_this.device_type_data === "mobile") {
				ptr_this.v_sImageLink = ptr_this.image_url_data;
			}
	
			ptr_this.v_sReturn = "<div id=\"BaggoutInterstitialDivId\" class=\"divOuter\" onclick=\"BaggoutInterstitial.getInstance().closeBaggoutInterstitialOuterDiv()\">" +
                    "\t<div class=\"divElement\">\n" +
                    "\t\t<div class=\"closeOuterDiv\" onclick=\"BaggoutInterstitial.getInstance().closeBaggoutInterstitialButton()\">\n" +
                    "\t\t\t<span class=\"closeButton\"></span>\n" +
                    "\t\t</div>\n" +
                    "\t\t<div class=\"tableDiv\">\n" +
                    "\t\t\t<div class=\"tableCellDiv\">\n" +
                    "\t\t\t\t<a href=\"#\" onclick=\"BaggoutInterstitial.getInstance().moveToHyperLink('" + ptr_this.site_data + "','" + ptr_this.device_type_data + "','" + ptr_this.anchor_url_data + "')\" style=\"width:100%; height:100%\"><img src=\"" + ptr_this.v_sImageLink + "\" width="+ptr_this.width_data+" height="+ptr_this.height_data+" alt=\"image\" /></a>\n" +
                    "\t\t\t</div>\n" +
                    "\t\t</div>\n" +
                    "\t</div>\n" +
                    "</div>";
			ptr_this.showBaggoutInterstitial(ptr_this.v_sReturn);
		});
	});
};

(function() {
	jQuery(document).ready(
			
		setTimeout(
				
			function() {
				

			
				
				var v_objBaggoutInterstitial = BaggoutInterstitial.getInstance();
				if(v_objBaggoutInterstitial.doesCookieExist("baggoutInterstitialShown", "yes")) {
				} else {
					v_objBaggoutInterstitial.start();
//					v_objBaggoutInterstitial.writeCookie("baggoutInterstitialShown", "yes", 1);
				};
		}, 100));
})();



