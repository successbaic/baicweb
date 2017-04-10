<%@ page contentType="text/html;charset=GBK"%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.util.TwoDimensionCode" %>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
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
	
	String checkBox = "□";
	String selected= "√";
	String WTYW="名称核准□、设立□、变更√、注销□、备案□、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
	
	String OLD_ENTNAME="";//名称
	String NEW_ENTNAME="";	
	
	String NEW_DOM="";//驻在地址
	String OLD_DOM="";
	
	String OLD_POSTALCODE="";//邮政编码
	String NEW_POSTALCODE="";
	
	String OLD_TEL="";//联系电话
	String NEW_TEL="";
	
	String OLD_LERPER="";//首席代表
	String NEW_LERPER="";
	
	String OLD_DB="";//代表
	String NEW_DB="";
	
	String OLD_BUSSCOPE="";//业务范围
	String NEW_BUSSCOPE="";
	
	String OLD_OPDATETO="";//驻在期限
	String NEW_OPDATETO="";
	
	String OLD_FORENTNAME="";//派驻企业名称
	String NEW_FORENTNAME="";
	
	String OLD_FORENTADD="";//派驻企业地址
	String NEW_FORENTADD="";
	
	boolean CWFZR=false;
	boolean LLY=false;
	boolean IFBA=false;
	boolean MCBG=false;//名称变更
	boolean DBBG=false;//代表/首席代表变更
	boolean DBBA=false;
	
	List bgsxList=new ArrayList();
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//名称
			temp.add("名称");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			MCBG=true;
			DQENTNAME=OLD_ENTNAME;
		}
		if(bgsx.getALTITEM().equals("02")){//驻在地址
			temp.add("驻在地址");
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
		if(bgsx.getALTITEM().equals("22")){//首席代表
			temp.add("首席代表");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			DBBG=true;
		}

		if(bgsx.getALTITEM().equals("12")){//业务范围
			temp.add("业务范围");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("08")){//驻在期限
			temp.add("驻在期限");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("150")){//派驻企业名称
		   temp.add("派驻企业名称");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("151")){//派驻企业地址
		    temp.add("派驻企业地址");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("90")){//外国（地区）企业有权签字人姓名
			temp.add("有权签字人姓名");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("91")){//外国（地区）企业企业责任形式
			temp.add("企业企业责任形式");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("92")){//外国（地区）企业资本（资产）
			temp.add("外国（地区）企业资本（资产）");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("93")){//外国（地区）企业经营范围
			temp.add("外国（地区）企业经营范围");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
			IFBA=true;
		}
		if(bgsx.getALTITEM().equals("94")){//代表
			ArrayList dbOldList = QYDJ_RYXX_ZS.getList(" where PRIPID='"+QYDJ_JBXX.getPRIPID()+"'");
			for (int j = 0; j<dbOldList.size();j++){
				com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS dbOld=(com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS)dbOldList.get(j);
				OLD_DB+=dbOld.getNAME()+" ;  ";
			}
			  ArrayList dbNewList=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' ");  
			  for(int j=0;j<dbNewList.size();j++){
			    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ dTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)dbNewList.get(j);
			    NEW_DB+=dTable.getNAME()+" ;  ";
			    }
			
			temp.add("代表信息");
			temp.add(OLD_DB);
			temp.add(NEW_DB);    
			DBBA=true;
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
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,QYDJ_JBXX.getENTNAME());
	}
%>
<html><head><title>外国(地区)企业常驻代表机构变更登记申请书</title>
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
<br/>


<table border="1" width="80%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">外国（地区）企业常驻代表机构登记申请书</span></b><br>
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
				<td align="center" height=28>代表机构名称</td>
				<td colspan="5"><%=QYDJ_JBXX.getENTNAME()%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=50>登记证注册号/统<br/>一社会信用代码</td>
				<td colspan=5 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
			</tr>
			<tr>
				<td width="20%" align="center" height=70 >驻在场所</td>
				<td colspan="5" >
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getPROVINCE().length()==6?QYDJ_JBXX.getPROVINCE():QYDJ_JBXX.getPROVINCE()+"00"),"center",6)%>省（市/自治区）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCITY()),"center",6)%>市（地区/盟/自治州）
					<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",QYDJ_JBXX.getCOUNTY()),"center",8)%> 县（自治县/旗/自治旗/市/区）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getTOWN(),"center",15)%>乡（民族乡/镇/街道）
					<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getVILLAGE(),"center",15)%>村（路/社区）<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getHOUSENUMBER(),"center",5)%>号
				</td>
			</tr>
			<tr>
				<td align="center" height=28 nowrap="nowrap">联系电话</td>
				<td colspan=2 width="25%" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getTEL())%></td>
				
				<td align="center" height=28 nowrap="nowrap">邮政编码</td>
				<td colspan=2 width="25%" ><%=QYDJ_JBXX.doPreProcess(QYDJ_JBXX.getPOSTALCODE())%></td>
			</tr>
		</table>
	</td>
</tr>
	<!-- 设立 -->
<tr>
	<td>
		<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="5">
					<B><%=checkBox%>设立</B>
				</td>
			</tr>
<tr>
<td align='center' height=25 style="width:15%">首席代表姓名</td>
<td colspan="4"> &nbsp;</td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">代表姓名</td>
<td colspan="4"> &nbsp;</td>
</tr>
<tr>
<td height=100 align='center'>业务范围</td>
<td colspan="4" align='left' style="font-size:13px"> &nbsp;</td>
</tr>
<tr>
<td align='center' height=25 style="width:15%">驻在期限</td>
<td colspan="4" >
&nbsp;&nbsp;自 &nbsp;&nbsp;&nbsp;&nbsp; 年 &nbsp;&nbsp; 月 &nbsp;&nbsp;  日  &nbsp; 至 &nbsp;&nbsp;&nbsp; 年 &nbsp;&nbsp; 月 &nbsp;&nbsp; 日</td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">批准设立机关名称</td>
<td colspan="4" > &nbsp;</td>
</tr>

<tr>
<td align='center' height=25 style="width:15%">批准驻在期限</td>
<td colspan="4" >
&nbsp;&nbsp;自 &nbsp;&nbsp;&nbsp;&nbsp; 年 &nbsp;&nbsp; 月 &nbsp;&nbsp;  日  &nbsp; 至 &nbsp;&nbsp;&nbsp; 年 &nbsp;&nbsp; 月 &nbsp;&nbsp; 日</td>
</tr>

<tr>
<td align='center' height=25 style="width:10%">批准日期</td>
<td style="width:20%" colspan="2"> &nbsp;</td>
<td align='center' height=25 style="width:10%">批准文号</td>
<td style="width:20%" > &nbsp;</td>
</tr>

<tr>
<td rowspan="7" align="center" >外国（地区）<br/>企业情况</td>
<td height=25 align='center'>中文名称</td>
<td> &nbsp;</td>
<td align='center'>外文名称</td>
<td> &nbsp;</td>
</tr>
<tr>
<td align='center' height=25>住 所</td>
<td colspan="3" > &nbsp;</td>
</tr>
<tr>
<td align='center' height=25>存续期限</td>
<td colspan="3">&nbsp;&nbsp;自 &nbsp;&nbsp;&nbsp;&nbsp; 年 &nbsp;&nbsp; 月 &nbsp;&nbsp;  日  &nbsp; 至 &nbsp;&nbsp;&nbsp; 年 &nbsp;&nbsp; 月 &nbsp;&nbsp; 日</td>
</tr>

<tr>
<td align='center' height=25 nowrap>有权签字<br/>人姓名</td>
<td colspan="3" > &nbsp;</td>
</tr>

<tr>
<td align='center' height=25 nowrap>企业责任<br/>形式</td>
<td colspan="3">
<%out.println("□"); %>
有限责任 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%out.println("□"); %>
无限责任
</td>
</tr>

<tr>
<td align='center' height=25 nowrap>资本<br/>（资产）</td>
<td> &nbsp; &nbsp;
&nbsp;&nbsp;
万美元
</td>
<td align="center">国别<br/>（地区）</td>
<td> &nbsp;</td>
</tr>

<tr>
<td align='center' height=100 nowrap>经营范围</td>
<td colspan="3" align='left' style="font-size:13px"> &nbsp;</td>
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
				<td align="center" height=28 colspan="6">
					<B><%out.print(selected);%>变更/备案</B>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height=28 width="20%" >变更/备案项目</td>
				<td align="center" colspan="2" width="40%">原变更/备案内容</td>
				<td align="center" colspan="2" width="40%">拟变更/备案内容</td>
			</tr>
			<% 	
			int bgsxSize = bgsxList.size();
			boolean addBgsxFlag=false;
			if(bgsxList.size()>6){
				bgsxSize = 6;
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
				if(bgsxList.size()<6){
					for(int i=bgsxList.size();i<6;i++){
						out.print("<tr><td height='28' colspan='2'></td><td colspan='2'></td><td colspan='2'></td></tr>");
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
				<td align="center" height=30 colspan="6">
					<B><%out.print(checkBox);%>注销</B>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">注销原因</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%> 外国（地区）企业撤销代表机构<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 代表机构驻在期限届满不再继续从事业务活动<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 外国（地区）企业终止<br>
					&nbsp;&nbsp;<%out.print(checkBox);%> 代表机构依法被撤销批准或者责令关闭<br>
				</td>
			</tr>
			<tr>
				<td align="center" >清税情况</td>
				<td colspan="5"  height=30>
					&nbsp;&nbsp;<%out.print(checkBox);%> 已清理完毕 
					&nbsp;&nbsp;<%out.print(checkBox);%> 未涉及纳税义务
				</td>
			</tr>
			
			<tr>
				<td align="center" >海关手续<br/>清缴情况</td>
				<td colspan="5" >
					&nbsp;&nbsp;<%out.print(checkBox);%> 已办理完毕
					&nbsp;&nbsp;<%out.print(checkBox);%> 未涉及海关事务
				</td>
			</tr>
			
			<tr>
				<td align="center"  height=30>批准机关</td>
				<td colspan="5" >
				</td>
			</tr>
			
			<tr>
				<td align="center" width="20%" height=30>批准文号</td>
				<td colspan="2" width="30%">&nbsp;</td>
				<td align="center" width="20%">批准日期</td>
				<td colspan="2" width="30%">&nbsp;</td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;本机构依照相关法律法规规定申请登记、备案，提交材料真实有效。
						<br><br><br>
						<p ><br>
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;外国（地区）企业有权签字人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">代表机构印章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br><br>
						<p> 
							<br>
							<font style="float:right">
								年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/><br/><br>
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
	 <%
	 	if(DBBG){
	ArrayList newdbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN='1' ");
  for(int n=0;n<newdbr.size();n++){
    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)newdbr.get(n);    
%>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">外国（地区）企业常驻代表机构<br/>首席代表/代表信息</b><br><br></caption>	
<tr>
   <td align="center" width="20%" height=50 nowrap="nowrap">机构名称</td>
   <td width="65%" colspan="5"><%=QYDJ_JBXX.getENTNAME() %></td>
   <td align="center" width="15%" rowspan="3">照<br>片</td>
</tr>
<tr>
	<td align="center" height=50>代表姓名</td>
	<td><%=bTable.getNAME() %></td>
	
	<td align="center">职务</td>
	<td><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>

    <td align="center">国籍</td>
	<td><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
</tr>
<tr>	
	<td align="center"  height=50>入境时间</td>
	<td colspan="3"><%=bTable.getARRCHDATE()%></td>
	<td align="center" height=50>联系电话</td>
	<td><%=bTable.getTEL()%></td>
</tr>
<tr>	
<td align="center"  height=50 >证件类型</td>
	<td COLSPAN=3 width="45%"><%=icms.getSysDm("CERTYPE", bTable.getCERTYPE()) %></td>
    <td align="center"  height=50>证件号码</td>
	<td COLSPAN=2 width="45%"><%=bTable.getCERNO()%></td>
</tr>
<tr >
	<td align="center" height=30 colspan="4">境内居住地址</td>
	<td colspan="3"><%=bTable.getHOUADDINCHINA()%></td>
</tr>
<tr>
	<td align="center" height=30 colspan="4">代表证有效期限</td>
	<td colspan="3">
	自
	<%=bTable.getREPCARFROM() %>		
	至
	<%=bTable.getREPCARTO() %>
	</td>
</tr>	
<tr>
 <td align="center" COLSPAN=4 height=350>首席代表/代表简历</td>
 <td align="center" COLSPAN=4 height=350><br/><br/><br/>身份证明复印件粘贴处</td>
</tr>
<tr>
<td COLSPAN=8 >
<p align="left">
本人承诺，不存在不得担任首席代表、代表的以下情形：<br/>
 1、因损害中国国家安全或者社会公共利益，被判处刑罚的；<br/>
 2、因从事损害中国国家安全或者社会公共利益等违法活动，依法被撤销设立登记、吊销登记证或者被有关部门依法责令关闭的代表机构的首席代表、代表，自被撤销、吊销或者责令关闭之日起未逾5年的；<br/>
 3、国家工商行政管理总局规定的其他情形。<br/>
 <br/>
 </p>
 <p align="center">首席代表/代表签字</p>
 <br/> <br/>
</td>
</tr>
</table>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;注：本表可复印续填。</p>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<%	}		
}
	
	 if(!DBBA){
	ArrayList newdbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN!='1' ");
  for(int n=0;n<newdbr.size();n++){
    com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable=(com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)newdbr.get(n);    
%>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">外国（地区）企业常驻代表机构<br/>首席代表/代表信息</b><br><br></caption>	
<tr>
   <td align="center" width="20%" height=50 nowrap="nowrap">机构名称</td>
   <td width="65%" colspan="5"><%=QYDJ_JBXX.getENTNAME() %></td>
   <td align="center" width="15%" rowspan="3">照<br>片</td>
</tr>
<tr>
	<td align="center" height=50>代表姓名</td>
	<td><%=bTable.getNAME() %></td>
	
	<td align="center">职务</td>
	<td><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>

    <td align="center">国籍</td>
	<td><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
</tr>
<tr>	
	<td align="center"  height=50>入境时间</td>
	<td colspan="3"><%=bTable.getARRCHDATE()%></td>
	<td align="center" height=50>联系电话</td>
	<td><%=bTable.getTEL()%></td>
</tr>
<tr>	
<td align="center"  height=30 >证件类型</td>
	<td COLSPAN=3 width="45%"><%=icms.getSysDm("CERTYPE", bTable.getCERTYPE()) %></td>
    <td align="center"  height=30>证件号码</td>
	<td COLSPAN=2 width="45%"><%=bTable.getCERNO()%></td>
</tr>
<tr >
	<td align="center" height=30 colspan="4">境内居住地址</td>
	<td colspan="3"><%=bTable.getHOUADDINCHINA()%></td>
</tr>
<tr>
	<td align="center" height=30 colspan="4">代表证有效期限</td>
	<td colspan="3">
	自
	<%=bTable.getREPCARFROM() %>		
	至
	<%=bTable.getREPCARTO() %>
	</td>
</tr>	
<tr>
 <td align="center" COLSPAN=4 height=330>首席代表/代表简历</td>
 <td align="center" COLSPAN=4 height=330><br/><br/><br/>身份证明复印件粘贴处</td>
</tr>
<tr>
<td COLSPAN=8 >
<p align="left">
本人承诺，不存在不得担任首席代表、代表的以下情形：<br/>
 1、因损害中国国家安全或者社会公共利益，被判处刑罚的；<br/>
 2、因从事损害中国国家安全或者社会公共利益等违法活动，依法被撤销设立登记、吊销登记证或者被有关部门依法责令关闭的代表机构的首席代表、代表，自被撤销、吊销或者责令关闭之日起未逾5年的；<br/>
 3、国家工商行政管理总局规定的其他情形。<br/>
 </p>
 <p align="center">首席代表/代表签字</p>
 <br/> 
</td>
</tr>
</table>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;注：本表可复印续填。</p>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<%} 
	 }
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
	 for (int i=6;i<bgsxList.size();i++){
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