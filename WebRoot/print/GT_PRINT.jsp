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
<%--jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/--%>
<jsp:useBean id="GTDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"/>
<jsp:useBean id="GTDJ_JYZXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =GTDJ_JBXX.doPreProcess(request.getParameter("OPENO"));

	//QYDJ_YWSB.setOPENO(OPENO);
	//QYDJ_YWSB.doSelect();
	
	GTDJ_JBXX.setOPENO(OPENO);
	GTDJ_JBXX.doSelect();
	
	GTDJ_JYZXX.setOPENO(OPENO);
	GTDJ_JYZXX.doSelect();
	
	String checkBox = "□";
    String selected = "√";
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,GTDJ_JBXX.getTRANAME());
	}
%>
<html><head><title>个体工商户设立登记申请书</title>
<%--out.print(pageshow.pagesetup_default()); --%>
</head>
<body style="text-align: center">
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

<table border="1" width="100%" align="center" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">个体工商户开业登记申请书</b><br><br></caption>
<tr>
	<td align='center' height=35 width="20%">名    称</td>
	<td colspan="5"><%=GTDJ_JBXX.getTRANAME()%></td></tr>
<tr>
    <Td align="center" rowspan=2>备选名称(请选用不同字号)</Td>
    <td colspan="5" height=35>1.</td></tr>
<tr>
    <td colspan="5" height=35>2.</td></tr>
<tr>
    <td align='center' width="20%" rowspan=7>经营者</td>
    <td align='center' width="10%" height=35>姓名</td>
    <td width="30%"><%=GTDJ_JYZXX.getNAME() %></td>
    <td align='center' width="10%">性别</td>
    <td width="15%"><%=icms.getSysDm("SEX",GTDJ_JYZXX.getSEX()) %></td>
    <td rowspan=7 align='center' width="15%">照片<br>粘贴处</td>
</tr>
<tr>
    <td align='center' width="10%" height=35 nowrap=nowrap>身份证号码</td>
    <td colspan=3><%=GTDJ_JYZXX.getCERNO() %></td>
</tr>
<tr>
    <td align='center' width="10%" height=35>住所</td>
    <td colspan=3><%=GTDJ_JYZXX.getDOM() %></td>
</tr>
<tr>
    <td align='center' width="10%" height=35>邮政编码</td>
    <td><%=GTDJ_JYZXX.getPOSTALCODE() %></td>
    <td align='center' width="10%" nowrap=nowrap>联系电话</td>
    <td><%=GTDJ_JYZXX.getTEL() %></td>
</tr>
<tr>
    <td align='center' width="10%" height=35>电子邮箱</td>
    <td ><%=GTDJ_JYZXX.getEMAIL() %></td>
    <td align='center' width="10%" nowrap=nowrap>移动电话</td>
    <td><%=GTDJ_JYZXX.getMOBTEL() %></td>
</tr>
<tr>
    <td align='center' width="10%" height=35>政治面貌</td>
    <td><%=icms.getSysDm("POLSTAND",GTDJ_JYZXX.getPOLSTAND())%></td>
    <td align='center' width="10%">民族</td>
    <td><%=icms.getSysDm("NATION",GTDJ_JYZXX.getNATION()) %></td>
</tr>
<tr>
    <td align='center' width="10%" height=35>文化程度</td>
    <td><%=icms.getSysDm("LITEDEG",GTDJ_JYZXX.getLITEDEG())%></td>
    <td align='center' width="10%">职业状况</td>
    <td><%=GTDJ_JYZXX.getOCCSTBEAPP() %></td>
</tr>
<tr>
   <td align='center' width="20%" rowspan=2>组成形式</td>
   <td height=35 colspan=5>个人经营<%if("1".equals(GTDJ_JBXX.getCOMPFORM())){out.print(selected);}else{out.print(checkBox);}%>  </td>
</tr>
<tr>
   <td height=80>家庭经营<%if("2".equals(GTDJ_JBXX.getCOMPFORM())){out.print(selected);}else{out.print(checkBox);}%></td>
   <td align="center">参加经营的<br>家庭成员姓名<br>及身份证号码</td>
   <td colspan=3><%=GTDJ_JBXX.getFAMMEMBER() %></td>
</tr>
<tr>
   <td align="center" height=150>经营范围</td>
   <td colspan="5" style="font-size:13px;"><%=GTDJ_JBXX.getBUSSCOANDFORM() %></td>
</tr>
<tr>
   <td height=35 align="center">邮政编码</td>
   <td colspan=2><%=GTDJ_JBXX.getPOSTALCODE()%></td>
   <td colspan=2 align="center">联系电话</td>
   <td><%=GTDJ_JBXX.getTEL() %></td>
</tr>
<tr>
   <td height=35 align="center">经营场所</td>
   <td colspan="5"><%=GTDJ_JBXX.getOPLOC() %></td>
</tr>
<tr>
   <td height=35 align="center">从业人员</td>
   <td colspan=2><%=GTDJ_JBXX.getEMPNUM() %>&nbsp;&nbsp;人</td>
   <td colspan=2 align="center">资金数额</td>
   <td><%=GTDJ_JBXX.getCAPAM() %>&nbsp;&nbsp;万元</td>
</tr>
<TR><TD COLSPAN=6><br>&nbsp;&nbsp;&nbsp;&nbsp;本人依照《个体工商户条例》申请登记为个体工商户，提交文件材料真实有效。谨对真实性承担责任。<br><br><br>
<p align="right"> 经营者签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> </TD></TR></table>

<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:12px">
						注：1、手工填写表格和签字请使用黑色或蓝黑色钢笔、毛笔或签字笔，请勿使用圆珠笔。
					</p>
				</td>
			</TR>
			
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<%if(GTDJ_JYZXX.getWHETHERHKMAC().equals("2")){ %>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GT_TWNM.inc" %>
<%} %>
<%if(GTDJ_JYZXX.getWHETHERHKMAC().equals("3")||GTDJ_JYZXX.getWHETHERHKMAC().equals("4")){ %>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GT_GAJM.inc" %>
<%} %>
<br><br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GT_WTDL.inc"%>
<br><br><%--
<p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" cellspacing="0" bordercolor="#000000" cellpadding="0" height="850">
	<caption><p align="center"><b><font size="4">个体工商户开业登记审核表</font></b></p>
	<p align='right' >注册号：<%=SysSystem.toUnderlineStr(GTDJ_JBXX.getREGNO(),"center",30)%></p></caption>
	<tr>
		<td height="40" align="center">名称</td>
		<td colspan="4" height="40"><%=GTDJ_JBXX.getTRANAME() %>　</td>
	</tr>
	<tr>
	    <td align="center" rowspan=3>经营者</td>
	    <td align="center" height="40">姓名</td>
	    <td><%=GTDJ_JYZXX.getNAME() %></td>
	    <td align="center" nowrap=nowrap>身份证号码</td>
	    <td><%=GTDJ_JYZXX.getCERNO() %></td>
	</tr>
	<tr>
	    <td align="center" height="40">住所</td>
	    <td colspan=3><%=GTDJ_JYZXX.getDOM() %></td>
	</tr>
	<tr>
	    <td align="center" height="40">邮政编码</td>
	    <td><%=GTDJ_JYZXX.getPOSTALCODE() %></td>
	    <td align="center" height="40">联系电话</td>
	    <td><%=GTDJ_JYZXX.getTEL() %></td>
	</tr>
	<tr>
	    <td align="center" height="40">组成形式</td>
	    <td colspan=4>个人经营<%if("1".equals(GTDJ_JBXX.getCOMPFORM())){out.print(selected);}else{out.print(checkBox);}%>&nbsp;&nbsp;&nbsp;&nbsp; 
	    家庭经营<%if("2".equals(GTDJ_JBXX.getCOMPFORM())){out.print(selected);}else{out.print(checkBox);}%></td>
	</tr>
	<tr>
		<td  height="140" align="center" ><br>
		经<br>
		营<br>
		范<br>
		围<br>
　       </td>
		<td  colspan="4" height="150" style="font-size:13px;"><%=GTDJ_JBXX.getBUSSCOANDFORM() %>　</td>
	</tr>
	<tr>
	    <td align="center" height="40">经营场所</td>
	    <td colspan=4><%=GTDJ_JBXX.getOPLOC() %></td>
	</tr>
	<tr>
	    <td align="center" height="40">从业人员</td>
	    <td><%=GTDJ_JBXX.getEMPNUM() %>&nbsp;&nbsp;人</td>
	    <td align="center" colspan=2>资金数额</td>
	    <td><%=GTDJ_JBXX.getCAPAM()%>&nbsp;&nbsp;万元</td>
	</tr>
	<tr>
    <td align="center" height=160>受理<br>意见</td>
    <td align="center" colspan=4><br><br><br><br>受理人员签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
    <td align="center" height=160>核准<br>意见</td>
    <td align="center" colspan=4><br><br><br><br>核准人员签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
     <td align="center" height="40">准予设立登记通知书文号</td>
     <td colspan=4></td>
  </tr>
  <tr>
     <td align="center" height="40">营业执照注册号</td>
     <td colspan=4><%=GTDJ_JBXX.getREGNO() %></td>
  </tr>
  <tr>
     <td align="center" height="40">归档日期</td>
     <td colspan=4></td>
  </tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GT_LZQD.inc"%> --%>
</body></html>