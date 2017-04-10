
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
<%@ page import="com.macrosoft.icms.util.TwoDimensionCode" %>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="GTDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"/>
<jsp:useBean id="GTDJ_JYZXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="GTDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_ZXXX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =GTDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	GTDJ_JBXX.setOPENO(OPENO);
	GTDJ_JBXX.doSelect();
	
	GTDJ_JYZXX.setOPENO(OPENO);
	GTDJ_JYZXX.doSelect();
	
	GTDJ_ZXXX.setOPENO(OPENO);
	GTDJ_ZXXX.doSelect();
	
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
<html><head><title>个体工商户注销登记申请书</title>
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

<table width="90%" align="center" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">个体工商户注销登记申请书</b><br><br></caption>
<tr>
    <td colspan="3" align="right" style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">统一社会信用代码：<%=GTDJ_JBXX.getUNISCID() %></td>
</tr>	
<tr>
    <td colspan="3" align="right" style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">注册号：<%=GTDJ_JBXX.getREGNO() %></td>
</tr>	
</table>
<table border="1" width="90%" align="center" bordercolor="#000000">
<tr>
	<td align="center" height=40 width="15%">名   称</td>
	<td colspan="4"><%=GTDJ_JBXX.getTRANAME()%></td>
</tr>
<tr>
	<td align="center" rowspan=3>经营者</td>
	<td align="center" height=40 width="15%">姓名</td>
	<td><%=GTDJ_JYZXX.getNAME()%></td>
	<td align="center" width="15%">身份证号码</td>
	<td><%=GTDJ_JYZXX.getCERNO()%></td>
</tr>
<tr>
    <td align="center" height=40>住所</td>
    <td colspan=3><%=GTDJ_JYZXX.getDOM() %></td>
</tr>
<tr>
    <td align="center" height=40>邮政编码</td>
    <td><%=GTDJ_JYZXX.getPOSTALCODE() %></td>
    <td align="center" height=40>联系电话</td>
    <td><%=GTDJ_JYZXX.getTEL() %></td>
</tr>
<tr>
    <td align="center" height=40>组成形式</td>
    <td colspan=4 align="center">个人经营<%if("1".equals(GTDJ_JBXX.getCOMPFORM())){out.print(selected);}else{out.print(checkBox);}%>
    &nbsp;&nbsp;&nbsp;&nbsp;家庭经营<%if("2".equals(GTDJ_JBXX.getCOMPFORM())){out.print(selected);}else{out.print(checkBox);}%></td>
</tr>
<tr>
    <td align="center" height=100>注销原因</td>
	<td colspan="4"><%=icms.getSysDm("TRACANREA",GTDJ_ZXXX.getCANREGREA()) %></td>
</tr><tr>
    <td align="center" height=40>清税证明文号</td>
    <td colspan="2"><%=GTDJ_ZXXX.getQSZMWH() %></td>
    <td align="center" height=40>清税证明开具时间</td>
    <td colspan="2"><%=GTDJ_ZXXX.getQSZMKJTIME() %></td>
</tr>
<tr>
    <td align="center" height=40>备注</td>
	<td colspan="4"><%=GTDJ_ZXXX.getREMARK() %></td>
</tr>
<tr>
   <td colspan="5"><p style="line-height: 25px">&nbsp;&nbsp;&nbsp;&nbsp;本人依照《个体工商户条例》申请注销登记，提交文件材料真实有效。谨对真实性承担责任。</p><br>
   <p align="left"> &nbsp;&nbsp;&nbsp;&nbsp;经营者签名：</p><br>
   <p align="right">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
	</td>
</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<p class="PageNext"></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>填写个体工商户注销登记申请书须知</b></p></span>
<table border="0" width="100%" height="700" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td height="700" valign="top">
<ol >
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">个体工商户申请注销登记的，应当依照《个体工商户条例》和国家工商总局《个体工商户登记管理办法》有关规定向其经营场所所在地登记机关提交：①经营者签署的《个体工商户注销登记申请书》；②经营者的身份证复印件。
	<br>委托代理人办理的，还应当提交经营者签署的《委托代理人证明》及委托代理人身份证复印件。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">家庭经营的个体工商户申请注销登记的，应当由全体参加经营家庭成员在《个体工商户注销登记申请书》经营者签名栏中予以签字确认。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">个体工商户申请注销登记的，应当缴回个体工商户营业执照正本及所有副本。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">应当使用钢笔、毛笔或签字笔工整地填写表格或签名，请勿使用圆珠笔。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">在选择的类型 □ 中打√。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">提交的申请书与其它申请材料应当使用A4型纸。
	<br>以上各项未注明提交复印件的，应当提交原件；提交复印件的，应当注明“与原件一致”并由个体工商户经营者或者由其委托的代理人签字。</font></li>
</ol>
</td>
</tr>
</table>


<%--
<p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" cellspacing="0" bordercolor="#000000" cellpadding="0">
	<caption><p align="center"><b><font size="4">个体工商户注销登记审核表</font></b></p>
	<p align='right' >注册号：<%=SysSystem.toUnderlineStr(GTDJ_JBXX.getREGNO(),"center",30)%></p></caption>
	<tr>
     <td align="center" height="40" width="20%">名  称</td>
     <td colspan=4><%=GTDJ_JBXX.getTRANAME() %></td>
  </tr> 
  <tr>
     <td align="center" height="40" width="20%">经营者姓名</td>
     <td colspan=4><%=GTDJ_JBXX.getOPERNAME() %></td>
  </tr>
	<tr>
    <td align="center" height=260>受<br>理<br>意<br>见</td>
    <td align="center" colspan=4><br><br><br><br>受理人员签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
    <td align="center" height=260>核<br>准<br>意<br>见</td>
    <td align="center" colspan=4><br><br><br><br>核准人员签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
     <td align="center" height="40" colspan=2 width="30%">准予注销登记通知书文号</td>
     <td colspan=3></td>
  </tr>
  <tr>
     <td align="center" height="40" colspan=2 width="30%">营业执照正、副本收缴情况</td>
     <td colspan=3>正本：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;副本：</td>
  </tr>
</table> --%>
<br><p class="PageNext"><br>
<!--########### -->
<%@ include file="public/GT_WTDL.inc" %>

</body></html>