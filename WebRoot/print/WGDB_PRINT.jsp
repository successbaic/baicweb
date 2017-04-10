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
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	String opetype=QYDJ_JBXX.getOPETYPE();
	
	String checkBox = "□";
	String selected= "√";
	
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
<html><head><title>外国(地区)企业常驻代表机构设立登记申请书</title>
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
	<span style="font-size: 20pt">外国（地区）企业常驻代表机构登记申请书</span></b><br>
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
				<td align="center" height=28>代表机构名称</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>登记证注册号/统<br/>一社会信用代码</td>
				<td colspan=5 ><%=QYDJ_JBXX.getREGNO()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >驻在场所</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			<tr>
				<td align="center" height=28 nowrap="nowrap">联系电话</td>
				<td colspan=2 width="25%" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=28 nowrap="nowrap">邮政编码</td>
				<td colspan=2 width="25%" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>
			</tr>
		</table>
	</td>
</tr>
	<!-- 设立 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="5">
					<B><%if("20".equals(opetype)){out.print(selected);}else{out.print(checkBox);}%>设立</B>
				</td>
			</tr>
			

<%
 String DBNAME="";
  ArrayList dbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN!='1'");  
  if(dbr.size()>0){
  for(int i=0;i<dbr.size();i++){
    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ dTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)dbr.get(i);
    DBNAME+=dTable.getNAME()+";";
    }
    }
 %>

<tr>
<td align='center' height=25 style="width:15%">首席代表姓名</td>
<td colspan="4" ><%=QYDJ_JBXX.getLEREP() %></td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">代表姓名</td>
<td colspan="4"><%=DBNAME%></td>
</tr>
<tr>
<td height=100 align='center'>业务范围</td>
<td colspan="4" align='left' style="font-size:13px"><%=QYDJ_JBXX.getBUSSCOPE()%></td>
</tr>
<tr>
<td align='center' height=25 style="width:15%">驻在期限</td>
<td colspan="4" >
&nbsp;&nbsp;自&nbsp;&nbsp;&nbsp;&nbsp;<%=QYDJ_JBXX.getOPFROM()%>&nbsp;&nbsp;&nbsp;&nbsp;至
&nbsp;&nbsp;<%=QYDJ_JBXX.getOPTO()%></td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">批准设立机关名称</td>
<td colspan="4" ><%=icms.getSysDm("REGORG",QYDJ_JBXX.getREGORG()) %></td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">批准驻在期限</td>
<td colspan="4" >
&nbsp;&nbsp;自&nbsp;&nbsp;&nbsp;&nbsp;<%=QYDJ_JBXX.getOPFROM()%>&nbsp;&nbsp;&nbsp;&nbsp;至
&nbsp;&nbsp;<%=QYDJ_JBXX.getOPTO()%></td>
</tr>

<tr>
<td align='center' height=25 style="width:10%">批准日期</td>
<td style="width:20%" colspan="2"><%=QYDJ_JBXX.getSANDATE()%></td>
<td align='center' height=25 style="width:10%">批准文号</td>
<td style="width:20%" ><%=QYDJ_JBXX.getSANDOCNO()%></td>
</tr>

<tr>
<td rowspan="7" align="center" >外国（地区）<br/>企业情况</td>
<td height=25 align='center'>中文名称</td>
<td><%=QYDJ_JBXX.getFORENTNAME()%></td>
<td align='center'>外文名称</td>
<td><%=QYDJ_JBXX.getFORENTFORNAME()%></td>
</tr>
<tr>
<td align='center' height=25>住 所</td>
<td colspan="3" ><%=QYDJ_JBXX.getFORENTADD()%></td>
</tr>
<tr>
<td align='center' height=25>存续期限</td>
<td colspan="3">&nbsp;&nbsp;自&nbsp;&nbsp;&nbsp;&nbsp;<%=QYDJ_JBXX.getFORENTOPFROM()%>&nbsp;&nbsp;&nbsp;&nbsp;至
&nbsp;&nbsp;<%=QYDJ_JBXX.getFORENTOPTO()%></td>
</tr>

<tr>
<td align='center' height=25 nowrap>有权签字<br/>人姓名</td>
<td colspan="3" ><%=QYDJ_JBXX.getFORENTAUTSIGN()%></td>
</tr>

<tr>
<td align='center' height=25 nowrap>企业责任<br/>形式</td>
<td colspan="3">
<%if(QYDJ_JBXX.getFORENLIAFOR().equals("2")){out.println("√");}else{out.println("□");} %>
有限责任 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%if(QYDJ_JBXX.getFORENLIAFOR().equals("1")){out.println("√");}else{out.println("□");} %>
无限责任
</td>
</tr>

<tr>
<td align='center' height=25 nowrap>资本<br/>（资产）</td>
<td><%=QYDJ_JBXX.getFORENTCAP()%>
&nbsp;&nbsp;
万美元
</td>
<td align="center">国别<br/>（地区）</td>
<td><%=icms.getSysDm("COUNTRY", QYDJ_JBXX.getCOUNTRY()) %></td>
</tr>

<tr>
<td align='center' height=100 nowrap>经营范围</td>
<td colspan="3" align='left' style="font-size:13px"><%=QYDJ_JBXX.getFORENTSCOPE()%></td>
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
				<td align="center" colspan="2" width="40%">原变更/备案内容</td>
				<td align="center" colspan="2" width="40%">拟变更/备案内容</td>
			</tr>
			<% 	
				for(int i=0;i<6;i++){
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
				<td align="center" height=30 colspan="6">
					<B><%out.print(checkBox);%>注销</B>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">注销原因</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%> 外国（地区）企业撤销代表机构<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 代表机构驻在期限届满不再继续从事业务活动<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 外国（地区）企业终止<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 代表机构依法被撤销批准或者责令关闭<br>
				</td>
			</tr>
			<tr>
				<td align="center" >清税情况</td>
				<td colspan="5"  height=30>
					&nbsp;&nbsp;<%out.print(checkBox);%> 已清理完毕 
					&nbsp;&nbsp;<%out.print(checkBox);%> 未涉及纳税义务
				</td>
			</tr>
			
			<tr>
				<td align="center" >海关手续<br/>清缴情况</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%> 已办理完毕
					&nbsp;&nbsp;<%out.print(checkBox);%> 未涉及海关事务
				</td>
			</tr>
			
			<tr>
				<td align="center"  height=30>批准机关</td>
				<td colspan="5" >
				</td>
			</tr>
			
			<tr>
				<td align="center" width="20%" height=30>批准文号</td>
				<td colspan="2" width="30%">&nbsp;</td>
				<td align="center" width="20%">批准日期</td>
				<td colspan="2" width="30%">&nbsp;</td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;本机构依照相关法律法规规定申请登记、备案，提交材料真实有效。
						<br><br><br>
						<p ><br>
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;外国（地区）企业有权签字人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">代表机构印章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br><br>
						<p> 
							<br>
							<font style="float:right">
								年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/><br/><br>
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

<%ArrayList newdbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'");
  for(int n=0;n<newdbr.size();n++){
    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)newdbr.get(n);    
%>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">外国（地区）企业常驻代表机构<br/>首席代表/代表信息</b><br><br></caption>	
<tr>
   <td align="center" width="20%" height=50 nowrap="nowrap">机构名称</td>
   <td width="65%" colspan="5"><%=QYDJ_JBXX.getENTNAME() %></td>
   <td align="center" width="15%" rowspan="3">照<br>片</td>
</tr>
<tr>
	<td align="center" height=50>代表姓名</td>
	<td><%=bTable.getNAME() %></td>
	
	<td align="center">职务</td>
	<td><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>

    <td align="center">国籍</td>
	<td><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
</tr>
<tr>	
	<td align="center"  height=50>入境时间</td>
	<td colspan="3"><%=bTable.getARRCHDATE()%></td>
	<td align="center" height=50>联系电话</td>
	<td><%=bTable.getTEL()%></td>
</tr>
<tr>	
<td align="center"  height=30 >证件类型</td>
	<td COLSPAN=3 width="45%"><%=icms.getSysDm("CERTYPE", bTable.getCERTYPE()) %></td>
    <td align="center"  height=30>证件号码</td>
	<td COLSPAN=2 width="45%"><%=bTable.getCERNO()%></td>
</tr>
<tr >
	<td align="center" height=30 colspan="4">境内居住地址</td>
	<td colspan="3"><%=bTable.getHOUADDINCHINA()%></td>
</tr>
<tr>
	<td align="center" height=30 colspan="4">代表证有效期限</td>
	<td colspan="3">
	自
	<%=bTable.getREPCARFROM() %>		
	至
	<%=bTable.getREPCARTO() %>
	</td>
</tr>	
<tr>
 <td align="center" COLSPAN=4 height=330>首席代表/代表简历</td>
 <td align="center" COLSPAN=4 height=330><br/><br/><br/>身份证明复印件粘贴处</td>
</tr>
<tr>
<td COLSPAN=8 >
<p align="left">
本人承诺，不存在不得担任首席代表、代表的以下情形：<br/>
 1、因损害中国国家安全或者社会公共利益，被判处刑罚的；<br/>
 2、因从事损害中国国家安全或者社会公共利益等违法活动，依法被撤销设立登记、吊销登记证或者被有关部门依法责令关闭的代表机构的首席代表、代表，自被撤销、吊销或者责令关闭之日起未逾5年的；<br/>
 3、国家工商行政管理总局规定的其他情形。<br/>
 </p>
 <p align="center">首席代表/代表签字</p>
 <br/>
</td>
</tr>
</table>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;注：本表可复印续填。</p>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<%}%>

<p class="PageNext"><br>
<%@include file="public/GS_CWFZR.inc" %>
<p class="PageNext"><br>
<%@include file="public/GS_LLY.inc" %>

<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc" %>
</body></html>