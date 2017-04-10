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
<OBJECT id=blicAtvNew classid=CLSID:0DC9CA0C-ED42-4C87-A335-1B0BD043FC71></OBJECT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type='text/javascript' src='<%=request.getContextPath()%>/eid/CCB.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/eid/BECCB.js'></script>
<script language="javascript" src="<%=request.getContextPath()%>/eid/base64.js"></script>
<title>营业执照签名</title>


<script language="javascript">
 
function testdatasign()
{
    var plainText = '<%=filedes%>';  //原文
	var data = "";
	var ifud="";   //若是ocxType时银行U盾时，该项的值为dn项，其他为空
	var mylx="";  //密钥类型
	var zslx="";   //证书类型
	var hashsf="";  //hash算法
	var ztxlh="";    //载体序列号
	var sign = "";  //base64编码的签名值
	var com = "";  //base64编码的执照信息或者证书信息
	com = blicAtvNew;
	var keySn = getNumSn(com,1,'');
	if (keySn == null || keySn == '') {
			alert("获取的设备序列号为空！")
			ret = -1;
			return ret;
	}
	var b = new Base64();
    plainText = b.encode(plainText);
	data = SignData(com,'','',plainText,'','33772','div1',keySn,1); //第六个参数为hashType [IN]:hash算法，该取33772还是32772
	ifud=data[0];
	mylx=data[1];
	zslx=data[2];
	hashsf=data[3];
	ztxlh==data[4];
	sign = data[5];
	cert = data[6];
	document.form1.ifud.value=ifud;
	document.form1.mylx.value=mylx;
    document.form1.zslx.value=zslx;
    document.form1.hashsf.value=hashsf;
    document.form1.ztxlh.value=ztxlh;
    document.form1.sign.value=sign;
    document.form1.cert.value=cert;
    document.form1.plainText.value=plainText;
	form1.submit();
}
</script>
</head>

<body>
<form name="form1" method="post" action="tjwj_yyzzsign_action.jsp" target="editframe">
<div id="dsklogindiv" style="border:solid 1px  #BED8EB; text-align: center;">
<div id='div1' name='div1' style="border:1px; width: 0px; height: 0px; text-align: center;"></div><br>
    <font size="5" face="arial" color="red">电子营业执照签名</font>
	<table width="100" border=0 align=center cellpadding=2 cellspacing=1 bordercolor="#799AE1" class="list">
	<tr><td><Input type="Button" name="infoLoad1" id="infoLoad1" value="数据签名" onClick="testdatasign();" />&nbsp;&nbsp;&nbsp;</td>
	<td><Input type="Button" name="infoLoad1" id="infoLoad1" value="关闭" onClick="window.close();" /></td></tr>
	</table>
</div>
<div id="A"></div>
<div id="ukeyCT"></div>
<div id="signCT"></div>
<div style="display:none">
    <input type="hidden" name="ifud" id ="ifud"></input>
	<input type="hidden" name="mylx" id ="mylx"></input>
	<input type="hidden" name="zslx" id ="zslx"></input>
	<input type="hidden" name="hashsf" id ="hashsf"></input>
	<input type="hidden" name="ztxlh" id ="ztxlh"></input>
	<input type="hidden" name="sign" id ="sign"></input>
	<input type="hidden" name="cert" id ="cert"></input>
	<input type="hidden" name=plainText id ="plainText"></input>
    <input type="hidden" name="openo" value='<%=openo%>'/>
    <input type="hidden" name="fileid" value='<%=fileid%>'/>    	
    <input type="hidden" name="name" value='<%=name%>'/>    	
    <input type="hidden" name="idnum" value='<%=idnum%>'/>    	
</div>
    <iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
</body>
</html>
