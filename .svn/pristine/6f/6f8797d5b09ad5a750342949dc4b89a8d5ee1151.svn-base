<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>相关证书</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/szcp/css/calendar.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/szcp/js/calendar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/szcp/js/createAjax.js"></script>
</head>
<body>
<%
	String regNo = request.getParameter("REGNO");
	String evalYear = request.getParameter("EVALYEAR");
%>

	<form name="form1"  >
		<input type="hidden" value="<%=regNo%>" name="REGNOHIDDEN" id="REGNOHIDDEN"></input>
		<input type="hidden" value="<%=evalYear%>" name="EVALHIDDEN" id="EVALHIDDEN"></input>
		<table border="1" width="100%" cellpadding="0" cellspacing="0">
			<tr>
		        <td class="yxsm" colspan="2" align="center">
		        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>相关证书</font>
		        </p>
		        </td>
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      			<tr>
		      		<td class="lc1">证件名称</td>
		      		<td class="lc2">
		      			<input type="text" name="CERT_NAME"  id = "CERT_NAME"  size="40" title="证件名称" maxlength=30 ></input>&nbsp;<font color=red>*</font>
		      		</td>
		      		</tr>
		      	</table>
		      	</td>	
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      		<tr>
	      		<td class="lc1">证件号码</td>
	      		<td class="lc2">
	      			<input type="text" name="CERT_NO"   id="CERT_NO" maxlength=30  size="40" title="证件号码" ></input>&nbsp;
	      		</td>
	      		</tr>
	      		</table>
	      		</td>
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      		<tr>
	      		<td class="lc1">发证机构</td>
	      		<td class="lc2">
	      			<input type="text" name="AUTH_ORG_DESC" id = "AUTH_ORG_DESC" size="40" maxlength=30 title="发证机构" ></input>&nbsp;
	      		</td>
	      		</tr>
	      		</table>
	      		</td>
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      		<tr>
	      		<td class="lc1">发证日期</td>
	      		<td class="lc2">
	      			<input type="text" name="ISSUE_DATE"  
	      			id="ISSUE_DATE"
	      			size="40" title="发证日期"  readonly="readonly" onclick="return showCalendar('ISSUE_DATE', 'y/mm/dd');">
	      			</input>&nbsp;
	      		</td>
	      		</tr>
	      		</table>
	      		</td>
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      		<tr>
	      		<td class="lc1">有效期至</td>
	      		<td class="lc2">
	      			<input type="text" name="VALID_TO_DATE" 
	      			id="VALID_TO_DATE"
	      			 size="40" title="有效期至" 
	      			readonly="readonly" onclick="return showCalendar('VALID_TO_DATE', 'y/mm/dd');"
	      			></input>&nbsp;
	      		</td>
	      		</tr>
	      		</table>
	      		</td>
	      	</tr>
	      	
	      
	      	
	      	<tr>
	      		<td colspan="2">
	      			<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      				<tr>
	      					<td align="center"  >
								<input type="button" class="button" value="确定" onclick="addData();"></input>&nbsp;&nbsp;&nbsp;
								<input type="button"  class="button" value="取消" onclick="cancelWin();"></input>
						  	</td>
	      				</tr>
	      			</table>
	      		</td>
  			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
function vaildzjhm(pwd) 
{
	var i,j,strTemp;
	strTemp="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.";
	if ( pwd.length == 0) return 1;
	for (i=0;i<pwd.length;i++) 
	{
		j = strTemp.indexOf(pwd.charAt(i));
		if (j==-1) 
		{
			//说明有字符不合格
			return 0;
		}
	}
	//说明合格
	return 1;
}
	 function addData() {
	 var xmlHttp = createXmlHttpRequest();
	 var REGNOHIDDEN = $("#REGNOHIDDEN").val();
	 var EVALHIDDEN = $("#EVALHIDDEN").val();
	 var CERT_NAME = $("#CERT_NAME").val();
	 var CERT_NO = $("#CERT_NO").val();
	 if(CERT_NO==null || CERT_NO==""){
		 	alert("请输入证件号码");
		 	return;
	}
	 var AUTH_ORG_DESC = $("#AUTH_ORG_DESC").val();
	 var ISSUE_DATE = $("#ISSUE_DATE").val();
	 var VALID_TO_DATE = $("#VALID_TO_DATE").val();
	 var d1 = new Date(ISSUE_DATE.replace(/\-/g, "\/")); 
 	 var d2 = new Date(VALID_TO_DATE.replace(/\-/g, "\/"));  
	 if(ISSUE_DATE!=""&&VALID_TO_DATE!=""&&d1 >=d2){ 
 		 alert("授予日期不能大于有效期！"); 
  		return ; 
 		}
	 
	 xmlHttp.onreadystatechange = function(){
			
			if(xmlHttp.readyState == 4) {
				
				if(xmlHttp.status == 200) {
					var textValue = xmlHttp.responseText;
					if(trim(textValue) == "ok") {
						alert("数据添加成功");
						 window.opener.location.reload();
						 window.close();
					}
					 
					}
				}
			}; 
	xmlHttp.open("POST","szcp_sq_add_xgzs_action.jsp",false);
	//xmlHttp.setRequestHeader("Content-Type", "text/html;charset=GBK" );
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=GBK");
	CERT_NAME = escape(escape(CERT_NAME));
	CERT_NO = escape(escape(CERT_NO));
	AUTH_ORG_DESC = escape(escape(AUTH_ORG_DESC));
	xmlHttp.send("REGNOHIDDEN="+REGNOHIDDEN+"&EVALHIDDEN="+EVALHIDDEN+"&CERT_NO="+CERT_NO+"&AUTH_ORG_DESC="+AUTH_ORG_DESC+"&CERT_NAME="+CERT_NAME+"&ISSUE_DATE="+ISSUE_DATE+"&VALID_TO_DATE="+VALID_TO_DATE);
 }
 
 	function cancelWin() {
 		window.close();
 	}
	function trim(str){ //删除左右两端的空格  
	　　     return str.replace(/(^\s*)|(\s*$)/g, "");  
	}  
</script>
</html>