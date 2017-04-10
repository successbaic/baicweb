var Sys = {};
var ua = navigator.userAgent.toLowerCase();
var s;
(s = ua.match(/(msie\s|trident.*rv:)([\w.]+)/)) ? Sys.ie = s[2] || "0" :
(s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
(s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
(s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
(s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

//---------------------------------------------------------建行U盾--------------------------------------------------------------------------------------------//
//keyCT是页面上的一个div元素<div id="ukeyCT"></div>，ocx 是所要调用获取序列号控件的div  
 function getsn(keyCT){
	var ocx = "wdk"; 
	var keysn = getUkeySN(keyCT,ocx);
	//alert(keysn);
	return keysn;
}
//keyCT是页面上的一个div元素<div id="ukeyCT"></div>，ocx 是所要调用获取序列号控件的div
//ocx          获取序列号的控件
function getUkeySN(keyCT,ocx){
	var ukeysn = "";
	var ukeyProduct = new Array("11","21","31","41","51","61","71","81");
	for(var i=0;i<ukeyProduct.length;i++){
		createObject(ukeyProduct[i],keyCT);
		try{
			var wdk = document.getElementById(ocx);   
			var s = wdk.GetMediaID;
			if(ukeyProduct[i] && typeof s !="undefined" && typeof s != "unknown"){
				var sn = Sys.ie?wdk.GetMediaID:wdk.GetMediaID();
				if(sn!="" && typeof sn !="undefined" && typeof sn !="unknown" ){
					ukeysn = ukeysn + sn + "|";
					if(i==1){
						ukeyProduct[5]=0;
					}
					if(i==2){
						ukeyProduct[7]=0;
					}
					if(i==3){
						ukeyProduct[6]=0;
					}
				}
			}
		}catch(e){
			return "-2";
		}
	}
	if(ukeysn.length>1){
		ukeysn = ukeysn.substring(0,ukeysn.length-1);
	}
	return ukeysn;
}

//obj  创建的对象
//keyCT是页面上的一个div元素<div id="ukeyCT"></div>，ocx 是所要调用获取序列号控件的div
function createObject(obj,keyCT){
	var ukeyCT = document.getElementById(keyCT);
	
	if(obj=="21"){
		if(Sys.ie){
			ukeyCT.innerHTML = '<OBJECT id="wdk" CLASSID="CLSID:CE0460F5-48BD-4DC1-A046-0BDCB5A06CEB" height=0 width=0></OBJECT>';
		}else {
			ukeyCT.innerHTML = '<OBJECT id="wdk" type="application/x-watchdata-usbkey-ctrl" width=0 height=0 />';
		}
	}else if(obj=="31"){
		if(Sys.ie){
			ukeyCT.innerHTML = '<OBJECT id="wdk" CLASSID="CLSID:391E41FF-1CE1-493F-9B34-8BC53FB76A86" height=0 width=0></OBJECT>';
		}else{
			ukeyCT.innerHTML = '<OBJECT id="wdk" type="application/mozilla-hdzb-ccbsnctrl-plugin" width=0 height=0/>'
		}
	}else if(obj=="41"){
		if(Sys.ie){
			ukeyCT.innerHTML = '<OBJECT id="wdk" CLASSID="CLSID:128EEE5A-A2FD-4DDC-AFAD-8B03DA1CA18F" height=0 width=0></OBJECT>';
		}else{
			ukeyCT.innerHTML = '<OBJECT id="wdk" type="application/mozilla-dmwz-ccbdevidctrl-plugin" width=0 height=0/>';
		}		
	}else if(obj=="11"){
		if(Sys.ie){
			ukeyCT.innerHTML = '<OBJECT id="wdk" CLASSID="CLSID:478AB5EE-5C92-41C3-8339-CFC5BA639733" height=0 width=0></OBJECT>';
		}else{
			ukeyCT.innerHTML = '<OBJECT id="wdk" type="application/mozilla-jd-plugin" width=0 height=0/>';
		}
	}else if(obj=="51"){
		if(Sys.ie){
			ukeyCT.innerHTML = '<OBJECT id="wdk" CLASSID="CLSID:48A7113A-2B2E-4ED3-9B26-5C21FABEB217" height=0 width=0></OBJECT>';
		}else{
			ukeyCT.innerHTML = '<OBJECT id="wdk" type="application/x-tendyron-ccb-usbkey-ctrl" width=0 height=0/>';
		}
	}else if(obj=="61"){
		if(Sys.ie){
			ukeyCT.innerHTML = '<OBJECT id="wdk" CLASSID="CLSID:CE0460F5-48BD-4DC1-A046-0BDCB5A06CEB" height=0 width=0></OBJECT>';
		}else{
			ukeyCT.innerHTML = '<OBJECT id="wdk" type="application/x-watchdata-usbkey-ctrl" width=0 height=0/>';
		}
	}else if(obj=="71"){
		if(Sys.ie){
			ukeyCT.innerHTML = '<OBJECT id="wdk" CLASSID="CLSID:128EEE5A-A2FD-4DDC-AFAD-8B03DA1CA18F" height=0 width=0></OBJECT>';
		}else{
			ukeyCT.innerHTML = '<OBJECT id="wdk" type="application/mozilla-dmwz-ccbdevidctrl-plugin" width=0 height=0/>';
		}
	}else if(obj=="81"){
		if(Sys.ie){
			ukeyCT.innerHTML = '<OBJECT id="wdk" CLASSID="CLSID:391E41FF-1CE1-493F-9B34-8BC53FB7914C" height=0 width=0></OBJECT>';
		}else{
			ukeyCT.innerHTML = '<OBJECT id="wdk" type="application/mozilla-hdzb-2g-ccbsnctrl-plugin" width=0 height=0/>';
		}
	}
}
 
 
 //signCT是页面上的一个div元素<div id="signCT"></div>
 function createSignObject(signCT){
	var usignCT = document.getElementById(signCT);
		if(Sys.ie){
			usignCT.innerHTML = '<OBJECT ID="CCB_GMSignCtl" CLASSID="CLSID:7F432EA4-52B9-442C-AFBD-E1A73AD87043" CODEBASE="CCB_GMSignCom.dll #version=1,0,0,1" width="0" height="0"></OBJECT>';
		}
		else{
			usignCT.innerHTML ='<div id="divSign"><embed id="CCB_GMSignCtl" type="application/mozilla-ccbgmsignctrl-plugin" width=400 height=30></div>';
		}
}

//ocx          U盾的控件id=CCB_GMSignCtl
//keySn        U盾的sn项
//keyType      密钥类型	
//certType     证书类型	
//hashType     hash类型	
//plainText    签名原文
function GMSignData(ocx,keySn,keyType,certType,hashType,plainText){	
		var signdata = "";
		if(keySn){
			if(plainText){
				signdata = ocx.CryptSign(keySn,keyType,certType,hashType,plainText);
				var errNum =  ocx.errorNum;
				if (errNum != 0){
		    	//alert("签名失败:"+errNum);
				return errNum;
				}
			}else{
				alert("输入为空");
			}
		}else{
			alert("请获取网银盾序列号")
		}	
		return signdata;
}
//ocx          U盾的控件id=CCB_GMSignCtl
//plainText    签名原文
//certDN       证书dn项
//hashType     hash类型
function DetachedSign(ocx,plainText,certDN,hashType){
	        var signdata = "";
			var errmessage = "";
			if(plainText){
				try{
					signdata = ocx.DetachedSign(plainText,certDN,hashType);
					var errNum = ocx.errorNum;
					if (errNum != 0){
			    	//alert("签名失败:"+errNum);
					return errNum;
					}
				}catch(e){
					alert(e.message);	
				}
			}else{
				alert("签名原文不能为空");
			}
		return signdata;
}

//ocx          U盾的控件id=CCB_GMSignCtl
//keySn        U盾的sn项
//keyType      密钥类型	
//certType     证书类型	
//hashType     hash类型	
//plainText    签名原文
//certDN       证书dn项
function CCBSign(ocx,keySn,keyType,certType,hashType,plainText,certDN){
	    var sign = "";
		var plainValue = "SH=\"1\";SN=\"数据签名\";IN=\"0\";SI=\""+plainText+"\";|";  
		if(keySn.indexOf("I") > 0)
		{
			sign = GMSignData(ocx,keySn,keyType,certType,hashType,plainValue);
			//alert(sign);
		}
		else
		{
			hashType = 257;
			sign = DetachedSign(ocx,plainValue,certDN,hashType);
			//alert(sign);
		}
		
		return sign;
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------//

//---------------------------------------------------------第三方CA--------------------------------------------------------------------------------------------//
//获取base64签名证书
function GetBJCASignCert(XTXAPP,strContainerName)
{  
  var UserCert = XTXAPP.SOF_ExportUserCert(strContainerName);
 
  return UserCert;
}

//获取用户列表 并填充到证书列表
function GetBJCAList(XTXAPP,strListID)
{
	var objListID = eval(strListID);
	var strUserList = XTXAPP.SOF_GetUserList();
	while (1) {
		var i = strUserList.indexOf("&&&");
		if (i <= 0 ) {
			break;
		}
		var strOneUser = strUserList.substring(0, i);
		var strName = strOneUser.substring(0, strOneUser.indexOf("||"));
		var strUniqueID = strOneUser.substring(strOneUser.indexOf("||") + 2, strOneUser.length);
		var objItem = new Option(strName, strUniqueID);
		objListID.options.add(objItem);
		var len = strUserList.length;
		strUserList = strUserList.substring(i + 3,len);
	}
	objListID = null;
	return;
}

//对随机数签名  CertID=证书id；
function BJCASignedData(XTXAPP,CertID,sInData,strPin) 
{
   if(!XTXAPP.SOF_Login(CertID,strPin))	
   {
		var retryCount = XTXAPP.SOF_GetPinRetryCount(CertID);
		if (retryCount > 0) {
			alert("校验证书密码失败!您还有" + retryCount + "次机会重试!");
			return false;
		} else if (retryCount == 0) {
			alert("您的证书密码已被锁死,请联系BJCA进行解锁!");
			return false;
		} else {
			alert("登录失败!");
			return false;
		}	
   }
	if (CertID != null)
		return XTXAPP.SOF_SignData(CertID,sInData);
	else
		return "";
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------//


//---------------------------------------------------------工行U盾--------------------------------------------------------------------------------------------//
/*获取封装<object>标记的对象 （IE环境）
		      参数bitFlag：IE浏览器位数
*/
function getProductObj(bitFlag){
	//32位IE
	var ukeyProduct32 = {
			//捷德
			"icbc_gdgetdv"        : 
			"<object id='wdk1' classid='CLSID:7CCE07A5-A590-4554-B5C3-082840D7012E' codebase='/icbc/icbc_gdgetdv.dll#version=1,0,0,2' height=0 width=0></object>",
			//金邦达
			"icbc_gemplusdv"      : 
			"<object id='wdk1' classid='CLSID:BF6B2647-9A97-4258-AC3F-7CC8EA20D422' codebase='/icbc/icbc_gemplusdv.dll#version=1,0,0,1' height=0 width=0></object>",
			//金邦达2006
			"icbc_gemplus2006dv"  : 
			"<object id='wdk1' classid='CLSID:C7EC0B9B-074B-40FE-BF29-B135FB4F57D7' codebase='/icbc/icbc_gemplus2006dv.dll#version=1,0,0,1' height=0 width=0></object>",
			//华虹多语言
			"icbc_bhdcdv"         : 
			"<object id='wdk1' classid='clsid:CE81F1F1-8E2B-4A64-A89F-C1880B9221D9' codebase='/icbc/icbc_bhdcdv.CAB#version=1,0,0,3' height=0 width=0></object>",
			//华虹1
			"icbc_bhdc1vdv"       : 
			"<object id='wdk1' classid='CLSID:DA1B7A94-28C8-4CDE-82B8-D5773AE27780' codebase='/icbc/icbc_bhdc1vdv.cab#version=1,0,0,1' height=0 width=0></object>",
			//华虹2	
			"icbc_bhdc2vdv"       : 
			"<object id='wdk1' classid='CLSID:3D14998A-4CFB-4FC8-A98D-A24F05E4ED88' codebase='/icbc/icbc_bhdc2vdv.cab#version=1,0,0,1' height=0 width=0></object>",
			//飞天
			"icbc_ftdv"           : 
			"<object id='wdk1' classid='CLSID:ABCAFD04-FB3B-47E8-A52A-BC5176186D19' codebase='/icbc/icbc_ftdv.cab#version=1,0,10,727' height=0 width=0></object>",
			//明华
			"icbc_mwdv"           : 
			"<object id='wdk1' classid='CLSID:E6C2DD02-CD38-41A1-9B69-3D7E3B64AF9A' codebase='/icbc/icbc_mwdv.cab#version=1,0,0,6' height=0 width=0></object>",
			//天地融
			"ICBC_TDRDV"          : 
			"<object id='wdk1' classid='CLSID:060CA154-DF25-4F03-98AA-FBCDE9D27382' codebase='/icbc/ICBC_TDRDV.cab#version=1,0,0,1' height=0 width=0></object>",
			//国密飞天
			"icbcgm_FTusbkey"     : 
			"<object id='wdk1' classid='CLSID:0884588F-60D8-4e12-8570-B86018E0288F' codebase='/icbc/newperbank/icbcgm_FTusbkey.cab#version=1,0,14,117' height=0 width=0></object>",
			//国密华虹
			"icbcgm_HHusbkey"     : 
			"<object id='wdk1' classid='CLSID:2FC1485C-2FC3-43c8-BE60-524A437BA6C3' codebase='/icbc/newperbank/icbcgm_HHusbkey.CAB#version=1,0,0,8' height=0 width=0></object>",
			//国密明华	
			"icbcgm_mwusbkey"     : 
			"<object id='wdk1' classid='CLSID:448141AA-CF15-4C61-9C95-1A739EA202BE' codebase='/icbc/newperbank/icbcgm_MWusbkey.cab#version=1,0,0,6' height=0 width=0></object>",
			//国密天地融
			"ICBCGM_TdrUsbKey"    : 
			"<object id='wdk1' classid='CLSID:50B20C64-357F-4A51-A5D2-5BF4930F4B3D' codebase='/icbc/newperbank/ICBCGM_TdrUsbKey.cab#version=1,0,0,4' height=0 width=0></object>",
/*以下为第二次添加*/
			//高级U盾
			"senior_u_c"          :
			"<object id='wdk1' classid='clsid:B219E31C-E110-4638-AF01-7BDD5ACA552C' style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>",
			//飞天二代多语言
			"icbc_ftdv_2"         :
			"<object id='wdk1' classid='clsid:04409CCE-49CD-43BE-A49A-BE004D94711D' style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>",
			//明华二代多语言
			"icbc_mwdv_2"		  :
			"<object id='wdk1' classid='clsid:3B3FE354-548D-4DA2-BEC2-52960C31F8E7' style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>",
			//天地融二代多语言
			"ICBC_TDRDV_2"	      :
			"<object id='wdk1' classid='clsid:746E471A-B6E4-44E3-8F3C-2A09B3A030B4' style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>",
			//未知
			"icbc_unknown"        :
			"<object id='wdk1' classid='CLSID:3AA9CF07-DF20-48FF-98BE-DED276E40146' style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>"
	};
	//64位IE
	var ukeyProduct64 = {
			//捷德
			"icbc_gdgetdv"        : 
			"<object id='wdk1' classid='CLSID:4FDD7CA9-FE81-43f8-B946-06AD4907D01B' codebase='/icbc/icbc_gdgetdv_64.cab#version=1,0,0,1' height=0 width=0></object>",
			//金邦达
			"icbc_gemplus2006dv"  : 
			"<object id='wdk1' classid='CLSID:51215D8F-D737-4857-B42B-8E2CA5E573CE' codebase='/icbc/icbc_gemplus2006dv_64.dll#version=1,0,0,1' height=0 width=0></object>",
			//华虹多语言
			"icbc_bhdcdv"  		  : 
			"<object id='wdk1' classid='clsid:73B7A1AE-73C2-4715-BA9D-5F7F7953D62C' codebase='/icbc/icbc_bhdcdv_64.CAB#version=1,0,0,3' height=0 width=0></object>",
			//华虹1
			"icbc_bhdc1vdv"  	  : 
			"<object id='wdk1' classid='CLSID:DA1B7A94-28C8-4CDE-82B8-D5773AE27764' codebase='/icbc/icbc_bhdc1vdv_64.cab#version=1,0,0,1' height=0 width=0></object>",
			//华虹2
			"icbc_bhdc2vdv"       : 
			"<object id='wdk1' classid='CLSID:ABF2EBB2-9743-434a-BC7D-D8A02AA853D7' codebase='/icbc/icbc_bhdc2vdv_64.cab#version=1,0,0,1' height=0 width=0></object>",
			//飞天
			"icbc_ftdv"           : 
			"<object id='wdk1' classid='CLSID:F86F2E28-F935-4f11-9EE9-48A1D8A2B00A' codebase='/icbc/icbc_ftdv_64.cab#version=1,0,11,122' height=0 width=0></object>",
			//明华
			"icbc_mwdv"           : 
			"<object id='wdk1' classid='CLSID:25ED8DDA-5824-4a11-9A29-843D7E881254' codebase='/icbc/icbc_mwdv_64.cab#version=1,0,0,6' height=0 width=0></object>",
			//天地融
			"ICBC_TDRDV"  		  : 
			"<object id='wdk1' classid='CLSID:5E8120CF-BDF8-4CF9-B4A5-B482DC64352E' codebase='/icbc/ICBC_TDRDV_64.cab#version=1,0,0,1' height=0 width=0></object>",
			//国密飞天
			"icbcgm_FTusbkey"     : 
			"<object id='wdk1' classid='CLSID:810ABF76-C71C-4b6a-833D-F8A56CBE12FE' codebase='/icbc/newperbank/icbcgm_FTusbkey_64.cab#version=1,0,14,117' height=0 width=0></object>",
			//国密华虹	
			"icbcgm_HHusbkey"     : 
			"<object id='wdk1' classid='CLSID:95F7E0AB-CDD7-4171-8A33-213174E42998' codebase='/icbc/newperbank/icbcgm_HHusbkey_64.CAB#version=1,0,0,8' height=0 width=0></object>",
			//国密明华
			"icbcgm_mwusbkey"     : 
			"<object id='wdk1' classid='CLSID:9940318B-C9C8-44d5-AF77-2D1E5B947A97' codebase='/icbc/newperbank/icbcgm_MWusbkey_64.cab#version=1,0,0,6' height=0 width=0></object>",
			//国密天地融
			"ICBCGM_TdrUsbKey"    : 
			"<object id='wdk1' classid='CLSID:32348DB2-82FC-4642-8CFA-514DCA7F5B45' codebase='/icbc/newperbank/ICBCGM_TdrUsbKey_64.cab#version=1,0,0,4' height=0 width=0></object>",
/*以下为第二次添加*/
			//高级U盾
			"senior_u_c"          :
			"<object id='wdk1' classid='clsid:B219E31C-E110-4638-AF01-7BDD5ACA5D64' style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>",
			//飞天二代多语言
			"icbc_ftdv_2"         :
			"<object id='wdk1' classid='clsid:6B282630-1135-4705-B9EF-FB0379388950' style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>",
			//明华二代多语言
			"icbc_mwdv_2"         :
			"<object id='wdk1' classid='clsid:B54D34D3-1E5E-4880-A0EE-CA047CDE197'  style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>",
			//天地融二代多语言
			"ICBC_TDRDV_2"        :
			"<object id='wdk1' classid='clsid:0266A29B-993F-4FF0-889B-B652949BB572' style='HEIGHT: 0px; WIDTH: 0px' VIEWASTEXT></object>"
	};
	return bitFlag.indexOf("win64") < 0 ? ukeyProduct32 : ukeyProduct64 ;
	
}	

/*循环获取序列号,
			不是IE，输出提示并返回"noie"
			找到符合规则的序列号，正常返回序列号
			找不到则返回""			
*/
function geticbckeySN(keyCT){
	
	var pObj;       
	var ukeyCT = document.getElementById(keyCT);   //存放<object>标记的div
	
	//判断是否 ie，非ie直接返回noie标志
	if(Sys.ie){
		var bitFlag = window.navigator.appVersion.toLowerCase();
		
		pObj = getProductObj(bitFlag);   //根据浏览器位数返回对象
	}else{
		alert("请使用ie浏览器 ");
		return "noie";
	}
	
	var regex = /^\d{10}$/i;   //10位数字正则
	//循环尝试获取序列号
	for(var n in pObj ){
		ukeyCT.innerHTML = pObj[n];
		var wdk = document.getElementById("wdk1");
		try{
			var s = wdk.GetMediaID();
			if(s && s.match(regex)){//s为有效字符串并长度为10，认为是合法序列号，返回该字符串
				return s;
			}
		}catch(e){
			
		}
		//高级U盾用GetMediaIDC()函数再次尝试获取
		if(n == 'senior_u_c'){
			try{
				var sno = wdk.GetMediaIDC();
				if(sno && sno.match(regex)){//sno为有效字符串并长度为10，认为是合法序列号，返回该字符串
					return sno;
				}
			}catch(e){
				
			}	
		}
	}//循环结束
	return "";
}
	
//ocx          U盾的控件id=ICBCSign
//plainText    签名原文
function ICBCSign(ocx,plainText){
	    var sign = "";
		var err = 0;
		ocx.addFormItem(plainText);
		//InfoSecNetSign1.showPlainText();
		ocx.makeAttachedSign();
		if ((err = ocx.errorNum) != 0)
   	 	{
			history.go(-1);
		}
		else{ 		
			sign =ocx.attachedSign;
		}
		return sign;
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------//

//---------------------------------------------------------农行U盾--------------------------------------------------------------------------------------------//
//ocx          U盾的控件id=ABCSign
//plainText    签名原文
function ABCSign(ocx,plainText){
	var sign = "";
	var dn = "";
	sign = ocx.DetachedSign(plainText,dn);
	if("" == sign)
	{
		alert("签名失败！错误信息是:" + ocx.getErrMsg());
		return false;
	}
	return sign;
}
/*获取证书序列号序列号		
*/
function getabckeySN(ocx){
	//GetSignerCertInfo(oriData,1);
	var numSN = "220113897783";
	return numSN;
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------//

//---------------------------------------------------------中行U盾--------------------------------------------------------------------------------------------//
//ocx          U盾的控件id=BOCSign
//plainText    签名原文
function BOCSign(ocx,plainText){
	    var sign = "";
		return sign;
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------//

//---------------------------------------------------------招行U盾--------------------------------------------------------------------------------------------//
//ocx          U盾的控件id=CMBSign
//plainText    签名原文
function CMBSign(ocx,plainText){
	    var sign = "";
		return sign;
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------//


//---------------------------------------------------------农村信用社U盾--------------------------------------------------------------------------------------------//


//------------------------------------------------------------------------------------------------------------------------------------------------------------//

