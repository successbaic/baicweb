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
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	
%>
<html><head><title>集团注销登记申请书</title>
<script language="javascript">
var hkey_root,hkey_path,hkey_key;
hkey_root="HKEY_CURRENT_USER";
hkey_path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";

//设置网页打印的页眉页脚为默认值
function pagesetup_default(){
try{
var RegWsh = new ActiveXObject("WScript.Shell");
hkey_key="footer";
RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"<%=icms.getSysDm("REGORG",QYDJ_YWSB.getREGORG())%>-<%=QYDJ_YWSB.getAPPRPER()%>-<%=QYDJ_YWSB.getAPPRDATE()%>");
}catch(e){}
}
</script>
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

<span style="font-size: 16pt"><p align="center"><b>指定代表或者共同委托代理人的证明</b></p></span>
<%String checkBox = "□";
  String selected = "√";
  String CONSIGNER="",CONFROM="",CONTO="",CONITEM="",IFLICENSE3="",APPPER="",SIGN="",TEL1="", MOBTEL="",IFLICENSE1="",IFLICENSE2="",IFLICENSE4=""; 
  ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
  if(sqwt.size()>0){
    com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
    CONSIGNER =bTable.getCONSIGNER();
    CONFROM=bTable.getCONFROM();
    CONTO=bTable.getCONTO();
    CONITEM=bTable.getCONITEM();
    IFLICENSE3=bTable.getIFLICENSE3();
    IFLICENSE2 = bTable.getIFLICENSE2();
    IFLICENSE1 = bTable.getIFLICENSE1();
    IFLICENSE4 = bTable.getIFLICENSE4();
    APPPER=bTable.getAPPPER();
    //SIGN=bTable.getSIGN();
    TEL1 = bTable.getTEL();
    MOBTEL = bTable.getMOBTEL();
 }
%>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请人:<%=SysSystem.toUnderlineStr(APPPER,"left",30)%><br></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;指定代表或者委托代理人:<%=SysSystem.toUnderlineStr(CONSIGNER,"left",30)%><br></p>

<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;委托事项及权限 ：</p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、办理&nbsp;<u><%=QYDJ_JBXX.getENTNAME()%></u>&nbsp;（企业名称）□注销手续。<br></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、同意<%if("1".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%>不同意<%if("2".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);} %>    核对登记材料中的复印件并签署核对意见；<br></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、同意<%if("1".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%>不同意<%if("2".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);} %>    修改企业自备文件的错误；<br></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、同意<%if("1".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%>不同意<%if("2".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);} %>    修改有关表格的填写错误；<br></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5、同意<%if("1".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%>不同意<%if("2".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);} %>    领取营业执照和有关文书；<br></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;指定或者委托的有效期限：自&nbsp;&nbsp;&nbsp;&nbsp;<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> &nbsp;&nbsp;&nbsp;&nbsp;至<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %><br></p>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center" rowspan="3">指定代表或者<br>委托代理人联系电话</td>
    <td align="center" height="45" width="20%">签&nbsp;&nbsp;&nbsp;&nbsp;字：</td>
    <td colspan="4" align="left" height=40><%=SIGN%></td>
  </tr>
  <tr>
    <td align="center" height="45" width="20%">固定电话：</td>
    <td colspan="4" align="left" height=40><%=TEL1%></td>
  </tr>
    <tr>
    <td align="center" height="45" width="20%">移动电话：</td>
    <td colspan="4" align="left" height=40><%=MOBTEL%></td>
  </tr>
</table>
<br><br>
<table align="center" border="1" width="60%" bordercolor='#000000'>
  <tr>
    <td height="200" align="center">（指定代表或者委托代理人身份证复印件粘贴处）</td>
  </tr>
</table>
<br>
<table align="center" border="0" width="90%" >
<tr><td>
<p align="right">
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="left" style="font-size: 15px">注：1、手工填写表格和签字请使用黑色或蓝黑色钢笔、毛笔或签字笔，请勿使用圆珠笔。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、设立登记，有限责任公司申请人为全体股东；国有独资公司申请人为国务院或地方人民政府国有资产监督管理机构；股份有限公司申请人为董事会；非公司企业申请人为出资人；变更、注销登记申请人为本企业；企业集团登记申请人为母公司。<br> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、委托事项及权限：第1项应当选择相应的项目并在□中打√， 或者注明其它具体内容；第2、3、4、5项选择“同意”或“不同意”并在□中打√。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、指定代表或者委托代理人可以是自然人，也可以是其他组织；指定代表或者委托代理人是其他组织的，应当另行提交其他组织证书复印件及其指派具体经办人的文件、具体经办人的身份证件。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5、自然人申请人由本人签字，非自然人申请人加盖公章。<br>
</p>
</td>
  </tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<% 
	String AFFWRITNO="",CanRea="",DECLEBRSIGN="",CANCELBRSIGN="",EXTCLEBRSIGN="",PUBNEWSNAME="",PUBDATE="",RETURNSIGN="";
	ArrayList zxxxList=QYDJ_ZXXX.getList(" where OPENO='"+OPENO+"'");
  if(zxxxList.size()>0){
    com.macrosoft.icms.qydj.QYDJ_ZXXX_SQ zxxxbTable = (com.macrosoft.icms.qydj.QYDJ_ZXXX_SQ)zxxxList.get(0);
    //AFFWRITNO =zxxxbTable.getAFFWRITNO();				//清算组成员《备案通知书》文号
    CanRea = zxxxbTable.getCANREA();    				//注销原因
	DECLEBRSIGN = zxxxbTable.getDECLEBRSIGN();			//债权债务清理情况
	CANCELBRSIGN = zxxxbTable.getCANCELBRSIGN();		//分公司注销登记手续办理情况
	EXTCLEBRSIGN = zxxxbTable.getEXTCLEBRSIGN();		//对外投资清理情况
	//RETURNSIGN = zxxxbTable.getRETURNSIGN();			//缴回公章情况
	PUBNEWSNAME = zxxxbTable.getPUBNEWSNAME();			//公告报纸名称
	PUBDATE = zxxxbTable.getPUBDATE();					//公告日期
 }
 %>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt"><b>集团注销登记申请书</b><br><br></caption>
<tr>
	<td align="center" colspan="2" height=40>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</td>
	<td colspan="2" align="left"><%=QYDJ_JBXX.getENTNAME()%></td>
</tr>
<tr>
    <td align="center" height=40  colspan="2" nowrap="nowrap">法定代表人姓名</td>
	<td align="left" colspan="2"><%=QYDJ_JBXX.getLEREP()%></td>
</tr>
<tr>
	<td align="center" colspan="2" width="30%">住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所</td>	
	<td colspan="2" align="left" height=40 width="70%"><%=QYDJ_JBXX.getDOM()%></td>
</tr>
<tr>
	<td align="center" height="40" colspan="2">公&nbsp;司&nbsp;类&nbsp;型</td>
	<td align="left" colspan="2"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>
</tr>
<%--<tr>--%>
<%--	<td align="center" height=40  colspan="2">缴回公章情况</td>--%>
<%--	<td align="left" colspan="2"><%if("1".equalsIgnoreCase(RETURNSIGN)){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕<br><%if("2".equalsIgnoreCase(RETURNSIGN)){out.print(selected);}else{out.print(checkBox);}%> 未清理完毕  &nbsp;&nbsp;&nbsp;&nbsp;</td>--%>
<%--</tr>--%>
<tr>
	<td align="center" height=40  colspan="2">申请注销登记原因</td>
	<td align="left" colspan="5"><%if("60".equalsIgnoreCase(CanRea)){out.print(selected);}else{out.print(checkBox);}%> 企业集团章程规定的终止事由出现<br><%if("90".equalsIgnoreCase(CanRea)){out.print(selected);}else{out.print(checkBox);}%> 已不符合集团登记的条件<br><%if("50".equalsIgnoreCase(CanRea)){out.print(selected);}else{out.print(checkBox);}%> 母公司依法被注销或者被吊销营业执照<br><%if("90".equalsIgnoreCase(CanRea)){out.print(selected);}else{out.print(checkBox);}%> 其它情形<br><br>  &nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<%--<tr>--%>
<%--	<td align="center" height=40  colspan="2">对外投资是否清理完毕</td>--%>
<%--	<td align="left" colspan="5"><%if("1".equalsIgnoreCase(EXTCLEBRSIGN)){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕<br><%if("2".equalsIgnoreCase(EXTCLEBRSIGN)){out.print(selected);}else{out.print(checkBox);}%> 未清理完毕 &nbsp;&nbsp;&nbsp;&nbsp;</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--	<td align="center" height=40  colspan="2">非法人分支机构是否注销完毕</td>--%>
<%--	<td align="left" colspan="5"><%if("1".equalsIgnoreCase(CANCELBRSIGN)){out.print(selected);}else{out.print(checkBox);}%> 已办理完毕<br><%if("2".equalsIgnoreCase(CANCELBRSIGN)){out.print(selected);}else{out.print(checkBox);}%> 未办理完毕  &nbsp;&nbsp;&nbsp;&nbsp;</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--	<td align="center" height=40  colspan="2">债权债务清理情况</td>--%>
<%--	<td align="left" colspan="2"><%if("1".equalsIgnoreCase(DECLEBRSIGN)){out.print(selected);}else{out.print(checkBox);}%> 已清理完毕<br><%if("2".equalsIgnoreCase(DECLEBRSIGN)){out.print(selected);}else{out.print(checkBox);}%> 未清理完毕  &nbsp;&nbsp;&nbsp;&nbsp;</td>--%>
<%--</tr>--%>

<%--<tr>--%>
<%--	<td align="center" height=40  colspan="1" rowspan="2">公告情况</td>--%>
<%--	    <td align="center" height="45" width="20%">公告报纸名称</td>--%>
<%--    <td colspan="2" align="center" height=40><%=PUBNEWSNAME%></td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <td align="center" height="45" width="20%">公告日期</td>--%>
<%--    <td colspan="2" align="center" height=40><%=PUBDATE%></td>--%>
<%--  </tr>--%>
<tr>
   <td colspan="6"><br><p style="line-height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;本公司依照《企业集团登记管理暂行办法》申请企业集团注销登记，提交材料真实有效。谨此对真实性承担责任。</p><br><br>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 母公司盖章：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;母公司法定代表人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="right">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br> </TD></TR>

</table>
<table border="0" width="100%" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
        <td>
         <p align="left" style="font-size:15px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：1、手工填写表格和签字请使用黑色或蓝黑色钢笔、毛笔或签字笔，请勿使用圆珠笔。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、因公司合并、分立而申请注销登记的，清算组负责人签字栏由公司法定代表人签字。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
       </td>
    </tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->

<p class="PageNext"><br></p>
<!--########### -->

</html>