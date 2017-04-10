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
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面	
	String OPENO =QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();	
	String DQENTNAME=QYDJ_JBXX.getENTNAME();	
%>
<html><head><title>外商投资公司设立登记申请书</title>
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
<p align="center"><span style="font-size: 24pt; font-family: 黑体" >外商投资公司设立登记申请书</td>
</tr>
<tr>
<td>
<table border="0" width="80%" bordercolor="#000000" style="border-collapse: collapse" align=center>
  <TR>
   <TD COLSPAN=4><br>
   <p style="line-height:40px;"><%=SysSystem.toUnderlineStr("","center",15)%>工商行政管理(总)局：<br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国公司法》、《中华人民共和国中外合资经营企业法》、《中华人民共和国中外合作经营企业法》、《中华人民共和国外资企业法》和《中华人民共和国公司登记管理条例》等有关规定，
   现申请设立登记，请予核准。同时承诺：所提交的文件和有关附件真实、合法、有效，复印文本与原件一致，并对因提交虚假文件所引发的后果承担法律责任。
   </p><br>
   </TD>
</TR>
</table></td></tr>
<tr>
<td height="388" align="center">
<table border="0" width="70%" height="234">
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">拟设立公司名称</font></td>
		<td><%=SysSystem.toUnderlineStr((String)QYDJ_JBXX.getENTNAME(),"center",30)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">拟任法定代表人签字</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>			
	<tr>
		<td width="200"><font style="font-size: 15pt">申   请   日   期</font></td>
		<td><%=SysSystem.toUnderlineStr("","center",30)%></td></tr>
</table><br></td></tr>
<tr><td align="center">
<font style="font-size: 16pt">中华人民共和国国家工商行政管理总局制</font><p align="center">
<font face="Times New Roman">
<span style="font-size: 16pt; font-weight: 700">HTTP://WWW.SAIC.GOV.CN</span><br>
<span style="font-size: 16pt; font-weight: 700">HTTP://QYJ.SAIC.GOV.CN</span></font></td></tr></table>
<p class="PageNext"><br>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>指定代表或委托代理人的证明</b></p></span>
<%
 String CONSIGNER="",CONFROM="",CONTO="",TEL1="",MOBTEL=""; 
 String llrname="",llrbm="",llrtel="",llrmobtel="",llremail="",llraddr="",llrpos=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 CONSIGNER =bTable.getCONSIGNER();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 TEL1=bTable.getTEL();
 MOBTEL=bTable.getMOBTEL();
 }
 ArrayList wzllr=QYDJ_WZLLR.getList(" where OPENO='"+OPENO+"'");
 if(wzllr.size()>0){
 com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ wzllrTable = (com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ)wzllr.get(0);
 llrname=wzllrTable.getNAME();
 llrbm=wzllrTable.getDEPARTMENT();
 llrtel=wzllrTable.getTEL();
 llrmobtel=wzllrTable.getMOBTEL();
 llremail=wzllrTable.getEMAIL();
 llraddr=wzllrTable.getADDR();
 llrpos=wzllrTable.getPOSTALCODE();
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;兹指定/委托<%=SysSystem.toUnderlineStr(CONSIGNER,"left",30)%>办理本公司设立登记事宜。<br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;指定/委托的有效期限：自<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> 至<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %><br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;委托人 ：<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%><br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%><br></p>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;<%=SysSystem.toUnderlineStr("","left",30)%><br></p>
<p align="right">
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;注：委托人指全体投资者。<br>&nbsp;&nbsp;&nbsp;&nbsp;(由投资各方法定代表人或其授权人签字盖章，投资者为自然人的由本人签字。)&nbsp;&nbsp;</p>
<span style="font-size: 16pt"><p align="center">指定代表或委托代理人信息</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">姓  名</td>
    <td align="center" height="45" width="20%"><%=CONSIGNER %></td>
    <td width="60%" rowspan="4" align="center">身份证明复印件粘贴处</td>
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
    <td align="center" height="45" width="20%"><%=(TEL1.equals("")?MOBTEL:TEL1)%></td>
  </tr>
</table>
<br>
<span style="font-size: 16pt"><p align="center">拟设立公司工商登记联络员信息</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">姓  名</td>
    <td align="center" height="45" width="20%"><%=llrname %></td>
    <td width="60%" rowspan="7" align="center">身份证明复印件粘贴处</td>
  </tr>
  <tr>
    <td width="20%" align="center">部  门</td>
    <td align="center" height="45" width="20%"><%=llrbm %></td>
  </tr>
  <tr>
    <td width="20%" align="center" rowspan="2">联系电话</td>
    <td align="left" height="45" width="20%">固定:<%=llrtel %></td>
  </tr>
  <tr>
    <td align="left" height="45" width="20%">移动:<%=llrmobtel %></td>
  </tr>
  <tr>
    <td width="20%" align="center">电子邮箱</td>
    <td align="center" height="45" width="20%"><%=llremail %></td>
  </tr>
  <tr>
    <td width="20%" align="center">联系地址</td>
    <td align="center" height="45" width="20%"><%=llraddr %></td>
  </tr>
  <tr>
    <td width="20%" align="center">邮政编码</td>
    <td align="center" height="45" width="20%"><%=llrpos %></td>
  </tr>
</table>
<p class="PageNext"><br></p>
<!--########### -->
<span style="font-size: 16pt"><p align="center"><b>外商投资的公司设立登记所需提交的文件</b></p></span>
<table border="1" width="100%" height="600" bordercolor='#000000' cellspacing="0" cellpadding="0" >
	<tr>
		<td width="67" align="center"  >
		<p >序号</td>
		<td >
		<p align="center" >文件名称</td>
	</tr>
	<tr>
		<td width="67" align="center"  >1</td>
		<td >拟任法定代表人签署的《外商投资的公司设立登记申请书》</td>
	</tr>
	<tr>
		<td width="67" align="center"  >2<font face="宋体">*</font></td>
		<td >审批机关的批准文件（批复和批准证书副本1）</td>
	</tr>
	<tr>
		<td width="67" align="center"  >3<font face="宋体">*</font></td>
		<td >公司章程</td>
	</tr>
	<tr>
		<td width="67" align="center"  >4<font face="宋体" >*</font></td>
		<td >《名称预先核准通知书》</td>
	</tr>
	<tr>
		<td width="67" align="center"  >5<font face="宋体">*</font></td>
		<td >投资者的主体资格证明或自然人身份证明</td>
	</tr>
	<tr>
		<td width="67" align="center"  >6<font face="宋体">*</font></td>
		<td >董事、监事和经理的任职文件及身份证明复印件</td>
	</tr>
	<tr>
		<td width="67" align="center"  >7<font face="宋体">*</font></td>
		<td >法定代表人任职文件和身份证明复印件</td>
	</tr>
	<tr>
		<td width="67" align="center"  >8<font face="宋体">*</font></td>
		<td >依法设立的验资机构出具的验资证明</td>
	</tr>
	<tr>
		<td width="67" align="center"  >9<font face="宋体">*</font></td>
		<td >股东首次出资是非货币财产的，提交已办理财产权转移手续的证明文件</td>
	</tr>
	<tr>
		<td width="67" align="center"  >10<font face="宋体">*</font></td>
		<td >公司住所证明</td>
	</tr>
	<tr>
		<td width="67" align="center"  >11<font face="宋体">*</font></td>
		<td >创立大会的会议记录</td>
	</tr>
	<tr>
		<td width="67" align="center"  >12<font face="宋体">*</font></td>
		<td >前置审批文件或证件</td>
	</tr>
	<tr>
		<td width="67" align="center"  >13<font face="宋体">*</font></td>
		<td >法律文件送达授权委托书</td>
	</tr>
	<tr> 
		<td width="67" align="center"  >14</td>
		<td >其它有关文件</td>
	</tr>
</table>
<br>
<table border="0" width="100%" height="280" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td height="280" valign="top">
         <p style="line-height: 30px"><font face="楷体_GBK"><b>规范要求：</b></font></p>
         <ol>
	       <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">本申请书应用黑色或蓝黑色钢笔、签字笔填写，字迹应清楚。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">以上文件除标明复印件外，应提交原件。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">以上所提交的文件若用外文书写，需提交中文译本，并加盖翻译单位印章。</font></li>
	      </ol>
	    </td>
	 </tr>
</table>
<p class="PageNext"></p>
<!--########### -->
<table border="0" width="100%" height="700" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td height="700" valign="top">
<ol start="4">
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第2项申请人应自收到批准证书之日起90日内到登记机关办理登记注册手续;但以中外合作、外商合资、外商独资形式设立公司的，申请人应自收到批准证书之日起30日内到登记机关办理登记注册手续;募集方式设立的股份有限公司公开发行股票的，还应提交国务院证券监督管理机构的核准文件原件或有效复印件。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第3项公司章程需投资各方法定代表人或其授权人签字、盖章的原件，投资者为自然人的由本人签字。提交的公司章程应与审批部门批准的相一致。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第4项《名称预先核准通知书》应在有效期内，且内容与拟设立公司申请的相关事项吻合。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第5项中方投资者应提交由本单位加盖公章的营业执照/事业单位法人登记证书/社会团体法人登记证/民办非企业单位证书复印件作为主体资格证明；外国投资者的主体
资格证明或身份证明应经其本国主管机关公证后送我国驻该国使(领)馆认证。如其本国与我国没有外交关系，则应当经与我国有外交关系的第三国驻该国使（领）馆认证，再由我国驻该第三国使（领）馆认证。某些国家的海外属地出具的文书，
应先在该属地办妥公证，再经该国外交机构认证，最后由我国驻该国使（领）馆认证。香港、澳门和台湾地区投资者的主体资格证明或身份证明应当按照专项规定或协议依法提供当地公证机构的公证文件。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第6项、第7项法定代表人、董事、监事和经理的产生应符合公司章程的规定。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第8、9项仅适用于股份有限公司和金融、证券、保险类公司及基金管理公司等在设立时依法应当一次性缴付全部出资的有限公司，以及设立时缴付全部或部分注册资本的其他类型有限公司。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第10项自有房产提交产权证复印件,并提交原件核对；租赁房屋提交租赁协议原件及出租方的产权证复印件，以上不能提供产权证复印件的，提交能够证明产权归属的其它房屋产权使用证明复印件。出租方为宾馆、饭店的，还应提交宾馆、饭店的营业执照复印件。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第11项仅适用于以募集方式设立的股份有限公司。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第12项指有关前置许可的批准文件或者许可证书复印件或许可证明，适用于经营范围中有法律、行政法规和国务院决定规定必须在登记前报经批准的项目的外商投资的公司。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">第13项“法律文件送达授权委托书”由外国投资者（授权人）与境内法律文件送达接受人（被授权人）签署。该委托书应当明确授权境内被授权人代为接受法律文件送达，并载明被授权人地址、联系方式。被授权人可以是外国投资者设立的分支机构、拟设立的公司（被授权人为拟设立的公司的，公司设立后委托生效）或者其他境内有关单位或个人。</font><br>	
	</li>
</ol>
</td>
</tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">外商投资的公司申请设立登记事项</b><br><br></caption>
<tr>   
	<td align='center' height=40 nowrap="nowrap" width="15%">名称</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getENTNAME()%></td>   

    <td align='center' height=40 nowrap="nowrap" width="15%">联系电话</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getTEL()%></td>       
</tr>
<tr>	
	<td align='center' height=40 nowrap="nowrap" width="15%">住所</td>   
	<td colspan="4" width="50%"><%=QYDJ_JBXX.getOPLOC()%></td>
 	
 	<td align='center' height=40 width="15%">邮政编码</td>   
	<td colspan="2" width="20%"><%=QYDJ_JBXX.getPOSTALCODE()%></td> 	
</tr>
<tr>	
	<td align='center' height=40 nowrap="nowrap" width="15%">公司类型</td>   
	<td colspan="3" width="40%"><%=icms.getSysDm("ENTTYPE",QYDJ_JBXX.getENTTYPE())%></td>
 	
 	<td align='center' rowspan="2" nowrap="nowrap" width="10%">法定代表人<br>姓名</td>   
	<td colspan="3" rowspan="2" width="35%"><%=QYDJ_RYXX.getNAME()%></td> 	
</tr>
<tr>
    <td align='center' height=40 width="15%">设立方式</td>
	<td colspan="3" width="40%"><%=icms.getSysDm("INSFORM",QYDJ_JBXX.getINSFORM())%></td>
</tr>
<tr> 
	<td align='center' height=40 width="15%">投资总额</td>   
	<td colspan="3" width="40%"><%=QYDJ_JBXX.getCONGRO()%></td> 
	
	<td align='center' nowrap="nowrap" width="10%">营业期限</td>   
	<%-- <td colspan="3" width="35%">自<%=QYDJ_JBXX.getOPFROM()%>至<%=QYDJ_JBXX.getOPTO()%></td>--%>
	<td colspan="3" width="35%">自&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至</td> 
</tr> 
<tr>
	<td align='center' rowspan="2" width="15%">注册资本</td> 
	<td align='left' rowspan="2" width="20%">币种:<%=icms.getSysDm("CURRENCY",QYDJ_JBXX.getREGCAPCUR())%></td>
	<td align='center' nowrap="nowrap" height=40 width="10%">中方</td> 
	<td align='center' width="10%"><%=QYDJ_JBXX.getDOMEREGCAP()%></td>  
	<td align='center' nowrap="nowrap" width="10%">折万美元</td>
	<td align='center' width="15%"><%=QYDJ_JBXX.getDOMEREGCAPUSD()%></td>
	<td align='center' nowrap="nowrap" width="10%">所占比例</td>
	<td align='center' width="10%"><%=QYDJ_JBXX.getDOMEREGCAPINVRAT()%></td>
</tr> 
<tr>
    <td align='center' nowrap="nowrap" height=40>外方</td> 
	<td align='center'><%=QYDJ_JBXX.getFORREGCAP()%></td>  
	<td align='center' nowrap="nowrap">折万美元</td>
	<td align='center'><%=QYDJ_JBXX.getFORREGCAPUSD()%></td>
	<td align='center' nowrap="nowrap">所占比例</td>
	<td align='center'><%=QYDJ_JBXX.getFORREGCAPINVRAT()%></td>    
</tr>
<tr>
    <td align='center' rowspan="2">实收资本</td> 
    <td align='left' rowspan="2">币种:<%=icms.getSysDm("CURRENCY",QYDJ_JBXX.getRECCAPCUR())%></td>
    <td align='center' nowrap="nowrap" height=40 width="10%">中方</td> 
	<td align='center'><%=QYDJ_JBXX.getDOMERECCAP()%></td>  
	<td align='center' nowrap="nowrap">折万美元</td>
	<td align='center'><%=QYDJ_JBXX.getDOMERECCAPUSD()%></td>
	<td align='center' nowrap="nowrap">所占比例</td>
	<td align='center'><%=QYDJ_JBXX.getDOMERECCAPCONPROP()%></td>
</tr>
<tr>
    <td align='center' nowrap="nowrap" height=40>外方</td> 
	<td align='center'><%=QYDJ_JBXX.getFORRECCAP()%></td>  
	<td align='center' nowrap="nowrap">折万美元</td>
	<td align='center'><%=QYDJ_JBXX.getFORRECCAPUSD()%></td>
	<td align='center' nowrap="nowrap">所占比例</td>
	<td align='center'><%=QYDJ_JBXX.getFORRECCAPCONPROP()%></td>    
</tr>
<tr>
	<td height="100" align="center">经<br>营<br>范<br>围</td>
	<td colspan="7" height="100"><%=QYDJ_JBXX.getBUSSCOPE()%></td>
</tr>
<tr> 
	<td align='center' nowrap="nowrap" height=40 colspan="2">凭许可经营项目</td>   
	<td colspan="2"><%=QYDJ_JBXX.getABUITEMCO()%></td>
	<td align='center' nowrap="nowrap" height=40>项目类型</td>
	<td colspan="3"><%=icms.getSysDm("PROTYPE",QYDJ_JBXX.getPROTYPE())%></td>		
</tr>
<tr>
	<td height="40" align="center"></td>
	<td height="40" align="center">投资者<br>名称或姓名</td>
	<td height="40" align="center">认缴<br>出资额</td>
	<td height="40" align="center">出资<br>方式</td>
	<td height="40" align="center">所占<br>比例</td>
	<td height="40" align="center">实缴<br>出资额</td>
	<td height="40" align="center">出资<br>方式</td>
	<td height="40" align="center">出资<br>时间</td>
	</tr>
<%
	ArrayList rsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'");
	int temp = rsdwtz.size();
	if(temp>0){
     for (int i=0;i<temp;i++)
      {
        com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)rsdwtz.get(i);
        String CONDATE=bTable.getCONDATE();
		if(CONDATE.length()>10)
			CONDATE=CONDATE.substring(0,10);
		String BALDELTERM=bTable.getBALDELTERM();
		if(BALDELTERM.length()>10)
			BALDELTERM=BALDELTERM.substring(0,10);
%>
	<tr>
		<td  rowspan="3" align="center" >
		<%
			if(bTable.getCOUNTRY().trim().equals("156"))
				out.print("中方");
			else
				out.print("外方");
		%>
		</td>
		<td align="center" height="40"><%=bTable.getINV()%></td>
		<td align="center" height="40"><%=String.valueOf(bTable.getSUBCONAM())%></td>
		<td align="center" height="40"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>
		<td align="center" height="40"><%=String.valueOf(bTable.getCONPROP())%></td>
		<td align="center" height="40"><%=String.valueOf(bTable.getACCONAM())%></td>
		<td align="center" height="40"><%=icms.getSysDm("CONFORM",bTable.getACCONFORM())%></td>
		<td align="center" height="40"><%=bTable.getACCONDATE()%></td>
	</tr>
	<tr>
		<td align="center" height="40">国别(地区)</td>
		<td height="40" colspan="2"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
		<td colspan="2" align="center" nowrap="nowrap" height="40">余额交付期限</td>
		<td colspan="2" height="40"><%=bTable.getBALDELTERM()%></td>
	</tr>
	<tr>
		<td align="center" height="40">投资人类型</td>
		<td height="40"><%=icms.getSysDm("INVTYPE",bTable.getINVTYPE())%></td>
		<td colspan="2" align="center" nowrap="nowrap" height="40">证件类型及号码</td>
		<td colspan="3" height="40"><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%><br><%=bTable.getCERNO()%></td>
	</tr>
<%
	  }
	}else{			
%>
<tr>
		<td  rowspan="3" align="center" ></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
		<td align="center" height="40"></td>
	</tr>
	<tr>
		<td align="center" height="40">国别(地区)</td>
		<td height="40" colspan="2"></td>
		<td colspan="2" align="center" nowrap="nowrap" height="40">余额交付期限</td>
		<td colspan="2" height="40"></td>
	</tr>
	<tr>
		<td align="center" height="40">投资人类型</td>
		<td height="40"></td>
		<td colspan="2" align="center" nowrap="nowrap" height="40">证件类型及号码</td>
		<td colspan="3" height="40"><br></td>
	</tr>
<%} %>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<%@include file="public/WZGS_FDDBR.inc" %>
<br><p class="PageNext"><br>
<table border="1" width="100%" bordercolor="#000000" cellspacing="0" cellpadding="0" height="750">
<caption align="center"><b>
	<span style="font-size: 16pt">法定代表人审查意见</span></b><br><br>
</caption>
 <tr>
   <td>
	 <p  style="line-height:30px; word-spacing: 1px; margin-top: 5px"> &nbsp;&nbsp;&nbsp;&nbsp; 经审查，法定代表人符合有关法律、法规规定的任职资格，不存在以下情况：</p>
	  <ol>
	   <li>
		 <p style="line-height: 30px; word-spacing: 1px">
		   <span style="vertical-align: top">无民事行为能力或者限制民事行为能力的；</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">正在被执行刑罚或者正在被执行刑事强制措施的；</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">正在被公安机关或者国家安全机关通缉的；</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">因犯有贪污贿赂罪、侵犯财产罪或者破坏社会主义市场经济秩序罪，被判处刑罚，执行期满未逾五年的；因犯有其他罪，被判处刑罚，执行期满未逾三年的；或者因犯罪被判处剥夺政治权利，执行期满未逾五年的；</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">担任因经营不善破产清算的企业的法定代表人或者董事、经理，并对该企业的破产负有个人责任，自该企业破产清算完结之日起未逾三年的；</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">担任因违法被吊销营业执照的企业的法定代表人，并对该企业违法行为负有个人责任，自该企业被吊销营业执照之日起未逾三年的；</span></p>
	   </li>
	   <li>
		 <p style="line-height: 30px">
		   <span style="vertical-align: top">个人负债数额较大，到期未清偿的；</span></p>
	   </li>
	   <li>
		  <p style="line-height: 30px">
		   <span style="vertical-align: top">有法律和国务院规定不得担任法定代表人的其他情形。</span></p>
	   </li>
	</ol>
		<p>　</p>
		<p>　</p>
		<p>　</p>
		<p><span style="vertical-align: top">审查人盖章（签字）：</span><p>　<p>　<p>　</td>
	</tr>
</table>
<p><span style="font-size: 11pt"><font face="仿宋_GBK"><span style="vertical-align: top">注：<font face="仿宋_GBK"><span style="font-size: 11pt">“审查人”指选举、委派、指定、任命法定代表人的董事会、股东会、投资人等。
</span></font></span></font></span></p>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="90%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">公司董事、监事、经理情况表</b><br><br>
</caption>	
<%
 int Nu=0;
 ArrayList rstz=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int rytemp = rstz.size();
 for (int i=0;i<rytemp;i++){
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)rstz.get(i);

 Nu=Nu+1;
%>  
 <tr><td align='center' colspan=3 height=120>
   <table align="center" border="1" width="100%" bordercolor='#000000' frame="void" height="100%">
      <tr>  
		  <td height="40" align="center" rowspan="2" width="15%">姓 名</td>
		  <td align="center" rowspan="2" width="10%" nowrap="nowrap">职 务</td>  
		  <td rowspan="2" width="10%"><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>
		  <td align="center" rowspan="2" width="10%" nowrap="nowrap">产生方式</td>  
		  <td rowspan="2" width="10%"><%=icms.getSysDm("POSBRFORM",bTable.getPOSBRFORM())%></td>
		  <td align="center" rowspan="2" width="10%">身份<br>证件</td>
		  <td align="center" width="10%" nowrap="nowrap">号码</td>
		  <td width="25%"><%=bTable.getCERNO()%></td>
	   </tr>
	   <tr>
		  <td align="center">类型</td>
		  <td><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%></td>
	  </tr>
	  <tr>
	      <td height="40"><%=bTable.getNAME()%></td>
	      <td align="center" width="10%">国别<br>(地区)</td>  
		  <td width="10%"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
		  <td align="center" width="10%">派出单位</td> 
		  <td colspan="2"><%=bTable.getACCDSIDE()%></td>
		  <td align="center" width="10%">住址</td>
		  <td width="25%"><%=bTable.getHOUSEADD()%></td>
	  </tr>
   </table>
 </td></tr>
<% 
 if (Nu!=0&&Nu%4==0){ 
  out.print("</table><br><p class='PageNext'><br><table align='center' border='1' width='90%' bordercolor='#000000'>");
 }
 }
	 if(Nu>0 && Nu<4){
	   for (int j=0; j<4-Nu;j++){
%>
  <tr><td align='center' colspan=3 height=120>
    <table align="center" border="1" width="100%" bordercolor='#000000'  frame="void" height="100%">
        <tr>  
		  <td height="40" align="center" rowspan="2" width="15%">姓 名</td>
		  <td align="center" rowspan="2" width="10%" nowrap="nowrap">职 务</td>  
		  <td rowspan="2" width="10%"></td>
		  <td align="center" rowspan="2" width="10%" nowrap="nowrap">产生方式</td>  
		  <td rowspan="2" width="10%"></td>
		  <td align="center" rowspan="2" width="10%">身份<br>证件</td>
		  <td align="center" width="10%" nowrap="nowrap">号码</td>
		  <td width="25%"></td>
		 </tr>
		 <tr>
		  <td align="center" width="10%">类型</td>
		  <td width="25%"></td>
	     </tr>
	  <tr>
	      <td height="40"></td>
	      <td align="center" width="10%">国别<br>(地区)</td>  
		  <td width="10%"></td>
		  <td align="center" width="10%">派出单位</td> 
		  <td colspan="2"></td>
		  <td align="center" width="10%">住址</td>
		  <td width="25%"></td>
	  </tr>
    </table>
 </td></tr>
<%   
	   }
	 }
 if (Nu==0) out.print("<tr><td colspan=3 align='center'>无此项内容</td></tr>");
%>	
</table>
<br>
<br><p class="PageNext">
<table border="1" width="100%" cellspacing="0" bordercolor="#000000" cellpadding="0" height="850">
<br>
	<p align="center"><b><font size="4">登记机关核定事项</font></b></p>
	<p align='right' >单位：万元</p>
	<tr>
		<td height="40" align="center" >名称</td>
		<td colspan="5" height="40" align="center" >　</td>
		<td height="40" align="center" >邮编</td>
		<td colspan="3" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td height="40" align="center" >住所</td>
		<td colspan="5" height="40" align="center" >　</td>
		<td height="40" align="center" nowrap="nowrap">联系电话</td>
		<td colspan="3" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td height="40" align="center" >法定代表人<br>姓名</td>
		<td colspan="4" height="40" align="center" >　</td>
		<td height="40" align="center" >公司类型</td>
		<td colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td height="40" align="center" >投资总额</td>
		<td width="38%" colspan="4" height="40" align="center">　</td>
		<td height="40" align="center" >设立方式</td>
		<td colspan="4" height="40" align="center">　</td>
	</tr>
	<tr>
		<td rowspan="2" height="80" align="center">注册<br>资本</td>
		<td height="40" align="left">币种：</td>
		<td height="40" align="center">中方</td>
		<td width="7%"  height="40" align="center">　</td>
		<td width="7%"  height="40" align="center">出资<br>方式</td>
		<td height="40" align="center">　</td>
		<td height="40" align="center">折美元</td>
		<td width="6%"  height="40" align="center">　</td>
		<td height="40" width="7%" align="center">所占<br>比例</td>
		<td width="5%"  height="40">　</td>
	</tr>
	<tr>
		<td height="40" align="left">币种：</td>
		<td height="40" align="center">外方</td>
		<td width="7%"  height="40" align="center">　</td>
		<td width="7%"  height="40" align="center">出资<br>方式</td>
		<td height="40" align="center">　</td>
		<td height="40" align="center">折美元</td>
		<td width="6%"  height="40" align="center">　</td>
		<td height="40" width="7%" align="center">所占<br>比例</td>
		<td width="5%"  height="40">　</td>
	</tr>
	<tr>
		<td rowspan="2"  height="80" align="center" >实收<br>资本</td>
		<td height="40" align="left" >币种：</td>
		<td height="40" align="center" >中方</td>
		<td width="7%"  height="40" align="center" >　</td>
		<td width="7%"  height="40" align="center" >出资<br>方式</td>
		<td  height="40" align="center" >　</td>
		<td  height="40" align="center" >折美元</td>
		<td width="6%"  height="40" align="center" >　</td>
		<td  height="40" width="7%" align="center" >所占<br>比例</td>
		<td width="5%"  height="40" >　</td>
	</tr>
	<tr>
		<td height="40" align="left" >币种：</td>
		<td height="40" align="center" >外方</td>
		<td width="7%"  height="40" align="center" >　</td>
		<td width="7%"  height="40" align="center" >出资<br>方式</td> 
		<td height="40" align="center">　</td>
		<td height="40" align="center">折美元</td>
		<td width="6%"  height="40" align="center">　</td>
		<td height="40" width="7%" align="center">所占<br>比例</td>
		<td width="5%"  height="34">　</td>
	</tr>
	<tr>
		<td  height="140" align="center" ><br>
		经<br>
		营<br>
		范<br>
		围<br>
　       </td>
		<td  colspan="9" height="150" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >凭许可经营项目</td>
		<td width="36%"  height="40"  colspan="4" align="center">　</td>
		<td  height="40" align="center" >项目类型</td>
		<td  height="40"  colspan="4" align="center">　</td>
	</tr>
	<tr>
		<td  height="65" align="center" >投资者<br>名称或姓名</td>
		<td  height="65" align="center" >国别<br>（地区）</td>
		<td  height="65" align="center" >认缴<br>出资额</td>
		<td width="7%"  height="65" align="center" >出资<br>方式</td>
		<td width="7%"  height="65" align="center" >所占<br>比例</td> 
		<td  height="65" align="center" >实缴<br>出资额</td>
		<td  height="65" align="center" >出资<br>方式</td>
		<td width="6%"  height="65" align="center" >出资<br>时间</td>
		<td  colspan="2" height="65" align="center" >余额缴付<br>期限</td>
	</tr>
	<tr>
		<td  height="40" align="center" >　</td>
		<td  height="40" align="center" >　</td>
		<td  height="40" align="center" >　</td>
		<td width="7%"  height="40" align="center" >　</td>
		<td width="7%"  height="40" align="center" >　</td>
		<td  height="40" align="center" >　</td>
		<td  height="40" align="center" >　</td>
		<td width="6%"  height="40" align="center" >　</td>
		<td  colspan="2" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >投资者类型</td>
		<td  height="40" align="center" colspan="2">　</td>
		<td  height="40" colspan="2" align="center">证件类型及号码</td>
		<td  height="40" align="center" colspan="5">　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >　</td>
		<td  height="40" align="center" >　</td>
		<td  height="40" align="center" >　</td>
		<td width="7%"  height="40" align="center" >　</td>
		<td width="7%"  height="40" align="center" >　</td>
		<td  height="40" align="center" >　</td>
		<td  height="40" align="center" >　</td>
		<td width="6%"  height="40" align="center" >　</td>
		<td  colspan="2" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center">投资者类型</td>
		<td  height="40" align="center" colspan="2">　</td>
		<td  height="40"  colspan="2" align="center">证件类型及号码</td>
		<td  height="40" align="center" colspan="5">　</td>
	</tr>
	<tr>
		<td  height="40" align="center">经营期限</td>
		<td  colspan="9" height="40" align="center">　</td>
	</tr>
	<tr>
		<td  height="40" align="center">行业代码</td>
		<td  width="38%"  colspan="4" height="40" align="center">  </td>
		<td  height="40" align="center">注册号</td>
		<td  colspan="4" height="40" align="center">　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >外资产业代码</td>
		<td  width="38%" colspan="4" height="40" align="center" >  </td>
		<td  height="40" align="center" >中西部优势产业代码</td>
		<td  colspan="4" height="40" align="center" >　</td>
	</tr>
	<tr>
		<td  height="40" align="center" >备注</td>
		<td  colspan="9" height="40" align="center">　</td>
	</tr>
</table>
<p class="PageNext"><br></p>
<%String lzrtitle="法定代表人"; %>
<%@include file="public/WZGS_LZQD.inc" %>
<br><br>
</body></html>