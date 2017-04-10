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

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
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
	
	String WTYW="□设立□变更□注销□备案□";
	String WTYW1="□ 名称预先核准   □ 设立    □ 变更    □ 注销    √ 备案    □ 撤销变更登记";
	String WTYW2="□ 股权出质 （□设立    □变更    □ 注销    □撤销）□ 其他";
	
	String checkBox = "□";
    String selected = "√";
    
    String sflx="";//删除中华人民共和国省份证中的中华人民共和国字样

%>
<html><head><title>公司登记（备案）申请书</title>
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

<br><br><br><br>
<table border="1" width="80%" align="center" height="75%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">公司登记（备案）申请书</span></b><br><br>
	<span style="font-size: 12pt">注：请仔细阅读本申请书《填写说明》，按要求填写。</span>
	</caption>
	<!-- 基本信息 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="6">
					<B><%out.print(selected);%>基本信息</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30>名    称</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=28 nowrap="nowrap">名称预先核准<br/>文号或注册号</td>
				<td colspan=5 ><%=QYDJ_JBXX.getREGNO()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >住    所</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			<tr>
				<td align="center" height=30 nowrap="nowrap">联系电话</td>
				<td colspan=2 width="25%" align="center" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=30 nowrap="nowrap">邮政编码</td>
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
				<td align="center" height=30 colspan="6">
					<B><%if("20".equals(opetype)){out.print(selected);}else{out.print(checkBox);}%>设立</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%">法定代表人<br>姓名</td>
				<td colspan="2" align="center" ></td>
				<td align="center" >职  务</td>
				<td align="center" colspan="2" >
					<%out.print(checkBox);%>董事长
					<%out.print(checkBox);%>执行董事
					<%out.print(checkBox);%>经理
				</td>
			</tr>
			<tr>
				<td align="center" height=30 >注册资本</td>
				<td align="center" colspan="2"><%=SysSystem.toUnderlineStr("","center",9)%>万元</td>
				<td align="center" nowrap="nowrap">公司类型</td>
				<td align="center" colspan="2"></td>
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=30 >设立方式</td>
				<td align="center" colspan=5>
					<%out.print(checkBox);%>发起设立
					<%out.print(checkBox);%>募集设立
				</td>
			</tr>
			<tr>
			    <td align="center" height=100 >经<br>营<br>范<br>围</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;">
					<br><%out.print(QYDJ_JBXX.getBUSSCOPE());%><br>
				</td>
			</tr>
			<tr>
			    <td align="center" height=30 >营业期限</td>
				<td align="center" colspan="2" >
				 <% 
					out.print(checkBox);%><%=SysSystem.toUnderlineStr("","center",4)%>
					<%out.print("年");
					out.print(checkBox+"长期");
					
			        %>
				</td>
				<td align="center" colspan=1 >申请副本数量</td>
				<td colspan=2 align="center" ><%=SysSystem.toUnderlineStr("","center",5)%>个</td>
			</tr>
 					<!-- 出资信息 -->
 			<tr>
 				<td colspan="6">
		 			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			 			<tr>
							<td rowspan="8" width='15%' nowrap="nowrap" align='center' height=30>股东<br/>（发起人）</td> 
							<td align="center" width='30%' nowrap="nowrap" style="font-size:14px;" height=30>名称或姓名</td>
							<td align="center" width='30%' style="font-size:14px;" height=30>证照号码</td>
							<td align="center" width='25%' style="font-size:14px;" height=30>备注</td>
						</tr>
						<% 
						 for(int i=0;i<7;i++) 
						 {
							out.print("<tr><td height='40'></td><td></td><td></td></tr>");
						 }
						%>	
					</table>	
				</td>
 			</tr>			
		</table>
	</td>
</tr>
</table>
<p class="PageNext"><br></p>

<table border="1" width="80%" align="center" bordercolor="#000000">
			<!-- 出资信息分页 -->
	<tr>
		<td colspan="6">
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			 	<tr>
					<td rowspan="3" width='15%' nowrap="nowrap" align='center' height=30>股东<br/>（发起人）</td> 
					<td height=30></td><td></td><td></td>
				</tr>
				<% 
				 for(int i=0;i<2;i++) 
				 {
					out.print("<tr><td height='30'></td><td></td><td></td></tr>");
				 }
				%>	
			</table>
		</td>
	</tr>
	<!-- 变更 -->
	<%
	boolean DSBA=false;//董事备案
	boolean JSBA=false;//监事备案
	boolean JLBA=false;//经理备案
	boolean ZCBA=false;//章程备案
	boolean ZCXGBA=false;//章程修改备案
	String NEW_QSZ_CY="";//清算组部分--成员
	String NEW_QSZ_FZR="";//负责人
	String NEW_QSZ_TEL="";//电话
	String NEW_QSZ_TXDZ="";//通讯地址
	String NEW_QSZ_YZBM="";//邮政编码
	String NEW_GD="";	//股东
	String NEW_GDMC="";  //发起人姓名或者名称
	String NEW_LERPER="";  //法定代表人
	boolean FGSBA=false;//分公司备案
	boolean IFBA=false;
	int fzjgSize=0;
	List bgsxList=new ArrayList();
	boolean addFzjgFlag=false;
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
	
		if(bgsx.getALTITEM().equals("10")){//股东-出资方式-出资时间
			NEW_GD = bgsx.getALTAF();
			temp.add("股东");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("160")){//发起人姓名或者名称
			NEW_GDMC = bgsx.getALTAF();
			temp.add("发起人姓名或者名称");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("17")){//出资时间
			temp.add("出资时间");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("15")){//出资方式
			temp.add("出资方式");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(temp.size()!=0){
			bgsxList.add(temp);
		}
		if(bgsx.getALTITEM().equals("70")){//董事
			DSBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("71")){//监事
			JSBA=true;
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("72")){//经理
			JLBA=true;
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
		if(bgsx.getALTITEM().equals("81") 
		|| bgsx.getALTITEM().equals("82") 
		||bgsx.getALTITEM().equals("83")){//分公司
			FGSBA=true;
			IFBA=true;
		}
	}
	%>
	
	
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=30 colspan="6">
					<B><%out.print(checkBox);%>变更</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=30 width="20%" >变更项目</td>
				<td align="center" width="40%">原登记内容</td>
				<td align="center" width="40%">拟变更内容</td>
			</tr>
			<% 	
				for(int i=0;i<10;i++){
					%>
					<tr>
						<td height='30' align="center" ></td>
						<td align="center" ></td>
						<td align="center" ></td>
					</tr>
			<%
				 }
			%>	
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
			 ArrayList fzjgList=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' AND regtype='新设' "); 
			 if(fzjgList.size()>0){
				 if(fzjgList.size()>1){
					 addFzjgFlag=true;
				 }
				 com.macrosoft.icms.qydj.QYDJ_FZJG_SQ fzjgBa=(com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(0);		
			 %>
				<tr>
					<td align="center" rowspan="2">增设分公司</td>
					<td align="center" height=30>名称</td>
					<td width="20%"><%=fzjgBa.getBRNAME()%></td>
					<td align="center" height=30>注册号</td>
					<td width="20%"><%=fzjgBa.getREGNO() %></td>
				</tr>
				<tr>
					<td align="center" height=30>登记机关</td>
					<td ><%=fzjgBa.getREGORG()%></td>
					<td align="center">登记日期</td>
					<td><%=fzjgBa.getREGDATE() %></td>
				</tr>
			<%				 
			 } else {
 			 %>
				<tr>
					<td align="center" rowspan="2">增设分公司</td>
					<td align="center" height=30>名称</td>
					<td width="20%"></td>
					<td align="center" height=30>注册号</td>
					<td width="20%"></td>
				</tr>
				<tr>
					<td align="center" height=30>登记机关</td>
					<td ></td>
					<td align="center">登记日期</td>
					<td></td>
				</tr>
			<%} %>
			<tr>
				<td align="center" rowspan="2">清算组</td>
				<td align="center" height="30" >成员</td>
				<td colspan="3"><%=NEW_QSZ_CY %></td>
			</tr>
			<tr>
				<td align="center" height=30>负责人</td>
				<td><%=NEW_QSZ_FZR%></td>
				<td align="center">联系电话</td>
				<td ><%=NEW_QSZ_TEL%></td>
			</tr>
			<tr>
				<td align="center" height="30">其他</td>
				<td align="center" colspan="4">
					<%
					if(DSBA){out.print(selected);}else{out.print(checkBox);}%>
					董事
					
					<%
					if(JSBA){out.print(selected);}else{out.print(checkBox);}%>
					监事
					
					<%
					if(JLBA){out.print(selected);}else{out.print(checkBox);}%>
					经理
					
					<%
					if(ZCBA){out.print(selected);}else{out.print(checkBox);}%>
					章程
					
					<%
					if(ZCXGBA){out.print(selected);}else{out.print(checkBox);}%>
					章程修正案
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
						&nbsp;&nbsp;&nbsp;&nbsp;本公司依照《公司法》、《公司登记管理条例》相关规定申请登记、备案，提交材料真实有效。
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">公司盖章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font  style="float:left">&nbsp;&nbsp;&nbsp;（清算组负责人）签字：
							<span class="NOPRINT" style="color:#CCCCCC">未知</span></font>
							
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
if(!NEW_LERPER.equals("")
   ||DSBA
   ||JSBA
   ||JLBA){
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_RYXX.inc"%>
<br>
<%}%>

<%--<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FDDBR.inc"%>
<br><br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_RYXX.inc" %>
--%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%> 
<%if(addFzjgFlag){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FZJG_BG.inc"%>
<br><br>
<%}%>
</body></html>