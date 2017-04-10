<%@ page contentType="text/html;charset=GBK"%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="/error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@page import="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="MCGL_TZRXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="MCGL_BGSX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_BGSX_SQ"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<%	
	
	//String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	String DQENTNAME=MCGL_JBXX.getENTNAME();
	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_SQWT.doSelect();
	String checkBox = "□";
    String selected = "√";
    
    //MCGL_JBXX_ZS.setPRIPID(MCGL_JBXX.getPRIPID());
    //MCGL_JBXX_ZS.doSelect();
    ArrayList bglist=MCGL_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
    int lastI=0;
	String DOM1="",DOM2="",REGCAP1="",REGCAP2="",REGCAPCUR1="",REGCAPCUR2="",CONGRO1="",CONGRO2="",CONGROCUR1="",CONGROCUR2="",BUSSCOPE1="",BUSSCOPE2="",ENTTYPE1="",ENTTYPE2="",SAVEPERTO1="",SAVEPERTO2="";
	String INDUSTRYPHY1="",INDUSTRYPHY2="",INDUSTRYCO1="",INDUSTRYCO2="",NAME1="",NAME2="",REGORG1="",REGORG2="";
	for(int i=0;i<bglist.size();i++){
		lastI+=1;
		com.macrosoft.icms.mcgl.MCGL_BGSX_SQ bgsx=(com.macrosoft.icms.mcgl.MCGL_BGSX_SQ)bglist.get(i);
		String bef=bgsx.getALTBE();
		String aft=bgsx.getALTAF();
		String altitem=bgsx.getALTITEM();
		
		if(altitem.equals("13")){
			DOM1=bef;
			DOM2=aft;
		}else if(altitem.equals("26")){
			REGCAP1=bef+"   万元";
			REGCAP2=aft+"   万元";
		}else if(altitem.equals("09")){
			NAME1=bef;
			NAME2=bef;
		}else if(altitem.equals("12")){
			BUSSCOPE1=bef;
			BUSSCOPE2=aft;
		}else if(altitem.equals("11")){
			INDUSTRYCO1=icms.getSysDm("INDUSTRYCO", aft);
			INDUSTRYCO2=icms.getSysDm("INDUSTRYCO", aft);
			//lastI-=1;
			//continue;
		}else if(altitem.equals("07")){
			ENTTYPE1=icms.getSysDm("ENTTYPE",bef);
			ENTTYPE2=icms.getSysDm("ENTTYPE",aft);
		}else if(altitem.equals("14")){
			REGORG1=icms.getSysDm("REGORG",bef);
			REGORG2=icms.getSysDm("REGORG",aft);
		}else if(altitem.equals("08")){
			SAVEPERTO1=bef;
			SAVEPERTO2=aft;
		}
	}	
	%>
<html>
	<head>
<style>table{border-collapse: collapse;}
</style>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-before: always;}
tr{font-size: 12pt;}
.tr9{font-size: 9pt;}
.tdprint{text-align: left;text-indent: 2;}
</style>
		<%out.print(pageshow.pagesetup_default()); %>
		<title>企业名称预先核准申请书</title>
	</head>
	<body onload="pagesetup_default()" style="width:100%;height: 100%;">
	<CENTER>
	<font style="text-align: right; " class="noPrint">
			<input type="button" value="打印申请书" onclick="window.print();"  class="noPrint">
			<input name=back type="button" value="关   闭" onclick="window.close();"  class="noPrint">
		</font>
			<font color="red" style="font-size: 9pt;" class="noPrint">
				(请用A4纸打印,在打印之前请在IE->文件->页面设置“中将”页眉"和“页脚”清空)
			</font>
	</CENTER>
	
	<CENTER>
		<span style="font-weight: bold;font-size: 18pt;">
			个体户名称调整申请书
		</span>		
	</CENTER>
		
			<table width="100%" align="center" bordercolor="#000000" border="1">				
					<tr>
						<td align="center" height=30>
							已核准<br/>
							企业名称
						</td>
						<td colspan="6">
							<%=MCGL_JBXX.getENTNAME() %>
						</td>
					</tr>	
					<tr>
						<td align="center" height=30>
							通知书文号
						</td>
						<td colspan="6">
							<%=MCGL_JBXX.getAPPRNO() %>
						</td>
					</tr>						
				
				<tr> 
				<td align="center" height=30>项 目</td>				
				<td align="center" height=30 colspan="3">原核准事项</td>
				<td align="center" height=30 colspan="3">申请调整事项</td>				
				</tr>
				
				<!-- <tr>
				<td align="center" height=30>字号名称</td>
				<td colspan="3"></td>
				<td colspan="3"></td>
				</tr> -->
				
				<tr>
				<td align="center" height=30>经营场所</td>
				<td colspan="3"><%=DOM1 %></td>
				<td colspan="3"><%=DOM2 %></td>
				</tr>
				
				
				<tr>
				<td align="center" height=30>经营者</td>
				<td colspan="3"><%=NAME1 %></td>
				<td colspan="3"><%=NAME2 %></td>
				</tr>
				<tr>
				<td align="center" height=30>登记机关</td>
				<td colspan="3"><%=REGORG1 %></td>
				<td colspan="3"><%=REGORG2 %></td>
				</tr>				
				<tr>
				<td align="center" height=30>行业门类</td>
				<td colspan="3"><%=INDUSTRYPHY1 %></td>
				<td colspan="3"><%=INDUSTRYPHY2 %></td>
				</tr>
				<tr>
				<td align="center" height=30>行业代码</td>
				<td colspan="3"><%=INDUSTRYCO1 %></td>
				<td colspan="3"><%=INDUSTRYCO2 %></td>
				</tr>
				<tr>
				<td align="center" height=30>经营范围</td>
				<td colspan="3"><%=BUSSCOPE1 %></td>
				<td colspan="3"><%=BUSSCOPE2 %></td>
				</tr>				
				
				<tr>
				<td align="center" height=30>保留期期限</td>
				<td colspan="3"><%=SAVEPERTO1 %></td>
				<td colspan="3"><%=SAVEPERTO2 %></td>
				</tr>
				<tr>
				<td align="center" height=30>
				签字或盖章				
				</td>
				<td colspan="6" align="right">
				<br/><br/><br/><br/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 年  &nbsp;&nbsp; 月 &nbsp;&nbsp; 日
				</td>
				</tr>
	</table>
	
	<br><p class="PageNext"><br>
	<%@include file="WZ_SQWT.inc"%>
</body></html>
