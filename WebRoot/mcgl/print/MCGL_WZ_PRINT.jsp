<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="/error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="MCGL_TZRXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<%	
	
	//String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	
	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_SQWT.doSelect();
	String checkBox = "□";
	String selected= "√";
	String WTYW="名称核准√、设立□、变更□、注销□、备案□、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
	String DQENTNAME=MCGL_JBXX.getENTNAME();
	//String WTYW="√设立□变更□注销□备案□";
	//String checkBox = "□";
    //String selected = "√";
%>
<html><head><title>外商投资企业名称预先核准申请书</title>
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


<p></p>
<!--########### -->
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">外商投资企业名称预先核准申请书</b><br><br></caption>
					<tr>
						<td align='center' height=30 nowrap="nowrap" width="15%">
							拟设立企业名称
						</td>
						<td colspan="6"  align='center' >
							<%=MCGL_JBXX.getENTNAME() %>
						</td>
					</tr>	
					<tr>
					<td rowspan="2"  height=60 align='center'>备用名称</td>
					<td colspan="3"  height=30 align='center'><%=MCGL_JBXX.getENTNAME1()%></td>
					<td colspan="3" height=30 align='center'><%=MCGL_JBXX.getENTNAME2()%></td>
					
					</tr>
					<tr>
					<td colspan="3" height=30 align='center'><%=MCGL_JBXX.getENTNAME3()%></td>
					<td colspan="3" height=30 align='center'><%=MCGL_JBXX.getENTNAME4()%></td>
					
					</tr>
					<tr>
					<td style="width:20%" height=30 align='center'>拟定企业住所</td>
					<td colspan="6" style="width:20%" height=30 align='center'> <%=MCGL_JBXX.getDOM() %></td>
					</tr>
					
					<tr>
					<td rowspan="2" align='center'>拟定投资总额</td>
					<td style="width:20%" height=30 align='center'>金额</td>
					<td style="width:10%" height=30 align='center'>币种</td>
					<td rowspan="2" colspan="2" style="width:20%" align='center'>拟定注册资本</td>
					<td style="width:20%"height=30 align='center'>金额</td>
					<td style="width:10%" height=30 align='center'>币种</td>
					</tr>
					<tr>
					<td style="width:20%" height=30 align='center'><font style="float: right">（万元）</font><%=MCGL_JBXX.getCONGRO() %></td>
					<td style="width:10%" height=30 align='center'><%= icms.getSysDm("CURRENCY",MCGL_JBXX.getCONGROCUR()) %></td>
					<td style="width:20%" height=30 align='center'><font style="float: right">（万元）</font><%=MCGL_JBXX.getREGCAP() %></td>
					<td style="width:10%" height=30 align='center'><%= icms.getSysDm("CURRENCY",MCGL_JBXX.getREGCAPCUR()) %></td>
					</tr>
					
					
					<tr>
					<td style="width:20%" height=30 align='center'>拟定企业类型</td>
					<td colspan="2"  style="width:30%" height=30 align='center'><%= icms.getSysDm("ENTTYPE",MCGL_JBXX.getENTTYPE()) %></td>
					<td colspan="2" height=30 align='center'>拟定经营期限</td>
					<td colspan="2"  style="width:30%" height=30 align='center'>
					 <% String yyqx=(String)MCGL_JBXX.doPreProcess(MCGL_JBXX.getOPDATETO());
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
					<%= MCGL_JBXX.getPLAYTIMELIMIT()%></td>
					</tr>
					<tr>
					<td  height=180 align='center'>拟定经营范围</td>
					<td colspan="6" align='center'><%=MCGL_JBXX.getBUSSCOPE() %></td>
					</tr>
					
					
					<tr>
					<td colspan="2" height=30 align='center'>投资人姓名或名称</td>
					<td align='center'>国别<br>（地区）</td>
					<td align='center'>出资额<br>（万元）</td>
					<td align='center'>币<br>种</td>
					<td align='center'>出资<br>比例</td>
					<td align='center'>投资人<br>签字或盖章</td>
		
					</tr>
					
					
					<%
				 List tzrxx=MCGL_TZRXX.getList(" WHERE OPENO='"+OPENO+"'");
				for(int i = 0 ;i<tzrxx.size();i++){
				MCGL_TZRXX_SQ bean = (MCGL_TZRXX_SQ)tzrxx.get(i);
				%>
				<tr>
					<td colspan="2" align='center'>
						<%= bean.getINV()%>
					</td >
					<td align='center'>
						<%= icms.getSysDm("COUNTRY",bean.getCOUNTRY()) %>
					</td>
					<td align='center'>
						<%= bean.getCONGRO()%>
					</td >
					<td align='center'>
						<%= icms.getSysDm("CURRENCY",bean.getCONGROCUR()) %>
					</td>
					
					<td align='center'>
						<%= bean.getCONPROP()%>%
					</td>
					<td>
					
					</td>
				</tr>
				
				
				
				<%
	  }
	
	            if(5-tzrxx.size()>0){
	            
				for(int i=0;i<5-tzrxx.size();i++){
					out.print("<tr><td height='30' colspan='2'></td><td></td><td></td><td></td><td></td><td></td></tr>");
				 }
			 }
		
%>
<tr>


		<td height="30" colspan="2"></td>
		<td height="30"></td>
		<td height="30"></td>
		<td height="30"></td>
		<td height="30"></td>
		<td height="30"></td>
		
	</tr>
				<%-- 	<tr>
						<td class="tdLabel" rowspan="2">
							备选名称
						</td>
						<td>
							<table class="noBorder" style="width:100%;">
								<tr style="width:100%;">
									<td style="border-right:solid #000 1px;width:50%;text-align:center;">
										<%=MCGL_JBXX.getENTNAME1()%>
									</td>
									<td style="text-align:center;">
										<%=MCGL_JBXX.getENTNAME2()%>
									</td>
								</tr>
							</table>
						</td>
					</tr>	
					<tr>
						<td>
							<table class="noBorder">
								<tr>
									<td style="border-right:solid #000 1px;width:50%;text-align:center;">
										<%=MCGL_JBXX.getENTNAME3()%>
									</td>
									<td style="text-align:center;">
										<%=MCGL_JBXX.getENTNAME4()%>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="tdLabel">
							拟定企业住所
						</td>
						<td>
							<%=MCGL_JBXX.getDOM() %>
						</td>
					</tr>	
					<tr>
						<td class="tdLabel">
							拟定投资总额 
						</td>
						<td class="tdContent">
							<table class="noBorder1">
								<tr>
									<td style="width:18%;border-right:solid #000 1px;border-bottom:solid #000 1px;">
										金额
									</td>
									<td style="width:18%;">
										币种
									</td>
									<td rowspan="2" style="border-left:solid #000 1px;border-right:solid #000 1px;">
										拟定注册资本
									</td>
									<td style="width:18%;border-right:solid #000 1px;border-bottom:solid #000 1px;">
										金额
									</td>
									<td style="width:18%;">
										币种
									</td>
								</tr>
								<tr>
									<td>
										<font style="float: right">（万元）</font><%=MCGL_JBXX.getCONGRO() %>
									</td>
									<td style="width:18%;border-left:solid #000 1px;border-top:solid #000 1px;">
										<%= icms.getSysDm("CURRENCY",MCGL_JBXX.getCONGROCUR()) %>
									</td>
									<td>
										<font style="float: right">（万元）</font><%=MCGL_JBXX.getREGCAP() %>
									</td>
									<td style="width:18%;border-left:solid #000 1px;border-top:solid #000 1px;">
										<%= icms.getSysDm("CURRENCY",MCGL_JBXX.getREGCAPCUR()) %>
									</td>
								</tr>
							</table>
						</td>
					</tr>	
					<tr>
						<td class="tdLabel">
							拟定企业类型
						</td>
						<td class="tdContent">
							<table class="noBorder1">
								<tr>
									<td style="width:36%;">
										<%= icms.getSysDm("ENTTYPE",MCGL_JBXX.getENTTYPE()) %>
									</td>
									<td style="border-left:solid #000 1px;border-right:solid #000 1px;">
										拟定经营期限
									</td>
									<td style="width:36%;">
										<%= MCGL_JBXX.getPLAYTIMELIMIT()%>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="tdLabel" style="height: 100px;" >
							拟定经营范围
						</td>
						<td style="height: 120px;">
						<%=MCGL_JBXX.getBUSSCOPE() %>
						</td>
					</tr>
				</tbody>
			</table>
			<table>
				<tr>
					<td style="width:35%;border-top: 0px;">
					投资人姓名或名称
					</td>
					<td style="width:15%;border-top: 0px;">
				          国别（地区）
					</td>
					<td style="width:10%;border-top: 0px;">
					出资额（万元）
					</td>
					<td style="width:10%;border-top: 0px;">
					币种
					</td>
					
					<td style="width:10%;border-top: 0px;">
					出资比例
					</td>
					<td style="width:10%;border-top: 0px;font-size:14px">
					投资人<br>签字或盖章
					</td>
				</tr>
				<%
				 List tzrxx=MCGL_TZRXX.getList(" WHERE OPENO='"+OPENO+"'");
				for(int i = 0 ;i<tzrxx.size();i++){
				MCGL_TZRXX_SQ bean = (MCGL_TZRXX_SQ)tzrxx.get(i);
				%>
				<tr>
					<td>
						<%= bean.getINV()%>
					</td>
					<td>
						<%= icms.getSysDm("COUNTRY",bean.getCOUNTRY()) %>
					</td>
					<td>
						<%= bean.getCONGRO()%>
					</td>
					<td>
						<%= icms.getSysDm("CURRENCY",bean.getCONGROCUR()) %>
					</td>
					
					<td>
						<%= bean.getCONPROP()%>%
					</td>
					<td>
					
					</td>
				</tr>
				
				
				
				<%
	  }
	
	            if(5-tzrxx.size()>0){
	            
				for(int i=0;i<5-tzrxx.size();i++){
					out.print("<tr><td height='30'></td><td></td><td></td><td></td><td></td><td></td></tr>");
				 }
			 }
		
%>
<tr>


		<td height="30"></td>
		<td height="30"></td>
		<td height="30"></td>
		<td height="30"></td>
		<td height="30"></td>
		<td height="30"></td>
		
	</tr>--%>
				</table>
		
	
<br><p class="PageNext"><br>
<!--########### -->


<span style="font-size: 16pt"><p align="center"><b>指定代表或者共同委托代理人的证明</b></p></span>
<%
 String APPPER="",CONSIGNER="",IFLICENSE1="",IFLICENSE2="",IFLICENSE3="",IFLICENSE4="",CONFROM="",CONTO="",TEL1="",MOBTEL="",CONDATE="",UNIT=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 APPPER=bTable.getAPPPER();
 CONSIGNER =bTable.getCONSIGNER();
 IFLICENSE1=bTable.getIFLICENSE1();
 IFLICENSE2=bTable.getIFLICENSE2();
 IFLICENSE3=bTable.getIFLICENSE3();
 IFLICENSE4=bTable.getIFLICENSE4();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 TEL1=bTable.getTEL();
 MOBTEL=bTable.getMOBTEL();
 CONDATE=bTable.getCONDATE();
 UNIT=bTable.getUNIT();
 }
%>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;指定代表或者委托代理人 ：<%=SysSystem.toUnderlineStr(CONSIGNER,"center",15)%></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托事项及权限：&nbsp;&nbsp;</p>
<table width="82%"  align="center" border="0">
  <tr><td>
	<p align="left" style="line-height:25px;" >
	&nbsp;&nbsp;&nbsp;1、办理<%=SysSystem.toUnderlineStr(DQENTNAME,"center",50)%>（单位名称）的<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=WTYW%>____________事宜。
	<br>
	&nbsp;&nbsp;&nbsp;2.同意<%if("1".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%> 核对登记材料中的复印件并签署核对意见；
	<br>
	&nbsp;&nbsp;&nbsp;3.同意<%if("1".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%> 修改企业自备文件的错误；
	<br>
	&nbsp;&nbsp;&nbsp;4.同意<%if("1".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%> 修改有关表格的填写错误；
	<br>
	&nbsp;&nbsp;&nbsp;5.同意<%if("1".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%> 领取营业执照和有关文书。
	</p>
</td></tr>
</table>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;指定或委托的有效期限：
<%--自&nbsp;&nbsp;<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %>&nbsp;&nbsp;  --%>
至&nbsp;&nbsp;<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %>&nbsp;&nbsp;</p>



<table border="1" width="72%" bordercolor='#000000' align="center">
  <tr>
    <td width="40%" rowspan="3" align="center">指定代表或委托代理人或者经办人信息</td>
    <td align="left" height="30">单位：<span class="NOPRINT" style="color:#CCCCCC"><%=UNIT%></span></td>
  </tr>
  <tr>
    <td align="left" height="30">签字：<%=CONSIGNER %></td>
  </tr>
  <tr>
    <td align="left" height="30">联系电话：<%=(TEL1.equals("")?MOBTEL:TEL1)%></td>
  </tr>
  <tr>
    <td colspan=2 height="270"><p align="center">（指定代表或委托代理人、具体经办人身份证明复印件粘贴处）</p></td>
  </tr>
</table>
<br/><br/>
<table align="center" border="0" width="90%" >
	<tr>
		<td>
			<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请人盖章或签字:&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<p align="right"><%=(CONDATE==null || CONDATE.equals(""))?"":icms.getFormatDate(CONDATE) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 
		</td>
	</tr>
</table>

	</body>
</html>