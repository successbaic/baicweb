<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" 	 class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="SZCP_YSB" scope="page"  class="com.macrosoft.icms.szcp.SZCP_YSB"/>
<jsp:useBean id="SZCP_LCZT" scope="page" class="com.macrosoft.icms.szcp.SZCP_LCZT" />
<%@page import="java.util.Calendar" %>
<%
String REG_NO = request.getParameter("REG_NO");
String CERNO = request.getParameter("CERNO");
String YEAR = request.getParameter("EVAL_YEAR");
SZCP_LCZT = SZCP_LCZT.querySZCP_LCZT(REG_NO);
String PRO_STAT_FALG = SZCP_LCZT.getPRO_STAT_FLAG();
String APPR_STAT = SZCP_LCZT.getAPPR_STAT_FLAG();
Calendar cal = Calendar.getInstance();
String year = String.valueOf(cal.get(Calendar.YEAR));
SZCP_YSB.doSelectBySql("SELECT * FROM SZCP_YSB WHERE  (REG_NO= '"+REG_NO+"' OR UNISCID = '"+REG_NO+"' )");
String entName = SZCP_YSB.getENT_NAME();
%>
<html>
<head>
<title>提交成功</title>
<script type="text/javascript">
	var REG_NO = '<%=REG_NO%>';
	var CERNO = '<%=CERNO%>';
	var year = '<%=year%>';
	var APPR_STAT = '<%=APPR_STAT%>';
	var PRO_STAT = '<%=PRO_STAT_FALG%>';
	function doSub(){
		if(APPR_STAT == 1){
			alert("等待工商局审核");
			return ;
		}else if(APPR_STAT == 2) {
			window.location.href= "szcp/szcp_sq_jbxx.jsp?REG_NO="+REG_NO+"&CerNO="+CERNO+"&EVAL_YEAR="+year;
		}  
		else if(APPR_STAT == 3) {
			alert("您的企业无申报资格");
			return;
		}else if(APPR_STAT == 4){
			alert("材料已报送，等待工商局审核");
		}else if(APPR_STAT == 6) {
			window.location.href= "szcp/szcp_sq_jbxx.jsp?REG_NO="+REG_NO+"&CerNO="+CERNO+"&EVAL_YEAR="+year;
		}else if(PRO_STAT == 8) {
			alert("您的企业已公示，请勿填报资料");
		}else if(PRO_STAT == 9) {
			alert("您的企业为公示撤销状态，请勿填报资料");
		}else if(PRO_STAT == 3) {
			alert("您的企业审核已经通过，请勿填报资料");
		}else if(PRO_STAT == 10) {
			alert("您的企业为公示撤回状态，请勿填报资料");
		}else if(PRO_STAT == 4) {
			alert("您的企业已经推荐，请勿填报资料");
		}
	  } 
</script>
</head>
<BODY style="margin: 0px" >&nbsp; 
<%@include file="/szcp/top_szcp.inc"%>

<table border='1' width='100%' align='center'>
<tr>
<td class=lc2 valign='top'>
<font style='font-size:11pt;color:red;font-weight: bold'>
&nbsp;&nbsp;系统提示：
</font>
<br/>
&nbsp;&nbsp;"<font color="red"><%=entName%></font>"，您的守合同重信用企业申请提交成功！
<br>
&nbsp;&nbsp;&nbsp;等待工商局审核，您可通过工商局网上服务平台<font color="#6495ED">办理进度查询</font>模块查看申请进度。
<br></td></tr></table>

<FORM NAME="form1" METHOD="POST" ACTION="web/szhtinfo_select_action.jsp" target="editframe">
    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      
   </table>
  <br/>
  	 <CENTER>
		  <div class="subImgs"  style="display:inline" onclick="window.location.href='index.jsp'">返回</div>
		  <div class="subImgs"  style="display:inline" onclick="doSub()">材料报送</div>
	</CENTER>	
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
<%@include file="bottom.inc"%>
</body>
</html>