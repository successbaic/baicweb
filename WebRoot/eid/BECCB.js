//义用户登录类型
var TP_USER = 1;
var TP_SUPUSER = 0;

var LBL_USERCERT_ENC = "LAB_USERCERT_ENC";
var LBL_USERCERT_SIG = "LAB_USERCERT_SIG";

//这里定义硬件标签数据类型
var AREA_CONFIG = 0;
var AREA_CERT = 1;
var AREA_KEY = 2;
var AREA_OTHER = 3;

//定义读写类型
var MODE_RD = 0; //只读模式
var MODE_WR = 1; //只写模式
var MODE_RW = 2; //读写模式

//定义算法类型
var ALGO_SSF33 = 9;
var ALGO_PMC3DES = 26115; //PMC3DES5
var ALGO_SCB2 = 26132;

var ALGO_HASH_MD5 = 32771;
var ALGO_HASH_SHA1 = 32772;
var ALGO_HASH_SM3 = 1;
var ALGO_RSA = 65536;
var ALGO_SM2 = 131328;

var ret = 0;
var cert = "";
var sign = "";
var errorcode = 0;
var retrycount = 0;

//-----------------------------------------数据签名------------------------------------------------------//
function BLICSign(i_com,inData,hashType,enumSN,pin){
	var outDataArray = new Array(); // 0 :signData
	var numsn = "";
	try{
			outDataArray[0] = "";
			ret = i_com.BLicInit();
			if (ret != 0) {
				alert("智能卡初始化失败" + ret);
				return ret;
			}	
			
			ret = i_com.BLicLogin(TP_USER, pin);
			if (!ret) {
				errorcode = i_com.CurStatus;
				retrycount = i_com.RetryCount;
				alert("登录失败，输入的PIN码有误，剩余可输入次数 :" + retrycount);
				return -1;
			}
			
			numsn = i_com.BLicGetDevSerialNum();
			if (numsn == null || numsn == '') {
				alert("获取的设备序列号为空！")
				ret = -1;
				return ret;
			}
			//keytype是返回值1：RSA，2：SM2
			var hashAlgo = '33772';
			var keytype = i_com.BLicGetContainerType();
			if (keytype != 1 && keytype != 2) {
				alert("获取电子营业执照类型失败" + keytype);
				return ret;
			}
			if (keytype == 1) {
				outDataArray[1] = 65535;
				outDataArray[2] = 65535;
				outDataArray[3] = 32772;
				hashAlgo = '32772';
			}
			outDataArray[1] = 131328;
			outDataArray[2] = 131328;
			outDataArray[3] = 33772;
			if(numsn == enumSN){
				sign = i_com.BLicSign(inData, hashAlgo);
				if (sign == null || sign == '') {
					outDataArray[5] = "";
					alert("签名失败，签名值为空！")
					ret = -1;
					return ret;
				}	
				outDataArray[4] = numsn;
				outDataArray[5] = sign;
			}
			else{
				    outDataArray[5] = "";
				    outDataArray[6] = "";
					alert("签名使用的卡片和登录时使用的卡片不一致！")
					ret = -1;
					return ret;
			}
			cert = i_com.BLicReadLable(LBL_USERCERT_SIG, AREA_CERT);
			if (cert == null || cert == '') {
				alert("读取智能卡内容为空，请检查密码钥匙是否可用！")
				outDataArray[6] = "";
				ret = -1;
				return ret;
			}
			outDataArray[6] = cert;
			ret = i_com.BLicLogout();
			if (!ret) {
				alert("智能卡退出失败!");
				return -1;
			}
			ret = i_com.BLicEnd();
			if (ret != 0) {
				alert("智能卡释放失败" + ret);
				return ret;
			}	
	}
	catch (e) { 
 		throw e;
	} 
	
	return outDataArray;
}

function EIDSign(i_com,eID,selectedReader,inData,enumSN,pin){
	var outDataArray = new Array(); // 0 :signData
	var numsn = "";
	try{
			outDataArray[0] = "";
			eID.hash(hashCallback, selectedReader, 'MTIz', 2, 1);
            function hashCallback(rv, result, idCarrier, alg) {
                //调用成功
                if (rv == 0) {
                    alert('hash调用成功，result为' + result + '，idCarrier为' + idCarrier + '，alg为' + alg);
                }
                //调用失败
                else {
                    alert('hash调用失败，返回码为 ' + rv + ':' + eID.getMessage(rv));
                }   
                numsn = idCarrier;
            }
            if(numsn == enumSN){
	            eID.signNoInputPin(signCallback, selectedReader,inData, 0);
	            function signCallback(rv, result, idCarrier, issuer, subject, certSn, issuerSn, certbase64, alg) {
	                //调用成功
	                if (rv == 0) {
	                    alert('signNoInputPin调用成功，result为' + result + '，idCarrier为' + idCarrier + '，issuer为' + issuer + '，subject为' + subject + '，certSn为' + certSn + '，issuerSn为' + issuerSn + '，certbase64为' + certbase64 + '，alg为' + alg);
	                }
	                //调用失败
	                else {
	                    alert('signNoInputPin失败，返回码为 ' + rv + ':' + eID.getMessage(rv));
	                }
	            }
            }
            else{
					alert("签名使用的卡片和登录时使用的卡片不一致！")
					ret = -1;
					return ret;
			}
			outDataArray[0] = result;
	}
	catch (e) { 
 		throw e;
	} 
	
	return outDataArray;
}

function CCBUkeySign(i_com,inData,deSignerDN,hashType,keyCT,enumSN){
	var outSignArray = new Array(); // 0 :signData
	var numsn = "";
	try{
			numsn = getsn(keyCT);           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
			if (numsn == null || numsn == '') {
					alert("获取的设备序列号为空！")
					ret = -1;
					return ret;
			}
			else if(numsn == enumSN){
				var plainText = inData;
				var keyType = 2;
				var certType = 1;
				var hashType = 259;
				sign =  CCBSign(i_com,numsn,keyType,certType,hashType,plainText,deSignerDN);
				if (sign == null || sign == "") {
					errorcode = i_com.errorNum;
			        alert("签名错误，错误码为:" + errorcode);
			        return errorcode;
				}
				outSignArray[0] = "";
				outSignArray[1] = 65535;
				outSignArray[2] = 65535;
				outSignArray[3] = 32772;
				outSignArray[4] = numsn;
				outSignArray[5] = sign;
				outSignArray[6] = "";
			}
			else{
					alert("签名使用的卡片和登录时使用的卡片不一致！")
					ret = -1;
					return ret;
			}		
	}
	catch (e) { 
 		throw e;
	} 
	
	return outSignArray;
	
}

function ICBCUkeySign(i_com,inData,hashType,enumSN,pin){
	var outSignArray = new Array(); // 0 :signData
	var numsn = "";
	try{
			numsn = geticbckeySN("ukeyCT");           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
			if (numsn == null || numsn == '') {
				alert("获取的设备序列号为空！")
				ret = -1;
				return ret;
			}
			else if(numsn == enumSN){
				sign = ICBCSign(i_com,inData);
				outSignArray[0] = "";
				outSignArray[1] = 65535;
				outSignArray[2] = 65535;
				outSignArray[3] = 32772;
				outSignArray[4] = numsn;
				outSignArray[5] = sign;
				outSignArray[6] = "";
			}
			else{
				alert(numsn+"---js-");
					alert("签名使用的卡片和登录时使用的卡片不一致！")
					ret = -1;
					return ret;
			}	
	}
	catch (e) { 
 		throw e;
	} 
	
	return outSignArray;
}

function ABCUkeySign(i_com,inData,enumSN,pin){
	var outSignArray = new Array(); // 0 :signData
	var numsn = "";
	try{
			numsn = "2123456";
			if (numsn == null || numsn == '') {
				alert("获取的设备序列号为空！")
				ret = -1;
				return ret;
			}
			else if(numsn == enumSN){
				sign = ABCSign(i_com,inData);
				if (sign == null || sign == "") {
					errorcode = i_com.errorNum;
					alert("签名错误，错误码为:" + errorcode);
					return errorcode;
				}
				outSignArray[0] = "";
				outSignArray[1] = 65535;
				outSignArray[2] = 65535;
				outSignArray[3] = 32772;
				outSignArray[4] = numsn;
				outSignArray[5] = sign;
				outSignArray[6] = "";
			}
			else{
					alert("签名使用的卡片和登录时使用的卡片不一致！")
					ret = -1;
					return ret;
			}	
	}
	catch (e) { 
 		throw e;
	} 
	
	return outSignArray;
}

function BOCUkeySign(i_com,inData,enumSN,pin){
	return "";
}

function SignData(i_com,eID,selectedReader,inData,deSignerDN,hashType,keyCT,numSN,ocxType){
	try{
			var pin = '';
			if(ocxType == 1){    
				return BLICSign(i_com,inData,hashType,numSN,pin);
			}
			else if(ocxType == 2){    
				return EIDSign(i_com,eID,selectedReader,inData,hashType,numSN,pin);
			}
			else if(ocxType == 3){  
				return CCBUkeySign(i_com,inData,deSignerDN,hashType,keyCT,numSN);
			}
			else if(ocxType == 5){    
				return ICBCUkeySign(i_com,inData,hashType,numSN,pin);
			}
			else if(ocxType == 6){    
				return BOCUkeySign(i_com,inData,hashType,numSN,pin);
			}
			else if(ocxType == 7){    
				return ABCUkeySign(i_com,inData,hashType,numSN,pin);
			}
			else{
					alert("所选类型错误！")
					ret = -1;
					return ret;
			}
			
			
	}
	catch (e) { 
 		throw e;
	} 
	
}
//-----------------------------------------数据签名END----------------------------------------------------//
//-----------------------------------------数据签名END----------------------------------------------------//

//-----------------------------------------登录----------------------------------------------------------//

function BLICLoginSign(i_com,inData,pin){
	var outDataArray = new Array(); // 0 :deSignerDN  1:keyType 2:certType 3: hashType 4: enumSN 5: signData 6:pin
	var numSN = "";
	try{
		    outDataArray[0] = "";
			ret = i_com.BLicInit();
			if (ret != 0) {
				alert("智能卡初始化失败" + ret);
				return ret;
			}	
			
			ret = i_com.BLicLogin(TP_USER, pin);
			if (!ret) {
				errorcode = i_com.CurStatus;
				retrycount = i_com.RetryCount;
				alert("登录失败，输入的PIN码有误，剩余可输入次数 :" + retrycount);
				return -1;
			}
			
			//keytype是返回值1：RSA，2：SM2
			var keytype = i_com.BLicGetContainerType();
			if (keytype != 1 && keytype != 2) {
				alert("获取电子营业执照类型失败" + keytype);
				return ret;
			}
			var hashAlgo = '33772';
			if (keytype == 1) {
				outDataArray[1] = 65535;
				outDataArray[2] = 65535;
				outDataArray[3] = 32772;
				hashAlgo = '32772';
			}
			outDataArray[1] = 131328;
			outDataArray[2] = 131328;
			outDataArray[3] = 33772;
			
			numSN = i_com.BLicGetDevSerialNum();
			if (numSN == null || numSN == '') {
				alert("获取的设备序列号为空！")
				ret = -1;
				return ret;
			}
			outDataArray[4] = numSN;
			
			cert = i_com.BLicReadLable(LBL_USERCERT_SIG, AREA_CERT);
			if (cert == null || cert == '') {
				alert("读取智能卡内容为空，请检查密码钥匙是否可用！")
				ret = -1;
				return ret;
			}
			outDataArray[6] = cert;
			sign = i_com.BLicSign(inData, hashAlgo);
			if (sign == null || sign == '') {
				alert("签名失败，签名值为空！")
				ret = -1;
				return ret;
			}	
			outDataArray[5] = sign;
			ret = i_com.BLicLogout();
			if (!ret) {
				alert("智能卡退出失败!");
				return -1;
			}
			
			ret = i_com.BLicEnd();
			if (ret != 0) {
				alert("智能卡释放失败" + ret);
				return ret;
			}
			

	}
	catch (e) { 
 		throw e;
	} 
	
	return outDataArray;
}

function EIDLoginSign(i_com,eID,selectedReader,inData,pin){
	
	var rv = 0;
	eidsign = "";
	flag = true;
	var outDataArray = new Array(); // 0 :deSignerDN  1:keyType 2:certType 3: hashType 4: enumSN 5: signData  6:pin
	try{
			eID.setDeviceDiv({
		        id: "div1",
		        callback: function(evt) {
		            if (evt.rv != 0) {
		                alert(evt.rv);
		            }
		        },
		        onDevChange: function(evt) {
		        }
		    });
			eID.setSignButton({
		        id: 'btn2',
		        src:  function() {
                    var toSignData = inData;
                    return toSignData;
                },
		     type: 3,   
		     alg: 22,
		     callback: function(evt) {
		            if (evt.rv != 0) {
		                alert('sign登录签名失败' + evt.rv + ':' + evt.msg);
		            }
		            else {
		                   //alert('signResult' + evt.data.signResult + 'idCarrier' + evt.data.idCarrier + 'issuer' + evt.data.issuer + 'subject' + evt.data.subject + 'certSn' + evt.data.certSn + 'issuerSn' + evt.data.issuerSn + 'alg' + evt.data.alg);
					      $("#eID_eid_issuer").val(evt.data.issuer);
			          	  $("#eID_eid_issuersn").val(evt.data.issuerSn);
			          	  $("#eID_eid_sn").val(evt.data.idCarrier);
			          	  $("#eID_data_to_sign").val(toSignData);
			          	  $("#eID_eid_sign").val(evt.data.signResult);
			          	  $("#eID_signtype").val(signalgo);
			          	  $("#eID_hashType").val(hashalgo);
			          	  $("#eID_eid_sc").val("");
			          	  $("#eID_subject").val(evt.data.subject);
			          	  $("#eID_eid_certsn").val(evt.data.certSn);
			        	  outDataArray[0] = "";
				          outDataArray[1] = 131328;
						  outDataArray[2] = 131328;
						  outDataArray[3] = 131328;
						  outDataArray[4] = "";
						  outDataArray[5] = "";
						  outDataArray[6] = "";
						  return outDataArray;
		            }
		        } 
		        });
	}
	catch (e) { 
 		throw e;
	} 
}

function BJCALoginSign(i_com,CertID,inData,pin){
	var numSN = "";
	var outDataArray = new Array(); // 0 :deSignerDN  1:keyType 2:certType 3: hashType 4: enumSN 5: signData  6:pin
	try{
			outDataArray[0] = "O=Public Trust CA";
			outDataArray[1] = 65535;
			outDataArray[2] = 65535;
			outDataArray[3] = 32772;
			numSN = CertID;
			if (numSN == null || numSN == '') {
				alert("获取的设备序列号为空！")
				ret = -1;
				return ret;
			}
			outDataArray[4] = numSN;
			
			sign =  BJCASignedData(i_com,CertID,inData,pin);
			if (sign == null || sign == "") {
				//errorcode = i_com.errorNum;
		        alert("签名错误，错误码为:" + errorcode);
		        return errorcode;
			}
			outDataArray[5] = sign;
			outDataArray[6] = GetBJCASignCert(i_com,CertID);
			
	}
	catch (e) { 
 		throw e;
	} 
	
	return outDataArray;
}

function CCBGMLoginSign(i_com,inData,pin){
	var numSN = "";
	var outDataArray = new Array(); // 0 :deSignerDN  1:keyType 2:certType 3: hashType 4: enumSN 5: signData  6:pin
	try{
			outDataArray[0] = "";
			outDataArray[1] = 65535;
			outDataArray[2] = 65535;
			outDataArray[3] = 32772;
			numSN = i_com.GetMediaID();
			if (numSN == null || numSN == '') {
				alert("获取的设备序列号为空！")
				ret = -1;
				return ret;
			}
			outDataArray[4] = numSN;
			sign = i_com.CryptSign(numSN, KeyType.value, CertType.value, HashType.value,plainText.value);
			if (sign == null || sign == "") {
				errorcode = i_com.errorNum;
		        alert("签名错误，错误码为:" + errorcode);
		        return errorcode;
			}
			outDataArray[5] = sign;
			outDataArray[6] = "";
	}
	catch (e) { 
 		throw e;
	} 
	
	return outDataArray;
}

function ICBCLoginSign(i_com,inData){
	var numSN = "";
	var outDataArray = new Array(); // 0 :deSignerDN  1:keyType 2:certType 3: hashType 4: enumSN 5: signData
	try{
			outDataArray[0] = "";
			outDataArray[1] = 65535;
			outDataArray[2] = 65535;
			outDataArray[3] = 32772;
			numSN = geticbckeySN("ukeyCT");           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
			if (numSN == null || numSN == '') {
					alert("获取的设备序列号为空！")
					ret = -1;
					return ret;
			}
			outDataArray[4] = numSN;
			sign = ICBCSign(i_com,inData);
			if (sign == null || sign == "") {
				errorcode = i_com.errorNum;
		        alert("签名错误，错误码为:" + errorcode);
		        return errorcode;
			}
			outDataArray[5] = sign;
			outDataArray[6] = "";
	}
	catch (e) { 
 		throw e;
	} 
	
	return outDataArray;
	
}

function ABCLoginSign(i_com,inData){
	var numSN = "";
	var outDataArray = new Array(); // 0 :deSignerDN  1:keyType 2:certType 3: hashType 4: enumSN 5: signData
	try{
			outDataArray[0] = "";
			outDataArray[1] = 65535;
			outDataArray[2] = 65535;
			outDataArray[3] = 32772;
			numSN = "220113897783";
			if (numSN == null || numSN == '') {
				alert("获取的设备序列号为空！")
				ret = -1;
				return ret;
			}
			outDataArray[4] = numSN;
			sign = ABCSign(i_com,inData);
			if (sign == null || sign == "") {
				errorcode = i_com.errorNum;
		        alert("签名错误，错误码为:" + errorcode);
		        return errorcode;
			}
			outDataArray[5] = sign;
			outDataArray[6] = "";
	}
	catch (e) { 
 		throw e;
	} 
	
	return outDataArray;
	
}

function LoginSignData(i_com,eID,selectedReader,inData,keyCT,ocxType){
  try{
	    var outDataArray = new Array();
	    var pin = '';
		if(ocxType == 1){ 
			return BLICLoginSign(i_com,inData,pin);
		}
		else if(ocxType == 2){  
			EIDLoginSign(i_com,eID,selectedReader,inData,pin);
			return eidsign;
		}
		else if(ocxType == 3){   
			var plainText = inData;
			var certDN = "";
			var sign = "";
			var keyType = 2;
			var certType = 1;
			var hashType = 257;

			var keySn = getsn(keyCT);           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
			if (keySn == null || keySn == '') {
					alert("获取的设备序列号为空！")
					ret = -1;
					return ret;
			}
			sign = CCBSign(i_com,keySn,keyType,certType,hashType,plainText,certDN);
			//alert(sign);
			outDataArray[0]= sign;    // 0 :sign 
			outDataArray[1]= keySn;   // 1 : keySn 
			return outDataArray;
		}
		else if(ocxType == 4){    
			pin = keyCT;
			return BJCALoginSign(i_com,selectedReader,inData,pin);
		}
		else if(ocxType == 5){    
			return ICBCLoginSign(i_com,inData);
		}
		else if(ocxType == 6){    
			return BOCLoginSign(i_com,inData);
		}
		else if(ocxType == 7){    
			return ABCLoginSign(i_com,inData);
		}
		else if(ocxType == 8){    
			return CMBLoginSign(i_com,inData);
		}
		else{
				alert("所选类型错误！")
				ret = -1;
				return ret;
		}
	}
	catch (e) { 
 		throw e;
	} 	
}




function getNumSn(i_com,type,keyCT)
{
	var numSn = "";
	try{
			if(type == 1){                                 //电子执照卡片设备序列号
				ret = i_com.BLicInit();
				if (ret != 0) {
					alert("智能卡初始化失败" + ret);
					return ret;
				}	
				numSn = i_com.BLicGetDevSerialNum();
				if (numSn == null || numSn == '') {
					alert("获取的设备序列号为空！")
					ret = -1;
					return ret;
				}
				ret = i_com.BLicEnd();
				if (ret != 0) {
					alert("智能卡释放失败" + ret);
					return ret;
				}
			}
			else if(type == 2){                       //EID卡片设备序列号
			
			
			}
			else if(type == 3){                      //建行U盾设备序列号
				var keySn = getsn(keyCT);           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
				if (keySn == null || keySn == '') {
						alert("获取的设备序列号为空！")
						ret = -1;
						return ret;
				}
				numSn = keySn;
			}
			else if(type == 4){                       //CA证书设备序列号
				var cakeySn = getcakeySN(keyCT);           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
				if (cakeySn == null || cakeySn == '') {
						alert("获取的设备序列号为空！")
						ret = -1;
						return ret;
				}
				numSn = cakeySn;
			
			}
			else if(type == 5){                          //工行U盾设备序列号
				var icbckeySn = geticbckeySN(keyCT);           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
				if (icbckeySn == null || icbckeySn == '') {
						alert("获取的设备序列号为空！")
						ret = -1;
						return ret;
				}
				numSn = icbckeySn;
			}
			else if(type == 6){                          //中行U盾设备序列号
				var bockeySn = getbockeySN(keyCT);           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
				if (bockeySn == null || bockeySn == '') {
						alert("获取的设备序列号为空！")
						ret = -1;
						return ret;
				}
				numSn = bockeySn;
			}
			else if(type == 7){                          //农行U盾设备序列号
				var abckeySn = getabckeySN(i_com);           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
				if (abckeySn == null || abckeySn == '') {
						alert("获取的设备序列号为空！")
						ret = -1;
						return ret;
				}
				numSn = abckeySn;
			}
			else if(type == 8){                          //招行U盾设备序列号
				var cmbkeySn = getcmbkeySN(keyCT);           //keyCT是页面上的一个div元素<div id="ukeyCT"></div>
				if (cmbkeySn == null || cmbkeySn == '') {
						alert("获取的设备序列号为空！")
						ret = -1;
						return ret;
				}
				numSn = cmbkeySn;
			}
			else{
				numSn = "";
				alert("所选控件类型错误！")
				ret = -1;
				return ret;
			}
		
	}catch (e) { 
 		throw e;
	} 
	
	return numSn;
}

function blicRead(i_com){
	var cert = "";
	try{
			ret = i_com.BLicInit();
			if (ret != 0) {
				alert("智能卡初始化失败" + ret);
				return ret;
			}	
			cert = i_com.BLicRead();
			if (cert == null || cert == '') {
				alert("获取的执照信息为空！")
				ret = -1;
				return ret;
			}
			ret = i_com.BLicEnd();
			if (ret != 0) {
				alert("智能卡释放失败" + ret);
				return ret;
			}	
		
	}catch (e) { 
 		throw e;
	} 
	
	return cert;
}