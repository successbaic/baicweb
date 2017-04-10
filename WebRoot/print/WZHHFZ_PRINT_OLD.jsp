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

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
%>
<html><head><title>外商投资合伙企业分支机构设立登记申请书</title>
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


<table border="0" width="100%" style="border-width: 0" cellspacing="0" cellpadding="0" height="880">		
<tr>
<td height="120" align="center" style="line-height: 100px;">			
<p align="center"><span style="font-size: 24pt; font-family: 黑体" >外商投资合伙企业分支机构<br>设立登记申请书</td>
</tr>
<tr>
<td>
<table border="0" width="80%" bordercolor="#000000" style="border-collapse: collapse" align=center>
  <TR>
   <TD COLSPAN=4><br>
   <p style="line-height:40px;"><%=SysSystem.toUnderlineStr("","center",15)%>工商行政管理(总)局：<br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国合伙企业法》、《中华人民共和国合伙企业登记管理办法》、《外国企业或个人在中国境内设立合伙企业管理办法》和《外商投资合伙企业登记管理规定》等有关法律法规和规章，现申请分支机构设立登记，请予核准。
   同时承诺：所提交的文件、证件真实、合法、有效，复印文本与原件一致，并对因提交虚假文件所引发的后果承担法律责任。
   </p>
   </TD>
</TR>
</table></td></tr>
<tr>
<td height="338" align="center">
<table border="0" width="80%" height="234">
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">拟设立分支机构名称</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">隶属企业名称</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getSUPENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">执行事务合伙人或委派代表签字</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>			
	<tr>
		<td width="200"><font style="font-size: 15pt">申   请   日   期</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>
</table></td></tr>
<tr><td align="center">
<font style="font-size: 16pt">中华人民共和国国家工商行政管理总局制</font><p align="center">
<font face="Times New Roman">
<span style="font-size: 16pt; font-weight: 700">HTTP://WWW.SAIC.GOV.CN</span><br>
<span style="font-size: 16pt; font-weight: 700">HTTP://QYJ.SAIC.GOV.CN</span></font></td></tr></table>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>指定代表或委托代理人的证明</b></p></span>
<%
 String CONSIGNER="",CONFROM="",CONTO="",TEL1="",MOBTEL=""; 
 String llrname="",llrbm="",llrtel="",llrmobtel="",llremail="",llraddr="",llrpos=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 CONSIGNER =bTable.getCONSIGNER();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 TEL1=bTable.getTEL();
 MOBTEL=bTable.getMOBTEL();
 }
 ArrayList wzllr=QYDJ_WZLLR.getList(" where OPENO='"+OPENO+"'");
 if(wzllr.size()>0){
 com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ wzllrTable = (com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ)wzllr.get(0);
 llrname=wzllrTable.getNAME();
 llrbm=wzllrTable.getDEPARTMENT();
 llrtel=wzllrTable.getTEL();
 llrmobtel=wzllrTable.getMOBTEL();
 llremail=wzllrTable.getEMAIL();
 llraddr=wzllrTable.getADDR();
 llrpos=wzllrTable.getPOSTALCODE();
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;兹指定/委托<%=SysSystem.toUnderlineStr(CONSIGNER,"left",30)%>办理本企业分支机构设立登记事宜。<br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;指定/委托的有效期限：自<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> 至<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %><br></p>
<p align="right">
&nbsp;&nbsp;&nbsp;&nbsp;委托人 ：<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<br></p>
<p align="right">
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;注：委托人指执行事务合伙人或委派代表。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<span style="font-size: 16pt"><p align="center">指定代表或委托代理人信息</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">姓  名</td>
    <td align="center" height="45" width="20%"><%=CONSIGNER %></td>
    <td width="60%" rowspan="4" align="center">代理人身份证件复印件粘贴处</td>
  </tr>
  <tr>
    <td width="20%" align="center">单  位</td>
    <td align="center" height="45" width="20%"></td>
  </tr>
  <tr>
    <td width="20%" align="center">部  门</td>
    <td align="center" height="45" width="20%"></td>
  </tr>
  <tr>
    <td width="20%" align="center">联系电话</td>
    <td align="center" height="45" width="20%"><%=(TEL1.equals("")?MOBTEL:TEL1)%></td>
  </tr>
</table>
<br>
<span style="font-size: 16pt"><p align="center">工商登记联络员信息</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">姓  名</td>
    <td align="center" height="45" width="20%"><%=llrname %></td>
    <td width="60%" rowspan="7" align="center">身份证复印件粘贴处</td>
  </tr>
  <tr>
    <td width="20%" align="center">部  门</td>
    <td align="center" height="45" width="20%"><%=llrbm %></td>
  </tr>
  <tr>
    <td width="20%" align="center" rowspan="2">联系电话</td>
    <td align="left" height="45" width="20%">固定:<%=llrtel %></td>
  </tr>
  <tr>
    <td align="left" height="45" width="20%">移动:<%=llrmobtel %></td>
  </tr>
  <tr>
    <td width="20%" align="center">电子邮箱</td>
    <td align="center" height="45" width="20%"><%=llremail %></td>
  </tr>
  <tr>
    <td width="20%" align="center">联系地址</td>
    <td align="center" height="45" width="20%"><%=llraddr %></td>
  </tr>
  <tr>
    <td width="20%" align="center">邮政编码</td>
    <td align="center" height="45" width="20%"><%=llrpos %></td>
  </tr>
</table>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构设立登记所需提交的文件</b></p></span>
<table border="1" width="100%" height="350" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center"  >
		<p >序号</td>
		<td >
		<p align="center" >文件名称</td>
	</tr>
	<tr>
		<td width="67" align="center"  >1</td>
		<td >《外商投资合伙企业分支机构设立登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center"  >2<font face="宋体">*</font></td>
		<td >全体合伙人签署的设立分支机构的决定书</td>
	</tr>
	<tr>
		<td width="67" align="center"  >3<font face="宋体">*</font></td>
		<td >全体合伙人签署的委派执行分支机构事务负责人的委托书及其身份证明复印件</td>
	</tr>
	<tr>
		<td width="67" align="center"  >4<font face="宋体" >*</font></td>
		<td >经营场所证明</td>
	</tr>
	<tr>
		<td width="67" align="center"  >5<font face="宋体">*</font></td>
		<td >加盖合伙企业印章的合伙企业营业执照复印件</td>
	</tr>
	<tr>
		<td width="67" align="center"  >6<font face="宋体">*</font></td>
		<td >前置审批文件或证件</td>
	</tr>
	<tr>
		<td width="67" align="center"  >7<font face="宋体">*</font></td>
		<td >其他有关文件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p style="line-height: 30px"><font face="楷体_GBK"><b>规范要求：</b></font></p>
         <ol>
	       <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">本申请书应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">以上文件除标明复印件外，应提交原件。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">上述文件若用外文书写，需提交加盖翻译单位印章的相应中文译本。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">第2项指根据《中华人民共和国合伙企业企业法》、《中华人民共和国合伙企业登记管理办法》以及《中华人民共和国外国企业或者个人在中国境内设立合伙企业管理办法》以及合伙企业协议规定做出的决定书，决定书的内容与所申请的事项应当一致。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">第4项指自有房产提交产权证复印件；租赁房屋提交一年以上租赁协议原件及出租方的产权证复印件，以上不能提供产权证复印件的，提交能够证明产权归属的其他房屋产权使用证明复印件。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">第6项指有关前置许可的批准文件或者许可证书复印件或许可证明，适用于经营范围中有法律、行政法规和国务院规定必须在登记前报经批准的项目的外商投资合伙企业。</font></li>
	      </ol>
	    </td>
	 </tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">外商投资合伙企业分支机构登记事项</b><br><br></caption>
<tr>   
	<td align='center' height=40 nowrap="nowrap" width="15%">分支机构名称</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getENTNAME()%></td>   

    <td align='center' height=40 nowrap="nowrap" width="15%">联系电话</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getTEL()%></td>       
</tr>
<tr>	
	<td align='center' height=40 nowrap="nowrap" width="15%">经营场所</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getDOM()%></td>
 	
 	<td align='center' height=40 width="15%">邮政编码</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getPOSTALCODE()%></td> 	
</tr>
<tr>	
	<td align='center' height=40 nowrap="nowrap" width="15%">负责人</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getLEREP()%></td>
 	
 	<td align='center' height=40 width="15%">从业人数</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getEMPNUM()%></td> 	
</tr>
<tr>
    <td align='center' height=40 nowrap="nowrap">经营期限</td>
    <%-- <td colspan=7>自<%=QYDJ_JBXX.getOPFROM()%>至<%=QYDJ_JBXX.getOPTO()%></td>--%>
    <td colspan=7>自&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至</td>
</tr>
<tr>
    <td rowspan=3 align='center'>隶属企业</td>
    <td align='center' height=40>名称</td> 
    <td colspan=6><%=QYDJ_JBXX.getSUPENTNAME() %></td>
</tr>
<tr>
    <td align='center' height=40>登记机关</td>
    <td colspan=6><%=icms.getSysDm("REGORG",QYDJ_JBXX.getSUPREGORG()) %></td>
</tr>
<tr>
    <td align='center' height=40>注册号</td>
    <td colspan=2><%=QYDJ_JBXX.getSUPREGNO() %></td>
    <td align='center'>电子邮箱</td>
    <td colspan=3><%=QYDJ_JBXX.getSUPEMAIL() %></td>
</tr>
<tr>
	<td height="100" align="center">经<br>营<br>范<br>围</td>
	<td colspan="7" height="100"><%=QYDJ_JBXX.getBUSSCOPE()%></td>
</tr>
<tr> 
	<td align='center' nowrap="nowrap" height=80>许可经营项目</td>   
	<td colspan="7"><%=QYDJ_JBXX.getABUITEMCO()%></td>	
</tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZHHFZ_FZR.inc" %>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构设立登记审批表</b></p></span>
<table align="center" border="1" width="90%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center" height=200>受理<br>意见</td>
    <td align="center"><br><br><br><br>受理人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
    <td width="20%" align="center" height=200>审查<br>意见</td>
    <td align="center"><br><br><br><br>核准人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
   <tr>
    <td width="20%" align="center" height=180>备注</td>
    <td><br><br><br><br></td>
  </tr>
</table>
<p class="PageNext"><br></p>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0">
<br>
	<caption><p><b><font size="4">外商投资合伙企业分支机构领照存单</font></b></p></caption>
	<tr>
	    <td height="40" align="center" width="20%">分支机构名称</td>
		<td align="center" colspan="5">　</td>
	</tr>
	<tr>
		<td height="40" align="center" width="20%">注册号</td>
		<td align="center"  colspan="2">　</td>
		<td align="center"  width="20%">核准日期</td>
		<td align="center"  colspan="2">　</td>
	</tr>
	<tr>
		<td   height="40" align="center" >营业执照编号</td>
		<td  colspan="5" height="40">
		<p align="left">正本：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		副本1：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		副本2：</td>
	</tr>
	<tr>
		<td   height="40" align="center" >缴费数额</td>
		<td width="27%" colspan="2" height="40" align="center" >　</td>
		<td height="40" align="center" >缴费收据号</td>
		<td colspan="2" height="40" align="center">　</td>
	</tr>
	<tr>
		<td   rowspan="4" height="40" align="center" >
		领<br>
		照<br>
		人</td>
		<td  height="40" align="center" nowrap="nowrap">证件名称</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >证件号码</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" width="15%">签&nbsp;&nbsp;&nbsp; 字</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >日&nbsp;&nbsp;&nbsp; 期</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td   rowspan="2" height="40" align="center" >发 照 人</td>
		<td  height="40" align="center" >签&nbsp;&nbsp;&nbsp; 字</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >日&nbsp;&nbsp;&nbsp; 期</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td   height="40" align="center" >备&nbsp;&nbsp;&nbsp; 注</td>
		<td  height="40" colspan="5" align="center" >　</td>
	</tr>
</table>
<p align="left" style="line-height: 150%">
<font face="仿宋_GBK" style="font-size: 11pt">注：领照人应为负责人或其授权人。</font></p>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0">
<caption>
<b><font size="4">归档情况</font></b>
</caption>
	<tr>
		<td height="40" align="center"  >送 档 人</td>
		<td height="40" width="478" >　</td>
	</tr>
	<tr>
		<td height="40" align="center"  >接 档 人</td>
		<td height="40" width="478" >　</td>
	</tr>
	<tr>
		<td height="40" align="center"  >送档日期</td>
		<td height="40" width="478" >　</td>
	</tr>
	<tr>
		<td height="40" align="center"  >备&nbsp;&nbsp;&nbsp; 注</td>
		<td height="40" width="478" >　</td>
	</tr>
</table>
<br>
</body></html>