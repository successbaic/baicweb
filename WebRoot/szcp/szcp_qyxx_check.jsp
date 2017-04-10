<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="SZCP_YSB" scope="page"  class="com.macrosoft.icms.szcp.SZCP_YSB"/>
<jsp:useBean id="SZCP_LCZT" scope="page" class="com.macrosoft.icms.szcp.SZCP_LCZT" />
<%@page import="com.macrosoft.icms.szcp.SZCP_LCZT" %>  
<%@page import="com.macrosoft.icms.szcp.SZCP_YSB" %>  

<%@  page import="java.util.Calendar" %>
<%
	String REGNO=SysUtility.doPreProcess(request.getParameter("REG_NO")).trim();
	String CERNO=SysUtility.doPreProcess(request.getParameter("CERNO")).trim();
	String XZQH=SysUtility.doPreProcess(request.getParameter("XZQH")).trim();
	String LOGINID=SysUtility.doPreProcess(request.getParameter("LOGINID")).trim();
	List<SZCP_YSB> list = SZCP_YSB.queryinfo(REGNO,CERNO);
%>
<html>
<head>
<title>检查企业信息</title>
<script type="text/javascript">
	function doSub(){
		form.submit();
	  } 
</script>
</head>
<BODY style="margin: 0px" >&nbsp; 
<%@include file="top_szcp.inc"%>
<form action="select_action.jsp" method="post" name="form">
<table border='1' width='100%' align='center'>
<tr>
<td class=lc2 valign='top'>
<%-- 	<input type="hidden" value="<%=regNo%>" name="REGNOHIDDEN" id="REGNOHIDDEN"></input>
		<input type="hidden" value="<%=evalYear%>" name="EVALHIDDEN" id="EVALHIDDEN"></input> --%>
		<input type="hidden" value="<%=REGNO%>" name="REGNO" />
		<input type="hidden" value="<%=CERNO%>" name="CERNO" />
		<input type="hidden" value="<%=XZQH%>" name="XZQH" />
		<input type="hidden" value="<%=LOGINID%>" name="LOGINID" />

		<table border="1" width="100%" cellpadding="0" cellspacing="0">
	      	<tr>
	      		<td class="lc1">注册号</td>
	      		<td class="lc1">统一社会信用代码</td>	      		
	      		<td class="lc1">企业名称</td>
	      		<td class="lc1">企业住所</td>
	      		<td class="lc1">管辖机关</td>
	      	</tr>
	      	  <c:if test="<%=list.size() == 0 %>">
	      	  </c:if>
	      	<tr>
	      	 <c:if test="<%=list.size()> 0 %>">
		      		<c:forEach items="<%=list%>" var="temp">
				<tr align="center">
					<td style="font-size: 12px;">${temp.REG_NO}</td>
					<td style="font-size: 12px;">${temp.UNISCID}</td>					
					<td style="font-size: 12px;">${temp.ENT_NAME}</td>
					<td style="font-size: 12px;">${temp.ADDR_DESC}</td>
					<td style="font-size: 12px;">${temp.localorgname}</td>
				</tr>
			</c:forEach>
		      </c:if>
		  </tr>
		</table>
		<br/>
  	 <CENTER>
		  <div class="subImgs"  style="display:inline" onclick="window.location.href='../szht_select.jsp'">返回</div>
		  <div class="subImgs"  style="display:inline" onclick="doSub()">确认申请</div>
	</CENTER>	
	</form>
<%@include file="../bottom.inc"%>
</body>
</html>