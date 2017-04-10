<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="HWGG_JBXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_JBXX_SQ"/>
<jsp:useBean id="HWGG_FBZXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_FBZXX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
String OPENO = request.getParameter("OPENO");
String OPETYPE = request.getParameter("OPETYPE");
HWGG_JBXX.setOPENO(OPENO);
HWGG_JBXX.doSelect();
HWGG_FBZXX.setOPENO(OPENO);
HWGG_FBZXX.doSelect();
	String checkBox = "□";
    String selected = "√";
%>
<html><head><title>户外广告登记申请表</title>
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
<p  align="right" >
<input type="button" value="打印报告书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉页脚"清空)</font>
</p>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt"><center>户外广告登记申请表</center></b><br><br></caption>
编号：<%=HWGG_JBXX.getADREGCNO() %>
申请日期：<%=HWGG_JBXX.getAPPDATE() %>
<tr>
	<td align='center' height=44 width="10px" rowspan='5'>发布单位情况</td>
	<td align='center' width='15%'>名称</td>
	<td colspan='4'><%=HWGG_FBZXX.getADISSENT() %></td>
</tr>

<tr>
	<td align='center' width='15%'>地址</td>
	<td colspan='4'><%=HWGG_FBZXX.getADDR() %></td>
</tr>

<tr>
	<td align='center' width='15%'>类型</td>
	<td colspan='2'><%=icms.getSysDm("ENTTYPE",HWGG_FBZXX.getADISSENTTYPE())%>		
	</td>
	<td align='center' width='15%'>邮编</td>
	<td><%=HWGG_FBZXX.getPOSTALCODE() %></td>
</tr>

<tr>
	<td align='center' width='15%'>发定代表人(负责人)</td>
	<td colspan='2'><%=HWGG_FBZXX.getLEREP() %></td>
	<td align='center' width='15%'>营业执照编号</td>
	<td><%=HWGG_FBZXX.getBLICNO() %></td>
</tr>

<tr>
	<td align='center' width='15%'>联系人</td>
	<td colspan='2'><%=HWGG_FBZXX.getLINKMAN()%></td>
	<td align='center' width='15%'>联系电话</td>
	<td><%=HWGG_FBZXX.getTEL() %></td>
</tr>

<tr>
	<td align='center' height=44 width="10px" rowspan='5'>申请登记事项</td>
	<td align='center' width='15%'>广告发布地点及具体位置</td>
	<td colspan='4'><%=HWGG_JBXX.getADISSSPOT() %></td>
</tr>

<tr>
	<td align='center' width='15%'>广告发布期限</td>
	<td colspan='4'><%=HWGG_JBXX.getADISSFROM() %>至<%=HWGG_JBXX.getADISSTO() %></td>
</tr>

<tr>
	<td align='center' width='15%'>广告形式</td>
	<td colspan='4'>
	<%String adForm  =  HWGG_JBXX.getADFORM();
	String lx="";
	if("01".equals(adForm)){
		lx="展示牌";
	}
	if("02".equals(adForm)){
		lx="电子显示装置";
	}
	if("03".equals(adForm)){
		lx="灯箱";
	}
	if("04".equals(adForm)){
		lx="霓虹灯";
	}
	if("05".equals(adForm)){
		lx="交通工具";
	}
	if("06".equals(adForm)){
		lx="水上漂浮物";
	}
	if("07".equals(adForm)){
		lx="升空器具";
	}
	if("08".equals(adForm)){
		lx="充气物";
	}
	if("09".equals(adForm)){
		lx="模型";
	}
	if("10".equals(adForm)){
		lx="墙体广告";
	}
	if("11".equals(adForm)){
		lx="条幅";
	}
	if("99".equals(adForm)){
		lx="其它";
	}
	%>
	<%=lx %>
	</td>
</tr>

<tr>
	<td align='center' width='15%'>广告数量及规格</td>
	<td colspan='4'><%=HWGG_JBXX.getADSPF() %></td>
</tr>

<tr>
	<td align='center' width='15%'>广告名称</td>
	<td colspan='4'><%=HWGG_JBXX.getADNAME() %></td>
</tr>
<tr>
<td align='center' height=84 width="10px">申请材料目录</td>
<td colspan='5'>
<%=HWGG_JBXX.getADSTUFF() %>
</td>
</tr>
<tr>
<td colspan='6'>
<p valgn='top' align='left'>法定代表人(负责人)签字:
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
单位盖章:&nbsp&nbsp&nbsp&nbsp&nbsp
</p>
<br><br><br>
<p valgn='bottom' align='right'>年&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp日</p>
</td>
</tr>
</table>

<table align="center" border="0" width="90%" >
<tr>
<td>
<p align=left style="font-size:10px">
<font size='2'>
<br>注：1、发布单位情况中“类型”一栏应视实际情况填写国有企业、国有事业、集体企业、集体事业、私营企业、个体工商户、外商投资企业或联营企业等。发布单位为非企业单位时，“营业执照编号”一栏应填写其与营业执照具有同等法律效力的经营资格证明文件的名称及编号。
<br>2、申请登记事项中“广告名称”一栏应视实际情况填写XX商品广告或XX服务广告等。

</font>
</p>
</td>
</tr>
</table>
</body></html>