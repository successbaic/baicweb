
/**
 * �Զ������ת����������ͬ����ִ����Ӧ�ı���ת��
 */
function myEncodeURI(url) {
	//��ʽ������WAS
	return url;
	
	//����������Tomcat
	//return encodeURI(url);
}

//Ϊ��ת��url����url���������
function myEscape(url) {
	//alert("===");
	return escape(url);
}
/**
 * ��ť���ú��������ڷ�ֹ����ύ
 */
function changeDis(clickObj) {
	clickObj.disabled = "false";
}
function c_showModalDialog(urlStr, p_num) {
	var strFeatureInfo = "dialogTop:100;dialogWidth:" + (window.screen.availWidth * p_num) + "px;DialogHeight=" + (window.screen.availHeight * p_num) + "px;help=no;location:no;center=yes;status:no;resizable:yes";
	var retval = window.showModalDialog(urlStr, "", strFeatureInfo);
	return retval;
}

//������󣬷�������׵����ڴ����
function DOMPurge(d) {
	if (d) {
		var a = d.attributes;//ȡ��DOM����������¼����� 
		if (a) {
			var l = a.length;
			for (var i = 0; i < l; i += 1) {
				var n = a[i].name;//ȡ��DOM�����¼����Ե�������onclick��onblur�� 
				if (typeof d[n] === "function") {
					d[n] = null;//���DOM�����¼����Ե�ֵ 
				}
			}
		}
		a = d.childNodes;//������Ԫ�� 
		if (a) {
			l = a.length;
			for (i = 0; i < l; i += 1) {
				purge(d.childNodes[i]);
			}
		}
	}
} 

//���������̶��߶ȵ�div��������������ĸ߶�
//caldiv��ʽ�磺titlebar,tabbar,querybar,tblheaderbar,bottombar
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


//����formȡֵ
function getFormValues(formObj) {
	var url = "";
    //����formȡֵ
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

