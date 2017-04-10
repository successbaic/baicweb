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
<jsp:useBean id="QYDJ_CZXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ"/>
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ"/>
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ"/>
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
	
	//String WTYW="√设立□变更□注销□备案□";
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
	boolean CWFZR=false;
	boolean LLY=false;
	boolean FGSBA=false;//分公司备案
	boolean IFBA=false;
	boolean WJSDJSR=false;
	int fzjgSize=0;
	String NEW_GD="";	//股东
	String NEW_GDMC="";  //发起人姓名或者名称
	String NEW_LERPER="";  //法定代表人
	List bgsxList=new ArrayList();
	
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		List temp = new ArrayList();
		if(bgsx.getALTITEM().equals("01")){//名称
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
		if(bgsx.getALTITEM().equals("03")){//法定代表人
			NEW_LERPER = bgsx.getALTAF();
			temp.add("法定代表人");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("05")){//注册资本
			temp.add("注册资本");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}	
		if(bgsx.getALTITEM().equals("110")){//注册资本币种
			temp.add("注册资本币种");
			temp.add(icms.getSysDm("CURRENCY",bgsx.getALTBE()));
			temp.add(icms.getSysDm("CURRENCY",bgsx.getALTAF()));
		}
		if(bgsx.getALTITEM().equals("20")){//投资总额
			temp.add("投资总额");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}	
		if(bgsx.getALTITEM().equals("114")){//注册资本币种
			temp.add("投资总额币种");
			temp.add(icms.getSysDm("CURRENCY",bgsx.getALTBE()));
			temp.add(icms.getSysDm("CURRENCY",bgsx.getALTAF()));
		}
		if(bgsx.getALTITEM().equals("101")){//企业类别
			temp.add("企业类别");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("04")){//企业类型
			temp.add("企业类型");
			temp.add(icms.getSysDm("ENTTYPE",bgsx.getALTBE()));
			temp.add(icms.getSysDm("ENTTYPE",bgsx.getALTAF()));
		}
		if(bgsx.getALTITEM().equals("12")){//经营范围
			temp.add("经营范围");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("08")){//经营期限
			temp.add("经营期限");
			temp.add(bgsx.getALTBE());
			temp.add(bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("10")){//股东-出资方式-出资时间
			NEW_GD = "GD";
			temp.add("投资人");
			ArrayList czxx_sq=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
			ArrayList czxx_zs=QYDJ_CZXX_ZS.getList(" WHERE PRIPID='"+QYDJ_JBXX.getPRIPID()+"'");
			String OLD_CZXX="",NEW_CZXX="";
			for(int j=0;j<czxx_zs.size();j++){
				com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS czxxzx=(com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS)czxx_zs.get(j);
			    if(!OLD_CZXX.equals("")){
			        OLD_CZXX+=";";
			    }
			    OLD_CZXX+=czxxzx.getINV();
            } 
            for(int m=0;m<czxx_sq.size();m++){
			    com.macrosoft.icms.qydj.QYDJ_CZXX_SQ czxxsq=(com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)czxx_sq.get(m);
			    if(!NEW_CZXX.equals("")){
			       NEW_CZXX+=";";
			    }
			    NEW_CZXX+=czxxsq.getINV();
			}
            
			temp.add(OLD_CZXX);
			temp.add(NEW_CZXX);
		}
		if(bgsx.getALTITEM().equals("160")){//发起人姓名或者名称
			NEW_GDMC = "GDMC";
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
			temp.add(icms.getSysDm("CONFORM",bgsx.getALTAF()));			
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
		if(bgsx.getALTITEM().equals("63")){//文件送达接收人
			WJSDJSR=true;
			IFBA=true;
		}
		
		if(bgsx.getALTITEM().equals("81") 
		|| bgsx.getALTITEM().equals("82") 
		||bgsx.getALTITEM().equals("83")){//分公司
			FGSBA=true;
			IFBA=true;
		}if(bgsx.getALTITEM().equals("780")){
			LLY=true;
			IFBA=true;
		}if(bgsx.getALTITEM().equals("790")){
			CWFZR=true;
			IFBA=true;
		}
	}
	%>
<html><head><title>非公司外资企业登记（备案）申请书</title>
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

<br>

<table border="1" width="85%" align="center" height="84%" bordercolor="#000000">         
<caption ><b>
	<span style="font-size: 20pt">非公司外资企业登记（备案）申请书</span></b><br>
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
				<td width="20%" align="center" height=50>名称预先核准文号注册号/统一社会信用代码</td>
				<td colspan=3 ><%if(QYDJ_JBXX.getUNISCID().equals("")){out.println(QYDJ_JBXX.getREGNO());}else{out.println(QYDJ_JBXX.getUNISCID());}%></td>
				
				<td width="20%" align="center" height=50>国别<br/>（地区）</td>
				<td ><%=icms.getSysDm("COUNTRY",QYDJ_JBXX.getCOUNTRY()) %></td>
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
				<td align="center" height=28 colspan="8">
					<B><%out.print(checkBox);%>设立</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=50 rowspan="2">法定代表人</td>
				<td align="center">姓名</td>
				<td colspan="3" align="center" >&nbsp;</td>
				
				<td align="center" >国别<br/>（地区）</td>
				<td align="center" colspan="2">&nbsp;</td>
			</tr>
			
			<tr>	
				<td align="center"  height=28>职  务</td>
				<td align="center" colspan="6" >
				
				<%=checkBox%>董事长/联合管理委员会主任
				&nbsp; &nbsp; 
				&nbsp; &nbsp; 
				<%=checkBox%>经理
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="15%">投资总额<br/>（万元）</td>
				<td align="center" width="10%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
				
				<td align="center" height=28  width="10%">币种</td>
				<td align="center" width="15%">&nbsp;</td>
				
				<td align="center" height=28 width="15%">折美元<br/>（万元）</td>
				<td align="center" width="10%">&nbsp;</td>
				
				<td align="center" height=28 width="15%">注册资本<br/>（万元）</td>
				<td align="center" width="10%">&nbsp;</td>
				
			</tr>
			<tr>
				<td align="center" nowrap="nowrap" height=28>企业类型</td>
				<td align="center" colspan="7">&nbsp;</td>
			</tr>
			<tr>
			    <td align="center" height=100 >经<br>营<br>范<br>围</td>
				<td colspan="7" align="left" class="tdprint" valign="top" style="font-size:13px;">
					<br>&nbsp;<br>
				</td>
			</tr>
			<tr>
			    <td align="center" height=28 >营业期限</td>
				<td align="center" colspan="4">
				□	___________年 &nbsp;&nbsp;&nbsp;&nbsp; □ 长期
				</td>
				<td align="center" colspan=2>申请副本数量</td>
				<td  align="center" >&nbsp;个</td>
			</tr>
		</table>
	</td>
</tr>
</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

<p class="PageNext"><br></p>

<table border="1" width="85%" align="center" bordercolor="#000000">
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="6">
					<B><%out.print(selected);%>变更</B>
				</td>
			</tr>
			<tr>
				<td align="center" height=28 width="20%" >变更项目</td>
				<td align="center" width="40%">原登记内容</td>
				<td align="center" width="40%">拟变更内容</td>
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
	<!-- 备案 -->
	<tr>
		<td>
			<table frame=void border="1" width="100%" align="center" bordercolor="#000000">
			<tr>
				<td align="center" height=28 colspan="5">
					<B><%if(IFBA){out.print(selected);}else{out.print(checkBox);}%>备案</B>
				</td>
			</tr>
			 <%
			 boolean addFzjgFlag=false;
			 String ADDFGS=checkBox;
			 String REMFGS=checkBox;
			 ArrayList fzjgList=QYDJ_FZJG.getList(" WHERE OPENO='"+OPENO+"' AND regtype IN ('新设','注销') "); 
			 if(fzjgList.size()>0){
				 if(fzjgList.size()>1){
					 addFzjgFlag=true;
				 }
			for(int i=0;i<fzjgList.size();i++){
				 ADDFGS=checkBox;
			     REMFGS=checkBox;
				 com.macrosoft.icms.qydj.QYDJ_FZJG_SQ fzjgBa=(com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(i);
				 if(fzjgBa.getREGTYPE().equals("新设")){
				 	ADDFGS=selected;
				 }else if(fzjgBa.getREGTYPE().equals("注销")){
				 	REMFGS=selected;
				 }
			 %>
				<tr>
					<td align="center" rowspan="2">分公司<br/><%=ADDFGS %>增设 <%=REMFGS %>注销</td>
					<td align="center" height=28>名称</td>
					<td width="20%"><%=fzjgBa.getBRNAME()%></td>
					<td align="center" height=28>注册号/统一<br/>社会信用代码</td>
					<td width="20%"><%=fzjgBa.getREGNO() %></td>
				</tr>
				<tr>
					<td align="center" height=28>登记机关</td>
					<td ><%=fzjgBa.getREGORG() %></td>
					<td align="center">登记日期</td>
					<td><%=fzjgBa.getREGDATE() %></td>
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
					<td width="20%"></td>
				</tr>
				<tr>
					<td align="center" height=28>登记机关</td>
					<td ></td>
					<td align="center">登记日期</td>
					<td></td>
				</tr>
			<%} %>
			<tr>
				<td align="center" rowspan="2">清算组</td>
				<td align="center" height="28" >成员</td>
				<td colspan="3"><%=NEW_QSZ_CY %></td>
			</tr>
			<tr>
				<td align="center" height=28>负责人</td>
				<td><%=NEW_QSZ_FZR%></td>
				<td align="center">联系电话</td>
				<td ><%=NEW_QSZ_TEL%></td>
			</tr>
			<tr>
				<td align="center" height="28">其他</td>
				<td align="left" colspan="4">
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
					<%
					if(CWFZR){out.print(selected);}else{out.print(checkBox);}%>
					财务负责人
					<%
					if(LLY){out.print(selected);}else{out.print(checkBox);}%>
					联络员
					<br/>
					<%
					if(WJSDJSR){out.print(selected);}else{out.print(checkBox);}%>
					外国投资者法律文件送达接受人
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table frame=void border="1" width="100%" height="80%" align="center" bordercolor="#000000">
				<tr>
					<td align="center" height=28 colspan="6">
						<B><%out.print(selected);%>申请人声明</B>
					</td>
				</tr>
				<tr>
					<td COLSPAN=6><br>
						&nbsp;&nbsp;&nbsp;&nbsp;本企业依照相关法律法规规定申请登记、备案，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。
						<br><br>
						<p >
							<font  style="float:left">
								&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签字：
								<span class="NOPRINT" style="color:#CCCCCC"><%=QYDJ_JBXX.getLEREP() %></span>
							</font>
						
							<font  style="float:right">公 章：&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
						</p>
						<br><br><br>
						<p> 
							<font  style="float:left">&nbsp;&nbsp;&nbsp;（清算组负责人）签字：
							<span class="NOPRINT" style="color:#CCCCCC">未知</span></font>
							
							<font style="float:right">
								年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</font>
							<br/>
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
if(!NEW_GD.equals("")||!NEW_GDMC.equals("")){
%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_CZXX.inc"%>
<%}%>
<%
if(!NEW_LERPER.equals("")
   ||DSBA
   ||JSBA
   ||JLBA){
%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_RYXX.inc"%>
<br>
<%}%>
<%if(!NEW_LERPER.equals("")){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FDDBR.inc"%>
<br><br>
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
<%--if(addFzjgFlag){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_FZJG_BG.inc"%>
<br><br>
<%}--%>
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

<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GS_WTDL.inc"%> 
</body></html>