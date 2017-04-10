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
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
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
	String opetype=QYDJ_JBXX.getOPETYPE();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	
	String WTYW="√设立□变更□注销□备案□";
	String WTYW1="□ 名称预先核准   □ 设立    √ 变更    □ 注销    □ 备案    □ 撤销变更登记";
	String WTYW2="□ 股权出质 （□设立    □变更    □ 注销    □撤销）□ 其他";
	
	String checkBox = "□";
    String selected = "√";
    
    String sflx="";//删除中华人民共和国省份证中的中华人民共和国字样

	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>非公司企业法人登记（备案）申请书</title>
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

<input type="button" value="打印申请书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉"清空)</font>

<%
 ArrayList fddbr_SL=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN='1'");  
 String NAME_SL="",TEL_SL="",POSITION_SL="",APPOUNIT_SL="",CERTYPE_SL="",CERNO_SL=""; 
 if(fddbr_SL.size()>0){
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)fddbr_SL.get(0);
 NAME_SL=bTable.getNAME();
 TEL_SL =bTable.getTEL();
 POSITION_SL=bTable.getPOSITION();
 APPOUNIT_SL=bTable.getAPPOUNIT();
 CERTYPE_SL=bTable.getCERTYPE();
 CERNO_SL=bTable.getCERNO();
 }
%>
<%
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");	
	boolean ZGBM=false;
	boolean ZCBA=false;//章程备案
	boolean ZCXGBA=false;//章程修改备案
	boolean IFBA=true;
	boolean LLY=false;
	boolean CWFZR=true;
	String NEW_LERPER="";
	List bgsxList=new ArrayList();
	boolean addBgsxFlag=false;
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//分公司名称
			temp.add("名称");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			DQENTNAME=bgsx.getALTBE();
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
		if(bgsx.getALTITEM().equals("13")){//经营场所
			temp.add("经营场所");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("03")){//法定代表人
			NEW_LERPER = bgsx.getALTAF();
			temp.add("法定代表人");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("04")){//经济性质==企业类型
			temp.add("经济性质");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("05")){//注册资本
			temp.add("注册资本");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("08")){//经营期限
			temp.add("经营期限");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("12")){//许可经营项目
			temp.add("经营范围");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("55")||bgsx.getALTITEM().equals("56")
		   ||bgsx.getALTITEM().equals("57")||bgsx.getALTITEM().equals("58")){//主管部门(出资人)姓名--类型--
			ZGBM=true;
			IFBA=true;
		}
		if(temp.size()!=0){
			bgsxList.add(temp);
		}
		if(bgsx.getALTITEM().equals("73")){//章程
			ZCBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("74")){//章程修正案
			ZCXGBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("780")){
			LLY=true;
			IFBA=true;
		}if(bgsx.getALTITEM().equals("790")){
			CWFZR=true;
			IFBA=true;
		}
	}
	%>
<br>
<table border="1" width="80%" align="center" height="75%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">非公司企业法人登记（备案）申请书</span></b><br><br>
	<span style="font-size: 12pt">注：请仔细阅读本申请书《填写说明》，按要求填写。</span>
	</caption>
	<!-- 基本信息 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=46 colspan="6">
					<B><%out.print(selected);%>基本信息</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=46>名    称</td>
				<td colspan="5"><%=DQENTNAME%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=46 nowrap="nowrap">名称预先核准文<br/>号/注册号/统一<br/>社会信用代码</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=46 >住    所</td>
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
				<td align="center" height=46 nowrap="nowrap">联系电话</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=46 nowrap="nowrap">邮政编码</td>
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
				<td align="center" height=46 colspan="6">
					<B><%out.print(checkBox);%>开业</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=46 width="20%">法定代表人</td>
				<td colspan="2" align="center" width="25%"></td>
				<td align="center" >职  务</td>
				<td align="center" colspan="2" width="25%"></td>
			</tr>
			<tr>
				<td align="center" height=46 >注册资金</td>
				<td align="center" colspan="2"><%=SysSystem.toUnderlineStr("","center",9)%>万元</td>
				<td align="center" nowrap="nowrap">经济性质</td>
				<td align="center" colspan="2"></td>
			</tr>
			<tr>
			    <td align="center" height=46 >营业期限</td>
				<td align="center" colspan="2" >
				 <% 
					out.print(checkBox);%><%=SysSystem.toUnderlineStr("","center",5)%><%out.print("年");%>
					<%
					out.print(checkBox+"长期");
					
			        %>
				</td>				<td align="center" >申请副本数量</td>
				<td colspan=2 align="center" ><%=SysSystem.toUnderlineStr("","center",5)%>个</td>
			</tr>

			<tr>
			    <td align="center" height=220 >经营范围</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;"><br>
					<br><br><br><br>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<p class="PageNext"><br></p>

<table border="1" width="80%" align="center" bordercolor="#000000">
	
	<!-- 变更 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="5">
					<B><%out.print(selected);%>变更</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%" >变更项目</td>
				<td align="center" width="40%" colspan=2>原登记内容</td>
				<td align="center" width="40%" colspan=2>拟变更内容</td>
			</tr>
			<% 	
				bgsxList.toArray();
				for(int i=0;i<bgsxList.size();i++){
					List temp = (List)bgsxList.get(i);
					%>
					<tr>
						<td height='30' align="center" ><%=temp.get(0) %></td>
						<td align="center" colspan=2><%=temp.get(1) %></td>
						<td align="center" colspan=2><%=temp.get(2) %></td>
					</tr>
			<%
				 }
				if(bgsxList.size()<9){
					for(int i=bgsxList.size();i<9;i++){
						out.print("<tr><td height='30'></td><td colspan=2></td><td colspan=2></td></tr>");
					}
				}
			 boolean addFzjgFlag=false;
			 ArrayList fzjgList=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' AND (REGULATION in ('0','1')) "); 
			 if(fzjgList.size()>0){
				 if(fzjgList.size()>1){
					 addFzjgFlag=true;
				 }
				 com.macrosoft.icms.qydj.QYDJ_FZJG_SQ fzjgBa=(com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(0);		
			 %>	
			 <tr>
				<td align="center" height=60 rowspan="2">分支机构</td>
				<td align="center" width="15%">名称</td>
				<td align="center">性质</td>
				<td align="center">登记机关</td>
				<td align="center">登记类型</td>
			</tr>
			<tr>
				<td align="center"><%=fzjgBa.getBRNAME()%></td>
				<td align="center"><%if(fzjgBa.getREGTYPE().equals("0")){out.print(selected);}else{out.print(checkBox);} %>法人 &nbsp;<%if(fzjgBa.getREGTYPE().equals("1")){out.print(selected);}else{out.print(checkBox);} %>非法人</td>
				<td align="center"><%=fzjgBa.getREGORG() %></td>
				<td align="center"><%if(fzjgBa.getREGULATION().equals("0")){out.print(selected);}else{out.print(checkBox);} %>增设 &nbsp;<%if(fzjgBa.getREGULATION().equals("1")){out.print(selected);}else{out.print(checkBox);} %>撤销</td>
			</tr>
			 <%				 
			 } else {
 			 %>
			<tr>
				<td align="center" height=60 rowspan="2">分支机构</td>
				<td align="center" width="15%">名称</td>
				<td align="center">性质</td>
				<td align="center">登记机关</td>
				<td align="center">登记类型</td>
			</tr>
			<tr>
				<td align="center"></td>
				<td align="center"><%out.print(checkBox); %>法人 &nbsp;&nbsp;<%out.print(checkBox); %>非法人</td>
				<td align="center"></td>
				<td align="center"><%out.print(checkBox); %>增设 &nbsp;&nbsp;<%out.print(checkBox); %>撤销</td>
			</tr>
			<%} %>
			</table>
		</td>
	</tr>
	<!-- 备案 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="5">
					<B><%if(IFBA){out.print(selected);}else{out.print(checkBox);}%>备案</B>
				</td>
			</tr>
			<%
			 ArrayList czxxList=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
			 if(czxxList.size()>0){
				 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ czxxBa=(com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)czxxList.get(0);		
			 %>	
			<tr>
				<td align="center" rowspan="4" nowrap="nowrap">主管部门<br>（出资人）</td>
				<td align="center" height=30>名称</td>
				<td colspan=3 width="60%"><%=czxxBa.getINV() %></td>
			</tr>
			<tr>
				<td align="center" height=30>法人类型</td>
				<td colspan=3><%=icms.getSysDm("INVTYPE",czxxBa.getINVTYPE()) %></td>
			</tr>
			<tr>
				<td align="center" height=30>登记机关</td>
				<td colspan=3><%=czxxBa.getINVPERAREA() %></td>
			</tr>
			<tr>
				<td align="center" height=30>证照号码</td>
				<td colspan=3><%=czxxBa.getCERNO()+czxxBa.getBLICNO() %></td>
			</tr>
			<%} else { %>
			<tr>
				<td align="center" rowspan="4" nowrap="nowrap">主管部门<br>（出资人）</td>
				<td align="center" height=30>名称</td>
				<td colspan=3 width="60%"></td>
			</tr>
			<tr>
				<td align="center" height=30>法人类型</td>
				<td colspan=3></td>
			</tr>
			<tr>
				<td align="center" height=30>登记机关</td>
				<td colspan=3></td>
			</tr>
			<tr>
				<td align="center" height=30>证照号码</td>
				<td colspan=3></td>
			</tr>
			<%} %>
			<tr>
				<td align="center" height="30">章程</td>
				<td align="center">
					<%if(ZCBA){out.print(selected);}else{out.print(checkBox);}%>章程 &nbsp;
					<%if(ZCXGBA){out.print(selected);}else{out.print(checkBox);} %>章程修正案    
				</td>
				<td align="center" height="28">其他</td>
				<td align="center">
					<%if(CWFZR){out.print(selected);}else{out.print(checkBox);}%>财务负责人 &nbsp;
					<%if(LLY){out.print(selected);}else{out.print(checkBox);}%>联络员    
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
						&nbsp;&nbsp;&nbsp;&nbsp;本企业依照《企业法人登记管理条例》、《企业法人登记管理条例施行细则》及相关规定申请登记、备案，提交材料真实有效。
						<br><br><br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;组建负责人（或法定代表人）签字： 
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right"> 企业法人盖章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font style="float:right">
								年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p> 
						<br/><br/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<br>
<%if(!NEW_LERPER.equals("")){%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FDDBR.inc"%>
<%} %>
<br>
<%if(addFzjgFlag){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/NZFR_FZJG_BG.inc"%>
<br><br>
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
<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>