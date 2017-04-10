
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
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>

<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
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
	
	String NEW_LERPER="";  //法定代表人
	List bgsxList=new ArrayList();
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String checkBox = "□";
	String selected= "√";
	String WTYW="名称核准□、设立□、变更√、注销□、备案□、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
	boolean CWFZR=false;
	boolean LLY=false;
	boolean WJSDJSR=false;
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//名称
			temp.add("名称");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			DQENTNAME=bgsx.getALTBE();
		}
		if(bgsx.getALTITEM().equals("02")){//营业场所
			temp.add("营业场所");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("50")){//电话
			temp.add("电话");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("69")){//邮编
			temp.add("邮编");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("03")){//负责人
			temp.add("负责人");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("26")){//资金数额
		   temp.add("资金数额");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		
		if(bgsx.getALTITEM().equals("110")){//币种
		   temp.add("币种");
			temp.add(icms.getSysDm("CURRENCY",bgsx.getALTBE()));
			temp.add(icms.getSysDm("CURRENCY",bgsx.getALTAF()));
		}
		if(bgsx.getALTITEM().equals("12")){//经营范围
			temp.add("经营范围");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("08")){//营业期限
			temp.add("营业期限");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		
		if(temp.size()!=0){
			bgsxList.add(temp);
		}
		
		if(bgsx.getALTITEM().equals("780")){
			LLY=true;
		}if(bgsx.getALTITEM().equals("790")){
			CWFZR=true;
		}
		if(bgsx.getALTITEM().equals("63")){//文件送达接收人
			WJSDJSR=true;
		}
	}
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>外国(地区)企业在中国境内从事生产经营活动变更登记申请书</title>
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

<table border="1" width="80%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 18pt">外国（地区）企业在中国境内从事<br/>生产经营活动登记申请书</span></b><br>
	<span style="font-size: 12pt">注：请仔细阅读本申请书《填写说明》，按要求填写。</span>
	</caption>
	<!-- 基本信息 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="4">
					<B><%out.print(selected);%>基本信息</B>
				</td>  
			</tr>
			<tr>
				<td align="center" height=28 width="15%">名    称</td>
				<td width="35%"><%=QYDJ_JBXX.getENTNAME()%></td>
			
				<td width="15%" align="center" style="font-size:13px" nowrap>名称预先核准文<br/>号注册号/统一社会<br/>信用代码</td>
				<td width="35%"><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
				
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >地     址<br/>（营业场所）</td>
				<td colspan="3" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			<tr>
				<td align="center" height=28 nowrap="nowrap">联系电话</td>
				<td width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=28 nowrap="nowrap">邮政编码</td>
				<td width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>
			</tr>
		</table>
	</td>
</tr>
	<!-- 设立 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
		<tr>
				<td align="center" height=28 colspan="4">
					<B><%=checkBox%>开业</B>
				</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" width="15%" height=28>企业类型</td>
				<td width="35%">&nbsp;</td>
				<td align="center" nowrap="nowrap" width="15%">主管部门</td>
				<td width="35%">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=28>审批机关</td>
				<td>&nbsp;</td>
				<td align="center" nowrap="nowrap">批准日期</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=28>负责人</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="120px">在中国境内<br/>经营范围</td>
				<td colspan="3" style="font-size:15px;">&nbsp;</td>
			</tr>	
			<tr>
				<td align="center" height=28 width="15%">资金数额（万元）</td>
				<td width="35%">&nbsp;万元</td>
				
				<td align="center" height=28  width="15%">币种</td>
				<td  width="35%">&nbsp;</td>
			</tr>
			<tr>
			    <td align="center" height=28 >营业期限</td>
				<td align="center" colspan="3">
				 自_________年______月______日 至_________年______月______日
				</td>				
			</tr>
			
			<tr>
				<td align="center" nowrap="nowrap" height="35px">承包工程或经营<br/>管理项目</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="35px">外国（地区）企<br/>业名称</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="35px">外国（地区）企<br/>业境外住所</td>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height="100px">外国（地区）企<br/>业经营范围</td>
				<td colspan="3" style="font-size:15px;">&nbsp;</td>
			</tr>
		</table>
	</td>
</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<p class="PageNext"><br></p>

<table border="1" width="80%" height="75%" align="center" bordercolor="#000000">
	<!-- 变更 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="3">
					<B><%out.print(selected);%>变更/备案</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="20%" >变更/备案项目</td>
				<td align="center" width="40%">原登记/备案内容</td>
				<td align="center" width="40%">拟变更/备案内容</td>
			</tr>
			<% 	
				bgsxList.toArray();
			int bgsxSize = bgsxList.size();
			boolean addBgsxFlag=false;
			if(bgsxList.size()>5){
				bgsxSize = 5;
				addBgsxFlag=true;
			}
				for(int i=0;i<bgsxSize;i++){
					List temp = (List)bgsxList.get(i);
					if(temp.get(2)!=null&&temp.get(2)!=""){
					%>
					<tr>
						<td height='28' align="center" ><%=temp.get(0) %></td>
						<td align="center" ><%=temp.get(1) %></td>
						<td align="center" ><%=temp.get(2) %></td>
					</tr>
			<%		}
				 }
				if(bgsxList.size()<5){
					for(int i=bgsxList.size();i<5;i++){
						out.print("<tr><td height='28'></td><td></td><td></td></tr>");
					}
				}
			%>	
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="4">
					<B><%out.print(checkBox);%>注销</B>
				</td>
			</tr>
			<tr>
				<td align="center" width="15%">注销原因</td>
				<td colspan="3" height="150px">
					
				</td>
			</tr>
			<tr>
				<td align="center" >清税情况</td>
				<td colspan="3" >
					&nbsp;&nbsp;
					<%=checkBox%> 已清理完毕&nbsp;&nbsp;
					<%=checkBox%> 未涉及纳税义务
				</td>
			</tr>
			<tr>
			<td align="center" nowrap="nowrap">海关手续<br/>清缴情况</td>
			<td colspan="3" nowrap="nowrap" >&nbsp;&nbsp;
			<%=checkBox%> 已办理完毕 &nbsp;&nbsp;
			<%=checkBox%> 未涉及海关事务</td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap">批准机关</td>
			<td colspan="3"></td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap" width="15%">批准文号</td>
			<td width="35%"></td>
			<td align="center" nowrap="nowrap" width="15%">批准日期</td>
			<td width="35%"></td>
			</tr>
			
			<tr>
			<td align="center" nowrap="nowrap">清理债权<br/>债务单位</td>
			<td colspan="3"></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
				<tr>
					<td align="center" height=28 colspan="6">
						<B><%out.print(selected);%>申请人声明</B>
					</td>
				</tr>
				<tr>
					<td COLSPAN=6>
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;本企业依照相关法律法规有关规定申请开业登记，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;外国（地区）企业有权签字人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">（印章）：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font style="float:right">
								年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/><br/>
						</p> 
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<%if(addBgsxFlag){%>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="80%" bordercolor='#000000'>
	<caption><p align="center"><b>
		<span style="font-size: 16pt">变更事项信息</b><br><br>
	</caption>	
<tr>    
	<td align='center' width='15%' nowrap="nowrap" style="font-size:14px;">变更项目</td>
	<td align="center" width='30%' height="30" style="font-size:14px;">原登记内容</td>
	<td align="center" width='30%' height="30" style="font-size:14px;">拟变更内容</td>
</tr>

	<%
	int bgsxNo=0;
	 for (int i=5;i<bgsxList.size();i++){
		 List temp = (List)bgsxList.get(i);
		//	if(temp.get(2)!=null&&temp.get(2)!=""){
			%>
			<tr>
				<td height='30' align="center" ><%=temp.get(0) %></td>
				<td align="center" ><%=temp.get(1) %></td>
				<td align="center" ><%=temp.get(2) %></td>
			</tr>
			<% 
		//	}
 }

 while (bgsxNo<15) 
 {
	out.print("<tr><td height='30'></td><td></td><td></td></tr>");
	bgsxNo++;
 }
%>	
</table>
<br>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<br><br>
<%}%>
<%
if(!NEW_LERPER.equals("")){
%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZFZ_FZR.inc"%>
<%}
if(WJSDJSR){
%>
<p class="PageNext"><br>
<%@include file="public/WZ_WJSDJSR.inc" %>
<%
}
if(CWFZR){
%>
<p class="PageNext"><br>
<%@include file="public/GS_CWFZR.inc" %>
<%
}
if(LLY){
%>
<p class="PageNext"><br>
<%@include file="public/GS_LLY.inc" %>
<%
}
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZ_SQWT.inc" %>
</body></html>