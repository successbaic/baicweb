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
	
	String checkBox = "□";
    String selected = "√";
    String WTYW="√设立□变更□注销□备案□";
	String WTYW1="□ 名称预先核准   □ 设立    □ 变更   √ 注销    □ 备案    □ 撤销变更登记";
	String WTYW2="□ 股权出质 （□设立    □变更    □ 注销    □撤销）□ 其他";
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>营业单位登记申请书</title>
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

<input type="button" value="打印申请书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉"清空)</font>

<br>
<table border="1" width="80%" align="center" height="75%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">营业单位登记申请书</span></b><br>
	<span style="font-size: 12pt">注：请仔细阅读本申请书《填写说明》，按要求填写。</span>
	</caption>
	<!-- 基本信息 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(selected);%>基本信息</B>
				</td>
			</tr>
			<tr>
				<td align='center' height=28 nowrap="nowrap">隶属单位<br/>（企业）</td>
				<td colspan="2"><%=QYDJ_JBXX.getSUPENTNAME()%></td>
				
				<td align='center' height=28 >注册号/统一<br/>社会信用代码</td>
				<td colspan="2"><%=QYDJ_JBXX.getSUPREGNO()%></td>
			</tr>
			<tr>
				<td align='center' height=28 width="20%" nowrap="nowrap">营业单位名称</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=28 nowrap="nowrap">名称预先核准<br/>文号注册号/<br/>统一社会信用代码</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
				
			</tr>
			<tr>
				<td width="20%" align="center" height=28 >地址</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >生产经营地</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROPROVINCE().length()==6?QYDJ_JBXX.getPROPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			<tr>
				<td align="center" height=28 nowrap="nowrap">联系电话</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>

				<td align="center" height=28 nowrap="nowrap">邮政编码</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>				
			</tr>
		</table>
	</td>
</tr>
	<!-- 设立 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(checkBox);%>开业</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="20%">负责人</td>
				<td colspan="2" align="center" ></td>
				
				<td align='center' height=28 width="20%">联系电话</td>
				<td colspan=2 align="center"></td>
			</tr>
			<tr>
				<td align='center' height=28 width="20%">资金数额</td>
				<td colspan="2" align="center" ><%=SysSystem.toUnderlineStr("","center",9)%>万元</td>
				
				<td align="center" colspan=1 nowrap="nowrap">申请执照副本数量</td>
				<td colspan=2 align="center" ><%=SysSystem.toUnderlineStr("","center",5)%>个</td>
			</tr>
			
			<tr>
			    <td align="center" height=70 nowrap="nowrap">经营范围</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;"><br>
					<br><br>
				</td>
			</tr> 	
			<tr>
			    <td align="center" height=30 nowrap="nowrap">核算方式</td>
				<td colspan="5" align="center">
					<%
					String CALCULATIONMETHOD=QYDJ_JBXX.getCALCULATIONMETHOD();
					String HS_DLHS=checkBox;
					String HS_FDLHS=checkBox;
					
					%>
					<%=HS_DLHS%> 独立核算 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=HS_FDLHS%> 非独立核算 
				</td>
			</tr>		
		</table>
	</td>
</tr>
	<!-- 变更 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan=3>
					<B><%out.print(checkBox);%>变更/备案</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="20%" >变更/备案项目</td>
				<td align="center" width="40%">原变更/备案内容</td>
				<td align="center" width="40%">拟变更/备案内容</td>
			</tr>
			<% 	
				for(int i=0;i<3;i++){
					out.print("<tr><td height='28'></td><td></td><td></td></tr>");
				 }
			%>	
			</table>
		</td>
	</tr>
	<!-- 注销 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="2">
					<B><%out.print(selected);%>注销</B>
				</td>
			</tr>
			<tr>
				<td align="center" >注销原因</td>
				<td colspan="5" ><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 1、所属企业法人歇业;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if("60".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 2、隶属单位决定撤销;<br>
					&nbsp;&nbsp;&nbsp;&nbsp;<%if("50".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%>  3、被登记机关依法吊销或撤销;
					&nbsp;&nbsp;&nbsp;&nbsp;<%if("90".equalsIgnoreCase(QYDJ_ZXXX.getCANREA())){out.print(selected);}else{out.print(checkBox);}%> 4、其它原因。<br><br>
				</td>
			</tr>
			<tr> 
				<td align="center" height=28>债权债务清理</td>
				<td>&nbsp;
					<%if("2".equals(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%>主管部门或者清算组织负责清理债权债务
					<%if("1".equals(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 债务清理完结
				</td>
			</tr>
			<tr>
				<td align="center" height=40  colspan="1" nowrap="nowrap">清税情况</td>
				<td colspan="5" nowrap="nowrap" >&nbsp;&nbsp;
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕 &nbsp;&nbsp;&nbsp;&nbsp;
				<br/>&nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 未涉及纳税义务</td>
			</tr>
			<tr>
				<td align="center" height=28>缴回公章情况</td>
				<td >&nbsp;
					<%if("1".equals(QYDJ_ZXXX.getCAREVST())){out.print(selected);}else{out.print(checkBox);}%> 已缴回 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
					<%if("2".equals(QYDJ_ZXXX.getCAREVST())){out.print(selected);}else{out.print(checkBox);}%> 未缴回 
				</td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本企业依照《企业法人登记管理条例》、《企业法人登记管理条例施行细则》及相关规定申请登记，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。
						<br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">隶属单位（企业）盖章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font style="float:right">
								年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							</font>
						</p> 
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<br>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>