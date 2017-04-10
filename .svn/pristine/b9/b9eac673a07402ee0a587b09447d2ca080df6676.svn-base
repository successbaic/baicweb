<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
 <%@ page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_SHRYDao"%>   
<jsp:useBean id="shry" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_SHRY" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>社会荣誉</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/szcp/css/calendar.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/szcp/js/calendar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/szcp/js/createAjax.js"></script>
</head>
<body>
<%
	String regNo = request.getParameter("REGNO");
	String evalYear = request.getParameter("EVALYEAR");
	String cerName = request.getParameter("CERT_NAME");
	SZCP_SQ_SHRYDao shryDao = new SZCP_SQ_SHRYDao();
	shry = shryDao.querySZCP_SQ_SHRY(regNo,evalYear,cerName);
%>

	<form name="form1"  >
		<input type="hidden" value="<%=regNo%>" name="REGNOHIDDEN" id="REGNOHIDDEN"></input>
		<input type="hidden" value="<%=evalYear%>" name="EVALHIDDEN" id="EVALHIDDEN"></input>
		<table border="1" width="100%" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
			<tr>
		        <td class="yxsm" colspan="2" align="center">
		        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>社会荣誉</font>
		        </p>
		        </td>
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      			<tr>
	      					<td class="lc1">荣誉级别</td>
				      		<td class="lc2">
				      			<input type="radio" name="HONOR_LEVEL_TYPE"   value="1"  <%="1".equals(shry.getHONOR_LEVEL_TYPE())? "checked='checked'":"" %>>国务院颁发</input>
							    <input type="radio" name="HONOR_LEVEL_TYPE"   value="2" <%="2".equals(shry.getHONOR_LEVEL_TYPE())? "checked='checked'":"" %>>国家部委或省政府颁发</input>
							    <input type="radio" name="HONOR_LEVEL_TYPE"   value="3"  <%="3".equals(shry.getHONOR_LEVEL_TYPE())? "checked='checked'":"" %>>省级部门或地市政府颁发</input>
							    <input type="radio" name="HONOR_LEVEL_TYPE"   value="4"  <%="4".equals(shry.getHONOR_LEVEL_TYPE())? "checked='checked'":"" %>>国家或省级行业协会颁发</input>
				      		</td>
	      			</tr>
	      		</table>
	      		</td>	
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      			<tr>
		      		<td class="lc1">荣誉名称</td>
		      		<td class="lc2">
		      			<input type="text" name="CERT_NAME"  readonly="readonly" style="background-color:silver;;"
		      			id = "CERT_NAME"  size="40" title="荣誉名称"  value="<%=shry.getCERT_NAME()%>"  
		      			></input>&nbsp;<font color=red>*</font>
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
	      			<input type="text" name="CERT_NO"   id="CERT_NO" maxlength=20 size="40" title="证件号"   value="<%=shry.getCERT_NO()%>"></input>&nbsp;<font color=red>*</font>
	      		</td>
	      		</tr>
	      		</table>
	      		</td>
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      		<tr>
	      		<td class="lc1">授予单位</td>
	      		<td class="lc2">
	      			<input type="text" name="AUTH_ORG_DESC" maxlength=20 id = "AUTH_ORG_DESC" size="40" title="授予单位"  value="<%=shry.getAUTH_ORG_DESC()%>"></input>&nbsp;
	      		</td>
	      		</tr>
	      		</table>
	      		</td>
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      		<tr>
	      		<td class="lc1">授予日期</td>
	      		<td class="lc2">
	      			<input type="text" name="ISSUE_DATE"  
	      			id="ISSUE_DATE"   value="<%=shry.getISSUE_DATE()%>"
	      			size="40" title="授予日期"  readonly="readonly" onclick="return showCalendar('ISSUE_DATE', 'y/mm/dd');">
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
	      			<input type="text" name="VALID_TO_DATE"  value="<%=shry.getVALID_TO_DATE()%>"
	      			id="VALID_TO_DATE"
	      			 size="40" title="有效期至" 
	      			readonly="readonly" onclick="return showCalendar('VALID_TO_DATE', 'y/mm/dd');"
	      			></input>&nbsp;<font color=red>*</font>
	      		</td>
	      		</tr>
	      		</table>
	      		</td>
	      	</tr>
	      	
	      	<tr>
	      		<td colspan="2">
	      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      		<tr>
	      		<td class="lc1">说明</td>
	      		<td class="lc2">
	      			<textarea rows="6" maxlength=1000 id="HONORDESC" onpropertychange="if(value.length>1000) value=value.substr(0,1000)"   name="HONORDESC" title="说明" cols="120"><%=shry.getHONORDESC()%></textarea>
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
								<input type="button" class="button" value="修改" onclick="editSHRYData();"></input>&nbsp;&nbsp;&nbsp;
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
 function editSHRYData() {
	 var xmlHttp = createXmlHttpRequest();
	 var CERT_NO = $("#CERT_NO").val();
	 if(CERT_NO==null || CERT_NO==""){
	 	alert("请输入证件号码");
	 	return;
	 }
	 var AUTH_ORG_DESC = $("#AUTH_ORG_DESC").val();
	 var CERT_NAME = $("#CERT_NAME").val();
	 var ISSUE_DATE = $("#ISSUE_DATE").val();
	 var VALID_TO_DATE = $("#VALID_TO_DATE").val();
	 var d1 = new Date(ISSUE_DATE.replace(/\-/g, "\/")); 
 	 var d2 = new Date(VALID_TO_DATE.replace(/\-/g, "\/"));  
	 if(ISSUE_DATE!=""&&VALID_TO_DATE!=""&&d1 >=d2){ 
 		 alert("发证时间不能大于有效期！"); 
  		return ; 
 		}
	 var VALID_TO_DATE = $("#VALID_TO_DATE").val();
	 var HONORDESC = $("#HONORDESC").val();
	 var REGNOHIDDEN = $("#REGNOHIDDEN").val();
	 var EVALHIDDEN = $("#EVALHIDDEN").val();
	 var HONOR_LEVEL_TYPE = $('input[name="HONOR_LEVEL_TYPE"]:checked').val();
	  if(HONOR_LEVEL_TYPE == null || HONOR_LEVEL_TYPE == ""){
	 	alert("请选择荣誉级别");
	 	return;
	 }
	 xmlHttp.onreadystatechange = function(){
			
			if(xmlHttp.readyState == 4) {
				
				if(xmlHttp.status == 200) {
						var textValue = xmlHttp.responseText;
						if(trim(textValue) == "ok") {
							 alert("数据修改成功");
							 window.opener.location.reload();
							 window.close();
						}
					}
				}
			}; 
	xmlHttp.open("POST","szcp_sq_edit_shry_action.jsp",true);
	//xmlHttp.setRequestHeader("Content-Type", "text/html;charset=GBK" );
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=GBK");
	CERT_NAME = escape(escape(CERT_NAME));
	CERT_NO = escape(escape(CERT_NO));
	AUTH_ORG_DESC = escape(escape(AUTH_ORG_DESC));
	HONORDESC = escape(escape(HONORDESC));
	xmlHttp.send("HONOR_LEVEL_TYPE="+HONOR_LEVEL_TYPE+"&REGNOHIDDEN="+REGNOHIDDEN+"&EVALHIDDEN="+EVALHIDDEN+"&CERT_NO="+CERT_NO+"&AUTH_ORG_DESC="+AUTH_ORG_DESC+"&CERT_NAME="+CERT_NAME+"&ISSUE_DATE="+ISSUE_DATE+"&VALID_TO_DATE="+VALID_TO_DATE+"&HONORDESC="+HONORDESC);
 }
 
 	function cancelWin() {
 		window.close();
 	}
 	function trim(str){ //删除左右两端的空格  
	　　     return str.replace(/(^\s*)|(\s*$)/g, "");  
	}  
</script>
</html>