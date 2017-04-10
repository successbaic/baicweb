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
%>
<html><head><title>外商投资合伙企业分支机构注销登记申请书</title>
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
<p align="center"><span style="font-size: 24pt; font-family: 黑体" >外商投资合伙企业分支机构<br>注销登记申请书</td>
</tr>
<tr>
<td>
<table border="0" width="80%" bordercolor="#000000" style="border-collapse: collapse" align=center>
  <TR>
   <TD COLSPAN=4><br>
   <p style="line-height:40px;"><%=SysSystem.toUnderlineStr("","center",15)%>工商行政管理(总)局：<br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国合伙企业法》、《中华人民共和国合伙企业登记管理办法》、《外国企业或个人在中国境内设立合伙企业管理办法》和
   《外商投资合伙企业登记管理规定》等有关法律法规和规章，现申请分支机构注销登记，请予核准。同时承诺：所提交的文件、证件真实、合法、有效，复印文本与原件一致，
   并对因提交虚假文件所引发的后果承担法律责任。
   </p><br>
   </TD>
</TR>
</table></td></tr>
<tr>
<td height="308" align="center">
<table border="0" width="70%" height="234">
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">合伙企业分支机构名称</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">分支机构注册号</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getREGNO(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">执行事务合伙人或委派代表签字</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>			
    <tr>
		<td nowrap="nowrap" colspan=2><font style="font-size: 15pt">申  请  日  期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</font><br></td></tr>
</table><br></td></tr>
<tr><td align="center">
<font style="font-size: 16pt">中华人民共和国国家工商行政管理总局制</font><p align="center">
<font face="Times New Roman">
<span style="font-size: 16pt; font-weight: 700">HTTP://WWW.SAIC.GOV.CN</span><br>
<span style="font-size: 16pt; font-weight: 700">HTTP://QYJ.SAIC.GOV.CN</span></font></td></tr></table>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>指定代表或委托代理人证明</b></p></span>
<%
 String CONSIGNER="",CONFROM="",CONTO=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 CONSIGNER =bTable.getCONSIGNER();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;兹指定/委托<%=SysSystem.toUnderlineStr(CONSIGNER,"left",30)%>办理本企业分支机构注销登记事宜。<br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;指定/委托的有效期限：自<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> 至<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %><br></p>
<p align="right">
&nbsp;&nbsp;&nbsp;&nbsp;委托人 ：<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<br></p>
<p align="right">
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;注：委托人为分支机构负责人。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<span style="font-size: 16pt"><p align="center">指定代表或委托代理人信息</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">姓  名</td>
    <td align="center" height="45" width="20%"></td>
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
    <td align="center" height="45" width="20%"></td>
  </tr>
</table>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构注销登记<br>所需提交的文件</b></p></span>
<table border="1" width="100%" height="200" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center"  >
		<p >序号</td>
		<td >
		<p align="center" >文件及印章名称</td>
	</tr>
	<tr>
		<td width="67" align="center"  >1</td>
		<td >《外商投资合伙企业分支机构注销登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center"  >2<font face="宋体">*</font></td>
		<td >隶属企业依法做出的决定书</td>
	</tr>
	<tr>
		<td width="67" align="center"  >3</td>
		<td >营业执照正、副本</td>
	</tr>
	<tr>
		<td width="67" align="center"  >4</td>
		<td >其他相关文件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p style="line-height: 30px"><font face="楷体_GBK"><b>规范要求：</b></font></p>
         <ol>
	       <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">申请书应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">以上文件除标明复印件外，应提交原件。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">以上提交文件如为外文，需提交中文译文，并加盖翻译单位公章。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">第2项指根据《中华人民共和国合伙企业企业法》、《中华人民共和国合伙企业登记管理办法》以及《中华人民共和国外国企业或者个人在中国境内设立合伙企业管理办法》以及合伙企业协议规定做出的决定书，决定书的内容与所申请的事项应当一致。分支机构被依法责令关闭、吊销营业执照的，应当提交行政机关责令关闭、吊销营业执照的决定。</font></li>
	      </ol>
	    </td>
	 </tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构注销登记审批表</b></p></span>
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
<br><p class="PageNext"><br>
<!--########### -->
<% 
	QYDJ_ZXXX.setOPENO(OPENO);
	QYDJ_ZXXX.doSelect();
 %>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">外商投资合伙企业分支机构注销登记申请书</b><br><br></caption>
<tr>
	<td align="center" height=40>分支机构名称</td>
	<td colspan="6"><%=QYDJ_JBXX.getENTNAME()%></td>
</tr>
<tr>
	<td align="center" nowrap="nowrap" height=40>注 册 号</td>	
	<td colspan="6"><%=QYDJ_JBXX.getREGNO()%></td>
</tr>
<tr>
	<td align="center" height=40>经营场所</td>	
	<td colspan="6"><%=QYDJ_JBXX.getDOM()%></td>
</tr>
<tr>
    <td align="center" height="40" nowrap="nowrap">负责人</td>
	<td colspan="6"><%=QYDJ_JBXX.getLEREP()%></td>
</tr>
<tr>
    <td align="center" height="40">经营期限</td>
	<td colspan="6">自<%=QYDJ_JBXX.getOPFROM() %>&nbsp;&nbsp;&nbsp;&nbsp;至<%=QYDJ_JBXX.getOPTO()%></td>
</tr>
<tr>
	<td align="center" height="100">注销原因</td>
	<td colspan="6"><%=icms.getSysDm("CANREA",QYDJ_ZXXX.getCANREA()) %></td>
</tr>
<tr>
	<td align="center" rowspan="2" nowrap="nowrap">证照缴销情况</td>
	<td align="center" height="40" nowrap="nowrap" width="15%">营业执照正本</td>
	<td align="center" height="40" nowrap="nowrap" width="10%">数量</td>
    <td><%=QYDJ_ZXXX.getBLICREVORINUM()%></td>
    <td align="center" height="40" nowrap="nowrap" width="10%">编号</td>
    <td colspan="2"><%=QYDJ_ZXXX.getBLICREVORINO()%></td>
</tr>
<tr>
    <td align="center" height="40">营业执照副本</td>
    <td align="center" height="40">数量</td>
    <td><%=QYDJ_ZXXX.getBLICREVDUPCONUM()%></td>
    <td align="center" height="40">编号</td>
    <td colspan="2"><%=QYDJ_ZXXX.getBLICREVDUPCONO()%></td>    
</tr>
<tr>
    <td align="center" height="120">备注</td>
    <td colspan="6"><%=QYDJ_ZXXX.getREMARK()%></td>
</tr>
</table>
<br>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0">
<p>　</p>
<p>　</p>
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
</html>