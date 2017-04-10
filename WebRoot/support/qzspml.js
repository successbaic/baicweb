
/**
 * 自定义编码转换函数，不同环境执行相应的编码转换
 */
function myEncodeURI(url) {
	//正式环境：WAS
	return url;
	
	//开发环境：Tomcat
	//return encodeURI(url);
}

//为了转换url中有url编码的问题
function myEscape(url) {
	//alert("===");
	return escape(url);
}
/**
 * 按钮禁用函数，用于防止多次提交
 */
function changeDis(clickObj) {
	clickObj.disabled = "false";
}
function c_showModalDialog(urlStr, p_num) {
	var strFeatureInfo = "dialogTop:100;dialogWidth:" + (window.screen.availWidth * p_num) + "px;DialogHeight=" + (window.screen.availHeight * p_num) + "px;help=no;location:no;center=yes;status:no;resizable:yes";
	var retval = window.showModalDialog(urlStr, "", strFeatureInfo);
	return retval;
}

//清除对象，否则很容易导出内存溢出
function DOMPurge(d) {
	if (d) {
		var a = d.attributes;//取得DOM对象的所有事件属性 
		if (a) {
			var l = a.length;
			for (var i = 0; i < l; i += 1) {
				var n = a[i].name;//取得DOM对象事件属性的名称如onclick、onblur等 
				if (typeof d[n] === "function") {
					d[n] = null;//清空DOM对象事件属性的值 
				}
			}
		}
		a = d.childNodes;//处理子元素 
		if (a) {
			l = a.length;
			for (i = 0; i < l; i += 1) {
				purge(d.childNodes[i]);
			}
		}
	}
} 

//根据其他固定高度的div来计算数据区域的高度
//caldiv格式如：titlebar,tabbar,querybar,tblheaderbar,bottombar
function resizethispage(objarea, caldiv) {
	var obj = document.getElementById(objarea);
	if (obj != null) {
		var s = document.body.offsetHeight + caldivheight(caldiv);
		if (s > 0) {
			obj.style.height = s + "px";
		} else {
			obj.style.height = "0px";
		}
	}
	if (document.getElementById("tbldataarea").scrollHeight > document.getElementById("tbldataarea").clientHeight) {
		tblheaderbar.style.overflowY = "scroll";
	} else {
		tblheaderbar.style.overflowY = "hidden";
	}
}
function caldivheight(objs) {
	var arr = objs.split(",");
	var s = -4;
	var obj;
	for (var i = 0; i < arr.length; i++) {
		obj = document.getElementById(arr[i]);
		if (obj != null) {
			s = s - obj.offsetHeight;
		}
	}
	return s;
}
function ShowLoadingNotice() {
	if (document.getElementById("waiting_box")) {
		var pixelLeft = screen.width / 2;
		var pixelTop = screen.height / 2 - 100;
		document.getElementById("waiting_box").style.pixelLeft = pixelLeft - 183;
		document.getElementById("waiting_box").style.pixelTop = pixelTop - 80;
		document.getElementById("waiting_box").style.display = "block";
	} else {
		if (window.top && window.top.document.getElementById("ShowLoadingMessage")) {
			window.top.document.getElementById("ShowLoadingMessage").style.display = "";
		}
	}
}
function HideLoadingNotice() {
	if (document.getElementById("waiting_box")) {
		document.getElementById("waiting_box").style.display = "none";
	} else {
		if (window.top && window.top.document.getElementById("ShowLoadingMessage")) {
			window.top.document.getElementById("ShowLoadingMessage").style.display = "none";
		}
	}
}


//遍历form取值
function getFormValues(formObj) {
	var url = "";
    //遍历form取值
	for (i = 0; i < formObj.elements.length; i++) {
		var e = formObj.elements[i];
		if (e.name != null && e.name != "") {
			if (e.type.toLowerCase() == "radio" || e.type.toLowerCase() == "checkbox") {
				if (e.checked) {
					url += ("&" + e.name + "=" + e.value);
				}
			} else {
				if (e.type.toLowerCase() == "select-one" || e.type.toLowerCase() == "text" || e.type.toLowerCase() == "hidden") {
					url += ("&" + e.name + "=" + e.value);
				}
			}
		}
	}
	return myEncodeURI(url);
}

