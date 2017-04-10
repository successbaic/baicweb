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

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="GGGL_JYDW_HDSX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_HDSX"/>
<jsp:useBean id="GGGL_JYDW_HCQK" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_HCQK"/>
<jsp:useBean id="GGGL_JYDW_GDXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_GDXX"/>
<jsp:useBean id="GGGL_JYDW_DWTZ" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_DWTZ"/>
<jsp:useBean id="GGGL_JYDW_ZSXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_ZSXX"/>
<jsp:useBean id="GGGL_JYDW_FZJG" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_FZJG"/>
<jsp:useBean id="GGGL_JYDW_JYSB" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYSB"/>
<jsp:useBean id="GGGL_JYDW_JYQK" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYQK"/>
<jsp:useBean id="GGGL_JYDW_GLZD" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_GLZD"/>
<jsp:useBean id="GGGL_GGJY" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_GGJY"/>
<jsp:useBean id="GGGL_USER" scope="session" class="com.macrosoft.icms.ggxkz.GGGL_USER"/>
<%	
	String ADBULICNO=GGGL_USER.getADBULICNO();
	int INSYEAR=GGGL_USER.getINSYEAR();
	
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();
	
	ArrayList list=GGGL_JYDW_HDSX.getList(" WHERE ADBULICNO='"+ADBULICNO+"' and INSYEAR="+INSYEAR);
	
	String NEW_ADBUENT=GGGL_JYDW_JBXX.getADBUENT();//单位名称
	String NEW_DOM=GGGL_JYDW_JBXX.getDOM();//住所
	String NEW_LEREP=GGGL_JYDW_JBXX.getLEREP();//法定代表人(负责人)
	String NEW_ADTYPE=GGGL_JYDW_JBXX.getADTYPE();//单位类型
	String NEW_OPFROM=GGGL_JYDW_JBXX.getOPFROM();//营业期限起
	String NEW_OPTO=GGGL_JYDW_JBXX.getOPTO();//营业期限至
	String NEW_OPDOMAREA=GGGL_JYDW_JBXX.getOPDOMAREA()+"";//经营场所面积
	String NEW_REGCAP=GGGL_JYDW_JBXX.getREGCAP()+"";//注册资本
	String NEW_BUSSCOPE=GGGL_JYDW_JBXX.getBUSSCOPE();//广告经营范围
	String NEW_EMPNUM=GGGL_JYDW_JBXX.getEMPNUM()+"";//广告从业人员总人数
	String NEW_JUCOLNUM=GGGL_JYDW_JBXX.getJUCOLNUM()+"";//中大专以上学历人数
	String NEW_CERDATE=GGGL_JYDW_JBXX.getCERDATE();//发证日期

	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.ggxkz.GGGL_JYDW_HDSX hdsx=(com.macrosoft.icms.ggxkz.GGGL_JYDW_HDSX)list.get(i);
		if(hdsx.getADINSCHEPRO().equals("01")&&hdsx.getMATSIGN().equals("2")){//单位名称
			NEW_ADBUENT=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("02")&&hdsx.getMATSIGN().equals("2")){//住所
			NEW_DOM=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("03")&&hdsx.getMATSIGN().equals("2")){//法定代表人(负责人)
			NEW_LEREP=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("04")&&hdsx.getMATSIGN().equals("2")){//单位类型
			NEW_ADTYPE=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("11")&&hdsx.getMATSIGN().equals("2")){//营业期限起
			NEW_OPFROM=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("05")&&hdsx.getMATSIGN().equals("2")){//营业期限至
			NEW_OPTO=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("06")&&hdsx.getMATSIGN().equals("2")){//经营场所面积
			NEW_OPDOMAREA=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("07")&&hdsx.getMATSIGN().equals("2")){//注册资本
		    NEW_REGCAP=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("08")&&hdsx.getMATSIGN().equals("2")){//广告经营范围
		    NEW_BUSSCOPE=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("09")&&hdsx.getMATSIGN().equals("2")){//广告从业人员总人数
			NEW_EMPNUM=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("10")&&hdsx.getMATSIGN().equals("2")){//中大专以上学历人数
			NEW_JUCOLNUM=hdsx.getINSACST();
		}
		if(hdsx.getADINSCHEPRO().equals("12")&&hdsx.getMATSIGN().equals("2")){//发证日期
			NEW_CERDATE=hdsx.getINSACST();
		}
	}
%>
<html><head><title>广告经营单位广告经营资格检查表</title>
</head>
<body style="text-align: center">
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
<td align="center" style="line-height: 40px;">			
<p align="center"><span style="font-size: 24pt; font-family: 黑体" >广告经营单位广告经营资格检查表</span></p>
<br>
<p align="center"><span style="font-size: 15pt; font-family: 黑体" >(<%=INSYEAR %>年度)</span></p></td>
</tr>
<br><br><br><br>
<tr>
<td height="388" align="center">
<table border="0" width="80%" height="234">
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">单位名称:</font></td>
		<td><%=SysSystem.toUnderlineStr((String)GGGL_JYDW_JBXX.getADBUENT(),"center",25)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">住所:</font></td>
		<td><%=SysSystem.toUnderlineStr((String)GGGL_JYDW_JBXX.getDOM(),"center",25)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">许可证号:</font></td>
		<td><%=SysSystem.toUnderlineStr((String)GGGL_JYDW_JBXX.getADBULICNO(),"center",25)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">邮政编码:</font></td>
		<td><%=SysSystem.toUnderlineStr((String)GGGL_JYDW_JBXX.getPOLCODE(),"center",25)%></td></tr>
	<tr>
		<td width="200" nowrap="nowrap"><font style="font-size: 15pt">联系电话:</font></td>
		<td><%=SysSystem.toUnderlineStr((String)GGGL_JYDW_JBXX.getTEL(),"center",25)%></td></tr>		
	<tr>
		<td width="200"><font style="font-size: 15pt">申报日期:</font></td>
		<td><%=SysSystem.toUnderlineStr(GGGL_JYDW_JBXX.getDECDATE(),"center",25)%></td></tr>
	<tr>
		<td width="200"><font style="font-size: 15pt">受理日期:</font></td>
		<td><%=SysSystem.toUnderlineStr(GGGL_JYDW_JBXX.getACCDATE(),"center",25)%></td></tr>
</table><br></td></tr>
<tr><td align="center">
<font style="font-size: 16pt">国家工商行政管理局总局制</font></td></tr></table>
<p class="PageNext"><br>
<!--########### -->
<table border="0" width="100%" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
    <tr>
       <td valign="top">
         <p align="center"><span style="font-size: 20pt; font-family: 黑体" >填表说明</span></p>
         <ol>
	       <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">许可证号：指《广告经营许可证》的许可号。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">广告经营资格审批登记时情况：按上次检查时报送的并经广告监督管理机关审查通过的检查表所填报的情况填写。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">广告经营资格检查时情况：按本次检查时本单位实际情况填写。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">单位名称：填写本单位已登记注册的单位名称的全称。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">法定代表（负责人）：当本单位为企业法人时，填写法定代表人姓名；为非企业法人时，填写负责人姓名。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">单位类型：指广告经营单位经营类型。按照《广告经营许可证》上载明的事项填写。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">营业期限：按照已核准登记的营业期限填写。其起始日从营业执照或许可证签发之日起计算。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">经营场所面积：指广告经营单位拥有的固定经营场所的有效使用面积；当广告经营单位为广告发布单位、广告兼营单位时，指归其广告经营机构使用的有效使用面积。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">注册资本（资金数额）：当广告经营单位为企业法人时，填写注册资本数额；为非企业法人时，填写资金数额，并标明币种。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">经营范围：填写本单位营业执照和许可证上载明的主营、兼营的所有经营项目。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">广告从业人员数：指本单位从事广告业务的全体职工数。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">发证日期：按《广告经营许可证》上载明的“有效期限”的起始日填写。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">股东（发起人）：指出资设立本单位的出资单位 （人） 的名称（姓名）。出资额应当写明币种。股东（发起人）及其投资额、所占比例、所属国家（地区）发生变化时，应在“备注”栏内注明。</font></li>
	      <li>
	         <p style="line-height: 25px"><font face="楷体_GBK">广告经营单位成立后对外投资情况：指本单位成立后以现金、实物、无形资产、或者购买股票、债券等有价证券方式向国内或境外企业、其他单位的投资情况。</font></li>
	      </ol>
	    </td>
	 </tr>
</table>
<p class="PageNext"></p>
<!--########### -->
<table border="0" width="100%" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td valign="top">
<ol start="15">
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告经营分支 （办事） 机构情况：指本单位出资设立的子公司、分公司、所属企业、办事处和其他派出机构情况；其中“登记机关”指为本单位核发执照、许可证的工商行政管理机关。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告经营设备情况：只填写用于广告设计、制作等广告业务的专业设备，不包括交通、办公等非专业设备。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告业务财务往来是否单独立账：根据广告法规规定，经营广告业务的单位应对广告业务往来单独建立会计账簿。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告业务收入：指广告经营全部收入减去付给广告发布者的广告发布费及付给第三方的广告设计、制作等费用后的余额。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告营业收入、纳税额、税后利润、亏损额：按年度末资产负债表上记载的情况填写；外商来华广告收入一律折算为人民币计算。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">固定形式印刷品广告：指经过国家广告监督管理机关核准登记、具有固定名称和规格、连续发布的印刷品广告。凡经营固定形式印刷品广告的单位，应当填写本表规定填写的内容。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">开展公益广告活动情况：应当写明年度设计、制作、发布的公益广告数量、媒介形式、出资金额等。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告经营中有无违法违章问题：凡有违法违章问题的，应当写明何时、何地、有何种违法违章行为，是否被广告监督管理机关处罚过，以及被处罚情况；有两种以上违法违章行为的，应当分别写明。</font></li>
    <li>
	<p style="line-height: 25px"><font face="楷体_GBK">改进措施：指本单位针对广告经营中存在的不符合广告法律、法规规定的问题，提出、制定的改进意见和办法。</font></li>
    <li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告监督管理机关核查情况：分为三部分。审查范围中第8项“广告经营业务开展情况”：指检查广告经营单位经核准登记后是否正常开展广告经营业务；( 2 ) “无广告违章违法行为”、或“已改正”：凡无广告违法违章行为的划“√”；有广告违法违章行为但已改正的，在“无广告违章违法行为”后划“×”，在：“已经改正”后划“√”，反之划“×”。检查建议中的第5项建议，由审查人根据具体情况依法提出。</font></li>
</ol>
</td>
</tr>
</table>
<p class="PageNext"></p>
<!--########### -->
<table border="0" width="100%" bordercolor='#000000' cellspacing="0" cellpadding="0" align=center>
<tr><td valign="top">
<ol start="25">
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告监督管理机关处理结果：指广告监督管理机关对被检查单位做出的正式书面检查结论意见。应将文件题目、文件号、主要内容等填入本栏中。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">本表封页第一至第六项和表内第一至第六项由广告经营单位填写，封页第七项（受理日期）和表内第七项由广告监督管理机关填写。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">广告经营单位应如实填写各项内容，并在规定的期限内将本表（一式两份）、许可证副本及须提交的其它材料报送广告监督管理机关。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">随表提交的文件应为原件，由于特殊情况不能提交原件时，应提交原出证机关加盖公章的复印件。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">填写本表时，某项内容如果没有，应当填写“无”；栏目内填写不下的内容应另附纸，并粘贴在相关页后面。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">提交的文件、材料应统一使用A4开纸，不得涂改。</font></li>
	<li>
	<p style="line-height: 25px"><font face="楷体_GBK">填表应字迹工整、使用蓝黑或黑色墨水。</font></li>
</ol>
</td>
</tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">一、广告经营资格基本情况</b><br>	
	<br></caption>	
</table>
<table border="1" width="100%" align="center" bordercolor="#000000">
<tr>
	<td align="center" height=40 width="20%">项      目</td>
	<td align="center" nowrap="nowrap" width="40%">1、广告经营资格审批登记时情况</td>
	<td align="center" nowrap="nowrap" width="40%">2、广告经营资格检查时情况</td></tr>
<tr>
<td align="center" height=40>单位名称</td>
<td><%=GGGL_JYDW_JBXX.getADBUENT()%></td>
<td><%=NEW_ADBUENT%></td>
</tr>

<tr>
<td align="center" height=40>住  所</td>
<td><%=GGGL_JYDW_JBXX.getDOM()%></td>
<td><%=NEW_DOM%></td>
</tr>

<tr>
<td align="center" nowrap="nowrap" height=40>法定代表人<br>(负责人)</td>
<td><%=GGGL_JYDW_JBXX.getLEREP()%></td>
<td><%=NEW_LEREP%></td>
</tr>

<tr>
<td align="center" height=40>单位类型</td>
<td><%=icms.getSysDm("ADTYPE",GGGL_JYDW_JBXX.getADTYPE())%></td>
<td><%=icms.getSysDm("ADTYPE",NEW_ADTYPE)%></td>
</tr>

<tr>
<td align="center" height=40>营业期限</td>
<td>自 <%=GGGL_JYDW_JBXX.getOPFROM()%>&nbsp;&nbsp;至 <%=GGGL_JYDW_JBXX.getOPTO() %></td>
<td>自 <%=NEW_OPFROM%>&nbsp;&nbsp;至 <%=NEW_OPTO %></td>
</tr>

<tr>
<td align="center" height=40>经营场所面积<br>(平方米)</td>
<td><%=GGGL_JYDW_JBXX.getOPDOMAREA()%></td>
<td><%=NEW_OPDOMAREA%></td>
</tr>

<tr>
<td align="center" height=80>注册资本<br>(资金数额)<br>(万元)</td>
<td><%=GGGL_JYDW_JBXX.getREGCAP()%></td>
<td><%=NEW_REGCAP%></td>
</tr>

<tr>
<td align="center" height=200>广告<br>经营范围</td>
<td style="font-size:13px;"><%=GGGL_JYDW_JBXX.getBUSSCOPE()%></td>
<td style="font-size:13px;"><%=NEW_BUSSCOPE%></td>
</tr>

<tr>
<td align="center" height=80>广告从业<br>人员情况</td>
<td>共有 <%=GGGL_JYDW_JBXX.getEMPNUM()%> 人，其中大专以上学历人数为 <%=GGGL_JYDW_JBXX.getJUCOLNUM()%> 人。</td>
<td>共有 <%=NEW_EMPNUM%> 人，其中大专以上学历人数为 <%=NEW_JUCOLNUM%> 人。</td>
</tr>

<tr>
<td align="center" height=40>发证日期</td>
<td><%=GGGL_JYDW_JBXX.getCERDATE()%></td>
<td><%=NEW_CERDATE%></td>
</tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="90%" bordercolor='#000000'>
<tr>
   <td colspan=4 align='center' height="60">3、股东（发起人）情况</td>
</tr>
<tr>    
	<td width='40%' align='center' nowrap="nowrap" height="40">股东（发起人）名称</td>
	<td width='20%' align="center">投资额（万元）</td>
	<td width='20%' align="center" height="40">所占比例（%）</td>   
	<td width='20%' align="center">国家（地区）</td>
</tr>	
<%
 int No1=0;
 ArrayList gdxx=GGGL_JYDW_GDXX.getList(" WHERE ADBULICNO='"+ADBULICNO+"' and INSYEAR="+INSYEAR); 
 for (int i=0;i<gdxx.size();i++){
 com.macrosoft.icms.ggxkz.GGGL_JYDW_GDXX bTable = (com.macrosoft.icms.ggxkz.GGGL_JYDW_GDXX)gdxx.get(i);

  No1=No1+1;
%>
  <tr>  
  <td height="40" align="center"><%=bTable.getINV()%></td><!--股东（发起人）-->
  <td align="center"><%=String.valueOf(bTable.getSUBCONAM())%></td>  <!--投资额（万元）-->
  <td align="center"><%=String.valueOf(bTable.getCONPROP())%></td> <!--所占比例（%）-->
  <td align="center"><%--=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())--%></td><!--国家（地区）-->  
 </tr>
<% 
 }

 while (No1<=6) 
 {
	out.print("<tr><td height='40'></td><td></td><td></td><td></td></tr>");
	No1++;
 }
%>	
<tr>
   <td colspan=4 height=120 valign="top">备注:</td>
</tr>
</table>
<br><br>
<table align="center" border="1" width="90%" bordercolor='#000000'>
<tr>
   <td colspan=4 align='center' height="60">4、广告经营单位成立后对外投资情况</td>
</tr>
<tr>    
	<td width='40%' align='center' nowrap="nowrap" height="40">对外投资设立企业名称</td>
	<td width='20%' align="center">投资额（万元）</td>
	<td width='20%' align="center" height="40">所占比例（%）</td>   
	<td width='20%' align="center">国家（地区）</td>
</tr>	
<%
 int No2=0;
 ArrayList tzxx=GGGL_JYDW_DWTZ.getList(" WHERE ADBULICNO='"+ADBULICNO+"' and INSYEAR="+INSYEAR); 
 for (int i=0;i<tzxx.size();i++){
 com.macrosoft.icms.ggxkz.GGGL_JYDW_DWTZ bTable = (com.macrosoft.icms.ggxkz.GGGL_JYDW_DWTZ)tzxx.get(i);

  No2=No2+1;
%>
  <tr>  
  <td height="40" align="center"><%=bTable.getINVENTNAME()%></td><!--对外投资设立企业名称-->
  <td align="center"><%=String.valueOf(bTable.getCONTOAM())%></td>  <!--投资额（万元）-->
  <td align="center"><%=String.valueOf(bTable.getPOSPROP())%></td> <!--所占比例（%）-->
  <td align="center"><%--=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())--%></td><!--国家（地区）-->  
 </tr>
<% 
 }

 while (No2<=6) 
 {
	out.print("<tr><td height='40'></td><td></td><td></td><td></td></tr>");
	No2++;
 }
%>	
</table>
<p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="90%" bordercolor='#000000'>
<tr>
   <td colspan=5 align='center' height="60">5、取得《广告专业技术岗位资格培训证书》和<br>《广告审查员证》人员名单
</td>
</tr>
<tr>    
	<td width='20%' align='center' nowrap="nowrap" height="40">姓名</td>
	<td align="center">培训日期</td>
	<td width='20%' align="center" height="40">证件名称</td>   
	<td width='20%' align="center">证件号码</td>
	<td width='20%' align="center">发证日期</td>
</tr>	
<%
 int No3=0;
 int zyjs=0;
 int scy=0;
 ArrayList zsxx=GGGL_JYDW_ZSXX.getList(" WHERE ADBULICNO='"+ADBULICNO+"' and INSYEAR="+INSYEAR); 
 for (int i=0;i<zsxx.size();i++){
 com.macrosoft.icms.ggxkz.GGGL_JYDW_ZSXX bTable = (com.macrosoft.icms.ggxkz.GGGL_JYDW_ZSXX)zsxx.get(i);
 if(bTable.getADTICERTYPE().equals("01")){//取得广告专业技术岗位资格培训证书人数
    zyjs=zyjs+1;
 }
 if(bTable.getADTICERTYPE().equals("02")){//有广告审查员证书的人数
    scy=scy+1;
 }
  No3=No3+1;
%>
  <tr>  
  <td height="40" align="center"><%=bTable.getNAME()%></td><!--姓名-->
  <td align="center"><%=bTable.getCULDATE()%></td>  <!--培训日期-->
  <td align="center"><%=bTable.getCERNAME()%></td> <!--证件名称-->
  <td align="center"><%=bTable.getCERNO()%></td> <!--证件号码-->
  <td align="center"><%=bTable.getISSCARDDATE()%></td><!--发证日期-->  
 </tr>
<% 
 }

 while (No3<=16) 
 {
	out.print("<tr><td height='40'></td><td></td><td></td><td></td><td></td></tr>");
	No3++;
 }
%>
<tr>
  <td colspan=5 height='80'>&nbsp;&nbsp;&nbsp;&nbsp;现取得广告专业技术岗位资格培训证书 <%=zyjs %> 人，占全部广告从业人员的<%if(zsxx.size()>0){out.print((zyjs*100)/zsxx.size());}else{out.print(0);} %> %，有广告审查员证书 <%=scy %> 人。（注：如填写不下，可复印附纸）</td>
</tr>	
</table>
<p class="PageNext"><br>
<!--########### -->
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">二、广告经营分支（办事）机构设立情况</b><br>	
	<br>
</caption>	
</table>
<table align="center" border="1" width="90%" bordercolor='#000000'>
<%ArrayList fzjgxx=GGGL_JYDW_FZJG.getList(" WHERE ADBULICNO='"+ADBULICNO+"' and INSYEAR="+INSYEAR);
  int r=0;
  if(fzjgxx.size()<=3){ 
    r=4;
  }else{
    r=fzjgxx.size()+1;
  }%>
<tr>    
	<td align='center' rowspan=<%=r %>>广告经营分支<br>机构（办事）<br>设 置 情 况</td>
	<td align='center' nowrap="nowrap" height="45">名称</td>
	<td align="center">登记机关</td>
	<td align="center">设立时间</td>   
	<td align="center">负责人</td>
</tr>	
<%
 int No4=0;
 for (int i=0;i<fzjgxx.size();i++){
 com.macrosoft.icms.ggxkz.GGGL_JYDW_FZJG bTable = (com.macrosoft.icms.ggxkz.GGGL_JYDW_FZJG)fzjgxx.get(i);

  No4=No4+1;
%>
  <tr>  
  <td height="45" align="center"><%=bTable.getBRNAME()%></td><!--名称-->
  <td align="center"><%=bTable.getREGORG()%></td>  <!--登记机关-->
  <td align="center"><%=bTable.getESTDATE()%></td> <!--设立时间-->
  <td align="center"><%=bTable.getPRILNAME()%></td><!--负责人-->  
 </tr>
<% 
 }

 while (No4<3) 
 {
	out.print("<tr><td height='45'></td><td></td><td></td><td></td></tr>");
	No4++;
 }
%>	
</table>
<br><br>
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">三、广告经营设备情况</b><br>	
	<br>
</caption>	
</table>
<table align="center" border="1" width="90%" bordercolor='#000000'>
<% 
ArrayList sbqkxx=GGGL_JYDW_JYSB.getList(" WHERE ADBULICNO='"+ADBULICNO+"' and INSYEAR="+INSYEAR);
   r=0;
  if(sbqkxx.size()<=6){ 
    r=7;
  }else{
    r=sbqkxx.size()+1;
  }
%>
<tr>    
	<td align='center' rowspan=<%=r%> width="10%">设<br>备<br>情<br>况</td>
	<td align='center' nowrap="nowrap" height="45">设 备 名 称</td>
	<td align="center">型    号</td>
	<td align="center">数  量（台）</td>   
	<td align="center">净价值（万元）</td>
</tr>	
<%
 int No5=0;
 for (int i=0;i<sbqkxx.size();i++){
 com.macrosoft.icms.ggxkz.GGGL_JYDW_JYSB bTable = (com.macrosoft.icms.ggxkz.GGGL_JYDW_JYSB)sbqkxx.get(i);

  No5=No5+1;
%>
  <tr>  
  <td height="45" align="center"><%=bTable.getEQUNAME()%></td><!--设备名称-->
  <td align="center"><%=bTable.getTYPESPF()%></td>  <!--型号-->
  <td align="center"><%=bTable.getQUAN()%></td> <!--数量-->
  <td align="center"><%=bTable.getNETPRICE()%></td><!--净价值-->  
 </tr>
<% 
 }

 while (No5<6) 
 {
	out.print("<tr><td height='45'></td><td></td><td></td><td></td></tr>");
	No5++;
 }
%>	
</table>
<p class="PageNext"><br>
<!--########### -->
<%GGGL_JYDW_GLZD.setADBULICNO(ADBULICNO);
  GGGL_JYDW_GLZD.setINSYEAR(INSYEAR);
  GGGL_JYDW_GLZD.doSelect(); %>
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">四、广告经营基本管理制度建立和执行情况</b><br>	
	<br>
</caption>	
</table>
<table align="center" border="1" width="90%" bordercolor='#000000'>
<tr>    
	<td>
	  <p align=left>
	  <br>
		请如实填写“是”或“否”：<br><br>
		1、是否建立了广告承接登记制度<%=SysSystem.toUnderlineStr(icms.getSysDm("YESORNO",GGGL_JYDW_GLZD.getADREGSYS()),"center",15)%><br> 
        2、是否建立了广告档案管理制度<%=SysSystem.toUnderlineStr(icms.getSysDm("YESORNO",GGGL_JYDW_GLZD.getADARCHMAG()),"center",15)%><br>
        3、是否建立了广告合同管理制度<%=SysSystem.toUnderlineStr(icms.getSysDm("YESORNO",GGGL_JYDW_GLZD.getADCONTMAG()),"center",15)%><br>
        4、是否建立了广告审查制度，设计、制作、代理、发布的广告是否经广告审查员审查，并签署意见<%=SysSystem.toUnderlineStr(icms.getSysDm("YESORNO",GGGL_JYDW_GLZD.getADEXAMSYS()),"center",15)%><br>
        5、广告收费标准是否及时向备案管理机关备案<%=SysSystem.toUnderlineStr(icms.getSysDm("YESORNO",GGGL_JYDW_GLZD.getISBA()),"center",15)%><br>
        6、使用广告业务专用发票、广告业务财务往来是否单独立帐<%=SysSystem.toUnderlineStr(icms.getSysDm("YESORNO",GGGL_JYDW_GLZD.getISSEPACC()),"center",15)%><br>
        7、是否按规定及时报送《广告经营单位基本情况统计表》<%=SysSystem.toUnderlineStr(icms.getSysDm("YESORNO",GGGL_JYDW_GLZD.getISTABLE()),"center",15)%><br>
        8、广告经营登记事项变化后，是否及时办理了变更手续<%=SysSystem.toUnderlineStr(icms.getSysDm("YESORNO",GGGL_JYDW_GLZD.getISBG()),"center",15)%><br>                
	  <br>
	  </p>
	</td>
</tr>	
</table>
<br><br><br>
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">五、广告经营基本情况</b><br>	
	<br>
</caption>	
</table>
<%GGGL_JYDW_JYQK.setADBULICNO(ADBULICNO);
  GGGL_JYDW_JYQK.setINSYEAR(INSYEAR);
  GGGL_JYDW_JYQK.doSelect(); %>
<table align="center" border="1" width="90%" bordercolor='#000000'>
<tr>
    <td><br><br>
      <p align=right><b><span style="font-size: 16pt">单位：万元&nbsp;&nbsp;&nbsp;&nbsp;</span></b></p>
      <br> 
	  <p align=left>
	  <br>
		1、广告营业收入：&nbsp;<%=GGGL_JYDW_JYQK.getADOPEINC() %><br><br>
		2、外商来华广告收入：&nbsp;<%=GGGL_JYDW_JYQK.getFORBUSIADINC() %><br><br> 
        3、纳税额：&nbsp;<%=GGGL_JYDW_JYQK.getRATAL() %><br><br>
        4、税后利润：&nbsp;<%=GGGL_JYDW_JYQK.getNETINC() %><br><br>
        5、亏损额：&nbsp;<%=GGGL_JYDW_JYQK.getDEFICIT() %><br><br><br>
	  </p>
	</td>
</tr>	
</table>
<p class="PageNext"><br>
<!--########### -->
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">六、印刷品广告、户外广告及临时性广告经营等情况</b><br>	
	<br></caption>	
</table>
<table border="1" width="90%" align="center" bordercolor="#000000">
<tr>
   <td align="center" rowspan=2 nowrap="nowrap">固定形式<br>印刷品广告<br>经营情况</td>
   <td align="center" height=40 colspan=3>固定形式<br>印刷品广告名称</td>
   <td align="center" colspan=3>发布期数</td>
   <td align="center">经营收入(万元)</td>
   <td align="center">备注</td>
</tr>
<tr>
   <td colspan=3 height=40><%=GGGL_JYDW_JYQK.getADNAME() %></td>
   <td colspan=3><%=GGGL_JYDW_JYQK.getISSDEG() %></td>
   <td><%=GGGL_JYDW_JYQK.getGDBUSINC() %></td>
   <td><%=GGGL_JYDW_JYQK.getREMARK() %></td>
</tr>
<tr>
   <td align="center" rowspan=2 nowrap="nowrap">户外广告<br>设置情况</td>
   <td align="center" height=40 colspan=2 nowrap="nowrap">经营总收入<br>(万元)</td>
   <td align="center">路牌<br>(个/m2)</td>
   <td align="center">灯箱<br>(个/m2)</td>
   <td align="center" colspan=2>霓虹灯<br>(个/m2)</td>
   <td align="center" nowrap="nowrap">电子显示牌(屏)<br>(个/m2)</td>
   <td align="center">其它<br>(个/m2)</td>
</tr>
<tr>
   <td align="center" height=40 colspan=2><%=GGGL_JYDW_JYQK.getHWBUSINC() %></td>
   <td align="center"><%=GGGL_JYDW_JYQK.getEXHPLAQUAN() %></td>
   <td align="center"><%=GGGL_JYDW_JYQK.getLAMPBOXQUAN() %></td>
   <td align="center" colspan=2><%=GGGL_JYDW_JYQK.getNELQUAN() %></td>
   <td align="center" nowrap="nowrap"><%=GGGL_JYDW_JYQK.getEDISUQUAN() %></td>
   <td align="center"><%=GGGL_JYDW_JYQK.getOTHQUAN() %></td>
</tr>
<tr>
   <td align="center" height=40 colspan=2 nowrap="nowrap">临时性广告经营情况</td>
   <td align="center" colspan=4 nowrap="nowrap">承办次数<%=SysSystem.toUnderlineStr(String.valueOf(GGGL_JYDW_JYQK.getUNDDEG()),"center",5)%>次</td>
   <td align="center" colspan=3 nowrap="nowrap">临时性广告经营收入<%=SysSystem.toUnderlineStr(String.valueOf(GGGL_JYDW_JYQK.getLSBUSINC()),"center",10)%>万元</td>
</tr>
<tr>
   <td align="center" height=120 colspan=2 nowrap="nowrap">开展公益广告<br>活动情况</td>
   <td colspan=7><%=GGGL_JYDW_JYQK.getACTCON() %></td>
</tr>
</table>
<br><br>
<table border="1" width="90%" align="center" bordercolor="#000000">
<tr>
   <td align="left" height=120 valign="top">广告经营中有无违法违章问题（时间、类别、内容、次数）：<br><%=GGGL_JYDW_JYQK.getILLEGAL() %></td>
</tr>
<tr>
   <td align="left" height=120 valign="top">改进措施：<br><%=GGGL_JYDW_JYQK.getIMPROVEMENT() %></td>
</tr>
<tr>
   <td align="left" height=120 valign="top">谨此确认，前述所填项目及所附材料真实无误。
   <br>
   <p align="right">单位负责人（签字）：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br><br>
   <p align="right">（单位盖章）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
   年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>  
   </td>
</tr>
</table>
<p class="PageNext"><br>
<!--########### -->
<%GGGL_JYDW_HCQK.setADBULICNO(ADBULICNO);
  GGGL_JYDW_HCQK.setINSYEAR(INSYEAR);
  GGGL_JYDW_HCQK.doSelect();
  String y="√";
  String n="×";
  String cheopin=GGGL_JYDW_HCQK.getCHEOPIN();
  String othercheopin=GGGL_JYDW_HCQK.getOTHERCHEOPIN();
  boolean sign=false; %>
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">七、广告监督管理机关核查情况</b><br>	
	<br>
</caption>	
</table>
<table align="center" border="1" width="90%" bordercolor='#000000'>
<tr>    
	<td>
	  <p align=left><b>&nbsp;&nbsp;&nbsp;&nbsp;审查范围（按照下列项目对检查单位逐项进行审查，符合规定的划“√”,不符合的划“×”）：</b></p>
	  <p align=left>
	  <br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;1、注册资本数额（  <%if(GGGL_JYDW_HCQK.getISREGCAP().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISREGCAP().equals("2")){out.print(n);} %>  ）；<br> 
        &nbsp;&nbsp;&nbsp;&nbsp;2、经营场所及其面积（  <%if(GGGL_JYDW_HCQK.getISOPDOM().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISOPDOM().equals("2")){out.print(n);} %>  ）；<br>
        &nbsp;&nbsp;&nbsp;&nbsp;3、专业人员具有大专以上学历人数（  <%if(GGGL_JYDW_HCQK.getISJUCOL().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISJUCOL().equals("2")){out.print(n);} %>  ）；<br>
        &nbsp;&nbsp;&nbsp;&nbsp;4、从业人员取得《广告专业技术岗位资格培训证书》人数（  <%if(GGGL_JYDW_HCQK.getISCRED().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISCRED().equals("2")){out.print(n);} %>  ），广告审查员配备人数（  <%if(GGGL_JYDW_HCQK.getISADCHE().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISADCHE().equals("2")){out.print(n);} %>  ）；<br>
        &nbsp;&nbsp;&nbsp;&nbsp;5、内部经营机构设置与其广告经营范围适应程度（  <%if(GGGL_JYDW_HCQK.getISOPBUS().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISOPBUS().equals("2")){out.print(n);} %>  ）；<br>
        &nbsp;&nbsp;&nbsp;&nbsp;6、广告经营基本专业设备（  <%if(GGGL_JYDW_HCQK.getISPROEQU().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISPROEQU().equals("2")){out.print(n);} %>  ）；<br>
        &nbsp;&nbsp;&nbsp;&nbsp;7、广告经营基本管理制度（  <%if(GGGL_JYDW_HCQK.getISMASYS().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISMASYS().equals("2")){out.print(n);} %>  ）；<br>
        &nbsp;&nbsp;&nbsp;&nbsp;8、广告经营业务开展情况（  <%if(GGGL_JYDW_HCQK.getISBUSSIT().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISBUSSIT().equals("2")){out.print(n);} %>  ）；<br>
        &nbsp;&nbsp;&nbsp;&nbsp;9、无广告违法违章行为（  <%if(GGGL_JYDW_HCQK.getISCASE().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISCASE().equals("2")){out.print(n);} %>  ），已经改正（  <%if(GGGL_JYDW_HCQK.getISCHANGE().equals("1")){out.print(y);}else if(GGGL_JYDW_HCQK.getISCHANGE().equals("2")){out.print(n);} %>  ）。<br><br>
        经检查，建议1、具备经营广告业务资格，通过检查（  <%if(cheopin.equals("1")){out.print(y);}%>  ）。<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、缓期通过检查，限期整改（  <%if(cheopin.equals("2")){out.print(y);} %>  ）。<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、核减其广告经营项目（  <%if(cheopin.equals("3")){out.print(y);} %>  ）。<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、不具备经营广告业务资格，核销《广告经营许可证》（  <%if(cheopin.equals("4")){out.print(y);} %>  ）。<br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5、<%if(othercheopin.equals("")){out.print(SysSystem.toUnderlineStr("","center",30));}else{out.print(SysSystem.toUnderlineStr(othercheopin,"left",30));}%> <br><br><br><Br>
       <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;审查人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 处（科、股）长签字：</p>
       <br><br>
       <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</p>
       <br><br>
	</td>
</tr>
<tr>
    <td><br>局（司）长审核意见：<br><br><br>
    <p align="right"> &nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </td>
</tr>
<tr>
    <td><br>广告监督管理机关处理结果：<br><br>
    <p align="right"> (盖章)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </td>
</tr>	
</table>
<p class="PageNext"><br>
<!--########### -->
<%
    GGGL_GGJY.setPRIPID(ADBULICNO);
	GGGL_GGJY.setANCHEYEAR(INSYEAR);
	GGGL_GGJY.doSelect();
	
 %>
<table width="90%" align="center" bordercolor="#000000">
<caption><b>
	<span style="font-size: 16pt">八、广告经营单位基本情况统计表</b><br>	
	<br>
</caption>	
</table>
  <table class="showTable01" border="0"  width="90%">
    <tr>
     <td align="left"><br><br>单位(公章)：</td>
    </tr>
  </table>
  <table align="center" border="1" width="90%" bordercolor='#000000'>
    <tr style="height:30">
      
      <td class="" nowrap  align="center">单位名称</td>
      <td class="" nowrap  align="center" colspan="3">住所</td>
      <td class="" nowrap  align="center">电话</td> 
      <td class="" nowrap  align="center">联系人</td>
          
    </tr>
    <tr style="height:30">
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getENTNAME()%></font></td></p>
      <td class="" align="center" colspan="3">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getENTADRESS()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getFILLTEL()%></font></td></p> 
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getLINKMAN()%></font></td></p>
      
    </tr>  
    <tr style="height:30">
      <td class="" nowrap  align="center">营业执照注册号(或广告经营许可证号)</td>
      <td class="" nowrap  align="center">注册资本(万元)</td>
      <td class="" nowrap  align="center">法定代表人(负责人)</td>
      <td class="" nowrap  align="center">类型</td>
      <td class="" nowrap  align="center">邮编</td>      
      <td class="" nowrap  align="center">广告企业资质等级</td>   
        
    </tr>
    <tr style="height:30">
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getENTREGNO()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getREGCAPITAL()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getLEGREFEREE()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getENTCLASS()%></font></td></p> 
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getPOSTCODE()%></font></td></p> 
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getQUAGRADE()%></font></td></p>
      
    </tr> 
  </table>
    <table class="showTable01" border="1" width="90%" bordercolor="#000000"  cellspacing="0" cellpadding="0" 
	style="BORDER-COLLAPSE: collapse;" rules='all' frame="box"  align="center">
    <tr style="height:30">
      <td with="6%" class=""   align="center" rowspan="3">广告经营额合计(万元)</td>
      <td with="6%" class=""  align="center">药品</td>   
      <td with="6%" class=""   align="center">食品</td>
      <td with="6%" class=""   align="center">保健食品</td>
      <td with="6%" class=""   align="center">化妆品</td>
      <td with="6%" class=""   align="center">美容业</td>
      <td with="6%" class=""   align="center">医疗器械</td>
      <td with="6%" class=""   align="center">医疗服务</td>
      <td with="6%" class=""   align="center">烟草</td>
      <td with="6%" class=""   align="center">酒类</td>
      <td  class=""   align="center">其他</td>
      <td with="6%" class=""   align="center">纳税额(万元)</td>
      <td  class=""   colspan="2" align="center">其中</td>
     
    </tr>
    <tr style="height:30">
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getMEDI()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getFOOD()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getHTHFOOD()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getMAQUI()%></font></td></p>       
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getBEACUL()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getMEDAPP()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getHTHCARPRO()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getTOBACCO()%></font></td></p>       
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getWINE()%></font></td></p>
      <td class="" align="center" rowspan="3">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getELSBUSTUR()%></font></td></p>
      <td class="" align="center" rowspan="3">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getRATAL()%></font></td></p>
      <td with="6%" class=""   rowspan="2" align="center">固定形式印刷品广告经营额(万元)</td>
      <td with="6%" class=""   rowspan="2" align="center">户外广告经营额(万元)</td>

    </tr>  
    <tr style="height:30">
      <td  class=""   align="center">招生招聘</td> 
      <td  class=""   align="center">房地产</td>   
      <td  class=""   align="center">农资</td>
      <td  class=""   align="center">服务业</td>
      <td  class=""   align="center">信息产业</td>
      <td  class=""   align="center">金融保险</td>
      <td  class=""   align="center">汽车</td>
      <td  class=""   align="center">家用电器</td>
      <td  class=""   align="center">服装服饰</td>
    </tr>
    <tr style="height:30">
      <td  class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getBUSTUR()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getADMREC()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getREAEST()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getAGRMAT()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getSERVICE()%></font></td></p>      
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getINFORIND()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getFININS()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getAUTOMAN()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getCONEQU()%></font></td></p>       
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getCLOTH()%></font></td></p>
      <td  class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getPRETION()%></font></td></p>
      <td  class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getOUTAD()%></font></td></p>    
    </tr>  
  </table>
   <table class="showTable01" border="1" width="90%" bordercolor="#000000"  cellspacing="0" cellpadding="0" 
	style="BORDER-COLLAPSE: collapse;" rules='all' frame="box"  align="center">
    <tr style="height:30">
      <td with="6%" class=""   align="center">广告营业收入(万元)</td>
      <td  class=""   align="center">其中：户外广告营业收入(万元)</td>
       <td with="8%" class=""   align="center">发布的户外广告媒介个数(个)</td>   
       <td with="8%" class=""   align="center">展示牌</td>
      <td with="8%" class=""   align="center">灯箱</td>
      <td with="8%" class=""   align="center">电子显示屏</td>
      <td with="8%" class=""   align="center">霓虹灯</td>
      <td with="8%" class=""   align="center">交通工具</td>
      <td with="6%" class=""   align="center">其他</td>
      <td with="8%" class=""   align="center">从业人员合计(人)</td>
      <td with="8%" class=""   align="center">管理人员</td>
      <td with="8%" class=""   align="center">业务人员</td>
      <td with="8%" class=""   align="center">其他人员</td> 
   
    </tr>
    <tr style="height:30">
    <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getOPRAINCOME()%></font></td></p>
    <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getOUTOPRAINCOME()%></font></td></p>
    <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getMEDINUM()%></font></td></p>
    <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getSHOWCARD()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getLIGHTBOX()%></font></td></p>     
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getELECSIGNS()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getNENOLIGHT()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getVEHICLE()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getOTHERNUM()%></font></td></p>   
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getEMPNUM()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getMANNUM()%></font></td></p>       
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getWORNUM()%></font></td></p>
      <td class="" align="center">&nbsp;<font class="textShowContent"><%=GGGL_GGJY.getELSEMPNUM()%></font></td></p>     
     
    </tr> 
    </table>
<table class="" border="0" width="90%">
  <tr>
   <td class=""  colspan="7"><font size="1">说明:<br>1、类型分为专营广告公司、兼营广告企业 、电视台、 广播电台 、报社 、期刊社 、网站 、其它。<br>
			          2、广告企业资质等级是指广告企业（不含媒体单位）按以“中国广告企业资质标准”有中国广告协会认定并授牌的广告业资质等级”分为一、二、三级。<br>															
			          3、广告营业额是指从事广告策划、设计、制作、发布代理业务以及其它与广告有关的业务活动的全部实际收入。<br>															
			          4、广告营业收入是指营业额减去付给媒体单位广告发布费用后的实际收入（以缴纳税款的发票数额为准）。	<br>														
			          5、广告经营额合计等于药品、食品、保健食品、化妆品、美容业、医疗器械、医疗服务、烟草、酒类、招生招聘、房地产、农资、服务业、信息产业、金融保险、汽车、家用电器、服装服饰和其他之和；从业人员合计等于管理人员、业务人员和其他人员相加之和；发布的户外广告媒介个数合计等于展示牌、灯箱、电子显示屏、霓虹灯、交通工具和其他之和。<BR>
			          6、本表填写<%=GGGL_GGJY.getANCHEYEAR()%>年度广告经营情况。</font>
   </td> 
 </tr>
</table>
<table class="" border="0" width="900">
  <tr>
   <td class="" align="left" width="300"><font size="2"><br>负责人：<%=GGGL_GGJY.getMANAGER()%></font>
   </td> 
    <td class="" align="center" width="300"><font size="2">填表人：<%=GGGL_GGJY.getFILLMAN()%></font>
   </td> 
    <td class="" align="right" width="300"><font size="2">填报日期：
    <%String filldat = GGGL_GGJY.getFILLDAT();
     if(filldat==null || "".equals(filldat)){ %>
     <%=filldat%>
     <%}else{ 
     filldat=filldat.substring(0, 10);
      %>
     <%=filldat%>
     <%} %>
    </font>
   </td> 
 </tr>
</table>
</body></html>