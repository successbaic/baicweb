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
<jsp:useBean id="GTDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"/>
<jsp:useBean id="GTDJ_JYZXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="GTDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_BGXX_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
	String OPENO =GTDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	GTDJ_JBXX.setOPENO(OPENO);
	GTDJ_JBXX.doSelect();	
	String PRIPID=GTDJ_JBXX.getPRIPID();
	
	GTDJ_JYZXX.setOPENO(OPENO);
	GTDJ_JYZXX.doSelect();
	
	String checkBox= "□";
	String selected= "√";
	
	ArrayList list=GTDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String OLD_TRANAME="";//名称
	String NEW_TRANAME="";	
	
	String OLD_OPERNAME="";//经营者信息--姓名
	String NEW_OPERNAME="";
	
	String OLD_SEX="";//经营者信息--性别
	String NEW_SEX="";
	
	String OLD_NATION="";//经营者信息--民族
	String NEW_NATION="";
	
	String OLD_POLSTAND="";//经营者信息--政治面貌
	String NEW_POLSTAND="";
	
	String OLD_LITEDEG="";//经营者信息--文化程度
	String NEW_LITEDEG="";
	
	String OLD_OCCSTBEAPP="";//经营者信息--职业状况
	String NEW_OCCSTBEAPP="";
	
	String OLD_CERNO="";//经营者信息--身份证号码
	String NEW_CERNO="";
	
	String OLD_DOM="";//经营者信息--住所
	String NEW_DOM="";
	
	String OLD_POSTALCODE="";//经营者信息--邮政编码
	String NEW_POSTALCODE="";
	
	String OLD_TEL="";//经营者信息--联系电话
	String NEW_TEL="";
	
	String OLD_EMAIL="";//经营者信息--电子邮箱
	String NEW_EMAIL="";
	
	String OLD_MOBTEL="";//经营者信息--移动电话
	String NEW_MOBTEL="";
	
	String OLD_COMPFORM="";//组成形式
	String NEW_COMPFORM="";
	
	String OLD_JTCY="";//家庭成员姓名及身份证号码	
	String NEW_JTCY="";
	
	String OLD_BUSSCOANDFORM="";//经营范围
	String NEW_BUSSCOANDFORM="";
	
	String OLD_OPLOC="";//经营场所
	String NEW_OPLOC="";
	
	String OLD_TELS="";//联系方式
	String NEW_TELS="";

	String OLD_POSTALCODES="";//邮政编码
	String NEW_POSTALCODES="";
	
	String OLD_EMPNUM="";//从业人数
	String NEW_EMPNUM="";
	
	String OLD_CAPAM="";//资金数额
	String NEW_CAPAM="";
	
	String jyzlx="";//经营者类别
	boolean IFJYZBG=false;

	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.GTDJ_BGXX_SQ bgsx=(com.macrosoft.icms.qydj.GTDJ_BGXX_SQ)list.get(i);
		jyzlx=GTDJ_JYZXX.getWHETHERHKMAC();
		if(bgsx.getALTITEM().equals("01")){//名称
			OLD_TRANAME=bgsx.getALTBE();
			NEW_TRANAME=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("09")){//经营者
			IFJYZBG=true;
			OLD_OPERNAME=bgsx.getALTBE();
			NEW_OPERNAME=bgsx.getALTAF();
			//ArrayList nwjyzlist=GTDJ_JYZXX_NW.getList(" WHERE PRIPID='"+PRIPID+"'");
			//if(nwjyzlist.size()>0){
			//   com.macrosoft.icms.nw.GTDJ_JYZXX nwjyz=(com.macrosoft.icms.nw.GTDJ_JYZXX)nwjyzlist.get(0);
			//   OLD_OPERNAME=nwjyz.getNAME();
			//   OLD_SEX=icms.getSysDm("SEX",nwjyz.getSEX());
			//   OLD_NATION=icms.getSysDm("NATION",nwjyz.getNATION());
			//   OLD_POLSTAND=icms.getSysDm("POLSTAND",nwjyz.getPOLSTAND());
			//   OLD_LITEDEG=icms.getSysDm("LITEDEG",nwjyz.getLITEDEG());
			//   OLD_OCCSTBEAPP=nwjyz.getOCCSTBEAPP();
			//   OLD_CERNO=nwjyz.getCERNO();
			//   OLD_DOM=nwjyz.getDOM();
			//   OLD_POSTALCODE=nwjyz.getPOSTALCODE();
			//   OLD_TEL=nwjyz.getTEL();
			   //OLD_EMAIL=内网没有电子邮箱这个字段			   
			//}
			
			//NEW_OPERNAME=GTDJ_JYZXX.getNAME();
			//NEW_SEX=icms.getSysDm("SEX",GTDJ_JYZXX.getSEX());
			//NEW_NATION=icms.getSysDm("NATION",GTDJ_JYZXX.getNATION()); 
			//NEW_POLSTAND=icms.getSysDm("POLSTAND",GTDJ_JYZXX.getPOLSTAND());
			//NEW_LITEDEG=icms.getSysDm("LITEDEG",GTDJ_JYZXX.getLITEDEG());
			//NEW_OCCSTBEAPP=GTDJ_JYZXX.getOCCSTBEAPP();
			//NEW_CERNO=GTDJ_JYZXX.getCERNO();
			//NEW_DOM=GTDJ_JYZXX.getDOM();
			//NEW_POSTALCODE=GTDJ_JYZXX.getPOSTALCODE();
			//NEW_TEL=GTDJ_JYZXX.getTEL();
			//NEW_EMAIL=GTDJ_JYZXX.getEMAIL();
		}
		if(bgsx.getALTITEM().equals("68")){//经营者性别
			IFJYZBG=true;
			OLD_SEX=bgsx.getALTBE();
			NEW_SEX=icms.getSysDm("SEX",bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("64")){//经营者民族
			IFJYZBG=true;
			OLD_NATION=bgsx.getALTBE();
			NEW_NATION=icms.getSysDm("NATION",bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("70")){//经营者政治面貌
			IFJYZBG=true;
			OLD_POLSTAND=bgsx.getALTBE();
			NEW_POLSTAND=icms.getSysDm("POLSTAND",bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("71")){//经营者文化程度
			IFJYZBG=true;
			OLD_LITEDEG=bgsx.getALTBE();
			NEW_LITEDEG=icms.getSysDm("LITEDEG",bgsx.getALTAF());
		}
		if(bgsx.getALTITEM().equals("72")){//经营者职业状况
			IFJYZBG=true;
			OLD_OCCSTBEAPP=bgsx.getALTBE();
			NEW_OCCSTBEAPP=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("66")){//经营者身份证号码
			IFJYZBG=true;
			OLD_CERNO=bgsx.getALTBE();
			NEW_CERNO=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("67")){//经营者住所
			IFJYZBG=true;
			OLD_DOM=bgsx.getALTBE();
			NEW_DOM=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("73")){//经营者邮政编码
			IFJYZBG=true;
			OLD_POSTALCODE=bgsx.getALTBE();
			NEW_POSTALCODE=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("74")){//经营者联系电话
			IFJYZBG=true;
			OLD_TEL=bgsx.getALTBE();
			NEW_TEL=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("75")){//经营者电子邮箱
			IFJYZBG=true;
			OLD_EMAIL=bgsx.getALTBE();
			NEW_EMAIL=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("76")){//经营者移动电话
			IFJYZBG=true;
			OLD_MOBTEL=bgsx.getALTBE();
			NEW_MOBTEL=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("14")){//组成形式
			OLD_COMPFORM=bgsx.getALTBE();
			NEW_COMPFORM=bgsx.getALTAF();
		}
	    //if(bgsx.getALTITEM().equals("")){//家庭成员姓名及身份证号码
		//	OLD_JTCY=bgsx.getALTBE();
		//	NEW_JTCY=bgsx.getALTAF();
		//}
		if(bgsx.getALTITEM().equals("15")){//经营范围
			OLD_BUSSCOANDFORM=bgsx.getALTBE();
			NEW_BUSSCOANDFORM=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("16")){//经营场所
			OLD_OPLOC=bgsx.getALTBE();
			NEW_OPLOC=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("50")){//联系电话
			OLD_TELS=bgsx.getALTBE();
			NEW_TELS=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("69")){//邮政编码
			OLD_POSTALCODES=bgsx.getALTBE();
			NEW_POSTALCODES=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("13")){//从业人员
			OLD_EMPNUM=bgsx.getALTBE();
			NEW_EMPNUM=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("04")){//资金数额
			OLD_CAPAM=bgsx.getALTBE();
			NEW_CAPAM=bgsx.getALTAF();
		}
	}
	
	TwoDimensionCode twodc=new TwoDimensionCode();
	String PATH="";
	boolean twoFlag=false;
	if(webuser.getXZQH().equals("370100")){
		PATH=icms.getSysDm("PATH","1");
		twoFlag=twodc.getImgePath(PATH+"\\ewm\\",OPENO,GTDJ_JBXX.getTRANAME());
	}
%>
<html><head><title>个体工商户变更登记申请书</title>
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
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉页脚"清空)</font>

<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">个体工商户变更登记申请书</b><br>	
	</caption>
<tr><td colspan="3" align="right"  style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">统一社会信用代码：<%=GTDJ_JBXX.getUNISCID() %></td></tr>	
<tr><td colspan="3" align="right"  style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">注册号：<%=GTDJ_JBXX.getREGNO() %></td></tr>	
</table>
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">
<tr>
<td align="center" height=30 width="10%">项      目</td>
<td align="center" colspan=3 width="45%">原登记事项</td>
<td align="center" colspan=3 width="45%">申请变更登记事项</td>
</tr>
<tr>
<td height=30 align="center">名      称</td>
<td colspan=3><%=OLD_TRANAME%></td>
<td colspan=3><%=NEW_TRANAME%></td>
</tr>

<%if(!jyzlx.equals("2")&&!jyzlx.equals("3")&&!jyzlx.equals("4")){ %>
<tr>
<td rowspan=12 align="center">经营者</td>
<td colspan=2 align="center" height=30>姓名</td> 
<td width="15%"><%=OLD_OPERNAME %></td>
<td colspan=2 align="center" height=30>姓名</td> 
<td width="15%"><%=NEW_OPERNAME %></td>
</tr>

<tr>
<td align="center" height=30 width="15%">性别</td>
<td width="18%"><%=OLD_SEX %></td>
<td rowspan=5 align="center" width="12%">照片<br>粘贴处</td>
<td align="center" height=30 width="15%">性别</td>
<td width="18%"><%=NEW_SEX %></td>
<td rowspan=5 align="center" width="12%">照片<br>粘贴处</td>
</tr>

<tr>
<td align="center" height=30>民族</td>
<td><%=OLD_NATION %></td>
<td align="center" height=30>民族</td>
<td><%=NEW_NATION %></td>
</tr>

<tr>
<td align="center" height=30 nowrap="nowrap">政治面貌</td>
<td><%=OLD_POLSTAND %></td>
<td align="center" height=30 nowrap="nowrap">政治面貌</td>
<td><%=NEW_POLSTAND %></td>
</tr>

<tr>
<td align="center" height=30>文化程度</td>
<td><%=OLD_LITEDEG %></td>
<td align="center" height=30>文化程度</td>
<td><%=NEW_LITEDEG %></td>
</tr>

<tr>
<td align="center" height=30>职业状况</td>
<td><%=OLD_OCCSTBEAPP %></td>
<td align="center" height=30>职业状况</td>
<td><%=NEW_OCCSTBEAPP %></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>身份证号码</td>
<td><%=OLD_CERNO %></td>
<td align="center" height=30 colspan=2>身份证号码</td>
<td><%=NEW_CERNO %></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>住所</td>
<td><%=OLD_DOM %></td>
<td align="center" height=30 colspan=2>住所</td>
<td><%=NEW_DOM %></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>邮政编码</td>
<td><%=OLD_POSTALCODE%></td>
<td align="center" height=30 colspan=2>邮政编码</td>
<td><%=NEW_POSTALCODE %></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>联系电话</td>
<td><%=OLD_TEL %></td>
<td align="center" height=30 colspan=2>联系电话</td>
<td><%=NEW_TEL %></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>电子邮箱</td>
<td><%=OLD_EMAIL %></td>
<td align="center" height=30 colspan=2>电子邮箱</td>
<td><%=NEW_EMAIL %></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>移动电话</td>
<td><%=OLD_MOBTEL %></td>
<td align="center" height=30 colspan=2>移动电话</td>
<td><%=NEW_MOBTEL %></td>
</tr>
<%}else{ %>
<tr>
<td rowspan=11 align="center">经营者</td>
<td colspan=2 align="center" height=30>姓名</td> 
<td width="15%"></td>
<td colspan=2 align="center" height=30>姓名</td> 
<td width="15%"></td>
</tr>

<tr>
<td align="center" height=30>性别</td>
<td></td>
<td rowspan=5 align="center">照片<br>粘贴处</td>
<td align="center" height=30>性别</td>
<td></td>
<td rowspan=5 align="center">照片<br>粘贴处</td>
</tr>

<tr>
<td align="center" height=30>民族</td>
<td></td>
<td align="center" height=30>民族</td>
<td></td>
</tr>

<tr>
<td align="center" height=30>政治面貌</td>
<td></td>
<td align="center" height=30>政治面貌</td>
<td></td>
</tr>

<tr>
<td align="center" height=30>文化程度</td>
<td></td>
<td align="center" height=30>文化程度</td>
<td></td>
</tr>

<tr>
<td align="center" height=30>职业状况</td>
<td></td>
<td align="center" height=30>职业状况</td>
<td></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>身份证号码</td>
<td></td>
<td align="center" height=30 colspan=2>身份证号码</td>
<td></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>住所</td>
<td></td>
<td align="center" height=30 colspan=2>住所</td>
<td></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>邮政编码</td>
<td></td>
<td align="center" height=30 colspan=2>邮政编码</td>
<td></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>联系电话</td>
<td></td>
<td align="center" height=30 colspan=2>联系电话</td>
<td></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>电子邮箱</td>
<td></td>
<td align="center" height=30 colspan=2>电子邮箱</td>
<td></td>
</tr>

<tr>
<td align="center" height=30 colspan=2>移动电话</td>
<td></td>
<td align="center" height=30 colspan=2>移动电话</td>
<td></td>
</tr>
<%} %>

<tr>
<td rowspan=2 align="center">组成形式</td>
<td height=30 colspan=3 align="center">个人经营<%if("1".equals(OLD_COMPFORM)){out.print(selected);}else{out.print(checkBox);}%>
家庭经营<%if("2".equals(OLD_COMPFORM)){out.print(selected);}else{out.print(checkBox);}%></td>
<td height=30 colspan=3 align="center">个人经营<%if("1".equals(NEW_COMPFORM)){out.print(selected);}else{out.print(checkBox);}%>
家庭经营<%if("2".equals(NEW_COMPFORM)){out.print(selected);}else{out.print(checkBox);}%></td>
</tr>

<tr>
<td colspan=2 align="center" height=80>家庭成员姓名<br>及身份证号码</td>
<td><%=OLD_JTCY %></td>
<td colspan=2 align="center" height=80>家庭成员姓名<br>及身份证号码</td>
<td><%=NEW_JTCY %></td>
</tr>

<tr>
<td align="center" height=100 nowrap=nowrap>经营范围</td>
<td colspan=3 style="font-size:13px;"><%=OLD_BUSSCOANDFORM %></td>
<td colspan=3 style="font-size:13px;"><%=NEW_BUSSCOANDFORM %></td>
</tr>

<tr>
<td align="center" height=30>经营场所</td>
<td colspan=3><%=OLD_OPLOC %></td>
<td colspan=3><%=NEW_OPLOC %></td>
</tr>

<tr>
<td align="center" height=30>联系电话</td>
<td colspan=3><%=OLD_TELS %></td>
<td colspan=3><%=NEW_TELS %></td>
</tr>

<tr>
<td align="center" height=30>邮政编码</td>
<td colspan=3><%=OLD_POSTALCODES %></td>
<td colspan=3><%=NEW_POSTALCODES %></td>
</tr>

<tr>
<td align="center" height=30>从业人员</td>
<td colspan=3><%=OLD_EMPNUM %>&nbsp;&nbsp;&nbsp;&nbsp;人</td>
<td colspan=3><%=NEW_EMPNUM %>&nbsp;&nbsp;&nbsp;&nbsp;人</td>
</tr>

<tr>
<td align="center" height=30>资金数额</td>
<td colspan=3><%=OLD_CAPAM %>&nbsp;&nbsp;&nbsp;&nbsp;万元</td>
<td colspan=3><%=NEW_CAPAM %>&nbsp;&nbsp;&nbsp;&nbsp;万元</td>
</tr>

<TR><TD COLSPAN=7>&nbsp;&nbsp;&nbsp;&nbsp;本人依照《个体工商户条例》申请变更登记，提交文件材料真实有效。谨对真实性承担责任。<br>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;经营者签名：</p>
<p align="right">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
</TD></TR></table>

<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:12px">
						注：1、手工填写表格和签字请使用黑色或蓝黑色钢笔、毛笔或签字笔，请勿使用圆珠笔。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2、原登记事项、申请变更登记事项均只填写申请变更的栏目。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3、港、澳居民个体工商户和台湾农民个体工商户不填写本申请书“经营者”一栏内容，但应当分别填写“个体工商户经营者（港澳居民）登记表”和“个体工商户经营者（台湾农民）登记表”作为替代。
					</p>
				</td>
			</TR>			
		</table>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>		
<%if(IFJYZBG&&jyzlx.equals("2")){%>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GT_TWNM.inc" %>
<%} %>
<%if(IFJYZBG&&(jyzlx.equals("3")||jyzlx.equals("4"))){ %>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GT_GAJM.inc" %>
<%} %>
<br><br>
<p class="PageNext"><br>
<!--########### -->
<%@include file="public/GT_WTDL.inc"%>
<br><br>
<%--
<p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" cellspacing="0" bordercolor="#000000" cellpadding="0" height="850">
	<caption><p align="center"><b><font size="4">个体工商户变更登记审核表</font></b></p>
	<p align='right' >注册号：<%=GTDJ_JBXX.getREGNO()%></p></caption>
	<tr>
	    <td height="35" align="center" width="12%">项目</td>
	    <td colspan=2 align="center" width="44%">原登记事项</td>
	    <td colspan=2 align="center" width="44%">登记变更事项</td>
	</tr>
	<tr>
	    <td height="35" align="center">名称</td>
	    <td colspan=2><%=OLD_TRANAME %></td>
	    <td colspan=2><%=NEW_TRANAME %></td>
	</tr>
	<tr>
	    <td rowspan=3 align="center" width="12%">经营者</td>
	    <td height="35" align="center" width="15%">姓名</td>
	    <td width="29%"><%=OLD_OPERNAME %></td>
	    <td height="35" align="center" width="15%">姓名</td>
	    <td width="29%"><%=NEW_OPERNAME %></td>
	</tr>
	<tr>
	    <td height="35" align="center">身份证号码</td>
	    <td><%=OLD_CERNO %></td>
	    <td height="35" align="center">身份证号码</td>
	    <td><%=NEW_CERNO %></td>
	</tr>
	<tr>
	    <td height="35" align="center">住所</td>
	    <td><%=OLD_DOM %></td>
	    <td height="35" align="center">住所</td>
	    <td><%=NEW_DOM %></td>
	</tr>
	<tr>
	    <td rowspan=2 align="center">组成形式</td>
	    <td height=35 colspan=2 align="center">个人经营<%if("1".equals(OLD_COMPFORM)){out.print(selected);}else{out.print(checkBox);}%>
         家庭经营<%if("2".equals(OLD_COMPFORM)){out.print(selected);}else{out.print(checkBox);}%></td>
        <td height=35 colspan=2 align="center">个人经营<%if("1".equals(NEW_COMPFORM)){out.print(selected);}else{out.print(checkBox);}%>
         家庭经营<%if("2".equals(NEW_COMPFORM)){out.print(selected);}else{out.print(checkBox);}%></td>
	</tr>
	<tr>
	    <td align="center" height=70>家庭成员姓名及身份证号码</td>
        <td style="font-size:13px;"><%=OLD_JTCY %></td>
        <td align="center">家庭成员姓名及身份证号码</td>
        <td style="font-size:13px;"><%=NEW_JTCY %></td>
	</tr>
	<tr>
        <td align="center" height=100>经营范围</td>
        <td colspan=2 style="font-size:13px;"><%=OLD_BUSSCOANDFORM %></td>
        <td colspan=2 style="font-size:13px;"><%=NEW_BUSSCOANDFORM %></td>
    </tr>
    <tr>
        <td align="center" height=35>经营场所</td>
        <td colspan=2><%=OLD_OPLOC %></td>
        <td colspan=2><%=NEW_OPLOC %></td>
    </tr>
    <tr>
        <td align="center" height=35>从业人员</td>
        <td colspan=2><%=OLD_EMPNUM %>&nbsp;&nbsp;&nbsp;&nbsp;人</td>
        <td colspan=2><%=NEW_EMPNUM %>&nbsp;&nbsp;&nbsp;&nbsp;人</td>
    </tr>
    <tr>
        <td align="center" height=35>资金数额</td>
        <td colspan=2><%=OLD_CAPAM %>&nbsp;&nbsp;&nbsp;&nbsp;万元</td>
        <td colspan=2><%=NEW_CAPAM %>&nbsp;&nbsp;&nbsp;&nbsp;万元</td>
    </tr>
	<tr>
    <td align="center" height=150>受<br>理<br>意<br>见</td>
    <td align="center" colspan=4><br><br><br><br>受理人员签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
    <td align="center" height=150>核<br>准<br>意<br>见</td>
    <td align="center" colspan=4><br><br><br><br>核准人员签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
     <td align="center" height="35">准予变更登记通知书文号</td>
     <td colspan=4></td>
  </tr>
</table> --%>
</body></html>