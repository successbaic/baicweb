<%@ page contentType="text/html;charset=GBK"%>
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
<%@ page import="com.macrosoft.icms.util.TwoDimensionCode" %>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	String opetype=QYDJ_JBXX.getOPETYPE();
	String DQENTNAME=QYDJ_JBXX.getENTNAME();
	

	MCGL_JBXX_ZS.setNAMEID(QYDJ_JBXX.getPRIPID());
	MCGL_JBXX_ZS.doSelect();
	String WH=MCGL_JBXX_ZS.getAPPRNO();

//	String WTYW="√设立□变更□注销□备案□";
	String WTYW1="□ 名称预先核准   √ 设立    □ 变更    □ 注销    □ 备案    □ 撤销变更登记";
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
<html><head><title>合伙企业登记（备案）申请书</title>
<%out.print(pageshow.pagesetup_default()); %>
</head>
<body onload="pagesetup_default()" style="text-align: center">
<style>
table{border-collapse: collapse;}
  h1{text-align:center;font-size:27px;}
.table{border: 3px solid black; width:80%;}
.text{align:center;text-indent:30px;width:92%;margin-left:5%;line-height:30px;}
.right{text-align:right;}
.float{float: right;}
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
<br>
<table border="1" width="80%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">合伙企业登记（备案）申请书</span></b><br>
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
				<td colspan=5 ><%=WH%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >主要经营场所</td>
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
					<B><%if("20".equals(opetype)){out.print(selected);}else{out.print(checkBox);}%>设立</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=100 rowspan="2">执行事务合伙人</td>
				<td colspan="2" align="center" >姓名或名称</td>
				<td colspan="3" align="center" ><%=QYDJ_JBXX.getLEREP()%></td>
			</tr>
			<tr>
				<td colspan="2" align="center" >委派代表（仅限执行事<br/>务合伙人为法人或其他<br/>组织时填写）</td>
				<td colspan="3" align="center" >&nbsp;</td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >合伙企业类型</td>
				<td colspan="5" >
					<%if("4531".equals(QYDJ_JBXX.getENTTYPE())){out.print(selected);}else{out.print(checkBox);}%>普通合伙
					&nbsp;
					<%if("4532".equals(QYDJ_JBXX.getENTTYPE())){out.print(selected);}else{out.print(checkBox);}%>特殊的普通合伙
					&nbsp;
					<%if("4533".equals(QYDJ_JBXX.getENTTYPE())){out.print(selected);}else{out.print(checkBox);}%>有限合伙
				</td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >出资额<br/>（万元）</td>
				<td colspan="5" >
				其中：实缴 <%=SysSystem.toUnderlineStr(QYDJ_JBXX.getREGCAP()+"","center",9)%> 万元，认缴 <%=SysSystem.toUnderlineStr(QYDJ_JBXX.getRECCAP()+"","center",9)%> 万元
				</td>
			</tr>
			<tr>
			    <td align="center" height=150 >经<br>营<br>范<br>围</td>
				<td colspan="5" align="left" class="tdprint" valign="top" style="font-size:13px;">
					<br><%out.print(QYDJ_JBXX.getBUSSCOPE());%><br>
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
			    <td align="center" height=30 width="20%">营业期限</td>
				<td align="left" colspan="5" width="80%">
				 自_________年_______月_______日到_________年_______月_______日
				</td>
			</tr>
			
			<tr>
			    <td align="center" height=28 >合伙人数</td>
				<td align="left">
				<%=QYDJ_JBXX.getPARNUM() %>
				</td>
				 <td align="center" height=28 colspan="2" nowrap>其中，有限合伙人数<br/>（仅限有限合伙填写）</td>
				<td align="left" colspan="2">
				<%=QYDJ_JBXX.getEXENUM() %>
				</td>
			</tr>
			<tr>
			    <td align="center" height=28 >从业人数</td>
				<td align="left" colspan="5">
				 <%=QYDJ_JBXX.getEMPNUM() %>
				</td>
			</tr>
			
			<tr>
					<td COLSPAN=6>
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;全体合伙人签字：
						<br><br><br><br><br><br><br><br>
						<p> 
							<font style="float:right">
								 申请日期：
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/><br/>
						</p> 
					</td>
				</tr>
		
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(checkBox);%>变更</B>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height=28 width="20%" >变更项目</td>
				<td align="center" colspan="2" width="40%">原登记内容</td>
				<td align="center" colspan="2" width="40%">拟变更内容</td>
			</tr>
			<% 	
				for(int i=0;i<4;i++){
					out.print("<tr><td height='28' colspan='2'></td><td colspan='2'></td><td colspan='2'></td></tr>");
				 }
			%>	
			
			<tr>
					<td COLSPAN=6>
						<br><br>
						&nbsp;&nbsp;&nbsp;&nbsp;执行事务合伙人（含委派代表）签字：
						<br><br><br><br><br><br>
						<p> 
							<font style="float:right">
								 申请日期：
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/><br/>
						</p> 
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

<table border="1" width="80%" height="75%" align="center" bordercolor="#000000">	
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="5">
					<B><%out.print(checkBox);%>备案</B>
				</td>
			</tr>
			<tr>
				<td align="center" rowspan="2">分公司<br/>□增设□注销</td>
				<td align="center" height=28>名称</td>
				<td width="20%"></td>
				<td align="center" height=28>注册号/统一社会信用代码</td>
				<td width="20%"></td>
			</tr>
			<tr>
				<td align="center" height=28>登记机关</td>
				<td></td>
				<td align="center">登记日期</td>
				<td></td>
			</tr>
			<tr>
				<td align="center" rowspan="2">清算组</td>
				<td align="center" height=28>清算人</td>
				<td></td>
				<td align="center">联系电话</td>
				<td ></td>
			</tr>
			<tr>
				<td align="center" height="28" >成员名单</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td align="center" height="28">合伙协议</td>
				<td align="center" colspan="4">
				□初次备案  &nbsp; &nbsp;  □涉及变更事项备案 
				</td>
			</tr>
			<tr>
				<td align="center" height="28">其他</td>
				<td align="center" colspan="4">
				□联络员  &nbsp; &nbsp; □财务负责人
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
					&nbsp;&nbsp;<%out.print(checkBox);%> 1、合伙期限届满，合伙人决定不再经营;<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 2、合伙协议约定的解散事由出现;<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 3、全体合伙人决定解散;<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 4、合伙人已不具备法定人数满三十天;<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 5、合伙协议约定的合伙目的已经实现或者无法实现;<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 6、依法被吊销营业执照、责令关闭或者被撤销;<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 7、法律、行政法规规定的其他原因：_____________;<br>
				</td>
			</tr>
			<tr>
				<td align="center" >分支机构<br/>注销情况</td>
				<td colspan="5" >
					
				</td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;本企业依照相关法律法规规定申请登记、备案，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;执行事务合伙人（含委派代表）签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">公章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br>
						<p> 
							<font  style="float:left">&nbsp;&nbsp;&nbsp;（清算组负责人）签字：
							<span class="NOPRINT" style="color:#CCCCCC"></span></font>
							
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
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>


<br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/NZHH_FZR.inc"%>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/NZHH_CZXX.inc" %>















<br><p class="PageNext"><br>
 <h1>全体合伙人主体资格证明或</h1><h1>自然人身份证明复印件</h1>
   <table class="table" ALIGN="CENTER">
      <tr><td style="height:650px;text-align:center;">复印件粘贴处</td></tr>
   </table>
   <br/>
   <%
	out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
	%>
   <br><p class="PageNext"><br>
   
   


   <h1>全体合伙人委托执行事务合伙人的委托书</h1>
   <div class="text">
       <div style="text-align:left;">
      &nbsp;&nbsp;&nbsp;&nbsp;经全体合伙人协商一致，同意委托_______________________为执行事务合伙人。
       </div> 
      <div>&nbsp;<br/><br/><br/></div>
      <div class="left">全体合伙人：</div>
      <div >&nbsp;<br/><br/><br/></div>
      <div class="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;日</div>
   </div>
    <br/>
   <%
	out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
	%>
   <br><p class="PageNext"><br>
   




   <h1>法人或其他组织委派代表的委托书</h1>
   <div class="text">
       <div style="text-align:left;">
      &nbsp;&nbsp;&nbsp;&nbsp;我单位作为合伙企业_________________________的执行事务合伙人，现委托___________代表我单位执行合伙事务。
       </div> 
       <div>&nbsp;<br/><br/><br/></div>
      <div class="left">委托单位法定代表人（负责人）签字：</div>
      <div >&nbsp;<br/><br/><br/></div>
      <div class="right">委托单位印章<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;日</div>
   </div>
    <br/>
   <%
	out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
	%>
   <br><p class="PageNext"><br>

   <h1>全体合伙人委派分支机构负责人的委托书</h1>
   <div class="text">
       <div style="text-align:left;">
      &nbsp;&nbsp;&nbsp;&nbsp;经全体合伙人与受托人协商一致，全体合伙人委派受托人为全体合伙人所办的合伙企业（名称）____________________________________的分支机构（名称）_________________________负责人。
       </div> 
      <div>&nbsp;<br/><br/><br/></div>
      <div class="float">
         <div>&nbsp;<br/><br/><br/></div>
         受托人：
         <div>&nbsp;<br/><br/><br/></div>
         <div class="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;日</div>
      </div>
       
      <div  width="50%">
         <div>&nbsp;<br/><br/><br/></div>
         全体合伙人：
         <div>&nbsp;<br/><br/><br/></div>
         <div >&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;日</div>
      </div>  
   </div>
    <br/>
   <%
	out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
	%>
   <br><p class="PageNext"><br>

   
   <h1>全体合伙人指定代表或共同委托代理人的委托书</h1>
   <div class="text">
       <div style="text-align:left;">
      &nbsp;&nbsp;&nbsp;&nbsp;经全体合伙人与受托人协商一致，全体合伙人指定________________作代表人或共同委托代理人_____________向登记机关申请办理合伙企业（分支机构）
            的设立（变更、注销）登记事宜。
       </div> 

      <div class="float">
         <div>&nbsp;<br/><br/><br/></div>
         受托人：
         <div>&nbsp;<br/><br/><br/></div>
         <div class="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;日</div>
      </div>
       
      <div  width="50%">
         <div>&nbsp;<br/><br/><br/></div>
         全体合伙人：
         <div>&nbsp;<br/><br/><br/></div>
         <div >&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;日</div>
      </div>  
   </div>
    <br/>
   <%
	out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
	%>
   <br><p class="PageNext"><br>


   <h1>执行事务合伙人（含委派代表）</h1><h1>指定的代表或者委托的代理人的委托书</h1>
   <div class="text">
       <div style="text-align:left;">
      &nbsp;&nbsp;&nbsp;&nbsp;作为合伙企业（名称）_________________________的执行事务合伙人或委派代表，现指定代表或者委托代理人_______________向登记机关申请办理合伙企业（分支机构）的变更（注销）登记事宜。
       </div> 

      <div class="float">
         <div>&nbsp;<br/><br/><br/></div>
         受托人：
         <div>&nbsp;<br/><br/><br/></div>
         <div class="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;日</div>
      </div>
       
      <div  width="50%">
         <div>&nbsp;<br/><br/><br/></div>
         执行事务合伙人（含委派代表）签字：
         <div>&nbsp;<br/><br/><br/></div>
         <div >&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;日</div>
      </div>  
   </div>

 <br/>
   <%
	out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
	%>















<p class="PageNext"><br>
<%@include file="public/GS_CWFZR.inc" %>
<p class="PageNext"><br>
<%@include file="public/GS_LLY.inc" %>

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%>
</body></html>