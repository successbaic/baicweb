
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
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
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
	String REGNO=QYDJ_JBXX.getREGNO();
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String NEW_QTSX="";
	String NEW_FZJG="";
	
	boolean DSBA=false;//董事备案
	boolean ZCBA=false;//章程备案
	boolean ZCXGBA=false;//章程修改备案
	String ZCXZA="";//章程修正内容
	
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
    
    String checkBox = "□";
	String selected= "√";
	String WTYW="名称核准□、设立□、变更□、注销□、备案√、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
	boolean FGSBA=false;//分公司备案
	boolean IFBA=false;
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
		if(bgsx.getALTITEM().equals("87")){//清算组负责人联系电话
			NEW_QSZ_TEL=bgsx.getALTAF();
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
<html><head><title>外商投资合伙企业备案申请书</title>
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
	<span style="font-size: 16pt">外商投资企业备案申请书</span></b>	
	<br></caption><br>
</table>

<table align="center" border="1" width="100%" bordercolor='#000000'>
<tr>
    <td align="center" height=35 style="width:15%">企业名称</td>
    <td colspan="2"><%=DQENTNAME %></td>
    <td align="center" style="width:15%">注册号</td>
    <td colspan="2"><%=REGNO %></td>
</tr>
  <tr>
    <td align="center" height=35 style="width:15%">分支机构</td>
    <td colspan="5" style="width:65%"><%=NEW_FZJG %></td>
  </tr>
  <tr>
  <td rowspan="3" style="width:15%"  height=70 align="center" >清算组（人）</td>

  <td rowspan="2" style="width:15%"  align="center" > 负责人</td>
  <td style="width:15%" height=35 align="center" >姓名</td>
  <td style="width:20%;"> <%=NEW_QSZ_FZR%></td>
  <td style="width:15%"  align="center"  height=35>证件类型</td>
  <td style="width:20%"><%=icms.getSysDm("CERTYPE",NEW_QSZ_ZJLX) %></td>
  </tr>
  <tr>
  <td  align="center" height=35>联系电话</td>
  <td><%=NEW_QSZ_TEL%></td>
  <td  align="center" height=35>证件号码</td>
  <td><%=NEW_QSZ_ZJHM %></td>
  </tr>
  <tr>
  <td  align="center" height=35>成员姓名</td>
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
    <td align="center" height=35 style="width:15%">协议修改</td>
    <td colspan="5" style="width:65%"><%=ZCXZA%></td>
  </tr>
  <tr>
  <td rowspan="3" style="width:15%"  align="center" >外国投资者<br>法律文件<br>送达接受人</td>
  <td  align="center" height=30>被授权人<br>名称或姓名</td>
  <td colspan="2"><%=NEW_WJSD_NAME %></td>
  <td  align="center" height=30>授权人</td>
  <td colspan="1"></td>
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

<TR><TD COLSPAN=6>&nbsp;&nbsp;&nbsp;&nbsp;本企业依照相关法律法规有关规定申请备案，提交材料真实有效。<br><br><br>
<p align="left"> 执行事务合伙人或委派代表签字或盖章：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span></p>
<p align="right">&nbsp;（企业印章）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>


</TD></TR>
</table>

<%if(FGSBA){ %>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FZJG.inc" %>
<%} %>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>

</body></html>