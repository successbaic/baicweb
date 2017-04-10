
<%@page import="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"%><%
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
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
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
	String PRIPID=QYDJ_JBXX.getPRIPID();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String checkBox = "□";
	String selected= "√";
	String WTYW="名称核准□、设立□、变更□、注销□、备案√、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
	
	String NEW_DS="";
	String OLD_DS="";
	boolean TZRBA=false;//投资人备案
	boolean DSBA=false;//董事备案
	boolean ZCBA=false;//章程备案
	boolean ZCXGBA=false;//章程修改备案
	String ZCXZA="";//章程修正内容
	String NEW_FZJG="";
	String NEW_QSZ_CY="";//清算组部分--成员
	String NEW_QSZ_FZR="";//负责人
	String NEW_QSZ_TEL="";//电话
	String NEW_QSZ_TXDZ="";//通讯地址
	String NEW_QSZ_ZJLX="";//证件类型
	String NEW_QSZ_ZJHM="";//证件号码
	String NEW_QSZ_YZBM="";//邮政编码
	
	String NEW_WJSD_NAME="";//文件送达人部分--姓名
	String NEW_WJSD_ADDR="";//联系地址
	String NEW_WJSD_GDTEL="";//固定电话
    String NEW_WJSD_YDTEL="";//移动电话
    String NEW_WJSD_EMAIL="";//电子邮箱
    String NEW_WJSD_POST="";
    String NEW_WJSD_LINKMAN="";//被授权人联系人
    
    String NEW_QTSX="";
    
	boolean FGSBA=false;//分公司备案
	boolean IFBA=false;
	boolean MCBG=false;//名称变更
	boolean DOMBG=false;//住所变更
	boolean FDDBRBG=false;//法定代表人变更
	boolean REGCAPBG=false;//投资总额、注册资本变更
	boolean RECCAPBG=false;//实收资本变更
	boolean ENTTYPEBG=false;//公司类型变更
	boolean BUSSCOPEBG=false;//经营范围变更
	boolean OPDATETOBG=false;//营业期限变更
	int fzjgSize=0;
	
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		
		if(bgsx.getALTITEM().equals("70")){//董事、监事、经理/委员
			DSBA=true;
		}
		if(bgsx.getALTITEM().equals("73")){//章程
			ZCBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("74")){//章程修正案
			ZCXZA=bgsx.getALTAF();
			ZCXGBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("79")){//清算组成员
			NEW_QSZ_CY=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("84")){//清算组负责人
			NEW_QSZ_FZR=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("86")){//清算组负责人通讯地址
			NEW_QSZ_TXDZ=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("131")){//清算组负责人证件类型
			NEW_QSZ_ZJLX=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("132")){//清算组负责人证件号码
			NEW_QSZ_ZJHM=bgsx.getALTAF();
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("87")){//清算组负责人联系电话
			NEW_QSZ_TEL=bgsx.getALTAF();
			IFBA=true;
		}

		if(bgsx.getALTITEM().equals("63")){//文件送达接受人
            ArrayList wjsdlist=QYDJ_WZWJSD.getList(" WHERE OPENO='"+OPENO+"'");
            if(wjsdlist.size()>0){
              com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ wjsd=(com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ)wjsdlist.get(0); 
              NEW_WJSD_NAME=wjsd.getNAME();
              NEW_WJSD_ADDR=wjsd.getADDR();
              NEW_WJSD_GDTEL=wjsd.getTEL();
              NEW_WJSD_YDTEL=wjsd.getMOBTEL();
              NEW_WJSD_EMAIL=wjsd.getEMAIL();
              NEW_WJSD_LINKMAN=wjsd.getLINKMAN();
              NEW_WJSD_POST=wjsd.getPOSTALCODE();
            }
			IFBA=true;
		}
		if((bgsx.getALTITEM().equals("81") 
		|| bgsx.getALTITEM().equals("82") 
		||bgsx.getALTITEM().equals("83"))
		&&!FGSBA){//分公司
			ArrayList addFzjg=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' "); 
			 for (int j=0;j<addFzjg.size();j++){
			com.macrosoft.icms.qydj.QYDJ_FZJG_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)addFzjg.get(j);
			NEW_FZJG+=bTable.getBRNAME()+" ; ";
			 }
			FGSBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("99") ){
			NEW_QTSX=bgsx.getALTAF();
			IFBA=true;
		}
	}
%>
<html><head><title>外商投资企业备案申请书</title>
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
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">外商投资企业备案申请书</b>	
	<br></caption><br>
<tr><td colspan="3" align="right"  style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">注册号：<%=QYDJ_JBXX.getREGNO() %></td></tr>	
</table>

<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" width="50%" height=30 colspan=3>原董事、监事、经理/委员</td>
	<td align="center" width="50%" height=30 colspan=3>申请更换董事、监事、经理/委员</td>
</tr>
	<%if(DSBA){
		ArrayList dsxxOldList = QYDJ_RYXX_ZS.getList(" where field002='sub02_01' and field001='"+QYDJ_JBXX.getPRIPID()+"'");
		ArrayList dsxxNewList = QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'"); 
		int listSize = dsxxOldList.size()>dsxxNewList.size()?dsxxNewList.size():dsxxOldList.size();
		for (int j = 0; j<dsxxOldList.size();j++){
			com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS gdxxOld=(com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS)dsxxOldList.get(j);
			OLD_DS+=gdxxOld.getNAME()+":"+icms.getSysDm("POSITION",gdxxOld.getPOSITION())+"<br/>";
		}
		for( int k=0; k<dsxxNewList.size();k++){
			com.macrosoft.icms.qydj.QYDJ_RYXX_SQ gdxxNew = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)dsxxNewList.get(k);
			NEW_DS+=gdxxNew.getNAME()+":"+icms.getSysDm("POSITION",gdxxNew.getPOSITION())+"<br/>";				
		}
	%>
	
	<% }%>
<tr>
	<td width="50%" align="center" height=30 colspan=3>姓名:职务</td>
	<td width="50%" align="center" height=30 colspan=3>姓名:职务</td>
</tr>
<tr>
	<td width="50%" align="center" height=90 colspan=3><%=OLD_DS%></td>
	<td width="50%" align="center" height=90 colspan=3><%=NEW_DS%></td>
</tr>
<tr>
    <td align="center" height=30 style="width:15%">章程修改</td>
    <td colspan="5" style="width:65%"><%=ZCXZA%></td>
  </tr>
  <tr>
    <td align="center" height=30 style="width:15%">分支机构</td>
    <td colspan="5" style="width:65%"><%=NEW_FZJG %></td>
  </tr>
  <tr>
  <td rowspan="3" style="width:15%"  align="center" height=60>清算组（人）</td>

  <td rowspan="2" style="width:15%"  align="center" height=30> 负责人</td>
  <td style="width:15%"  align="center" height=30>姓名</td>
  <td style="width:20%;"> <%=NEW_QSZ_FZR%></td>
  <td style="width:15%"  align="center" height=30>证件类型</td>
  <td style="width:20%"><%=icms.getSysDm("CERTYPE",NEW_QSZ_ZJLX) %></td>
  </tr>
  <tr>
  <td  align="center" height=30>联系电话</td>
  <td><%=NEW_QSZ_TEL%></td>
  <td  align="center" height=30>证件号码</td>
  <td><%=NEW_QSZ_ZJHM %></td>
  </tr>
  <tr>
  <td  align="center" height=30>成员姓名</td>
  <td colspan="4"> <%=NEW_QSZ_CY%></td>
  </tr>
  
 <%--  <tr>
    <td colspan=2 align="center" height=35>清算组成员</td>
    <td colspan="6"><%=NEW_QSZ_CY%></td>
  </tr>
  <tr>
    <td colspan=2 rowspan=2 align="center">清算组负责人</td>
    <td colspan="2" rowspan=2><%=NEW_QSZ_FZR%></td>
    <td colspan=2 align="center" height=35>通信地址</td>
    <td colspan="2"><%=NEW_QSZ_TXDZ%></td>
  </tr>
  <tr> 
    <td colspan=2 align="center" height=35>联系电话</td>
    <td colspan=2><%=NEW_QSZ_TEL%></td>
  </tr>--%>

  <%-- <tr>
    <td rowspan=3 align="center">外国投资者<br>法律文件<br>文件送达接受人</td>
    <td align="center" height=35 nowrap="nowrap">被授权人<br>名称或姓名</td>
    <td colspan=2 align="center" nowrap="nowrap">被授权人<br>地址</td>
    <td align="center" nowrap="nowrap">被授权人<br>联系电话</td>
    <td align="center" nowrap="nowrap">邮政编码</td>
   
  </tr>--%>
  
  <tr>
  <td rowspan="3" style="width:15%"  align="center" >外国投资者<br>法律文件<br>送达接受人</td>
  <td  align="center" height=30>被授权人<br>名称或姓名</td>
  <td colspan="4"><%=NEW_WJSD_NAME %></td>
  
  </tr>
  <tr>
  <td  align="center" height=30>被授权人<br>地址</td>
  <td colspan="4"><%=NEW_WJSD_ADDR %></td>
  
  </tr>
  <tr>
  <td  align="center" height=30>被授权人<br>电话
  </td>
  <td colspan="2"><%=NEW_WJSD_YDTEL %></td>
  <td  align="center" height=30>邮政编码</td>
  <td colspan="1"><%=NEW_WJSD_POST %></td>

  </tr>
<tr>
<td style="width:15%"  align="center" height=80>其他事项</td>
<td colspan="5"><%=NEW_QTSX %></td>
</tr>
<TR><TD COLSPAN=6>&nbsp;&nbsp;&nbsp;&nbsp;本企业依照相关法律法规有关规定申请变更登记，提交材料真实有效。<br><br><br>
<p align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br></p>
<p align="right">&nbsp;（公司盖章）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

</TD></TR>
</table>
<P>注：本表未列出的登记事项发生变化的或申请备案事项的，请在“其他事项”栏内填写。此表不够填写的，可复印空表填写。</P>

<%if(IFBA){
String DSJSJLXX="";
ArrayList ryList=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'");
for(int p=0;p<ryList.size();p++){
	com.macrosoft.icms.qydj.QYDJ_RYXX_SQ ryxxBa=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)ryList.get(p);
	if(DSJSJLXX.equals("")){
		DSJSJLXX=icms.getSysDm("POSITION",ryxxBa.getPOSITION())+"  "+ryxxBa.getNAME();
	}else{
		DSJSJLXX="；"+icms.getSysDm("POSITION",ryxxBa.getPOSITION())+"  "+ryxxBa.getNAME();
	}
}
}

%>
<%if(DSBA){ %>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_DSQK_PRINT.inc" %>
<%} %>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>

</body></html>