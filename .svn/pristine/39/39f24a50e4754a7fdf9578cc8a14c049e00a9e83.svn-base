<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.TwoDimensionCode" %>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_ZXXX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	QYDJ_ZXXX.setOPENO(OPENO);
	QYDJ_ZXXX.doSelect();
	
	String WTYW="□设立□变更√注销□备案□";
	String WTYW1="□ 名称预先核准   □ 设立    □ 变更   √ 注销    □ 备案    □ 撤销变更登记";
	String WTYW2="□ 股权出质 （□设立    □变更    □ 注销    □撤销）□ 其他";
	
	String checkBox = "□";
    String selected = "√";
    
    TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
	    
%>
<html><head><title>公司注销登记申请书</title>
<%out.print(pageshow.pagesetup_default()); %>
</head>
<body onload="pagesetup_default()" style="text-align: center">
<style>table{border-collapse: collapse;} 
 
</style>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-before: always;}
tr{font-size: 12pt;}
.tr9{font-size: 9pt;}
.tdprint{text-align: left;text-indent: 2;}
</style>

<input type="button" value="打印报告书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE-&gt;文件-&gt;页面设置&quot;中将&quot;页眉页脚&quot;清空)</font>

<br><br>
<table width="90%" align="center" bordercolor="#000000">         
	<caption ><b>
		<span style="font-size: 16pt">公司注销登记申请书</span></b><br><br></caption>
</table>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<tr>
	<td align="center" height=40 nowrap="nowrap">名   称</td>
	<td colspan="2" nowrap="nowrap"><%=QYDJ_JBXX.getENTNAME()%></td>
	
	<td align="center" height=40 nowrap="nowrap">注册号/统一<br/>社会信用代码</td>
	<td colspan="2" nowrap="nowrap"><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
</tr>
<tr>
	<td align="center" height="40" nowrap="nowrap">公司类型</td>
	<td colspan="2"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>

    <td align="center" height="40" nowrap="nowrap" >清算组备案<br/>通知书文号</td>
	<td colspan="2"><%=QYDJ_ZXXX.getAFFWRITNO()%></td>
</tr>
<tr>
	<td align="center" nowrap="nowrap">申请注销<br>登 记 的<br>原   因</td>
	<td colspan="5"><br>
		&nbsp;&nbsp;<%if("10".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 1、公司章程规定的营业期限届满或其他解散事由出现;<br>
		&nbsp;&nbsp;<%if("20".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 2、股东决定、股东会、股东大会决议解散;<br>
		&nbsp;&nbsp;<%if("70".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 3、因公司合并或者分立需要解散;<br>
		&nbsp;&nbsp;<%if("50".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 4、依法被吊销营业执照、责令关闭或者被撤销;<br>
		&nbsp;&nbsp;<%if("30".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 5、人民法院依法予以解散;<br>
		&nbsp;&nbsp;<%if("40".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 6、公司被依法宣告破产;<br>
		&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 7、法律、行政法规规定的其他解散情形:
		<%=SysSystem.toUnderlineStr("","center",10) %>。<br><br>
	</td>
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">对外投资<br/>清理情况</td>
	<td colspan="2" width="30%" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无对外投资</td>
	
	<td align="center" height=40  colspan="1" nowrap="nowrap" nowrap="nowrap">分公司注销<br/>登记情况</td>
	<td colspan="2" width="30%" nowrap="nowrap">&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已办理完毕&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无分公司</td>
	
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">债权债务<br/>清理情况</td>
	<td colspan="5" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕 &nbsp;&nbsp;&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无债权债务</td>
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">清税情况</td>
	<td colspan="5" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕 &nbsp;&nbsp;&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 未涉及纳税义务</td>
</tr>

<tr>
	<td align="center" >公告情况</td>
	<td align="center" height="40">公告报纸名称</td>
    <td width="15%" nowrap="nowrap"><%=QYDJ_ZXXX.getPUBNEWSNAME()%></td>

    <td align="center" height="40">公告日期</td>
    <td nowrap="nowrap"><%=QYDJ_ZXXX.getPUBDATE()%></td>
</tr>
<tr>
	<td align="center">申请人声明</td>
	<td colspan="5">
	   <br><p style="line-height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;本公司依照《公司法》、《公司登记管理条例》申请注销登记，提交材料真实有效。</p><br><br>
		<p >
			<font  style="float:left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签字：
				<span class="NOPRINT" style="color:#CCCCCC"></span>
			</font>
		
			<font  style="float:right">公司盖章：&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</font>
		<br><br>
		</p>
	   <p align="right">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   </p>
	   <br/><br/> 
	</td>
</TR>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@ include file="public/GS_WTDL.inc" %>
</html>