<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.qydj.Eid"%>
<%@ page import="java.io.StringReader"%>   
<%@ page import="javax.xml.parsers.DocumentBuilder"%>  
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>   
<%@ page import="org.w3c.dom.Document"%>   
<%@ page import="org.w3c.dom.Element"%>   
<%@ page import="org.w3c.dom.Node"%> 
<%@ page import="org.w3c.dom.NodeList"%>   
<%@ page import="org.xml.sax.InputSource"%>  
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.io.IOException"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="UPLOAD_FILE_ELEC" scope="page"  class="com.macrosoft.icms.util.UPLOAD_FILE_ELEC"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
	<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>文件签名页面</title>
</head>
<%
//登录用户名称
String name=new String(WEB_USER.doPreProcess(request.getParameter("NAME")).getBytes("ISO8859_1"),"GBK");
String idnum=WEB_USER.doPreProcess(request.getParameter("CERNO"));
String openo=WEB_USER.doPreProcess(request.getParameter("OPENO"));
String fileid=WEB_USER.doPreProcess(request.getParameter("FILEID"));
String fpath=WEB_USER.doPreProcess(request.getParameter("FPATH"));
if("".equals(fileid)||fileid==null){
	out.print(SysUtility.setAlertGo("签名文件不存在!","wsdj_fjxx_list.jsp?OPENO="+openo));
	return;
}
String path = fpath+"/"+fileid; //设置下载的路径
String filedata="";
File file = new File(path);	
boolean exist=file.exists(); 	
if(exist)
{
FileInputStream fi = new FileInputStream(file);
long fileSize = file.length();  
byte[] buffer = new byte[(int) fileSize];
int offset = 0;
int numRead = 0;
fi.read(buffer);
fi.close();
// 对字节数组Base64编码
BASE64Encoder base64 = new BASE64Encoder();
filedata = base64.encode(buffer);
}
%>
<script type="text/javascript">
//签名原文(base64编码)
var filedata = '<%=filedata%>';
//读卡器
var reader="";
var serial="";
//杂凑数据
var hashdata="";
//签名值
var eid_sign="";
//颁发者 
var eid_issuer="";
//颁发者序列号
var eid_issuersn="";
//证书序列号
var eid_certSn="";
window.onload = function() {
	//检测设备拔插----------------------
     eID.detectDeviceBegin(detectDeviceCallback);
     function detectDeviceCallback(rv, readerSerialList) {
          //调用成功
          if (rv == 0) {                  
            for (var i = 0; i < readerSerialList.length; i++) {
              reader = readerSerialList[i][0];
              serial = readerSerialList[i][1];
             }
           }else {
             alert('detectDeviceBegin调用失败，返回码为 ' + rv + ':' + eID.getMessage(rv));
           }
        }
     //终止检测设备拔插---------------------
     eID.detectDeviceEnd(detectDeviceEndCallback);
     function detectDeviceEndCallback(rv) {
         //调用成功
         if (rv == 0) {
            // alert('endDetectDevice调用成功');
         }
         //调用失败
         else {
             alert('endDetectDevice调用失败，返回码为 ' + rv + ':' + eID.getMessage(rv));
         }
     }
     //杂凑数据-----------------------
     eID.hash(hashCallback, reader,filedata, 1, 3);     //filedata  是下载文件的的base64
     function hashCallback(rv, result, idCarrier, alg) {
         //调用成功
         if (rv == 0) {
        	 hashdata=result;
            // alert('hash调用成功，result为' + result + '，idCarrier为' + idCarrier + '，alg为' + alg);
         }
         //调用失败
         else {
             alert('hash调用失败，返回码为 ' + rv + ':' + eID.getMessage(rv));
         }
     }

   //校验PIN码 
     eID.verifyPin(verifyPinCallback, reader,0, '111111'); //type为0时pin随便写，会弹出输入pin的弹出框
     function verifyPinCallback(rv) { 
     //调用成功 
     if (rv == 0) { 
     //alert('verifyPinCallback调用成功'); 
     } 
     //调用失败 
     else { 
     alert('verifyPinCallback失败，返回码为 ' + rv + ':' + eID.getMessage(rv)); 
     } 
   } 

      
    //签名数据---------------------------------
    eID.signNoInputPin(signCallback, reader, hashdata, 1);//hashdata为base64位原文hash后的串,1为RSA1024算法
    function signCallback(rv, result, idCarrier, issuer, subject, certSn, issuerSn, certbase64, alg) {
        //调用成功
        if (rv == 0) {
        	//获取签名结果
        	eid_sign= result;
        	eid_issuer=issuer;
        	eid_issuerSn=issuerSn;
        	eid_certSn=certSn;
            //alert('signNoInputPin调用成功，result为' + result + '，idCarrier为' + idCarrier + '，issuer为' + issuer + '，subject为' + subject + '，certSn为' + certSn + '，issuerSn为' + issuerSn + '，certbase64为' + certbase64 + '，alg为' + alg);
        	document.form1.result.value=result;
			document.form1.issuer.value=issuer;
			document.form1.certSn.value=certSn;
			document.form1.issuerSn.value=issuerSn;
			document.form1.filedata.value=filedata;
			document.form1.hashdata.value=hashdata;
			form1.submit();
        }
        //调用失败
        else {
            alert('signNoInputPin失败，返回码为 ' + rv + ':' + eID.getMessage(rv));
        }
    }
}   
</script>
</head>
<body>
<form name="form1" METHOD="POST" ACTION="tjwj_sign_action.jsp" target="editframe">
<div style="display:none">
   <input type="hidden" name="result" id ="result"></input>
	<input type="hidden" name="issuer" id ="issuer"></input>
	<input type="hidden" name="certSn" id ="certSn"></input>
	<input type="hidden" name="issuerSn" id ="issuerSn"></input>
	<input type="hidden" name="filedata" id ="filedata"></input>
	<input type="hidden" name="hashdata" id ="hashdata"></input>	
    <input type="hidden" name="openo" value='<%=openo%>'/>
    <input type="hidden" name="fileid" value='<%=fileid%>'/>    	
    <input type="hidden" name="name" value='<%=name%>'/>    	
    <input type="hidden" name="idnum" value='<%=idnum%>'/>    	  
</div>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</body>
</html>