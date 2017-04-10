<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>

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
 function login(){
    var name = document.form1.name.value;
    var cerno = document.form1.cerno.value;
    if(name==null||name==''){
       alert("用户名不能为空！");
       return;
    }
    else if(cerno==null||cerno==''){
       alert("证件号码不能为空！");
       return;
    }
    form1.submit();
} 

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
                    var name = document.form1.name.value;
                    var cerno = document.form1.cerno.value;
                    if(name==null||name==''){
				    	alert("用户名不能为空！");
				        document.form1.name.focus();
				        return;
				    }
                    if(cerno==null||cerno==''){
				    	alert("证件号码不能为空！");
				        document.form1.cerno.focus();
				        return;
				    }
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
<%
	String openo=request.getParameter("OPENO");
	String fileid=request.getParameter("FILEID"); 
%>

<form name="form1" METHOD="POST" ACTION="web/wsdj_fjxx_sign.jsp?openo=<%=openo%>&fileid=<%=fileid %>" target="editframe">

<table align="center" width="100%" cellpadding="0" cellspacing="0" id="stockmanID">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
EID签名</td>
</tr>
</table>
<br>
<div id='div1' name='div1' style="display: inline-block;margin-left: 30px; width: 350px; height: 50px; text-align: center;"></div>
<br>
    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      <tr>
	    <td class="lc1" align="center" width="28%">
		    用户名：
	    </td>
	    <td class="lc2">
		  <input type="text" name="name" id="name" size="30"/>	    
	    </td>
     </tr>
     <tr>
	    <td class="lc1">
		   证件号码：
	    </td>
	    <td class="lc2">
		   <input type="text" name="cerno" id="cerno" size="30"/>
	    </td>
     </tr>
     <tr>
     	<td colspan="2" style="text-align: center;"><button name="btn1" id="btn1">签名</button></td>
     </tr>
   </table>
   <div style="display:none">
   <input type="hidden" name="result" id ="result"></input>
	<input type="hidden" name="issuer" id ="issuer"></input>
	<input type="hidden" name="certSn" id ="certSn"></input>
	<input type="hidden" name="issuerSn" id ="issuerSn"></input>
	<input type="hidden" name="toSignData" id ="toSignData"></input>
	<input type="hidden" name="subject" id ="subject"></input></div>
   <iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
</body>
</html>