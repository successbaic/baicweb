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
	
	QYDJ_RYXX.setOPENO(OPENO);
	QYDJ_RYXX.getDataByFr();
	
	String sflx="";
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>外商投资公司设立登记申请书</title>
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
	<span style="font-size: 20pt">外资公司登记（备案）申请书</span></b><br>
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
				<td align="center" height=28>名    称</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>名称预先核准文<br/>号注册号/统一社会<br/>信用代码</td>
				<td colspan=3 ><%=WH%></td>
				
				<td width="20%" align="center" height=50>国别<br/>（地区）</td>
				<td ><%=icms.getSysDm("COUNTRY",QYDJ_JBXX.getCOUNTRY()) %></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >住    所</td>
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
				<td align="center" height=28 colspan="8">
					<B><%if("20".equals(opetype)){out.print(selected);}else{out.print(checkBox);}%>设立</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=50 rowspan="2">法定代表人</td>
				<td align="center">姓名</td>
				<td colspan="3" align="center" ><%=QYDJ_JBXX.getLEREP()%></td>
				
				<td align="center" >国别<br/>（地区）</td>
				<td align="center" colspan="2"><%=icms.getSysDm("COUNTRY",QYDJ_RYXX.getCOUNTRY()) %></td>
			</tr>
			
			<tr>	
				<td align="center" >职  务</td>
				<td align="center" colspan="6" >
				<%
					String sl1=checkBox,sl2=checkBox,sl3=checkBox;
					if("431A".equals(QYDJ_JBXX.getPOSITION()) || "431B".equals(QYDJ_JBXX.getPOSITION())){
						sl1=selected;
					}else if("432K".equals(QYDJ_JBXX.getPOSITION())){
						sl2=selected;
					}else if("434Q".equals(QYDJ_JBXX.getPOSITION()) || "434R".equals(QYDJ_JBXX.getPOSITION()) || "436A".equals(QYDJ_JBXX.getPOSITION())){
						sl3=selected;
					}else if ("410A".equals(QYDJ_JBXX.getPOSITION())){
						sl1=selected;
						sl3=selected;
					}else if ("410C".equals(QYDJ_JBXX.getPOSITION())){
						sl2=selected;
						sl3=selected;
					}
				%>
				<%=sl1%>董事长
				<%=sl2%>执行董事
				<%=sl3%>经理
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="15%">投资总额<br/>（万元）</td>
				<td align="center" width="10%"><%=QYDJ_JBXX.getCONGRO()%></td>
				
				<td align="center" height=28  width="10%">币种</td>
				<td align="center" width="15%"><%=icms.getSysDm("CURRENCY",QYDJ_JBXX.getCONGROCUR())%></td>
				
				<td align="center" height=28 width="15%">折美元<br/>（万元）</td>
				<td align="center" width="10%"><%=QYDJ_JBXX.getCONGROUSD()%></td>
				
				<td align="center" height=28 width="15%">注册资本<br/>（万元）</td>
				<td align="center" width="10%"><%=QYDJ_JBXX.getREGCAP()%></td>
				
			</tr>
			<tr>
				<td align="center" nowrap="nowrap">公司类型</td>
				<td align="center" colspan="3"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>
			
				<td align="center" height=28 >设立方式<br/>（股份公司填写）</td>
				<td align="center" colspan=3>
					<%if("01".equals(QYDJ_JBXX.getINSFORM())){out.print(selected);}else{out.print(checkBox);}%>发起设立
					<%if("07".equals(QYDJ_JBXX.getINSFORM())){out.print(selected);}else{out.print(checkBox);}%>募集设立
				</td>
			</tr>
			<tr>
			    <td align="center" height=100 >经<br>营<br>范<br>围</td>
				<td colspan="7" align="left" class="tdprint" valign="top" style="font-size:13px;">
					<br><%out.print(QYDJ_JBXX.getBUSSCOPE());%><br>
				</td>
			</tr>
			<tr>
			    <td align="center" height=28 >营业期限</td>
				<td align="center" colspan="4">
				 <% String yyqx=(String)QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getOPDATETO());
				 if("长期".equals(yyqx)){
					out.print(checkBox);%><%=SysSystem.toUnderlineStr("","center",4)%><%out.print("年");%>
					<%
					out.print(selected+"长期");
				 }else {
					 if("".equals(yyqx)){
						 out.print(checkBox);%><%=SysSystem.toUnderlineStr("","center",4)%><%out.print("年");%>
							<%
							out.print(selected+"长期");
					 }else{
						 out.print(selected);%><%=SysSystem.toUnderlineStr(yyqx,"center",4)%><%out.print("年");%>
							<%
							out.print(checkBox+"长期");
					 }
				 }
			        %>
				</td>
				<td align="center" colspan=2>申请副本数量</td>
				<td  align="center" ><%=SysSystem.toUnderlineStr(QYDJ_JBXX.getCOPYNUM()+"","center",5)%>个</td>
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
					<B><%out.print(checkBox);%>变更</B>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height=28 width="20%" >变更项目</td>
				<td align="center" colspan="2" width="40%">原登记内容</td>
				<td align="center" colspan="2" width="40%">拟变更内容</td>
			</tr>
			<% 	
				for(int i=0;i<5;i++){
					out.print("<tr><td height='28' colspan='2'></td><td colspan='2'></td><td colspan='2'></td></tr>");
				 }
			%>	
			</table>
		</td>
	</tr>
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
				<td align="center" height=28>注册号/统一社会信用代码</td>
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
				<td align="center" height="28" >成员</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td align="center" height=28>负责人</td>
				<td></td>
				<td align="center">联系电话</td>
				<td ></td>
			</tr>
			<tr>
				<td align="center" height="28">其他</td>
				<td align="left" colspan="4">
					&nbsp;&nbsp;&nbsp;
					<%out.print(checkBox); %>董事  &nbsp;   
					<%out.print(checkBox); %>监事  &nbsp;   
					<%out.print(checkBox); %>经理  &nbsp;   
					<%out.print(checkBox); %>章程  &nbsp;   
					<%out.print(checkBox); %>章程修正案  &nbsp;   
					<%out.print(checkBox); %>财务负责人  &nbsp;  
					<%out.print(checkBox); %>联络员 &nbsp;
					<br/>
					&nbsp;&nbsp;&nbsp;
					<%out.print(checkBox); %>外国投资者法律文件送达接受人
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
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;本公司依照《公司法》、《公司登记管理条例》相关规定申请登记、备案，提交材料真实有效。
						通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">公司盖章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font  style="float:left">&nbsp;&nbsp;&nbsp;（清算组负责人）签字：
							<span class="NOPRINT" style="color:#CCCCCC"></span></font>
							
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
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>


<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_FDDBR.inc"%>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_RYXX.inc" %>


<p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_CZXX.inc" %>

<p class="PageNext"><br>
<%@include file="public/GS_CWFZR.inc" %>
<p class="PageNext"><br>
<%@include file="public/GS_LLY.inc" %>

<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>
</body></html>