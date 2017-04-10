<%@ include file="../jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<jsp:useBean id="GQDJ_JBXX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>

<html>
<head>
<!--media=print 这个属性可以在打印时有效-->
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>

<title>股权出质设立登记预审通知书</title>
</head>

<%	
	String OPENO= SysUtility.doPreProcess(request.getParameter("OPENO"));
	String STATUS= SysUtility.doPreProcess(request.getParameter("STATUS"));	
	String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
	String sENTTYPE=SysUtility.doPreProcess(request.getParameter("ENTTYPE"));
	
	
	String LX="股权出质";
	String name="";
	String regorg="";

	GQDJ_JBXX.setOPENO(OPENO);
	GQDJ_JBXX.doSelect();
	name=GQDJ_JBXX.getEXPMOR();
	regorg=GQDJ_JBXX.getREGORG();

	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	String YW=icms.getSysDm("OPETYPE",OPETYPE);
%>
<body>

<table border="1" align="center" cellpadding="0" cellspacing="0" width="580" >
  <caption><font size="4pt"><p align="center">股权出质预审通知书</p></caption>
  <tr>
    <td width="100%" colspan="2" align="left"class='lc2'><%=SysSystem.toUnderlineStr(name,"center",30) %>:<br>&nbsp;&nbsp;&nbsp;&nbsp;你的网上<%=YW%>申请，预审
	<% 
	if (STATUS.equals("2")  || STATUS.equals("4") )//预审通过
	{
	%> 
		<font color="#FF0000">已通过</font>，请于<font color="#FF0000">七个工作日</font>内携带本通知书及<%=YW%>申请书以及下列提交材料到<font color="#FF0000"><%=icms.getSysDm("REGORG",regorg)%></font>，办理相关手续。
	<% 
	}
	if (STATUS.equals("3"))//预审驳回
	{
	%>
		<font color="#FF0000">被驳回</font>，请根据预审意见重新修改后，重新提交申请。
	<%
	}
	%>
	</td>
	<br>

  </tr>
	<tr>
		<td  class='lc1'>预审结果</td>		
		<td  class='lc2'><% if (STATUS.equals("2")  || STATUS.equals("4")){ out.print("预审通过");}else{out.print("预审驳回");}%> </td>		
	</tr>
	<tr>
		<td  class='lc1'><%if(STATUS.equals("3")){out.println("驳回原因");}else{out.println("预审意见");} %></td>
		<td  class='lc2'><%=QYDJ_YWSB.getAPPROPIN().replaceAll("&b","\n")%></td>		
	</tr>
	<%
	String SUBDOC=QYDJ_YWSB.getSUBDOC();
	if(!SUBDOC.equals("") ){	
	SUBDOC=SUBDOC.replaceAll("&b","<br/>");
	System.out.println(SUBDOC);
	%>
	<tr>
		<td  class='lc1'>提交材料</td>
		<td  class='lc2'><%=SUBDOC %></td>
	</tr>
	<%}if(!QYDJ_YWSB.getCLBSDD().equals("") ){%>
	<tr>
		<td  class='lc1'>材料报送地址</td>
		<td  class='lc2'><%=QYDJ_YWSB.getCLBSDD()%></td>		
	</tr>
	<%}%>
	<tr>
		<td  class='lc1' width="20%"><%if(STATUS.equals("3")){out.println("驳回日期");}else{out.println("预审日期");}%></td>		
		<td  class='lc2' ><%=QYDJ_YWSB.getAPPRDATE() %></td>
	</tr>
	<tr>
		<td  class='lc1' width="20%">备 &nbsp; 注</td>		
		<td  class='lc2' ><%=QYDJ_YWSB.getREGORGN() %></td>
	</tr>

   <tr>
    <td width="100%" align="center" colspan="2" class="fc">
	<INPUT name="print" type=button value="打 印" onClick="window.focus();window.print();" class="NOPRINT">
	<INPUT name="close" type=button value="关 闭" onClick="javascript:window.close();" class="NOPRINT"></td>
  </tr>
</table>
 </body>
</html>
 <%
	dbc.close();
%>