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
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	 String checkBox = "□";
	String selected= "√";
	String WTYW="名称核准□、设立□、变更□、注销√、备案□、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>外商投资的公司注销登记申请书</title>
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
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉页脚"清空)</font>

	

<% 
    QYDJ_ZXXX.setOPENO(OPENO);
	QYDJ_ZXXX.doSelect();
 %>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">外商投资的公司注销登记申请书</b><br><br></caption>
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
	<td align="center" height=40>注销原因</td>
	
	<td colspan="5">
	&nbsp;&nbsp;<%if("40".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 1、公司被依法宣告破产<br>
	&nbsp;&nbsp;<%if("10".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 2、公司章程规定的营业期限届满或者其他解散事由出现<br>
	&nbsp;&nbsp;<%if("20".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 3、股东会、股东大会决议解散或者一人有限责任公司的股东、外商投资的公司董事会议解散<br>
	&nbsp;&nbsp;<%if("50".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 4、依法被吊销营业执照、责令关闭或者被撤销<br>
	&nbsp;&nbsp;<%if("30".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 5、人民法院依法予以解散<br>
	&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 6、其他法律、行政法规规定的情形__________________<br>
	</td>
</tr>


<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">对外投资<br/>清理情况</td>
	<td colspan="2" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕&nbsp;&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无对外投资</td>
	
	<td align="center" height=40  colspan="1" nowrap="nowrap" nowrap="nowrap">分公司注销<br/>登记情况</td>
	<td colspan="2" nowrap="nowrap">&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已办理完毕&nbsp;&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无分公司</td>
	
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">债权债务<br/>清理情况</td>
	<td colspan="2" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕 &nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无债权债务</td>
	
	<td align="center" height=40  colspan="1" nowrap="nowrap">批准证书<br/>缴销情况</td>
	<td colspan="2" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCANCELLATIONCERTIFICATE())){out.print(selected);}else{out.print(checkBox);}%> 批准证书已缴销完毕 &nbsp;&nbsp;
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">清税情况</td>
	<td colspan="2" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕 &nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 未涉及纳税义务</td>
	
	<td align="center" height=40  colspan="1" nowrap="nowrap">海关手续<br/>清缴情况</td>
	<td colspan="2" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCUSTOMSETTLEMENT())){out.print(selected);}else{out.print(checkBox);}%> 已办理完毕 &nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCUSTOMSETTLEMENT())){out.print(selected);}else{out.print(checkBox);}%> 未涉及海关事务</td>
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
<%@include file="public/WZ_SQWT.inc" %>
</html>