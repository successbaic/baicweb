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
<jsp:useBean id="MCGL_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
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
    String WTYW1="□ 名称预先核准   √ 设立    □ 变更    □ 注销    □ 备案    □ 撤销变更登记";
	String WTYW2="□ 股权出质 （□设立    □变更    □ 注销    □撤销）□ 其他";
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>外商投资合伙企业登记申请书</title>
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
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">外商投资合伙企业登记申请书</span></b><br><br>
	<span style="font-size: 12pt">注：请仔细阅读本申请书《填写说明》，按要求填写。</span>
	</caption>
	<!-- 基本信息 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="6">
					<B><%out.print(selected);%>基本信息</B>
				</td>
			</tr>
			
			<tr>
				<td align="center" height=28>名    称</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>名称预先核准文<br/>号/注册号/统一<br/>社会信用代码</td>
				<td colspan=5><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >主要经营场所</td>
				<td colspan="5" style="font-size:13px;">
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			
			<tr>
				<td width="20%" align="center" height=70 >生产经营地</td>
				<td colspan="5" style="font-size:13px;">
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROPROVINCE().length()==6?QYDJ_JBXX.getPROPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			
			<tr>
								
				<td align="center" height=30 nowrap="nowrap">联系电话</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=30 nowrap="nowrap">邮政编码</td>
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
				<td align="center" height=30 colspan="6">
					<B><%out.print(checkBox);%>设立</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%">执行事务合伙<br/>人或委派代表</td>
				<td align="center" >姓名或名称</td>
				<td align="center" >&nbsp;</td>
				<td align="center" width="15%">国 别<br/>（地 区）</td>
				<td align="center" colspan="2" width="25%">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%">认缴出资额<br/>（万元）</td>
				<td width="10%">&nbsp;</td>
				<td align="center" width="20%">实缴出资额<br/>（万元）</td>
				<td width="10%">&nbsp;</td>
				<td align="center" width="15%">币种</td>
				<td width="25%">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%">企业类型</td>
				<td colspan="5">&nbsp;</td>
			</tr>	
			<tr>
			    <td align="center" height=100 nowrap="nowrap">经营范围</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;"><br>
					<br>&nbsp;<br>
				</td>
			</tr>
			
			<tr>
				<td align="center" height="30px">合伙期限</td>
				<td align="center" colspan=2>
				□	________年 &nbsp;&nbsp; □ 长期
				</td>
				<td align="center" colspan=2 nowrap="nowrap">申请执照副本数量</td>
				<td align="center" > _______个</td>
			</tr>
		</table>
	</td>
</tr>
	<!-- 变更 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="3">
					<B><%out.print(checkBox);%>变更</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%" >变更项目</td>
				<td align="center" width="40%">原登记内容</td>
				<td align="center" width="40%">申请变更登记内容</td>
			</tr>
			<% 	
				for(int i=0;i<4;i++){
					out.print("<tr><td height='30'></td><td></td><td></td></tr>");
				 }
			%>	
			</table>
		</td>
	</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<p class="PageNext"><br></p>

<table border="1" width="90%" height="75%" align="center" bordercolor="#000000">
	<!-- 备案 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="5">
					<B><%out.print(checkBox);%>备案</B>
				</td>
			</tr>
			<tr>
				<td align="center" rowspan="2">分公司<br/>□增设□注销</td>
				<td align="center" height=28>名称</td>
				<td width="20%"></td>
				<td align="center" height=28>注册号/统一<br/>社会信用代码</td>
				<td width="20%"></td>
			</tr>
			<tr>
				<td align="center" height=28>登记机关</td>
				<td></td>
				<td align="center">登记日期</td>
				<td></td>
			</tr>
			<tr>
				<td align="center" rowspan="2">清算组</td>
				<td align="center" height="28" >成员姓名</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td align="center" height=28>清算负责<br/>人姓名</td>
				<td></td>
				<td align="center">联系电话</td>
				<td ></td>
			</tr>
			<tr>
				<td align="center" height="28">其他</td>
				<td align="left" colspan="4">
					&nbsp;&nbsp;&nbsp;
					<%out.print(checkBox); %>合伙协议  &nbsp;   
					<%out.print(checkBox); %>财务负责人  &nbsp;  
					<%out.print(checkBox); %>联络员 &nbsp;
					<%out.print(checkBox); %>外国投资者法律文件送达接受人  &nbsp;   
				</td>
			</tr>
			</table>
		</td>
	</tr>
	
	<!-- 注销 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="5">
					<B><%out.print(selected);%>注销</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 >注销原因</td>
				<td colspan="4" ><%=icms.getSysDm("CANREA",QYDJ_ZXXX.getCANREA()) %></td>
			</tr>
			
			<tr>
				<td align="center" height=30>清算人备案通知书编号</td>
				<td><%=QYDJ_ZXXX.getAFFWRITNO() %></td>
				<td align="center" height=30>对外投资清理情况</td>
				<td colspan="2">
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕&nbsp;&nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getEXTCLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无对外投资
				</td>
			</tr>    
			<tr>
				<td align="center" height=30>分支机构注销<br/>登记情况</td>
				<td>
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已办理完毕&nbsp;&nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCANCELBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无分支机构
				</td>
				<td align="center" height=30>债权债务清理情况</td>
				<td colspan="2">
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕 &nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getDECLEBRSIGN())){out.print(selected);}else{out.print(checkBox);}%> 无债权债务</td>
			</tr>
			<tr>
				<td align="center" height=30>清税情况</td>
				<td>
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕 &nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCLEANTAX())){out.print(selected);}else{out.print(checkBox);}%> 未涉及纳税义务</td>
				<td align="center" height=30>海关手续清缴情况</td>
				<td colspan="2">
				<%if("1".equalsIgnoreCase(QYDJ_ZXXX.getCUSTOMSETTLEMENT())){out.print(selected);}else{out.print(checkBox);}%> 已办理完毕 &nbsp;&nbsp;
				<%if("2".equalsIgnoreCase(QYDJ_ZXXX.getCUSTOMSETTLEMENT())){out.print(selected);}else{out.print(checkBox);}%> 未涉及海关事务</td>
			</tr>
			<tr>
				<td align="center" height=30>公告情况</td>
				<td align="center" height=30>公告报纸名称</td>
				<td><%=QYDJ_ZXXX.getPUBNEWSNAME() %></td>
				<td align="center" height=30>公告日期</td>
				<td><%=QYDJ_ZXXX.getPUBDATE() %></td>
			</tr>
			<tr>
				<td align="center" height=30>批准（决定）机关</td>
				<td><%=QYDJ_ZXXX.getSANAUTH() %></td>
				<td align="center" height=30>批准（决定）文号</td>
				<td><%=QYDJ_ZXXX.getSANDOCNO() %></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
				<tr>
					<td align="center" height=30 colspan="6">
						<B><%out.print(selected);%>申请人声明</B>
					</td>
				</tr>
				<tr>
					<td COLSPAN=6>
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;本企业依照相关法律法规规定申请登记、备案，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;执行事务合伙人（委派代表）签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">企业印章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br>
						<p> 
							<font style="float:left">
							&nbsp;&nbsp;&nbsp;&nbsp;
							清算负责人签字：  
							</font>
							<font style="float:right">
								年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
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

<p class="PageNext"><br>
<%@include file="public/WZ_WJSDJSR.inc" %>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>