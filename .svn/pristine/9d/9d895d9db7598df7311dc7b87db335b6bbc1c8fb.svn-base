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
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();	
	String DQENTNAME =QYDJ_JBXX.getENTNAME();
	String checkBox = "□";
	String selected= "√";
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	boolean CYBA=false;//成员备案
	boolean ZCBA=false;//章程备案
	boolean ZCXGBA=false;//章程修改备案
	
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		if(bgsx.getALTITEM().equals("10")){//成员
			CYBA=true;
		}
		if(bgsx.getALTITEM().equals("73")){//章程
			ZCBA=true;
		}
		if(bgsx.getALTITEM().equals("74")){//章程修正案
			ZCXGBA=true;
		}
	}
	String WTYW1="□ 名称预先核准   √ 设立    □ 变更    □ 注销    □ 备案    □ 撤销变更登记";
	String WTYW2="□ 股权出质 （□设立    □变更    □ 注销    □撤销）□ 其他";
%>
<html><head><title>农民专业合作社备案登记申请书</title>
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

<%
 int No=0;
 ArrayList rsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int temp = rsdwtz.size();
%>
<table align="center" width="90%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">农 民 专 业 合 作 社 备 案 表</b><br><br></caption>	
<tr>
<td align="right">
注册号：<%=QYDJ_JBXX.getREGNO() %></td></tr>	
</table>
<table align="center" border="1" width="90%" bordercolor='#000000'>
 <tr>
   <td align="center" height=40>名称</td>
   <td colspan=2><%=QYDJ_JBXX.getENTNAME() %></td>
 </tr>
 <tr>
   <td align="center" height=40>备案事由</td>
   <td align="center">提交的材料</td>
   <td align="center">份数</td>
 </tr>
 <tr>
   <Td rowspan=2 align="center">1、成员发生变更<%if(CYBA){out.print(selected);}else{out.print(checkBox);} %></Td>
   <td align="center" height=40>法定代表人签署的修改后的成员名册</td>
   <td></td>
 </tr>
 <tr>
   <td align="center" height=40>新成员的身份证明</td>
   <td></td>
 </tr>
 <tr>
   <Td rowspan=2 align="center">2、章程修改未涉<br>及登记事项的 
   <%if(ZCBA||ZCXGBA){out.print(selected);}else{out.print(checkBox);} %></Td>
   <td align="center" height=40>法定代表人签署的修改后的章程</td>
   <td></td>
 </tr>
 <tr>
   <td align="center" height=40>法定代表人签署的修改后的章程修正案</td>
   <td></td>
 </tr>
  <tr>
  <td colspan="3" height=100>
&nbsp;&nbsp;&nbsp;&nbsp;本农民专业合作社依照《中华人民共和国农民专业合作社登记管理条例》的有关规定提交备案材料，提交材料真实有效。谨对真实性承担责任。
<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;农民专业合作社盖章：<p>
<br>
 <p align="right"> 年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;</p> 
  </td>
  </tr>
  <tr>
    <td colspan="3" align="center" height=40><b>以下由登记机关填写</b></td>
  </tr>
  <tr>
    <td align="center" height=80>受理<br>审查<br>意见</td>
    <td align="center" colspan=2><br><br><br>受理审查人员签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
    <td align="center" height=40>备案回执文号</td>
    <td colspan=2></td>
  </tr>
</table>
<br>
<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						须知：1、在选择的类型 □ 中打√。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2、在提交材料的份数栏内填写提交材料的实际份数。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3、提交文件、证件复印件应当使用A4纸。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4、应当使用钢笔、毛笔或签字笔工整地填写表格或签名。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;5、以上需签署的，农民专业合作社成员为自然人的由本人签名；自然人以外的设立人加盖公章。
					</P>
				</td>
			</tr>
			
</table>
<%if(CYBA){ %>
<p class="PageNext"><br>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CZXX.inc"%>

<span style="font-size: 16pt"><p align="center"><b>填写农民专业合作社成员出资清单须知</b></p></span>
<table border="0" width="100%" height="700" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td height="700" valign="top">
<ol >
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">出资方式：农民专业合作社成员以货币作为出资的填写“货币”。以实物、知识产权等可以用货币估价并可以依法转让的非货币财产作为出资的，填写非货币财产的具体种类，如房屋、农业机械、注册商标等。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">出资额是成员以货币出资的数额，或者成员以非货币财产出资由全体成员评估作价的货币数额。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">出资成员是自然人的由其签名，是单位的由其盖章。单位盖章可以加盖在出资清单的空白处。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">因出资成员多出资清单写不下的，可另备页面载明。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">应当使用钢笔、毛笔或签字笔工整地填写表格和签名。</font></li>
</ol>
</td>
</tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CYXX.inc" %>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CYZM.inc" %>
<br>
<p class="PageNext"></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>填写农民专业合作社成员名册须知</b></p></span>
<table border="0" width="100%" height="700" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td height="700" valign="top">
<ol >
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">单位成员主体资格：符合《农民专业合作社登记管理条例》第十三条规定条件的企业、事业单位或者社会团体，可以成为农民专业合作社的成员。企业、事业单位或者社会团体的分支机构不得作为农民专业合作社的成员。农业植保站、农业技术推广站、畜牧检疫站以及卫生防疫站、水文检测站等具有管理公共事务职能的单位不得成为农民专业合作社成员。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">证件名称及号码：成员为自然人的，填写“居民身份证”及其号码；成员为单位的，填写主体资格证书及其号码。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">住所：农民专业合作社成员是自然人的住所为现住所，是企业、事业单位或社会团体成员为登记证书上载明的住所。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">成员类型:分为农民成员、非农民成员和单位成员（企业、事业单位或社会团体）三类。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">成员身份证明复印件：农民成员应当提交农业人口户口簿复印件，因地方户籍制度改革等原因不能提交农业人口户口簿复印件的，可以提交居民身份证复印件，以及土地承包经营权证复印件或者村民委员会出具的身份证明。非农民成员应当提交居民身份证复印件。企业、事业单位或者社会团体成员应当提交其登记机关颁发的企业营业执照或者登记证书复印件。成员身份证明复印件粘贴处粘贴不下的，可另备页面粘贴。</font></li>
    <li>
	<p style="line-height: 25px"><font face="楷体_GBK">《农民专业合作社成员名册》写不下的，可另备页面载明。</font></li>
    <li>
	<p style="line-height: 25px"><font face="楷体_GBK">证件复印件应当注明“与原件一致”并由本人签名或者单位盖章。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">提交文件、证件复印件应当使用A4纸。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">应当使用钢笔、毛笔或签字笔工整地填写表格或签名。</font></li>
</ol>
</td>
</tr>
</table>
<%}%>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>