<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>

<jsp:useBean id="DCDY_JBXX" scope="page"  class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ"/>
<jsp:useBean id="DCDY_DYWXX" scope="page"  class="com.macrosoft.icms.htgl.DCDY_DYWXX_SQ"/>


<%	
String OPENO = request.getParameter("OPENO");
String OPETYPE = request.getParameter("OPETYPE");
DCDY_JBXX.setOPENO(OPENO);
DCDY_JBXX.doSelect();
//DCDY_DYWXX.setOPENO(OPENO);
List dwyList = DCDY_DYWXX.getList(" OPENO='"+OPENO+"'");
	String checkBox = "□";
    String selected = "√";
    String WTYW="设立□变更□注销□备案□";
    if("20".equals(OPETYPE)){
    	WTYW="设立√变更□注销□";
    }else if("30".equals(OPETYPE)){
    	WTYW="设立□变更√注销□";
    }else if("50".equals(OPETYPE)){
    	WTYW="设立□变更□注销√";    	
    }
    String dcdylb="";
	if("1".equals(DCDY_JBXX.getSTATUS())){
		dcdylb="企业√个体工商户□农业生产经营者□";
	}else if("2".equals(DCDY_JBXX.getSTATUS())){
		dcdylb="企业□个体工商户√农业生产经营者□";
	}else if("3".equals(DCDY_JBXX.getSTATUS())){
		dcdylb="企业□个体工商户□农业生产经营者√";
	}
%>
<html><head><title>动产抵押登记书</title>
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
<p  align="right" >
<input type="button" value="打印报告书" onclick="window.focus();window.print();" class="NOPRINT">
<input name=back type="button" value="关   闭" onclick="window.close();" class="NOPRINT">
<font  color="red" id="shelp" class="noprint" style="font-size: 9pt;" class="NOPRINT">(请用A4纸打印,在打印之前请在IE->文件->页面设置"中将"页眉页脚"清空)</font>
</p>
<p align="right">
<font style="font-size: 9pt;" align='' >(登记机关存档)</font>
</p>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt"><center>动产抵押登记书</center></b><br><br></caption>
<tr>
	<td align='center' height=44 width="20%">抵押人</td>
	<td colspan="3" align='center'><%=dcdylb%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">名称（姓名）</td>
	<td width="40%"><%=DCDY_JBXX.getMORTGAGO()%></td>
	
	<td align='center' height=46 width="20%">住所地</td>
	<td width="20%"><%=DCDY_JBXX.getMORTGAGOADDRESS()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">证件类型</td>
	<td width="40%"><%=icms.getSysDm("CERTYPE",DCDY_JBXX.getMORTGAGOCERTYPE())%></td>
	
	<td align='center' height=46 width="20%">证件号码</td>
	<td width="20%"><%=DCDY_JBXX.getMORTGAGORPERNO()  %></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">代理人名称（姓名）</td>
	<td colspan='3'><%=DCDY_JBXX.getMORTGAGOAGENT() %></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=46 colspan="4">被担保债权概况</td>
</tr>
<tr>
	<td align='center' height=46 width="20%">种类</td>
	<td width="40%">
	<%="01".equals(DCDY_JBXX.getMAINCONTTYPE())?"购销":("02".equals(DCDY_JBXX.getMAINCONTTYPE())?"借贷":"其他")%>
	</td>
	
	<td align='center' height=46 width="20%">数额</td>
	<td width="20%"><%=DCDY_JBXX.getMAINCONTAM() %>万元</td>
</tr>
<tr>
	<td align='center' height=46 width="20%">担保的范围</td>
	<td width="40%"><%=DCDY_JBXX.getPRICRE() %></td>
	
	<td align='center' height=46 width="20%">债务人履行债务的期限</td>
	<td width="20%"><%=DCDY_JBXX.getPEFPERFROM() %>至<%=DCDY_JBXX.getPEFPERTO() %></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=DCDY_JBXX.getREMARK() %></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=46 colspan="4">抵押物概况</td>
</tr>
<tr>
	<td align='center' height=46 width="33%">名称</td>
	<td align='center' height=46 width="33%">所有权归属</td>
	<td align='center' height=46 width="34%">数量、质量、状况、所在地等情况</td>	
</tr>
<tr>
<%
if(null!=dwyList&&dwyList.size()>0){
	for( int i=0;i<dwyList.size();i++){
	com.macrosoft.icms.htgl.DCDY_DYWXX_SQ dwyxx = (com.macrosoft.icms.htgl.DCDY_DYWXX_SQ)dwyList.get(i);
%>
	<td width="33%" height='44'><%=dwyxx.getGUANAME() %></td>
	<td width="33%"><%=dwyxx.getOWN()  %></td>
	<td width="34%">数量:<%=dwyxx.getQUAN() %>;&nbsp价值:<%=dwyxx.getVALUE() %>万元;&nbsp
	状况:<%=dwyxx.getASCST() %>;&nbsp所在地:<%=dwyxx.getDEPOSPOT() %></td>	
<%} 
}else{
%>
<td width="33%" height='44'></td>
<td width="33%"></td>
<td width="34%"></td>	
<%}%>
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=""%></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=20 width="33%">抵押人签字（盖章）</td>
	<td align='center' height=20 width="33%">抵押权人签字（盖章）</td>
	<td align='center' height=20 width="34%">登记机关盖章</td>	
</tr>
<tr>
	<td width="33%" height='84' valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日
	</td>
	<td width="33%"  valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日
	</td>
	<td width="34%"  valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日	
	</td>	
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=""%></td>
</tr>
</table>
<br><p class="PageNext"><br>
<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:10px">
<center><font size='4'><b>动产抵押登记须知</b></font></center>
<font size='2'>
<br>
<b>为了您的合法权益能够得到充分的保障，请在填写登记书前仔细阅读以下内容，并在须知后签字确认。
（该须知和《动产抵押登记书》、《动产抵押变更登记书》、《动产抵押注销登记书》登记机关存档份双面打印）
</b>
<br>一、申请人须使用标准A4纸张、黑色钢笔、签字笔填写或打印登记书。
<br>二、申请人应当保证其所提供的材料及信息真实有效。登记书内容应当与抵押合同以及主合同相关内容一致。
<br>三、《中华人民共和国物权法》第一百八十八条规定以动产抵押的，抵押权自抵押合同生效时设立；未经登记，不得对抗善意第三人。
<br>四、《中华人民共和国物权法》第一百八十四条规定下列动产不得抵押：
<br>（一）学校、幼儿园、医院等以公益为目的的事业单位、社会团体的教育设施、医疗卫生设施和其他社会公益设施；
<br>（二）所有权、使用权不明或者有争议的财产；
<br>（三）依法被查封、扣押、监管的财产；
<br>（四）法律、行政法规规定不得抵押的其他财产。
<br>五、《中华人民共和国物权法》第一百八十九条规定企业、个体工商户、农业生产经营者以本法第一百八十一条规定的动产抵押的，应当向抵押人住所地的工商行政管理部门办理登记。
国家工商行政管理总局《动产抵押登记办法》第二条规定，企业、个体工商户、农业生产经营者以现有的以及将有的生产设备、原材料、半成品、产品抵押的，应当向抵押人住所地的县级工商行政管理部门办理登记。
<br>六、国家工商行政管理总局《动产抵押登记办法》第三条规定，当事人申请动产抵押登记，应向工商行政管理局提交下列文件：
<br>（一）经抵押合同双方当事人签字或者盖章的《动产抵押登记书》；
<br>（二）抵押合同双方当事人主体资格证明或者自然人身份证明文件。
委托代理人办理动产抵押登记的，还应提交代理人身份证明文件和授权委托书。
<br>七、国家工商行政管理总局《动产抵押登记办法》第六条规定，动产抵押合同变更、《动产抵押登记书》内容变更的,抵押合同双方当事人或者其委托的代理人可以到原动产抵押登记机关办理变更登记。办理变更登记应当向动产抵押登记机关提交下列文件：
<br>（一）原《动产抵押登记书》；
<br>（二）抵押合同双方当事人签字或者盖章的《动产抵押变更登记书》；
<br>（三）抵押合同双方当事人主体资格证明或者自然人身份证明文件。
委托代理人办理动产抵押变更登记的，还应当提交代理人身份证明文件和授权委托书。
<br>八、国家工商行政管理总局《动产抵押登记办法》第八条规定，在主债权消灭、担保物权实现、债权人放弃担保物权等情形下，动产抵押合同双方当事人或者其委托的代理人可以到原动产抵押登记机关办理注销登记。办理注销登记应当向动产抵押登记机关提交下列文件：
<br>（一）原《动产抵押登记书》；
<br>（二）《动产抵押变更登记书》；
<br>（三）抵押合同双方当事人签字或者盖章的《动产抵押注销登记书》；
<br>（四）抵押合同双方当事人主体资格证明或者自然人身份证明文件。
委托代理人办理动产抵押注销登记的，还应当提交代理人身份证明文件和授权委托书。
<br>九、国家工商行政管理总局《动产抵押登记办法》第十一条规定，有关单位和个人可以持合法身份证明文件，向登记机关查阅、抄录或者复印有关动产抵押登记的资料。
<br>十、国家工商行政管理总局《动产抵押登记办法》第十二条规定，反担保及最高额抵押登记适用此办法。
<br>抵押人：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp （公章）&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 抵押权人：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp （公章）
<br>
<br>代理人签字：  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp代理人签字：     
<br>&nbsp&nbsp&nbsp年&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp日
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
年&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp日
</font>
						<br>
					</p>
				</td>
			</TR>
</table>
<br><p class="PageNext"><br>
<p align="right">
<font style="font-size: 9pt;" align='' >(抵押权人保存)</font>
</p>

<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt"><center>动产抵押登记书</center></b><br><br></caption>
<tr>
	<td align='center' height=44 width="20%">抵押人</td>
	<td colspan="3" align='center'><%=dcdylb%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">名称（姓名）</td>
	<td width="40%"><%=DCDY_JBXX.getMORTGAGO()%></td>
	
	<td align='center' height=46 width="20%">住所地</td>
	<td width="20%"><%=DCDY_JBXX.getMORTGAGOADDRESS()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">证件类型</td>
	<td width="40%"><%=icms.getSysDm("CERTYPE",DCDY_JBXX.getMORTGAGOCERTYPE())%></td>
	
	<td align='center' height=46 width="20%">证件号码</td>
	<td width="20%"><%=DCDY_JBXX.getMORTGAGORPERNO()  %></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">代理人名称（姓名）</td>
	<td colspan='3'><%=DCDY_JBXX.getMORTGAGOAGENT() %></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=46 colspan="4">被担保债权概况</td>
</tr>
<tr>
	<td align='center' height=46 width="20%">种类</td>
	<td width="40%">
	<%="01".equals(DCDY_JBXX.getMAINCONTTYPE())?"购销":("02".equals(DCDY_JBXX.getMAINCONTTYPE())?"借贷":"其他")%>
	</td>
	
	<td align='center' height=46 width="20%">数额</td>
	<td width="20%"><%=DCDY_JBXX.getMAINCONTAM() %>万元</td>
</tr>
<tr>
	<td align='center' height=46 width="20%">担保的范围</td>
	<td width="40%"><%=DCDY_JBXX.getPRICRE() %></td>
	
	<td align='center' height=46 width="20%">债务人履行债务的期限</td>
	<td width="20%"><%=DCDY_JBXX.getPEFPERFROM() %>至<%=DCDY_JBXX.getPEFPERTO() %></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=DCDY_JBXX.getREMARK() %></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=46 colspan="4">抵押物概况</td>
</tr>
<tr>
	<td align='center' height=46 width="33%">名称</td>
	<td align='center' height=46 width="33%">所有权归属</td>
	<td align='center' height=46 width="34%">数量、质量、状况、所在地等情况</td>	
</tr>
<tr>
<%
if(null!=dwyList&&dwyList.size()>0){
	for( int i=0;i<dwyList.size();i++){
	com.macrosoft.icms.htgl.DCDY_DYWXX_SQ dwyxx = (com.macrosoft.icms.htgl.DCDY_DYWXX_SQ)dwyList.get(i);
%>
	<td width="33%" height='44'><%=dwyxx.getGUANAME() %></td>
	<td width="33%"><%=dwyxx.getOWN()  %></td>
	<td width="34%">数量:<%=dwyxx.getQUAN() %>;&nbsp价值:<%=dwyxx.getVALUE() %>万元;&nbsp
	状况:<%=dwyxx.getASCST() %>;&nbsp所在地:<%=dwyxx.getDEPOSPOT() %></td>	<%} 
}else{
%>
<td width="33%" height='44'></td>
<td width="33%"></td>
<td width="34%"></td>	
<%}%>
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=""%></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=20 width="33%">抵押人签字（盖章）</td>
	<td align='center' height=20 width="33%">抵押权人签字（盖章）</td>
	<td align='center' height=20 width="34%">登记机关盖章</td>	
</tr>
<tr>
	<td width="33%" height='84' valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日
	</td>
	<td width="33%"  valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日
	</td>
	<td width="34%"  valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日	
	</td>	
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=""%></td>
</tr>
</table>
<br><p class="PageNext"><br>
<p align="right">
<font style="font-size: 9pt;" align='' >(抵押人保存)</font>
</p>

<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt"><center>动产抵押登记书</center></b><br><br></caption>
<tr>
	<td align='center' height=44 width="20%">抵押人</td>
	<td colspan="3" align='center'><%=dcdylb%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">名称（姓名）</td>
	<td width="40%"><%=DCDY_JBXX.getMORTGAGO()%></td>
	
	<td align='center' height=46 width="20%">住所地</td>
	<td width="20%"><%=DCDY_JBXX.getMORTGAGOADDRESS()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">证件类型</td>
	<td width="40%"><%=icms.getSysDm("CERTYPE",DCDY_JBXX.getMORTGAGOCERTYPE())%></td>
	
	<td align='center' height=46 width="20%">证件号码</td>
	<td width="20%"><%=DCDY_JBXX.getMORTGAGORPERNO()  %></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">代理人名称（姓名）</td>
	<td colspan='3'><%=DCDY_JBXX.getMORTGAGOAGENT() %></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=46 colspan="4">被担保债权概况</td>
</tr>
<tr>
	<td align='center' height=46 width="20%">种类</td>
	<td width="40%">
	<%="01".equals(DCDY_JBXX.getMAINCONTTYPE())?"购销":("02".equals(DCDY_JBXX.getMAINCONTTYPE())?"借贷":"其他")%>
	</td>
	
	<td align='center' height=46 width="20%">数额</td>
	<td width="20%"><%=DCDY_JBXX.getMAINCONTAM() %>万元</td>
</tr>
<tr>
	<td align='center' height=46 width="20%">担保的范围</td>
	<td width="40%"><%=DCDY_JBXX.getPRICRE() %></td>
	
	<td align='center' height=46 width="20%">债务人履行债务的期限</td>
	<td width="20%"><%=DCDY_JBXX.getPEFPERFROM() %>至<%=DCDY_JBXX.getPEFPERTO() %></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=DCDY_JBXX.getREMARK() %></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=46 colspan="4">抵押物概况</td>
</tr>
<tr>
	<td align='center' height=46 width="33%">名称</td>
	<td align='center' height=46 width="33%">所有权归属</td>
	<td align='center' height=46 width="34%">数量、质量、状况、所在地等情况</td>	
</tr>
<tr>
<%
if(null!=dwyList&&dwyList.size()>0){
	for( int i=0;i<dwyList.size();i++){
	com.macrosoft.icms.htgl.DCDY_DYWXX_SQ dwyxx = (com.macrosoft.icms.htgl.DCDY_DYWXX_SQ)dwyList.get(i);
%>
	<td width="33%" height='44'><%=dwyxx.getGUANAME() %></td>
	<td width="33%"><%=dwyxx.getOWN()  %></td>
	<td width="34%">数量:<%=dwyxx.getQUAN() %>;&nbsp价值:<%=dwyxx.getVALUE() %>万元;&nbsp
	状况:<%=dwyxx.getASCST() %>;&nbsp所在地:<%=dwyxx.getDEPOSPOT() %></td>	<%} 
}else{
%>
<td width="33%" height='44'></td>
<td width="33%"></td>
<td width="34%"></td>	
<%}%>
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=""%></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=20 width="33%">抵押人签字（盖章）</td>
	<td align='center' height=20 width="33%">抵押权人签字（盖章）</td>
	<td align='center' height=20 width="34%">登记机关盖章</td>	
</tr>
<tr>
	<td width="33%" height='84' valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日
	</td>
	<td width="33%"  valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日
	</td>
	<td width="34%"  valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日	
	</td>	
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=""%></td>
</tr>
</table>
<br><p class="PageNext"><br>

<p align="right">
<font style="font-size: 9pt;" align='' >(置备于动产抵押登记簿供查询)</font>
</p>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt"><center>动产抵押登记书</center></b><br><br></caption>
<tr>
	<td align='center' height=44 width="20%">抵押人</td>
	<td colspan="3" align='center'><%=dcdylb%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">名称（姓名）</td>
	<td width="40%"><%=DCDY_JBXX.getMORTGAGO()%></td>
	
	<td align='center' height=46 width="20%">住所地</td>
	<td width="20%"><%=DCDY_JBXX.getMORTGAGOADDRESS()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">证件类型</td>
	<td width="40%"><%=icms.getSysDm("CERTYPE",DCDY_JBXX.getMORTGAGOCERTYPE())%></td>
	
	<td align='center' height=46 width="20%">证件号码</td>
	<td width="20%"><%=DCDY_JBXX.getMORTGAGORPERNO()  %></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">代理人名称（姓名）</td>
	<td colspan='3'><%=DCDY_JBXX.getMORTGAGOAGENT() %></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=46 colspan="4">被担保债权概况</td>
</tr>
<tr>
	<td align='center' height=46 width="20%">种类</td>
	<td width="40%">
	<%="01".equals(DCDY_JBXX.getMAINCONTTYPE())?"购销":("02".equals(DCDY_JBXX.getMAINCONTTYPE())?"借贷":"其他")%>
	</td>
	
	<td align='center' height=46 width="20%">数额</td>
	<td width="20%"><%=DCDY_JBXX.getMAINCONTAM() %>万元</td>
</tr>
<tr>
	<td align='center' height=46 width="20%">担保的范围</td>
	<td width="40%"><%=DCDY_JBXX.getPRICRE() %></td>
	
	<td align='center' height=46 width="20%">债务人履行债务的期限</td>
	<td width="20%"><%=DCDY_JBXX.getPEFPERFROM() %>至<%=DCDY_JBXX.getPEFPERTO() %></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=DCDY_JBXX.getREMARK() %></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=46 colspan="4">抵押物概况</td>
</tr>
<tr>
	<td align='center' height=46 width="33%">名称</td>
	<td align='center' height=46 width="33%">所有权归属</td>
	<td align='center' height=46 width="34%">数量、质量、状况、所在地等情况</td>	
</tr>
<tr>
<%
if(null!=dwyList&&dwyList.size()>0){
	for( int i=0;i<dwyList.size();i++){
	com.macrosoft.icms.htgl.DCDY_DYWXX_SQ dwyxx = (com.macrosoft.icms.htgl.DCDY_DYWXX_SQ)dwyList.get(i);
%>
	<td width="33%" height='44'><%=dwyxx.getGUANAME() %></td>
	<td width="33%"><%=dwyxx.getOWN()  %></td>
	<td width="34%">数量:<%=dwyxx.getQUAN() %>;&nbsp价值:<%=dwyxx.getVALUE() %>万元;&nbsp
	状况:<%=dwyxx.getASCST() %>;&nbsp所在地:<%=dwyxx.getDEPOSPOT() %></td>	<%} 
}else{
%>
<td width="33%" height='44'></td>
<td width="33%"></td>
<td width="34%"></td>	
<%}%>
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=""%></td>
</tr>
</table>
<br>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<tr>
	<td align='center' height=20 width="33%">抵押人签字（盖章）</td>
	<td align='center' height=20 width="33%">抵押权人签字（盖章）</td>
	<td align='center' height=20 width="34%">登记机关盖章</td>	
</tr>
<tr>
	<td width="33%" height='84' valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日
	</td>
	<td width="33%"  valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日
	</td>
	<td width="34%"  valign='bottom' align='right'>
		年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp&nbsp日	
	</td>	
</tr>
<tr>
	<td align='center' height=46 width="20%">备注</td>
	<td colspan='3'><%=""%></td>
</tr>
</table>
<br><p class="PageNext"><br>
</body></html>