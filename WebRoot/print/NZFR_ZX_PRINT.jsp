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
<html><head><title>非公司企业法人登记（备案）申请书</title>
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
		<span style="font-size: 16pt">非公司企业法人注销登记申请书</span></b><br><br></caption>
</table>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<tr>
	<td align="center" height=40>名   称</td>
	<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
</tr>
<tr>	
	<td align="center" height=40>注册号/统一<br/>社会信用代码</td>
	<td colspan="5"><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
</tr>
<tr>
    <td align="center" height="40" nowrap="nowrap" >主管部门<br/>（出资人）</td>
	<td colspan="5"><%=QYDJ_JBXX.getDEPINCHA()%></td>
</tr>
<tr>
	<td align="center" height="40">经济性质</td>
	<td colspan="5"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>
</tr>
<tr>
	<td align="center">注销原因</td>
	<td colspan="5"><br>
		&nbsp;&nbsp;<%if("10".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 1、企业法人歇业;<br>
		&nbsp;&nbsp;<%if("50".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 2、	依法被吊销营业执照、责令关闭;<br>
		&nbsp;&nbsp;<%if("32".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 3、被撤销;<br>
		&nbsp;&nbsp;<%if("40".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 4、人民法院宣告破产;<br>
		&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 5、其他原因终止营业:
		<%=SysSystem.toUnderlineStr("","center",20) %>。<br><br>
	</td>
</tr>


<tr>
	<td align="center" height=40  nowrap="nowrap">债权债务清理情况</td>
	<td colspan="5">&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 主管部门或者清算组织负责清理债权债务
	 <br/>&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 债务清理完结</td>
</tr>

<tr>
	<td align="center" height=40  colspan="1" nowrap="nowrap">清税情况</td>
	<td colspan="5" nowrap="nowrap" >&nbsp;&nbsp;
	<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕 &nbsp;&nbsp;&nbsp;&nbsp;
	<br/>&nbsp;&nbsp;
	<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 未涉及纳税义务</td>
</tr>

<tr>
	<td align="center" height=40 >缴回公章情况</td>
	<td colspan="5">&nbsp;&nbsp;
	<%if("1".equals(QYDJ_ZXXX.getCAREVST())){out.print(selected);}else{out.print(checkBox);}%> 已缴回 &nbsp;&nbsp;&nbsp;&nbsp;
	<%if("2".equals(QYDJ_ZXXX.getCAREVST())){out.print(selected);}else{out.print(checkBox);}%> 未缴回 &nbsp;&nbsp;</td>
</tr>
<tr>
	<td align="center">申请人声明</td>
	<td colspan="5">
	   <br><p style="line-height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;本企业依照《企业法人登记管理条例》、《企业法人登记管理条例施行细则》申请注销登记，提交材料真实有效。</p><br><br>
		<p >
			<font  style="float:left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签字：
				<span class="NOPRINT" style="color:#CCCCCC"></span>
			</font>
		
			<font  style="float:right">企业法人盖章：&nbsp;
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
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@ include file="public/GS_WTDL.inc" %>
</html>