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
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
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
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	String checkBox = "□";
	String selected= "√";
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String OLD_ENTNAME="";//名称
	String NEW_ENTNAME="";	
	
	String NEW_DOM="";//住所
	String OLD_DOM="";
	
	String OLD_POSTALCODE="";//邮政编码
	String NEW_POSTALCODE="";
	
	String OLD_TEL="";//联系电话
	String NEW_TEL="";
	
	String OLD_REGCAP="";//成员出资总额
	String NEW_REGCAP="";
	
	String OLD_BUSSCOPE="";//业务范围
	String NEW_BUSSCOPE="";
	
	String OLD_LERPER="";//法定代表人
	String NEW_LERPER="";
	
	boolean CYBA=false;//成员备案
	boolean ZCBA=false;//章程备案
	boolean ZCXGBA=false;//章程修改备案
	boolean IFBA=false;
	boolean CWFZR=false;
	boolean LLY=false;
	boolean FGSBA=false;
	List bgsxList=new ArrayList();
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//名称
			temp.add("名称");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			DQENTNAME=OLD_ENTNAME;
		}
		if(bgsx.getALTITEM().equals("02")){//住所
			temp.add("住所");
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
		if(bgsx.getALTITEM().equals("05")){//成员出资总额
			temp.add("成员出资总额");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("12")){//业务范围
			temp.add("业务范围");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("03")){//法定代表人
			temp.add("法定代表人");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("08")){//经营期限
			temp.add("经营期限");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("81") 
		|| bgsx.getALTITEM().equals("82") 
		||bgsx.getALTITEM().equals("83")){//分公司
			FGSBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("10")){//成员
			CYBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("73")){//章程
			ZCBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("74")){//章程修正案
			ZCXGBA=true;
			IFBA=true;
		}
		if(temp.size()!=0){
			bgsxList.add(temp);
		}
		if(bgsx.getALTITEM().equals("780")){
			LLY=true;
			IFBA=true;
		}if(bgsx.getALTITEM().equals("790")){
			CWFZR=true;
			IFBA=true;
		}
	}
	
	String WTYW1="□ 名称预先核准   √ 设立    □ 变更    □ 注销    □ 备案    □ 撤销变更登记";
	String WTYW2="□ 股权出质 （□设立    □变更    □ 注销    □撤销）□ 其他";

	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>农民专业合作社变更登记申请书</title>
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

<table border="1" width="80%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">农民专业合作社登记（备案）申请书</span></b><br>
	<span style="font-size: 12pt">注：请仔细阅读本申请书《填写说明》，按要求填写。</span>
	</caption>
	<!-- 基本信息 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(selected);%>基本信息</B>
				</td>  
			</tr>
			<tr>
				<td align="center" height=28>名    称</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td align="center" height=28>备用名称1</td>
				<td colspan="5"> &nbsp;</td>
			</tr>
			<tr>
				<td align="center" height=28>备用名称2</td>
				<td colspan="5"> &nbsp;</td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>名称预先核准文<br/>号注册号/统一<br/>社会信用代码</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >住   所</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			
			<tr>
				<td width="20%" align="center" height=70 >生产经营地</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROPROVINCE().length()==6?QYDJ_JBXX.getPROPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getPROHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			
			<tr>
				<td align="center" height=28 nowrap="nowrap">联系电话</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=28 nowrap="nowrap">邮政编码</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>
			</tr>
		</table>
	</td>
</tr>
	<!-- 设立 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%=checkBox%>设立</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28>法定代表人姓名</td>
				<td colspan="5" align="center" >&nbsp;</td>
			</tr>
			<tr>
				<td width="20%" align="center" height=28 >成员出资总额<br/>（元）</td>
				<td colspan="5" >
				&nbsp;&nbsp;&nbsp;&nbsp; 元
				</td>
			</tr>
			<tr>
				<td colspan="6" style="line-height:25px">
				&nbsp;&nbsp;成员总数：___________（名）<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;其中：农民成员___________（名）
				  所占比例 ___________%<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;
				&nbsp;&nbsp;
				 企业、事业单位或社会团体成员：____________（名）
				  所占比例 ____________%<br/>
				</td>
			</tr>
			<tr>
			    <td align="center" height=150 >经<br>营<br>范<br>围</td>
				<td colspan="6" align="left" class="tdprint" valign="top" style="font-size:13px;">
					<br>&nbsp;<br>
				</td>
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
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(selected);%>变更</B>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height=28 width="20%" >变更项目</td>
				<td align="center" colspan="2" width="40%">原登记内容</td>
				<td align="center" colspan="2" width="40%">拟变更内容</td>
			</tr>
			<% 	
				bgsxList.toArray();
			int bgsxSize = bgsxList.size();
			boolean addBgsxFlag=false;
			if(bgsxList.size()>4){
				bgsxSize =4;
				addBgsxFlag=true;
			}
				for(int i=0;i<bgsxSize;i++){
					List temp = (List)bgsxList.get(i);
					if(temp.get(2)!=null&&temp.get(2)!=""){
					%>
					<tr>
						<td height='28' align="center" colspan="2"><%=temp.get(0) %></td>
						<td align="center" colspan="2"><%=temp.get(1) %></td>
						<td align="center" colspan="2"><%=temp.get(2) %></td>
					</tr>
			<%		}
				 }
				if(bgsxList.size()<4){
					for(int i=bgsxList.size();i<4;i++){
						out.print("<tr><td height='28' colspan='2'></td><td colspan='2'></td><td colspan='2'></td></tr>");
					}
				}
			%>	
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%if(IFBA){out.print(selected);}else{out.print(checkBox);}%>备案</B>
				</td>
			</tr>
			 <%
			 boolean addFzjgFlag=false;
			 String ADDFGS=checkBox;
			 String REMFGS=checkBox;
			 ArrayList fzjgList=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' AND REGULATION IN ('0','1') "); 
			 if(fzjgList.size()>0){
				 if(fzjgList.size()>1){
					 addFzjgFlag=true;
				 }
			for(int i=0;i<fzjgList.size();i++){
				 ADDFGS=checkBox;
			     REMFGS=checkBox;
				 com.macrosoft.icms.qydj.QYDJ_FZJG_SQ fzjgBa=(com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(i);
				 if(fzjgBa.getREGULATION().equals("0")){
				 	ADDFGS=selected;
				 }else if(fzjgBa.getREGULATION().equals("1")){
				 	REMFGS=selected;
				 }
			 %>
				<tr>
					<td align="center" rowspan="2">分公司<br/><%=ADDFGS %>增设 <%=REMFGS %>注销</td>
					<td align="center" height=28>名称</td>
					<td width="20%"><%=fzjgBa.getBRNAME()%></td>
					<td align="center" height=28>注册号/统一<br/>社会信用代码</td>
					<td width="20%" colspan="2"><%=fzjgBa.getREGNO() %></td>
				</tr>
				<tr>
					<td align="center" height=28>登记机关</td>
					<td ><%=fzjgBa.getREGORG() %></td>
					<td align="center">登记日期</td>
					<td colspan="2"><%=fzjgBa.getREGDATE() %></td>
				</tr>
			<%				 
			 }
			 }
			  else {
 			 %>
				<tr>
					<td align="center" rowspan="2">分公司<br/><%=ADDFGS %>增设 <%=REMFGS %>注销</td>
					<td align="center" height=28>名称</td>
					<td width="20%"></td>
					<td align="center" height=28>注册号</td>
					<td width="20%" colspan="2"></td>
				</tr>
				<tr>
					<td align="center" height=28>登记机关</td>
					<td ></td>
					<td align="center">登记日期</td>
					<td colspan="2"></td>
				</tr>
			<%} %>
			
			<tr>
				<td align="center" height="28">章程</td>
				<td align="center" colspan="5">
				□初次备案 &nbsp; &nbsp;
				<%if(ZCXGBA){out.print(selected);}else{out.print(checkBox);}%>章程修正案 &nbsp;&nbsp; 
				□修改后的章程
				</td>
			</tr>
			<tr>
				<td align="center" height="28">其他</td>
				<td align="center" colspan="5">
				<%if(CYBA){out.print(selected);}else{out.print(checkBox);}%>成员名册 &nbsp; &nbsp;
				<%if(LLY){out.print(selected);}else{out.print(checkBox);}%>联络员 &nbsp; &nbsp; 
				<%if(CWFZR){out.print(selected);}else{out.print(checkBox);}%>财务负责人
				</td>
			</tr>
		</table>
	   </td>
	</tr>
	
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="6">
					<B><%out.print(checkBox);%>注销</B>
				</td>
			</tr>
			<tr>
				<td align="center" >注销原因</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%>章程规定的解散事由出现 &nbsp;&nbsp;
					&nbsp;&nbsp;<%out.print(checkBox);%>成员大会决定解散<br>
					&nbsp;&nbsp;<%out.print(checkBox);%>因合并或分立需要解散  &nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(checkBox);%>依法被吊销营业执照或者被撤销<br>
					&nbsp;&nbsp;<%out.print(checkBox);%>法律、行政法规规定的其他解散情形__________________<br>	
				</td>
			</tr>
			<tr>
				<td align="center" >分支机构办理<br/>注销登记情况</td>
				<td colspan="5" >
					
				</td>
			</tr>
			<tr>
				<td align="center" rowspan="2">清算公告情况</td>
				<td width="20%">公告报纸名称</td><td colspan="4" >	</td>
			</tr>
			<tr>
			<td>公告日期</td><td colspan="4" >	</td>
			</tr>
			<tr>
				<td align="center" >清税情况</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%> 已清理完毕 
					&nbsp;&nbsp;<%out.print(checkBox);%> 未涉及纳税义务
				</td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;本社依法申请登记、备案，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的信息为本社提供、发布的信息，信息真实、有效。
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						</p>
						<br><br>
						<p> 
							<font  style="float:left">&nbsp;&nbsp;&nbsp;清算组负责人签名：
							<span class="NOPRINT" style="color:#CCCCCC"></span></font>
							<br/>
							<br/>
							<font  style="float:right">公章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
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
	 for (int i=4;i<bgsxList.size();i++){
		 List temp = (List)bgsxList.get(i);
	%>
			<tr>
				<td height='30' align="center" ><%=temp.get(0) %></td>
				<td align="center" ><%=temp.get(1) %></td>
				<td align="center" ><%=temp.get(2) %></td>
			</tr>
	<% 
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

<%if(!NEW_LERPER.equals("")){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_FDDBR.inc"%>
<br>
<%}%>

<%if(CYBA){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CZXX.inc"%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CYXX.inc" %>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/HZS_CYZM.inc" %>
<br>
<%}%>



<%
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

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
<br>

</body></html>