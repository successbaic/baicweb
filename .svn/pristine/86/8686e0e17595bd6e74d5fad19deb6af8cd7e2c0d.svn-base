<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.dbc.DbConnection"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<jsp:useBean id="SZCP_LCZT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_LCZT" />
<%@page import="com.macrosoft.icms.szcp.SZCP_LCZT" %> 
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/> 
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<%
	webuser.validatePage(request.getRequestURI());//检查用户是否有权限访问该页面
	Page.init();
	String loginid = webuser.getLOGINID();
	List<SZCP_LCZT> list = SZCP_LCZT.queryAll(loginid);
%>
<html>
<head>
<title><%=PropertiesConfigUtil.getValue("deployregorg")%>网上服务平台</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/szcp/js/createAjax.js"></script>
<LINK href="css/icms.css" type="text/css" rel="stylesheet">
<style type="text/css">
.DIV_L {
	line-height: 30px;
	text-align: center;
	color: #000000;
	font-size: 9pt;
	cursor: pointer;
	width: 81px;
	height: 30px;
	background: transparent url(images/tab/tabbefore.png) no-repeat;
}

.DIV_L_ON {
	width: 81px;
	height: 30px;
	background: transparent url(images/tab/tabafter.png) no-repeat;
	line-height: 30px;
	text-align: center;
	color: #FFFFFF;
	font-size: 9pt;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function updateinfo(REG_NO,EVAL_YEAR){
		var regNo = REG_NO;
		var evalYear = EVAL_YEAR;
			 var xmlHttp = createXmlHttpRequest();
			 xmlHttp.open("POST","szcp_jdcx_cerno.jsp",true);
			 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=GBK");
			 xmlHttp.send("REG_NO="+regNo+"&EVAL_YEAR="+evalYear);
			 xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState == 4) {
						if(xmlHttp.status == 200) {
								var cernoVal = xmlHttp.responseText;
								var cerno = trim(cernoVal);
									window.location.href = "szcp_sq_jbxx.jsp?REG_NO="+trim(REG_NO)+"&EVAL_YEAR="+trim(EVAL_YEAR)+"&CERNO="+cerno;
							} 
						}
					};
		
	}
	// 查看全部
	function viewAll(REG_NO,EVAL_YEAR) {
		var regNo = REG_NO;
		var evalYear = EVAL_YEAR;
			 var xmlHttp = createXmlHttpRequest();
			 xmlHttp.open("POST","szcp_jdcx_cerno.jsp",true);
			 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=GBK");
			 xmlHttp.send("REG_NO="+regNo+"&EVAL_YEAR="+evalYear);
			 xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState == 4) {
						if(xmlHttp.status == 200) {
								var cernoVal = xmlHttp.responseText;
								var cerno = trim(cernoVal);
									window.location.href = "szcp_sq_jbxx_view.jsp?REG_NO="+trim(REG_NO)+"&EVAL_YEAR="+trim(EVAL_YEAR)+"&CERNO="+cerno;
							} 
						}
					};
	}
	
	function printAll(REG_NO,EVAL_YEAR){
		if (window.navigator.appName == "Microsoft Internet Explorer")
		  {
		       var version = navigator.appVersion;
		       var start = version.indexOf("MSIE");
		       var temp = version.slice(start+5, start+6);
		       if(temp==1){
		    	   //浏览器文档版本10
		    	   var regNo = REG_NO;
		   		var evalYear = EVAL_YEAR;
		   			 var xmlHttp = createXmlHttpRequest();
		   			 xmlHttp.open("POST","szcp_jdcx_cerno.jsp",true);
		   			 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=GBK");
		   			 xmlHttp.send("REG_NO="+regNo+"&EVAL_YEAR="+evalYear);
		   			 xmlHttp.onreadystatechange = function(){
		   					if(xmlHttp.readyState == 4) {
		   						if(xmlHttp.status == 200) {
		   								var cernoVal = xmlHttp.responseText;
		   								var cerno = trim(cernoVal);
		   									window.open ("../szcp/print/szcp_all_printForIE9.jsp?REG_NO="+trim(REG_NO)+"&EVAL_YEAR="+trim(EVAL_YEAR)+"&CERNO="+cerno);
		   							} 
		   						}
		   					};
		       }else if(temp==8){
		    	 //浏览器文档版本8
		    	   var regNo = REG_NO;
			   		var evalYear = EVAL_YEAR;
			   			 var xmlHttp = createXmlHttpRequest();
			   			 xmlHttp.open("POST","szcp_jdcx_cerno.jsp",true);
			   			 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=GBK");
			   			 xmlHttp.send("REG_NO="+regNo+"&EVAL_YEAR="+evalYear);
			   			 xmlHttp.onreadystatechange = function(){
			   					if(xmlHttp.readyState == 4) {
			   						if(xmlHttp.status == 200) {
			   								var cernoVal = xmlHttp.responseText;
			   								var cerno = trim(cernoVal);
			   									window.open ("../szcp/print/szcp_all_printForIE8.jsp?REG_NO="+trim(REG_NO)+"&EVAL_YEAR="+trim(EVAL_YEAR)+"&CERNO="+cerno);
			   							} 
			   						}
			   					};
		       }else if(temp==7||temp==9){
		    	 //浏览器文档版本7
		    	   var regNo = REG_NO;
			   		var evalYear = EVAL_YEAR;
			   			 var xmlHttp = createXmlHttpRequest();
			   			 xmlHttp.open("POST","szcp_jdcx_cerno.jsp",true);
			   			 xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=GBK");
			   			 xmlHttp.send("REG_NO="+regNo+"&EVAL_YEAR="+evalYear);
			   			 xmlHttp.onreadystatechange = function(){
			   					if(xmlHttp.readyState == 4) {
			   						if(xmlHttp.status == 200) {
			   								var cernoVal = xmlHttp.responseText;
			   								var cerno = trim(cernoVal);
			   									window.open ("../szcp/print/szcp_all_print.jsp?REG_NO="+trim(REG_NO)+"&EVAL_YEAR="+trim(EVAL_YEAR)+"&CERNO="+cerno);
			   							} 
			   						}
			   					};
		       }
		 }else{
			 alert("请使用IE浏览器打印！！")
		 }
	}
	
	function trim(str){ //删除左右两端的空格  
　　     return str.replace(/(^\s*)|(\s*$)/g, "");  
	 }  
	
</script>
</head>
<body style="margin: 0px" >
	
	<%@include file="top_szcp.inc"%>

	<table width="100%" cellspacing="0" cellpadding="0"
		style="background-image:url(images/main/currpostitleBG.jpg);background-repeat:repeat-x;height:27px;">
		<tr>
			<td width="60%">&nbsp;&nbsp;<img
				src="../images/main/nowlocation.png" /> &nbsp;&nbsp;<font
				color="#1E90FF">当 前 位 置 : </font><font style="color:#AA0219;">
					已 办 业 务 查 询</font>
			</td>
			<td width="30%" align="right"><img src="../images/main/nowuser.png" />&nbsp;&nbsp;<font
				color="#1E90FF">当前用户 : <%=webuser.getUSERNAME()%></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="10%"></td>
		</tr>
	</table>
	<br />
	<br />
	<table width="99%" border="1" >
		<tr class="yxsm">
			<td align='center' nowrap>注册号</td>
			<td align='center' nowrap>企业名称</td>
			<td align='center' nowrap>企业住所</td>
			<td align='center' nowrap>管辖机关</td>
			<td align='center' nowrap>业务状态</td>
			<td align='center'>操作</td>
		</tr>
		<tr>
	      	 <c:if test="<%=list.size() != 0 %>">
		      		<c:forEach items="<%=list%>" var="temp">
				<tr>
					<td>${temp.REG_NO}</td>
					<td>${temp.ENT_NAME}</td>
					<td>${temp.ADDR_DESC}</td>
					<td>${temp.localOrgName}</td>
					<td>
						<c:choose>
							<c:when test="${temp.APPR_STAT_FLAG == 1}">
								待初审
							</c:when>
							<c:when test="${temp.APPR_STAT_FLAG == 2}">
								初审通过
							</c:when>
							<c:when test="${temp.APPR_STAT_FLAG == 3}">
								无申报资格
							</c:when>
							<c:when test="${temp.APPR_STAT_FLAG == 4}">
								待审核
							</c:when>
							<c:when test="${temp.APPR_STAT_FLAG == 5}">
								已审核
							</c:when><c:when test="${temp.APPR_STAT_FLAG == 6}">
								信息有误
							</c:when><c:when test="${temp.APPR_STAT_FLAG == 7}">
								推荐退回
							</c:when><c:when test="${temp.APPR_STAT_FLAG == 8}">
								计算退回
							</c:when>
						</c:choose>
					</td>
					<c:if test ="${temp.APPR_STAT_FLAG == '6'}" >
					<td align="center">&nbsp;<input type="button" class="button" value="修改" onclick="updateinfo('${temp.REG_NO}','${temp.EVAL_YEAR}')">&nbsp;</td>
					</c:if>
					<c:if test ="${temp.APPR_STAT_FLAG == '2'}" >
					<td align="center">&nbsp;<input type="button" class="button" value="报送" onclick="updateinfo('${temp.REG_NO}','${temp.EVAL_YEAR}')">&nbsp;</td>
					</c:if>
					<c:if test ="${temp.APPR_STAT_FLAG == '4'}" >
					<td align="center">&nbsp;
					    <input type="button" class="button" value="打印全部" onclick="printAll('${temp.REG_NO}','${temp.EVAL_YEAR}')">&nbsp;&nbsp;
					    <input type="button" class="button" value="查看" onclick="viewAll('${temp.REG_NO}','${temp.EVAL_YEAR}')">&nbsp;
					</td>
					</c:if>
					<c:if test ="${temp.APPR_STAT_FLAG == '5'}" >
					<td align="center">&nbsp;
					    <input type="button" class="button" value="打印全部" onclick="printAll('${temp.REG_NO}','${temp.EVAL_YEAR}')">&nbsp;&nbsp;
					    <input type="button" class="button" value="查看" onclick="viewAll('${temp.REG_NO}','${temp.EVAL_YEAR}')">&nbsp;
					</td>
					</c:if>
					 <c:if test ="${temp.APPR_STAT_FLAG != '4'  && temp.APPR_STAT_FLAG != '6' && temp.APPR_STAT_FLAG != '2' && temp.APPR_STAT_FLAG != '5'}" >
					<td align="center">&nbsp;<input type="button" class="button" value="修改" onclick="updateinfo('${temp.REG_NO}','${temp.EVAL_YEAR}')" disabled=true>&nbsp;</td>
					</c:if> 
				</tr>
			</c:forEach>
		      </c:if>
		  </tr>
	</table>
	<%@include file="../bottom.inc"%>
</body>
</html>