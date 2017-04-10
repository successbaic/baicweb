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
<%
	//登录用户名称
	String name=new String(WEB_USER.doPreProcess(request.getParameter("NAME")).getBytes("ISO8859_1"),"GBK");
	String idnum=WEB_USER.doPreProcess(request.getParameter("CERNO"));
	String openo=WEB_USER.doPreProcess(request.getParameter("OPENO"));
	String fileid=WEB_USER.doPreProcess(request.getParameter("FILEID"));
	String filedes=WEB_USER.doPreProcess(request.getParameter("FILEDES"));
	String fpath=WEB_USER.doPreProcess(request.getParameter("FPATH"));
%>
<html>
<head>
<title>EID签名</title>
	<script language="javascript" src="<%=request.getContextPath()%>/eid/eIDPluginHelper2.0.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/eid/base64.js"></script>
	<script language="javascript" src='<%=request.getContextPath()%>/eid/jquery-1.8.2.js'></script>
	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.js'></script>
   	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/eIDUI-common.js'></script>
    <link   rel="stylesheet" href="<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.css">
<script type="text/javascript">
window.onload = function() {
	//eid
     eID.setDeviceDiv({
                id: "div1",
                callback: function(evt) {
                    if (evt.rv != 0) {
                        alert(evt.msg);
                    }
                },
                onDevChange: function(evt) {
                    //alert(evt.count);
                }
            });    
            
             function getDataToSign() {
                var myTime = new Date();
                var yyyy = myTime.getFullYear();
                var MM = myTime.getMonth() + 1;
                var dd = myTime.getDate();
                var HH = myTime.getHours();
                var mm = myTime.getMinutes();
                var ss = myTime.getSeconds();
                var myTimeStr = "" + yyyy + (MM > 9 ? MM : "0" + MM)
			+ (dd > 9 ? dd : "0" + dd) + (HH > 9 ? HH : "0" + HH)
			+ (mm > 9 ? mm : "0" + mm) + (ss > 9 ? ss : "0" + ss);
                // as in doc, data_to_sign must be with such format as follow:
                var dataToSign = myTimeStr + ":" + myTimeStr + ":data";
                var b = new Base64();
                var dataToSignBase64 = b.encode(dataToSign);
               // alert(dataToSignBase64);
                return dataToSignBase64;
            }
             var toSignData="";
            eID.setSignButton({
                id: 'btn1',
                src: function() {
                    toSignData = getDataToSign();
                    return toSignData;
                },
                alg: 0,
                callback: function(evt) {                   
                    if (evt.rv != 0) {
                        alert('sign失败，返回码为 ' + evt.rv + ':' + evt.msg);
                    }
                    else {
				    document.form1.result.value=evt.data.signResult;
				    document.form1.issuer.value=evt.data.issuer;
				    document.form1.certSn.value=evt.data.certSn;
				    document.form1.issuerSn.value=evt.data.issuerSn;
				    document.form1.subject.value=evt.data.subject;
				    document.form1.toSignData.value=toSignData;
					form1.submit();
					}
                }
            }); 
}
</script>
</head>
<body>
<form name="form1" METHOD="POST" ACTION="tjwj_sign_action.jsp" target="editframe">

<table align="center" width="100%"  cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: center;">
EID签名</td>
</tr>
</table>
<br>
<div id="dsklogindiv" style="margin-top: 16px; margin-left: 10px; height: 200px;border:solid 1px  #BED8EB; 
        text-align: center; vertical-align: middle; box-sizing: border-box; padding-top: 26px;">
<div id='div1' name='div1' style="display: inline-block;border:5px; width: 200px; height: 50px; text-align: center;"></div>
<br>
    <table id="mc"  width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr style="text-align: center;"> 
     	<td><button colspan="2" style="height: 30px;width:60px;" name="btn1" id="btn1">签名</button>&nbsp;&nbsp;
     	<button style="height: 30px;width:60px;" name="btn2" id="btn2" onclick="window.close();">关闭</button></td>
     </tr>
   </table>
   </div>
   <div style="display:none">
   <input type="hidden" name="result" id ="result"></input>
	<input type="hidden" name="issuer" id ="issuer"></input>
	<input type="hidden" name="certSn" id ="certSn"></input>
	<input type="hidden" name="issuerSn" id ="issuerSn"></input>
	<input type="hidden" name="toSignData" id ="toSignData"></input>
	<input type="hidden" name="subject" id ="subject"></input></div>
    <input type="hidden" name="openo" value='<%=openo%>'/>
    <input type="hidden" name="fileid" value='<%=fileid%>'/>    	
    <input type="hidden" name="name" value='<%=name%>'/>    	
    <input type="hidden" name="idnum" value='<%=idnum%>'/>    	
    </div>
   <iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
</body>
</html>