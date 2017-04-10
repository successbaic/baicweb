<%@ include file="../jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_XGZSDao" %>
<%@page import="com.macrosoft.icms.szcp.SZCP_SQ_XGZS"%>
<%@page import="java.util.List" %>             
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="xgzs" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_XGZS" />	
<jsp:useBean id="lczt" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_LCZT" />
	<jsp:useBean id="createHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>���֤��</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/szcp/js/createAjax.js"></script>
<style>
#printa {
	 background-image: url("../images/ly/next_page.png");
    background-repeat: no-repeat;
    color: #ffffff;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    height: 33px;
    line-height: 35px;
    text-align: center;
    width: 105px;
}
.xgzs a:link {
    color:#ffffff;
    text-decoration:none;
}
.xgzs a:visited {
    color:#ffffff;
    text-decoration:none;
}
.xgzs a:hover {
    color:#ffffff;
    text-decoration:none;
}
.xgzs a:active {
    color:#ffffff;
    text-decoration:none;
}
.jygl,.htgl,.htlx,.jyxy,.shxy,.shry,.jbxx {
	line-height: 30px;
	text-align: center;
	color: #000000;
	font-size: 9pt;
	cursor: pointer;
	width: 81px;
	height: 30px;
	background: transparent url(../images/tab/tabbefore.png) no-repeat;
	/*���ie��֧��background-size*/
	background-size :cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/tab/tabbefore.png',sizingMethod='scale');
	border: 0px solid black;
}

.xgzs {
	width: 81px;
	height: 30px;
	background: transparent url(../images/tab/tabafter.png) no-repeat;
	/*���ie��֧��background-size*/
	background-size :cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../images/tab/tabafter.png',sizingMethod='scale');
	line-height: 30px;
	text-align: center;
	color: #FFFFFF;
	font-size: 9pt;
	cursor: pointer;
    border: 0px solid black;
}
.jbxx a,.jygl a,.htgl a,.htlx a,.jyxy a,.shxy a,.shry a,.xgzs a{ position:relative; display:inline-block;}
.form1{
	margin: 0px;padding: 0px;
}
</style>
</head>
<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">
<%@include file="top_szcp.inc"%>
<%
	String REG_NO = request.getParameter("REG_NO");
	String YEAR = request.getParameter("EVAL_YEAR");
	String CERNO = request.getParameter("CerNO");
	SZCP_SQ_XGZSDao xgzsDao = new SZCP_SQ_XGZSDao();
	List<SZCP_SQ_XGZS> list = xgzsDao.querySZCP_SQ_XGZS(REG_NO,YEAR);
	lczt = xgzsDao.queryLcztStatus(REG_NO,YEAR);
%>
	<%=createHeaderUtil.createHeader(REG_NO,YEAR,CERNO,"8","") %>
	<form class="form1" name="form1" method="POST"  action="szcp_sq_xgzs_action.jsp">
	
	<table border="1" width="100%" cellpadding="0" cellspacing="0">
		<input type="hidden" name="REG_NO" value="<%=REG_NO%>" id="REG_NO"></input>
		<input type="hidden" name="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR"></input>
		<input type="hidden" name="APPR_STAT_FLAG" value="<%=lczt.getAPPR_STAT_FLAG()%>" id="APPR_STAT_FLAG"></input>
		<input type="hidden" name="PRO_STAT_FLAG" value="<%=lczt.getPRO_STAT_FLAG()%>" id="PRO_STAT_FLAG"></input>
		<tr>
	        <td class="yxsm" colspan="7" align="center">
	        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>���֤��</font>
	        </p>
	        </td>
      </tr>
        <tr>
      	<td colspan="7">
      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
      			<tr>
      				<td class="lc1">
      				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				<input type="button" class="button" value="���" onclick="addXGZS();">
      				</td>
      			</tr>
      		</table>
      	</td>
      </tr>
    
    <tr>
    	<td colspan="7">
      		<table border="1" width="100%" cellpadding="0" cellspacing="0" >
      			<tr>
					<td>֤������</td>
					<td>֤�����</td>
					<td>��֤����</td>
					<td>��֤����</td>
					<td>��Ч����</td>
					<td colspan="2" style="text-align: center">����</td>
		      </tr>
		      <c:if test="<%=list.size() == 0 %>">
		      	<tr>
		      		<td colspan="8">�������ݣ����ȵ�����Ͻǰ�ť������ӣ�</td>
		      	</tr>
		      </c:if>
		       <c:if test="<%=list.size() != 0 %>">
		      		<c:forEach items="<%=list%>" var="temp">
				<tr>
					<td>${temp.CERT_NAME}</td>
					<td>${temp.CERT_NO}</td>
					<td>${temp.AUTH_ORG_DESC}</td>
					<td>${temp.ISSUE_DATE}</td>
					<td>${temp.VALID_TO_DATE}</td>
					<td><input type="button" class="button" value="�޸�" onclick="editData('${temp.CERT_NAME}');"></td>
					<td><input type="button" class="button" value="ɾ��" onclick="deleteData('${temp.CERT_NAME}');"></td>
				</tr>
			</c:forEach>
		      </c:if>
    		</table>
      </td>
     </tr> 
	</table>
	<br>
			<CENTER>
			<div style="display:inline;" >
			<a id="printa" onclick="return confirm('ȷ������ļ��������ɣ�')"
				href="print/szcp_sq_xgzs_print.jsp?REG_NO=<%=REG_NO%>&EVAL_YEAR=<%=YEAR %>"
				target="_blank">��ӡ��ҳ</a>
		</div>
					<div class="subImgs"  style="display:inline" onclick="doLastSub()">��һ��</div>
					<c:choose>
						<c:when test='<%="2".equals(lczt.getAPPR_STAT_FLAG()) && "1".equals(lczt.getPRO_STAT_FLAG()) %>'>
								<div class="subImgs"  style="display:inline" onclick="Jdcx()">����</div>
						</c:when>
						<c:when test='<%="6".equals(lczt.getAPPR_STAT_FLAG()) %>'>
								<div class="subImgs"  style="display:inline" onclick="checkError()">����</div>
						</c:when>
						<c:otherwise>
								<div class="subImgs"  style="display:inline" onclick="checkError()">�鿴</div>
						</c:otherwise>
					</c:choose>
			</CENTER>
	</form>
</body>
<script type="text/javascript">
	function Jdcx(){
		document.form1.submit();
	}
	function addXGZS() {
		var regNo = document.getElementById("REG_NO").value;
		var evalYear = document.getElementById("EVAL_YEAR").value;
		var url = '${pageContext.request.contextPath}'+"/szcp/szcp_sq_add_xgzs.jsp?REGNO="+regNo+"&EVALYEAR="+evalYear+"&CerNO=<%=CERNO%>";
	  	window.open(url, 'newwindow', 'height=300, width=800, top=170, left=500, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=n o, status=no'); 
		//window.showModalDialog(url,window,"dialogWidth:800px;dialogHeight:400px;center:1;status:0");
	}
	
	function editData(cerName) {
		var regNo = document.getElementById("REG_NO").value;
		var evalYear = document.getElementById("EVAL_YEAR").value;
		cerName = escape(escape(cerName));
		var url = '${pageContext.request.contextPath}'+"/szcp/szcp_sq_edit_xgzs.jsp?REGNO="+regNo+"&EVALYEAR="+evalYear+"&CERT_NAME="+cerName+"&CerNO=<%=CERNO%>";
	  	window.open(url, 'newwindow', 'height=300, width=800, top=170, left=500, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=n o, status=no'); 
		//window.showModalDialog(url,window,"dialogWidth:800px;dialogHeight:400px;center:1;status:0");
	}
	
	function checkError() {
		document.form1.submit();
	}
	
	function doLastSub() {
		var regNo = $("#REG_NO").val();
		var evalYear = $("#EVAL_YEAR").val();
		window.location.href = "szcp_sq_shry.jsp?REG_NO="+regNo+"&EVAL_YEAR="+evalYear+"&CerNO=<%=CERNO%>";
	}
	
	function deleteData(cername) {
		var regNo = document.getElementById("REG_NO").value;
		var evalYear = document.getElementById("EVAL_YEAR").value;
		cername = escape(escape(cername));
		var flag = window.confirm("��ȷ��Ҫɾ����");
		if(flag) {
			// ִ��ajaxɾ��
			 var xmlHttp = createXmlHttpRequest();
			 xmlHttp.open("POST","szcp_sq_delete_xgzs_action.jsp",true);
			 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=GBK");
			 xmlHttp.send("REG_NO="+regNo+"&EVAL_YEAR="+evalYear+"&CERT_NAME="+cername);
			 xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState == 4) {
						if(xmlHttp.status == 200) {
							var textValue = xmlHttp.responseText;
							if(trim(textValue) == "ok") {
							 alert("����ɾ���ɹ�");
							 window.location.reload();								
							}
							}
						}
					};
		}
	}
	function trim(str){ //ɾ���������˵Ŀո�  
	����     return str.replace(/(^\s*)|(\s*$)/g, "");  
	}  
</script>



</html>