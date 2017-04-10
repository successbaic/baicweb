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
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
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
	ArrayList list=QYDJ_BGSX.getList(" WHERE OPENO='"+OPENO+"'");
	
	String OLD_ENTNAME="";//分支机构名称
	String NEW_ENTNAME="";	
	
	String NEW_DOM="";//经营场所
	String OLD_DOM="";
	
	String OLD_POSTALCODE="";//邮政编码
	String NEW_POSTALCODE="";
	
	String OLD_TEL="";//联系电话
	String NEW_TEL="";
	
	String OLD_ENTTYPE="";//企业类型
	String NEW_ENTTYPE="";
	
	String OLD_SUPENTNAME="";//隶属企业名称
	String NEW_SUPENTNAME="";
	
	String OLD_SUPENTTYPE="";//隶属企业企业类型
	String NEW_SUPENTTYPE="";
	
	String OLD_LERPER="";//负责人
	String NEW_LERPER="";
	
	String OLD_HOUSEADD="";//负责人住所
	String NEW_HOUSEADD="";
	
	String OLD_ABUITEMCO="";//许可经营项目
	String NEW_ABUITEMCO="";
	
	String OLD_BUSSCOPE="";//经营范围
	String NEW_BUSSCOPE="";
	
	String OLD_OPDATETO="";//营业期限
	String NEW_OPDATETO="";
	
	boolean MCBG=false;//名称变更
	boolean DOMBG=false;//经营场所变更
	boolean ENTTYPEBG=false;//企业类型变更
	boolean LERPERBG=false;//负责人变更
	boolean BUSSCOPEBG=false;//经营范围变更
	boolean OPDATETOBG=false;//经营期限变更
	
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);
		if(bgsx.getALTITEM().equals("01")){//分支机构名称
			OLD_ENTNAME=bgsx.getALTBE();
			NEW_ENTNAME=bgsx.getALTAF();
			MCBG=true;
			DQENTNAME=OLD_ENTNAME;
		}
		if(bgsx.getALTITEM().equals("02")){//经营场所
			OLD_DOM=bgsx.getALTBE();
			NEW_DOM=bgsx.getALTAF();
			DOMBG=true;
		}
		if(bgsx.getALTITEM().equals("50")){//电话
			OLD_TEL=bgsx.getALTBE();
			NEW_TEL=bgsx.getALTAF();
			DOMBG=true;
		}
		if(bgsx.getALTITEM().equals("69")){//邮编
			OLD_POSTALCODE=bgsx.getALTBE();
			NEW_POSTALCODE=bgsx.getALTAF();
			DOMBG=true;
		}
		if(bgsx.getALTITEM().equals("04")){//企业类型
			OLD_ENTTYPE=bgsx.getALTBE();
			NEW_ENTTYPE=bgsx.getALTAF();
			ENTTYPEBG=true;
		}
		if(bgsx.getALTITEM().equals("105")){//隶属企业名称
		    OLD_SUPENTNAME=bgsx.getALTBE();
		    NEW_SUPENTNAME=bgsx.getALTAF();
		    MCBG=true;
		}
		if(bgsx.getALTITEM().equals("108")){//隶属企业的企业类型
		    OLD_SUPENTTYPE=bgsx.getALTBE();
		    NEW_SUPENTTYPE=bgsx.getALTAF();
		}
		if(bgsx.getALTITEM().equals("21")){//负责人
			OLD_LERPER=bgsx.getALTBE();
			NEW_LERPER=bgsx.getALTAF();
			LERPERBG=true;
		}
		if(bgsx.getALTITEM().equals("54")){//负责人住所
		    OLD_HOUSEADD=bgsx.getALTBE();
		    NEW_HOUSEADD=bgsx.getALTAF();
		    LERPERBG=true;
		}
		if(bgsx.getALTITEM().equals("06")){//许可经营项目
			OLD_ABUITEMCO=bgsx.getALTBE();
			NEW_ABUITEMCO=bgsx.getALTAF();
			BUSSCOPEBG=true;
		}
		if(bgsx.getALTITEM().equals("12")){//经营范围
			OLD_BUSSCOPE=bgsx.getALTBE();
			NEW_BUSSCOPE=bgsx.getALTAF();
			BUSSCOPEBG=true;
		}
		if(bgsx.getALTITEM().equals("08")){//营业期限
			OLD_OPDATETO=bgsx.getALTBE();
			NEW_OPDATETO=bgsx.getALTAF();
			OPDATETOBG=true;
		}
	}
%>
<html><head><title>外商投资合伙企业分支机构变更登记申请书</title>
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

<table border="0" width="100%" style="border-width: 0" cellspacing="0" cellpadding="0" height="880">		
<tr>
<td height="120" align="center" style="line-height: 100px;">			
<p align="center"><span style="font-size: 24pt; font-family: 黑体" >外商投资合伙企业分支机构<br>变更登记申请书</td>
</tr>
<tr>
<td>
<table border="0" width="85%" bordercolor="#000000" style="border-collapse: collapse" align=center>
  <TR>
   <TD COLSPAN=4><br>
   <p style="line-height:40px;"><%=SysSystem.toUnderlineStr("","center",15)%>工商行政管理局：<br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国合伙企业法》、《中华人民共和国合伙企业登记管理办法》、《外国企业或个人在中国境内设立合伙企业管理办法》和《外商投资合伙企业登记管理规定》等有关法律法规和规章，现申请分支机构
<%for(int i=0;i<list.size();i++){
	com.macrosoft.icms.qydj.QYDJ_BGSX_SQ bgsx=(com.macrosoft.icms.qydj.QYDJ_BGSX_SQ)list.get(i);   
%><%=SysSystem.toUnderlineStr(icms.getSysDm("ALTITEM",bgsx.getALTITEM()),"center",8)%>
<%}%>等事项的变更登记，请予核准。同时承诺：所提交的文件、证件真实、合法、有效，复印文本与原件一致，并对因提交虚假文件所引发的后果承担法律责任。
   </p>
   </TD>
</TR>
</table></td></tr>
<tr>
<td height="250" align="center">
<table border="0" width="85%" height="234">
	<tr>
		<td width="220" nowrap="nowrap"><font style="font-size: 15pt">合伙企业分支机构名称</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="220" nowrap="nowrap"><font style="font-size: 15pt">分支机构注册号</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getREGNO(),"center",30)%></td></tr>
	<tr>
		<td width="220" nowrap="nowrap"><font style="font-size: 15pt">执行事务合伙人或委派代表签字</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>	
	<tr>
	    <td nowrap="nowrap" colspan=2><font style="font-size: 15pt">申  请  日  期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</font><br><br></td></tr>			
</table></td></tr>
<tr><td align="center">
<font style="font-size: 16pt">中华人民共和国国家工商行政管理总局制</font><p align="center">
<font face="Times New Roman">
<span style="font-size: 16pt; font-weight: 700">HTTP://WWW.SAIC.GOV.CN</span><br>
<span style="font-size: 16pt; font-weight: 700">HTTP://QYJ.SAIC.GOV.CN</span></font></td></tr></table>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>指定代表或委托代理人的证明</b></p></span>
<%
 String CONSIGNER="",CONFROM="",CONTO=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 CONSIGNER =bTable.getCONSIGNER();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;兹指定/委托<%=SysSystem.toUnderlineStr(CONSIGNER,"left",30)%>办理本分支机构变更登记事宜。<br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;指定/委托的有效期限：自<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> 至<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %><br></p>
<p align="right">
&nbsp;&nbsp;&nbsp;&nbsp;委托人 ：<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<br></p>
<p align="right">
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;注：委托人为分支机构负责人。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<span style="font-size: 16pt"><p align="center">指定代表或委托代理人信息</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">姓  名</td>
    <td align="center" height="45" width="20%"></td>
    <td width="60%" rowspan="4" align="center">代理人身份证件复印件粘贴处</td>
  </tr>
  <tr>
    <td width="20%" align="center">单  位</td>
    <td align="center" height="45" width="20%"></td>
  </tr>
  <tr>
    <td width="20%" align="center">部  门</td>
    <td align="center" height="45" width="20%"></td>
  </tr>
  <tr>
    <td width="20%" align="center">联系电话</td>
    <td align="center" height="45" width="20%"></td>
  </tr>
</table>
<%-- 
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构变更登记审批表</b></p></span>
<table align="center" border="1" width="90%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center" height=200>受理<br>意见</td>
    <td align="center"><br><br><br><br>受理人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
  <tr>
    <td width="20%" align="center" height=200>审查<br>意见</td>
    <td align="center"><br><br><br><br>核准人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 </td>
  </tr>
   <tr>
    <td width="20%" align="center" height=180>备注</td>
    <td><br><br><br><br></td>
  </tr>
</table>
<p class="PageNext"><br></p>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0">
<br>
	<caption><p><b><font size="4">外商投资合伙企业分支机构领照存单</font></b></p></caption>
	<tr>
	    <td height="40" align="center" width="20%">企业分支机构名称</td>
		<td align="center" colspan="5">　</td>
	</tr>
	<tr>
		<td height="40" align="center" width="20%">注册号</td>
		<td align="center"  colspan="2">　</td>
		<td align="center"  width="20%">核准日期</td>
		<td align="center"  colspan="2">　</td>
	</tr>
	<tr>
		<td   height="40" align="center" >营业执照编号</td>
		<td  colspan="5" height="40">
		<p align="left">正本：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		副本1：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		副本2：</td>
	</tr>
	<tr>
		<td   height="40" align="center" >缴费数额</td>
		<td width="27%" colspan="2" height="40" align="center" >　</td>
		<td height="40" align="center" >缴费收据号</td>
		<td colspan="2" height="40" align="center">　</td>
	</tr>
	<tr>
		<td   rowspan="4" height="40" align="center" >
		领<br>
		照<br>
		人</td>
		<td  height="40" align="center" nowrap="nowrap">证件名称</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >证件号码</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" width="15%">签&nbsp;&nbsp;&nbsp; 字</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >日&nbsp;&nbsp;&nbsp; 期</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td   height="40" align="center" >备&nbsp;&nbsp;&nbsp; 注</td>
		<td  height="40" colspan="5" align="center" >　</td>
	</tr>
</table>
<p align="left" style="line-height: 150%">
<font face="仿宋_GBK" style="font-size: 11pt">注：领照人应为负责人或其授权人。</font></p>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0">
<caption>
<b><font size="4">归档情况</font></b>
</caption>
	<tr>
		<td height="40" align="center"  >送 档 人</td>
		<td height="40" width="478" >　</td>
	</tr>
	<tr>
		<td height="40" align="center"  >接 档 人</td>
		<td height="40" width="478" >　</td>
	</tr>
	<tr>
		<td height="40" align="center"  >送档日期</td>
		<td height="40" width="478" >　</td>
	</tr>
	<tr>
		<td height="40" align="center"  >备&nbsp;&nbsp;&nbsp; 注</td>
		<td height="40" width="478" >　</td>
	</tr>
</table>--%>
<%if(MCBG){ %>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构名称变更登记<br>所需提交的文件</b></p></span>
<table border="1" width="100%" height="240" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center">
		<p >序号</td>
		<td >
		<p align="center">文件名称</td>
	</tr>
	<tr>
		<td width="67" align="center">1</td>
		<td >《外商投资合伙企业分支机构变更登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center">2<font face="宋体">*</font></td>
		<td >隶属企业依法做出的决定书</td>
	</tr>
	<tr>
		<td width="67" align="center">3</td>
		<td >加盖隶属企业印章的隶属企业营业执照副本复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">4<font face="宋体" >*</font></td>
		<td >分支机构营业执照副本复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">5</td>
		<td >其他有关文件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p><font face="楷体_GBK" size="2px"><b>规范要求：</b></font><br>
         <p><font face="楷体_GBK" size="2px">1.本申请表应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font><Br>
	     <p><font face="楷体_GBK" size="2px">2.以上文件除标明复印件外，应提交原件。</font><br>
	     <p><font face="楷体_GBK" size="2px">3.以上提交文件如为外文，需提交中文译文，并加盖翻译单位公章。</font><br>
	     <p><font face="楷体_GBK" size="2px">4.同时申请多项变更时，相同材料只需提交一份。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">5.第2项指根据《中华人民共和国合伙企业企业法》、《中华人民共和国合伙企业登记管理办法》以及《中华人民共和国外国企业或者个人在中国境内设立合伙企业管理办法》以及合伙企业协议规定做出的决定书，决定书的内容与所申请的事项应当一致。</font><br>
	     <p><font face="楷体_GBK" size="2px">6.第4项指变更核准后，应提交营业执照正、副本原件，由登记机关换发新的营业执照。</font><br>
	    </td>
	 </tr>
</table>
<br>
<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" width="50%" height=40>原隶属企业名称</td>
	<td align="center" width="50%">变更的隶属企业名称</td>
</tr>
<tr>
	<td width="50%" height=40><%=OLD_SUPENTNAME %></td>
	<td width="50%"><%=NEW_SUPENTNAME %></td>
</tr>
<tr>
	<td align="center" width="50%" height=40>原分支机构名称</td>
	<td align="center" width="50%">变更的分支机构名称</td>
</tr>
<tr>
	<td width="50%" height=40><%=OLD_ENTNAME %></td>
	<td width="50%"><%=NEW_ENTNAME %></td>
</tr>
</table>
<%} %>
<%if(DOMBG){%>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构经营场所<br>变更登记所需提交的文件</b></p></span>
<table border="1" width="100%" height="200" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center">
		<p >序号</td>
		<td >
		<p align="center">文件名称</td>
	</tr>
	<tr>
		<td width="67" align="center">1</td>
		<td >《外商投资合伙企业分支机构变更登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center">2<font face="宋体">*</font></td>
		<td >隶属企业依法做出的决定书</td>
	</tr>
	<tr>
		<td width="67" align="center">3<font face="宋体">*</font></td>
		<td >经营场所证明</td>
	</tr>
	<tr>
		<td width="67" align="center">4<font face="宋体" >*</font></td>
		<td >分支机构营业执照副本复印件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p><font face="楷体_GBK" size="2px"><b>规范要求：</b></font><br>
         <p><font face="楷体_GBK" size="2px">1.本申请表应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font><Br>
	     <p><font face="楷体_GBK" size="2px">2.以上文件除标明复印件外，应提交原件。</font><br>
	     <p><font face="楷体_GBK" size="2px">3.以上提交文件如为外文，需提交中文译文，并加盖翻译单位公章。</font><br>
	     <p><font face="楷体_GBK" size="2px">4.同时申请多项变更时，相同材料只需提交一份。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">5.第2项指根据《中华人民共和国合伙企业企业法》、《中华人民共和国合伙企业登记管理办法》以及《中华人民共和国外国企业或者个人在中国境内设立合伙企业管理办法》以及合伙企业协议规定做出的决定书，决定书的内容与所申请的事项应当一致。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">6.第3项自有房产提交产权证复印件，并提交原件核对；租赁房屋提交租赁协议原件及出租方的产权证复印件。以上不能提供产权证复印件的，提交能够证明产权归属的其他房屋产权使用证明复印件。出租方为宾馆、饭店的，还应提交宾馆、饭店的营业执照复印件。</font><br>
	     <p><font face="楷体_GBK" size="2px">7.第4项指变更核准后，应提交营业执照正、副本原件，由登记机关换发新的营业执照。</font><br>
	    </td>
	 </tr>
</table>
<br>
<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" width="40%" height=40>原经营场所</td>
	<td align="center" width="60%">申请变更后经营场所</td>
</tr>
<tr>
	<td width="40%" height=100><%=OLD_DOM %></td>
	<td width="60%"><%=NEW_DOM %><br><br>邮政编码:<%=SysSystem.toUnderlineStr(NEW_POSTALCODE,"center",12)%>联系电话:<%=SysSystem.toUnderlineStr(NEW_TEL,"center",15)%></td>
</tr>
</table>
<%} %>
<%if(ENTTYPEBG){ %>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构企业类型变更<br>登记所需提交的文件</b></p></span>
<table border="1" width="100%" height="240" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center">
		<p >序号</td>
		<td >
		<p align="center">文件名称</td>
	</tr>
	<tr>
		<td width="67" align="center">1</td>
		<td >《外商投资合伙企业分支机构变更登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center">2<font face="宋体">*</font></td>
		<td >隶属企业依法做出的决定书</td>
	</tr>
	<tr>
		<td width="67" align="center">3</td>
		<td >加盖隶属企业印章的隶属合伙企业营业执照副本复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">4<font face="宋体" >*</font></td>
		<td >分支机构营业执照副本复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">5</td>
		<td >其他有关文件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p><font face="楷体_GBK" size="2px"><b>规范要求：</b></font><br>
         <p><font face="楷体_GBK" size="2px">1.本申请表应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font><Br>
	     <p><font face="楷体_GBK" size="2px">2.以上文件除标明复印件外，应提交原件。</font><br>
	     <p><font face="楷体_GBK" size="2px">3.以上提交文件如为外文，需提交中文译文，并加盖翻译单位公章。</font><br>
	     <p><font face="楷体_GBK" size="2px">4.同时申请多项变更时，相同材料只需提交一份。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">5.第2项指根据《中华人民共和国合伙企业企业法》、《中华人民共和国合伙企业登记管理办法》以及《中华人民共和国外国企业或者个人在中国境内设立合伙企业管理办法》以及合伙企业协议规定做出的决定书，决定书的内容与所申请的事项应当一致。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">6.分支机构变更类型，涉及其他登记事项变更的，应当同时申请变更登记，按相应的提交材料格式规范提交相应的材料。</font><br>
	     <p><font face="楷体_GBK" size="2px">7.合伙企业类型填写“普通合伙企业”或者“特殊合伙企业”或者“有限合伙企业”。</font><br>
	     <p><font face="楷体_GBK" size="2px">8.第4项指变更核准后，应提交营业执照正、副本原件，由登记机关换发新的营业执照。</font><br>
	    </td>
	 </tr>
</table>
<br>
<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" width="50%" height=40>原隶属企业企业类型</td>
	<td align="center" width="50%">变更的隶属企业企业类型</td>
</tr>
<tr>
	<td width="50%" height=40><%=icms.getSysDm("ENTTYPE",OLD_SUPENTTYPE) %></td>
	<td width="50%"><%=icms.getSysDm("ENTTYPE",NEW_SUPENTTYPE) %></td>
</tr>
<tr>
	<td align="center" width="50%" height=40>原分支机构企业类型</td>
	<td align="center" width="50%">变更的分支机构企业类型</td>
</tr>
<tr>
	<td width="50%" height=40><%=icms.getSysDm("ENTTYPE",OLD_ENTTYPE) %></td>
	<td width="50%"><%=icms.getSysDm("ENTTYPE",NEW_ENTTYPE) %></td>
</tr>
</table>
<%} %>
<%if(LERPERBG){ %>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构负责人变更登<br>记所需提交的文件</b></p></span>
<table border="1" width="100%" height="240" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center">
		<p >序号</td>
		<td >
		<p align="center">文件名称</td>
	</tr>
	<tr>
		<td width="67" align="center">1</td>
		<td >《外商投资合伙企业分支机构变更登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center">2<font face="宋体">*</font></td>
		<td >隶属企业依法做出的决定书</td>
	</tr>
	<tr>
		<td width="67" align="center">3<font face="宋体">*</font></td>
		<td >分支机构负责人委托书及其身份证明复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">4</td>
		<td >分支机构负责人登记表</td>
	</tr>
	<tr>
		<td width="67" align="center">5<font face="宋体">*</font></td>
		<td >分支机构营业执照副本复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">6</td>
		<td >其他有关文件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p><font face="楷体_GBK" size="2px"><b>规范要求：</b></font><br>
         <p><font face="楷体_GBK" size="2px">1.本申请表应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font><Br>
	     <p><font face="楷体_GBK" size="2px">2.以上文件除标明复印件外，应提交原件。</font><br>
	     <p><font face="楷体_GBK" size="2px">3.以上提交文件如为外文，需提交中文译文，并加盖翻译单位公章。</font><br>
	     <p><font face="楷体_GBK" size="2px">4.同时申请多项变更时，相同材料只需提交一份。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">5.第2项指根据《中华人民共和国合伙企业企业法》、《中华人民共和国合伙企业登记管理办法》以及《中华人民共和国外国企业或者个人在中国境内设立合伙企业管理办法》以及合伙企业协议规定做出的决定书，决定书的内容与所申请的事项应当一致。</font><br>
	     <p><font face="楷体_GBK" size="2px">6.第3项指全体合伙人签署的委托书或者依据合伙协议作出的任免决定。</font><br>
	     <p><font face="楷体_GBK" size="2px">7.第5项指变更核准后，应提交营业执照正、副本原件，由登记机关换发新的营业执照。</font><br>
	    </td>
	 </tr>
</table>
<br>
<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" width="50%" height=40 colspan=2>原负责人</td>
	<td align="center" width="50%" colspan=2>变更的负责人</td>
</tr>
<tr>
	<td align="center" width="15%" height=40>姓名</td>
	<td align="center" width="35%">住所</td>
	<td align="center" width="15%">姓名</td>
	<td align="center" width="35%">住所</td>
</tr>
<tr>
	<td height=80><%=OLD_LERPER%></td>
	<td><%=OLD_HOUSEADD%></td>
	<td><%=NEW_LERPER%></td>
	<td><%=NEW_HOUSEADD%></td>
</tr>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZHHFZ_FZR.inc"%>
<%} %>
<%if(BUSSCOPEBG){ %>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构经营范围变更<br>登记所需提交的文件</b></p></span>
<table border="1" width="100%" height="240" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center">
		<p >序号</td>
		<td >
		<p align="center">文件名称</td>
	</tr>
	<tr>
		<td width="67" align="center">1</td>
		<td >《外商投资合伙企业分支机构变更登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center">2<font face="宋体">*</font></td>
		<td >隶属企业依法做出的决定书</td>
	</tr>
	<tr>
		<td width="67" align="center">3</td>
		<td >加盖隶属企业印章的隶属合伙企业营业执照复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">4<font face="宋体">*</font></td>
		<td >分支机构营业执照副本复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">5<font face="宋体">*</font></td>
		<td >其他有关文件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p><font face="楷体_GBK" size="2px"><b>规范要求：</b></font><br>
         <p><font face="楷体_GBK" size="2px">1.本申请表应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font><Br>
	     <p><font face="楷体_GBK" size="2px">2.以上文件除标明复印件外，应提交原件。</font><br>
	     <p><font face="楷体_GBK" size="2px">3.以上提交文件如为外文，需提交中文译文，并加盖翻译单位公章。</font><br>
	     <p><font face="楷体_GBK" size="2px">4.同时申请多项变更时，相同材料只需提交一份。</font><br>
	     <p><font face="楷体_GBK" size="2px">5.分支机构的经营范围不得超过其隶属企业的经营范围。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">6.第2项指根据《中华人民共和国合伙企业企业法》、《中华人民共和国合伙企业登记管理办法》以及《中华人民共和国外国企业或者个人在中国境内设立合伙企业管理办法》以及合伙企业协议规定做出的决定书，决定书的内容与所申请的事项应当一致。</font><br>
	     <p><font face="楷体_GBK" size="2px">7.第4项指变更核准后，应提交营业执照正、副本原件，由登记机关换发新的营业执照。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">8.第5项法律、行政法规或国务院决定规定分支机构经营范围变更登记必须报经有关部门批准的，提交批准文件；经营范围涉及前置审批的，应提交相关许可的原件或有效复印件。</font><br>
	    </td>
	 </tr>
</table>
<br>
<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" width="50%" height=40 colspan=2>原经营范围</td>
	<td align="center" width="50%" colspan=2>申请变更后经营范围</td>
</tr>
<tr>
	<td width="50%" height=100 colspan=2><%=OLD_BUSSCOPE %></td>
	<td width="50%" colspan=2><%=NEW_BUSSCOPE %></td>
</tr>
<tr>
	<td align="center" width="15%" height=80>凭许可<br>经营项目</td>
	<td width="35%"><%=OLD_ABUITEMCO %></td>
	<td align="center" width="15%">凭许可<br>经营项目</td>
	<td width="35%"><%=NEW_ABUITEMCO %></td>
</tr>
</table>
<%} %>
<%if(OPDATETOBG){ %>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资合伙企业分支机构经营期限<br>变更登记所需提交的文件</b></p></span>
<table border="1" width="100%" height="240" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center">
		<p >序号</td>
		<td >
		<p align="center">文件名称</td>
	</tr>
	<tr>
		<td width="67" align="center">1</td>
		<td >《外商投资合伙企业分支机构变更登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center">2<font face="宋体">*</font></td>
		<td >隶属企业依法做出的决定书</td>
	</tr>
	<tr>
		<td width="67" align="center">3</td>
		<td >加盖隶属企业印章的隶属合伙企业营业执照复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">4<font face="宋体">*</font></td>
		<td >分支机构营业执照副本复印件</td>
	</tr>
	<tr>
		<td width="67" align="center">5<font face="宋体">*</font></td>
		<td >其他有关文件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p><font face="楷体_GBK" size="2px"><b>规范要求：</b></font><br>
         <p><font face="楷体_GBK" size="2px">1.本申请表应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font><Br>
	     <p><font face="楷体_GBK" size="2px">2.以上文件除标明复印件外，应提交原件。</font><br>
	     <p><font face="楷体_GBK" size="2px">3.以上提交文件如为外文，需提交中文译文，并加盖翻译单位公章。</font><br>
	     <p><font face="楷体_GBK" size="2px">4.同时申请多项变更时，相同材料只需提交一份。</font><br>
	     <p><font face="楷体_GBK" size="2px">5.分支机构的经营期限不得超过其隶属企业的经营期限。</font><br>
	     <p style="line-height: 25px"><font face="楷体_GBK" size="2px">6.第2项指根据《中华人民共和国合伙企业企业法》、《中华人民共和国合伙企业登记管理办法》以及《中华人民共和国外国企业或者个人在中国境内设立合伙企业管理办法》以及合伙企业协议规定做出的决定书，决定书的内容与所申请的事项应当一致。</font><br>
	     <p><font face="楷体_GBK" size="2px">7.第4项指变更核准后，应提交营业执照正、副本原件，由登记机关换发新的营业执照。</font><br>
	    </td>
	 </tr>
</table>
<br>
<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" width="50%" height=40 colspan=2>原经营期限</td>
	<td align="center" width="50%" colspan=2>变更的经营期限</td>
</tr>
<tr>
	<td width="50%" height=100 colspan=2><%=OLD_OPDATETO %></td>
	<td width="50%" colspan=2><%=NEW_OPDATETO %></td>
</tr>
</table>
<%} %>
<%-- 
<p class="PageNext"><br></p>
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">外商投资合伙企业分支机构变更登记申请书</b><br>	
	<br></caption>
<tr><td colspan="3" align="right"  style="border:none; border-bottom:none; border-left:none; border-right:none; border-top:none">注册号：<%=QYDJ_JBXX.getREGNO() %></td></tr>	
</table>
<table border="1" width="90%" align="center" height="75%" bordercolor="#000000">
<tr>
	<td align="center" colspan=2 nowrap="nowrap" width="20%" height=40>项      目</td>
	<td align="center" colspan=2 width="40%">原登记事项</td>
	<td align="center" colspan=3 width="40%">申请变更登记事项</td></tr>
<tr>
<td colspan=2 align="center" height=40>分支机构名称</td>
<td colspan=2><%=OLD_ENTNAME%></td>
<td colspan=3><%=NEW_ENTNAME%></td>
</tr>

<tr>
<td colspan=2 align="center" height=40>经营场所</td>
<td colspan=2><%=OLD_DOM%></td>
<td colspan=3><%=NEW_DOM%></td>
</tr>

<tr>
<td colspan=2 align="center" nowrap="nowrap" height=40>邮政编码</td>
<td colspan=2><%=OLD_POSTALCODE%></td>
<td colspan=3><%=NEW_POSTALCODE%></td>
</tr>

<tr>
<td colspan=2 align="center" nowrap="nowrap" height=40>联系电话</td>
<td colspan=2><%=OLD_TEL%></td>
<td colspan=3><%=NEW_TEL%></td>
</tr>

<tr>
<td colspan=2 align="center" height=40>企业类型</td>
<td colspan=2><%=icms.getSysDm("ENTTYPE",OLD_ENTTYPE)%></td>
<td colspan=3><%=icms.getSysDm("ENTTYPE",NEW_ENTTYPE)%></td>
</tr>

<tr>
<td colspan=2 align="center" height=40>隶属企业名称</td>
<td colspan=2><%=OLD_SUPENTNAME%></td>
<td colspan=3><%=NEW_SUPENTNAME%></td>
</tr>

<tr>
<td colspan=2 align="center" height=40>隶属企业企业类型</td>
<td colspan=2><%=icms.getSysDm("ENTTYPE",OLD_SUPENTTYPE)%></td>
<td colspan=3><%=icms.getSysDm("ENTTYPE",NEW_SUPENTTYPE)%></td>
</tr>

<tr>
<td colspan=2 align="center" nowrap="nowrap" height=40>负责人</td>
<td colspan=2><%=OLD_LERPER%></td>
<td colspan=3><%=NEW_LERPER%></td>
</tr>

<tr>
<td colspan=2 align="center" nowrap="nowrap" height=40>负责人住所</td>
<td colspan=2><%=OLD_HOUSEADD%></td>
<td colspan=3><%=NEW_HOUSEADD%></td>
</tr>

<tr>
<td colspan=2 align="center" nowrap="nowrap" height=80>许可经营项目</td>
<td colspan=2><%=OLD_ABUITEMCO%></td>
<td colspan=3><%=NEW_ABUITEMCO%></td>
</tr>

<tr>
<td colspan=2 align="center" nowrap="nowrap" height=100>经营范围</td>
<td colspan=2><%=OLD_BUSSCOPE%></td>
<td colspan=3><%=NEW_BUSSCOPE%></td>
</tr>

<tr>
<td colspan=2 align="center" nowrap="nowrap" height=40>经营期限</td>
<td colspan=2><%=OLD_OPDATETO%></td>
<td colspan=3><%=NEW_OPDATETO%></td>
</tr>
</table>

<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						注：1、手工填写表格和签字请使用黑色或蓝黑色钢笔、毛笔或签字笔，请勿使用圆珠笔。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2、原登记事项及申请变更登记事项均只填写申请变更的栏目。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3、申请变更负责人同时填写《分支机构负责人登记表》。
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4、“经营期限”应选择“长期”/“XX年”，选择“XX年”的从企业法人成立之日起计算。
					</p>
				</td>
			</TR>
		</table>
<%if(!NEW_LERPER.equals("")){%>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZHHFZ_FZR.inc"%>
<%}%>--%>
</body></html>