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
<title>�ύ�ɹ�</title>
<script type="text/javascript">
	var REG_NO = '<%=REG_NO%>';
	var CERNO = '<%=CERNO%>';
	var year = '<%=year%>';
	var APPR_STAT = '<%=APPR_STAT%>';
	var PRO_STAT = '<%=PRO_STAT_FALG%>';
	function doSub(){
		if(APPR_STAT == 1){
			alert("�ȴ����̾����");
			return ;
		}else if(APPR_STAT == 2) {
			window.location.href= "szcp/szcp_sq_jbxx.jsp?REG_NO="+REG_NO+"&CerNO="+CERNO+"&EVAL_YEAR="+year;
		}  
		else if(APPR_STAT == 3) {
			alert("������ҵ���걨�ʸ�");
			return;
		}else if(APPR_STAT == 4){
			alert("�����ѱ��ͣ��ȴ����̾����");
		}else if(APPR_STAT == 6) {
			window.location.href= "szcp/szcp_sq_jbxx.jsp?REG_NO="+REG_NO+"&CerNO="+CERNO+"&EVAL_YEAR="+year;
		}else if(PRO_STAT == 8) {
			alert("������ҵ�ѹ�ʾ�����������");
		}else if(PRO_STAT == 9) {
			alert("������ҵΪ��ʾ����״̬�����������");
		}else if(PRO_STAT == 3) {
			alert("������ҵ����Ѿ�ͨ�������������");
		}else if(PRO_STAT == 10) {
			alert("������ҵΪ��ʾ����״̬�����������");
		}else if(PRO_STAT == 4) {
			alert("������ҵ�Ѿ��Ƽ������������");
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
&nbsp;&nbsp;ϵͳ��ʾ��
</font>
<br/>
&nbsp;&nbsp;"<font color="red"><%=entName%></font>"�������غ�ͬ��������ҵ�����ύ�ɹ���
<br>
&nbsp;&nbsp;&nbsp;�ȴ����̾���ˣ�����ͨ�����̾����Ϸ���ƽ̨<font color="#6495ED">������Ȳ�ѯ</font>ģ��鿴������ȡ�
<br></td></tr></table>

<FORM NAME="form1" METHOD="POST" ACTION="web/szhtinfo_select_action.jsp" target="editframe">
    <table id="mc"  border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
      
   </table>
  <br/>
  	 <CENTER>
		  <div class="subImgs"  style="display:inline" onclick="window.location.href='index.jsp'">����</div>
		  <div class="subImgs"  style="display:inline" onclick="doSub()">���ϱ���</div>
	</CENTER>	
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
<%@include file="bottom.inc"%>
</body>
</html>