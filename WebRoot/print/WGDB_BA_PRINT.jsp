
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
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String PRIPID=QYDJ_JBXX.getPRIPID();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
 String checkBox = "□";
	String selected= "√";
	String WTYW="名称核准□、设立□、变更□、注销□、备案√、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	
	String NEW_NAME="";//外国（地区）企业有权签字人姓名
	String OLD_NAME="";
	
	String NEW_ZRXS="";//外国（地区）企业企业责任形式
	String OLD_ZRXS="";
	
	String NEW_ZB="";//外国（地区）企业资本（资产）
	String OLD_ZB="";
	
	String NEW_JYFW="";//外国（地区）企业经营范围
	String OLD_JYFW="";
	
	String NEW_DB="";
	String OLD_DB="";
	
	boolean MCBG=false;//名称变更
	boolean DBBA=false;//代表/首席代表变更

	
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		if(bgsx.getALTITEM().equals("90")){//外国（地区）企业有权签字人姓名
			OLD_NAME=bgsx.getALTBE();
			NEW_NAME=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("91")){//外国（地区）企业企业责任形式
			OLD_ZRXS=bgsx.getALTBE();
			NEW_ZRXS=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("92")){//外国（地区）企业资本（资产）
			OLD_ZB=bgsx.getALTBE();
			NEW_ZB=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("93")){//外国（地区）企业经营范围
			OLD_JYFW=bgsx.getALTBE();
			NEW_JYFW=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("94")){//首席代表
			ArrayList dbOldList = QYDJ_RYXX_ZS.getList(" where field002='sub02_01' and field001='"+QYDJ_JBXX.getPRIPID()+"'");
			for (int j = 0; j<dbOldList.size();j++){
				com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS dbOld=(com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS)dbOldList.get(j);
				OLD_DB+=dbOld.getNAME()+" ;  ";
			}
			  ArrayList dbNewList=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' ");  
			  for(int j=0;j<dbNewList.size();j++){
			    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ dTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)dbNewList.get(j);
			    NEW_DB+=dTable.getNAME()+" ;  ";
			    }
			DBBA=true;
		}
	}
%>
<html><head><title>外国（地区）企业常驻代表机构备案申请书</title>
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
<br>

<table  width="100%" align="center" bordercolor="#000000">
<caption align="center"><b>
	<span style="font-size: 16pt">外国（地区）企业常驻代表机构<br>备案申请书	<br><br></caption>
	<tr><td colspan="3" align="right"  style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none"> 登记证编号：<%=QYDJ_JBXX.getREGNO() %></td></tr>	
	</table>
<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
    <td align="center" width="20%" height=40>项    目</td>
	<td align="center" width="40%" height=40>原备案事项</td>
	<td align="center" width="40%" height=40>申请备案事项</td>
</tr>
<tr>
     <td align="center">外国（地区）企业<br>有权签字人姓名</td>
	<td width="40%" height=40><%=OLD_NAME %></td>
	<td width="40%" height=40><%=NEW_NAME %></td>
</tr>

<tr>
     <td align="center">外国（地区）企业<br>企业责任形式</td>
	<td width="40%" height=40><%if("0".equals(OLD_ZRXS)){out.print("无");} 
									else if("1".equals(OLD_ZRXS)){out.print("有限责任形式");} 
									else if("2".equals(OLD_ZRXS)){out.print("无限责任形式");} 
								%></td>
	<td width="40%" height=40><%if("0".equals(NEW_ZRXS)){out.print("无");} 
									else if("1".equals(NEW_ZRXS)){out.print("有限责任形式");} 
									else if("2".equals(NEW_ZRXS)){out.print("无限责任形式");} 
								%></td>
</tr>
<tr>
     <td align="center">外国（地区）企业<br>资本（资产）</td>
	<td width="40%" height=40><%=OLD_ZB %> &nbsp;万美元</td>
	<td width="40%" height=40><%=NEW_ZB %> &nbsp;万美元</td>
</tr>


<tr>
     <td align="center">外国（地区）企业<br>经营范围</td>
	<td width="40%" height=40><%=OLD_JYFW %></td>
	<td width="40%" height=40><%=NEW_JYFW %></td>
</tr>



<tr>
     <td rowspan="1" align="center">代表姓名</td>
	<td width="40%" height=80><%=OLD_DB %></td>
	<td width="40%" height=80><%=NEW_DB %></td>
</tr>

<tr>
   <td colspan="3">
	 <p  style="line-height:30px; word-spacing: 1px; margin-top: 20px" align="center" > &nbsp;&nbsp;&nbsp;&nbsp; 本企业依照相关法律法规有关规定申请设立登记，提交材料真实有效。</p>
	 <p  style="line-height:30px; word-spacing: 1px; margin-top: 60px" align="left" > &nbsp;&nbsp;&nbsp;&nbsp; 外国（地区）企业有权签字人签字：</p>
			<p align="right" style="vertical-align: top">　（机构印章）&nbsp;&nbsp;&nbsp;&nbsp;</p>
		<p style="vertical-align: top" align="right" > &nbsp;&nbsp;年        &nbsp;&nbsp;月        &nbsp;&nbsp; 日&nbsp;&nbsp;&nbsp;&nbsp;</p>　</td>
	</tr>  
	<tr>
	<td align="center" height=60>备注</td>
	<td colspan="2"></td>
	</tr>
</table>
<%
	if(DBBA){
		ArrayList newdbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'");
		  for(int n=0;n<newdbr.size();n++){
		    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)newdbr.get(n);    
		%>
		<br><p class="PageNext"><br>
		<!--########### -->
		<table align="center" border="1" width="100%" bordercolor='#000000'>
		<caption><p align="center"><b>
			<span style="font-size: 16pt">外国（地区）企业常驻代表机构人员登记表</b><br><br></caption>	
		<tr>
		   <td align="center" width="20%" height=40 nowrap="nowrap">机构名称</td>
		   <td width="65%" colspan="3"><%=QYDJ_JBXX.getENTNAME() %></td>
		   <td align="center" width="15%" rowspan="4">照<br>片</td>
		</tr>
		<tr>
			<td align="center" width="20%" height=40>姓名</td>
			<td width="20%"><%=bTable.getNAME() %></td>
			
			<td align="center" width="20%">职务</td>
			<td width="25%"><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>
		</tr>
		<tr>
		    <td align="center" width="20%">国籍</td>
			<td width="20%"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
			
			<td align="center" width="20%"  height=40>任职时间</td>
			<td width="25%"><%=bTable.getARRCHDATE()%></td>
		</tr>
		<tr>
		    <td align="center"  height=40 colspan=2>护照或身份证号码</td>
			<td COLSPAN=2 width="45%"><%=bTable.getCERNO()%></td>
		</tr>
		<tr>
		    <td align="center"  height=40 colspan=2>护照或身份证签发日期</td>
			<td width="20%"><%=bTable.getREPCARFROM()%></td>
			
			<td align="center" width="25%" height=40>有效期</td>
			<td width="15%"><%=bTable.getREPCARTO()%></td>
		</tr>
		<tr >
			<td align="center" height=40 colspan="2">在华居住地址</td>
			<td colspan="3"><%=bTable.getHOUADDINCHINA()%></td>
		</tr>
		<tr>
			<td align="center" height=40 colspan="2">联系电话</td>
			<td colspan="3"><%=bTable.getTEL()%></td>
		</tr>	
		<tr>
		 <td align="center" COLSPAN=5 height=350>身份证明复印件粘贴处</td>
		        </tr>
		        <tr >
		           <td valign="bottom" height=120 COLSPAN=5 align="right">代表签字<%=SysSystem.toUnderlineStr("","center",30)%>(备案)<br></td>
		        </tr> 



		</table>
		<table align="center" border="0" width="90%" >
					<tr>
						<td>
							<p align=left style="font-size:13px">
								注：1、本表不够可复印
							</p>
						</td>
					</tr>			
		</table>
<%}
	}
%>

<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>

</body></html>