<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.TwoDimensionCode" %>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>

<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	String opetype=QYDJ_JBXX.getOPETYPE();
	
	MCGL_JBXX_ZS.setNAMEID(QYDJ_JBXX.getPRIPID());
	MCGL_JBXX_ZS.doSelect();
	String WH=MCGL_JBXX_ZS.getAPPRNO();
	
	String checkBox = "□";
	String selected= "√";
	String WTYW="名称核准□、设立√、变更□、注销□、备案□、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
	
	String sflx="";
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>外国（地区）企业在中国境内从事生产经营活动登记申请书</title>
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


<table border="1" width="80%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">外国（地区）企业在中国境内从事<br/>生产经营活动登记申请书</span></b><br>
	<span style="font-size: 12pt">注：请仔细阅读本申请书《填写说明》，按要求填写。</span>
	</caption>
	<!-- 基本信息 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="4">
					<B><%out.print(selected);%>基本信息</B>
				</td>  
			</tr>
			<tr>
				<td align="center" height=28 width="15%">名    称</td>
				<td width="35%"><%=QYDJ_JBXX.getENTNAME()%></td>
			
				<td width="15%" align="center" height=50>名称预先核准文<br/>号注册号/统一社会<br/>信用代码</td>
				<td width="35%"><%=WH%></td>
				
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >地     址<br/>（营业场所）</td>
				<td colspan="3" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			<tr>
				<td align="center" height=28 nowrap="nowrap">联系电话</td>
				<td width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=28 nowrap="nowrap">邮政编码</td>
				<td width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>
			</tr>
		</table>
	</td>
</tr>
	<!-- 设立 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
		<tr>
				<td align="center" height=30 colspan="4">
					<B><%if("20".equals(opetype)){out.print(selected);}else{out.print(checkBox);}%>开业</B>
				</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" width="15%">企业类型</td>
				<td width="35%"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>
				<td align="center" nowrap="nowrap" width="15%">主管部门</td>
				<td width="35%"><%=QYDJ_JBXX.getDEPINCHA() %></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap">审批机关</td>
				<td><%=QYDJ_JBXX.getEXAAUTH()%></td>
				<td align="center" nowrap="nowrap">批准日期</td>
				<td><%=QYDJ_JBXX.getSANDATE() %></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap">负责人</td>
				<td colspan="3"><%=QYDJ_JBXX.getLEREP()%></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="150px">在中国境内<br/>经营范围</td>
				<td colspan="3" style="font-size:15px;"><%=QYDJ_JBXX.getBUSSCOPE()%></td>
			</tr>	
			<tr>
				<td align="center" height=28 width="15%">资金数额（万元）</td>
				<td width="35%"><%=QYDJ_JBXX.getREGCAP()%>万元</td>
				
				<td align="center" height=28  width="15%">币种</td>
				<td  width="35%"><%=icms.getSysDm("CURRENCY",QYDJ_JBXX.getREGCAPCUR())%></td>
			</tr>
			<tr>
			    <td align="center" height=28 >营业期限</td>
				<td align="center" colspan="3">
				 自_________年______月______日 至_________年______月______日
				</td>				
			</tr>
			
			<tr>
				<td align="center" nowrap="nowrap" height="40px">承包工程或经营<br/>管理项目</td>
				<td colspan="3"><%=QYDJ_JBXX.getITEMOFOPORCPRO()%></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="40px">外国（地区）企<br/>业名称</td>
				<td colspan="3"><%=QYDJ_JBXX.getFORENTNAME()%></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="40px">外国（地区）企<br/>业境外住所</td>
				<td colspan="3"><%=QYDJ_JBXX.getFORENTADD()%></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="120px">外国（地区）企<br/>业经营范围</td>
				<td colspan="3" style="font-size:15px;"><%=QYDJ_JBXX.getFORENTSCOPE()%></td>
			</tr>
		</table>
	</td>
</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<p class="PageNext"><br></p>

<table border="1" width="80%" height="75%" align="center" bordercolor="#000000">
	<!-- 变更 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(checkBox);%>变更/备案</B>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height=28 width="20%" >变更/备案项目</td>
				<td align="center" colspan="2" width="40%">原登记/备案内容</td>
				<td align="center" colspan="2" width="40%">拟变更/备案内容</td>
			</tr>
			<% 	
				for(int i=0;i<5;i++){
					out.print("<tr><td height='28' colspan='2'></td><td colspan='2'></td><td colspan='2'></td></tr>");
				 }
			%>	
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="4">
					<B><%out.print(checkBox);%>注销</B>
				</td>
			</tr>
			<tr>
				<td align="center" width="15%">注销原因</td>
				<td colspan="3" height="150px">
					
				</td>
			</tr>
			<tr>
				<td align="center" >清税情况</td>
				<td colspan="3" >
					&nbsp;&nbsp;
					<%=checkBox%> 已清理完毕&nbsp;&nbsp;
					<%=checkBox%> 未涉及纳税义务
				</td>
			</tr>
			<tr>
			<td align="center" nowrap="nowrap">海关手续<br/>清缴情况</td>
			<td colspan="3" nowrap="nowrap" >&nbsp;&nbsp;
			<%=checkBox%> 已办理完毕 &nbsp;&nbsp;
			<%=checkBox%> 未涉及海关事务</td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap">批准机关</td>
			<td colspan="3"></td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap" width="15%">批准文号</td>
			<td width="35%"></td>
			<td align="center" nowrap="nowrap" width="15%">批准日期</td>
			<td width="35%"></td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap">清理债权<br/>债务单位</td>
			<td colspan="3"></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
				<tr>
					<td align="center" height=28 colspan="6">
						<B><%out.print(selected);%>申请人声明</B>
					</td>
				</tr>
				<tr>
					<td COLSPAN=6>
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;本企业依照相关法律法规有关规定申请开业登记，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;外国（地区）企业有权签字人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">（印章）：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font style="float:right">
								年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/><br/>
						</p> 
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZFZ_FZR.inc"%>

<p class="PageNext"><br>
<%@include file="public/GS_CWFZR.inc" %>
<p class="PageNext"><br>
<%@include file="public/GS_LLY.inc" %>

<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>
</body></html>