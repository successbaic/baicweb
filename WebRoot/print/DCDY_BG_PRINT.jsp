<%-- <%
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
<jsp:useBean id="DCDY_BGXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_BGXX_SQ"/>
<jsp:useBean id="DCDY_JBXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ"/>
<jsp:useBean id="AF0401" scope="page" class="com.macrosoft.icms.gsnw.AF0401"/>

<%	
String OPENO = request.getParameter("OPENO");
String OPETYPE = request.getParameter("OPETYPE");
List bgList  = new ArrayList();
if(!OPENO.equals("")){
	DCDY_JBXX.setOPENO(OPENO);
	DCDY_JBXX.doSelect();
	bgList = DCDY_BGXX.getList(" where OPENO='"+OPENO+"'");
}
String MORTGAGO=DCDY_JBXX.getMORTGAGO();
String MORREGCNO=DCDY_JBXX.getMORREGCNO();
String MORE=DCDY_JBXX.getMORE();
AF0401.doSelectBySql(" SELECT * FROM AF0401 WHERE AF04005='"+MORREGCNO+"' AND AF04011='"+MORE+"' AND AF04017='"+MORTGAGO+"'");
%>
<html><head><title>动产抵押变更登记书</title>
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
	<span style="font-size: 16pt"><center>动产抵押变更登记书</center></b><br><br></caption>
<tr>
	<td align='center' height=46 width="20%">动产抵押登记编号</td>
	<td width="40%"><%=AF0401.getAF04005()%></td>
	
	<td align='center' height=46 width="20%">登记日期</td>
	<td width="20%"><%=AF0401.getHF04061()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">抵押人名称（姓名）</td>
	<td colspan='3' width="40%"><%=DCDY_JBXX.getMORTGAGO()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">抵押权人名称（姓名）</td>
	<td colspan='3'><%=DCDY_JBXX.getMORE() %></td>
</tr>
<tr><td align='center' colspan='4'>变更内容</td></tr>
<tr>
<td align='left' colspan='4' height='80'>
<table>
<%for(int i=0;i<bgList.size();i++ ){ 
	com.macrosoft.icms.htgl.DCDY_BGXX_SQ bg = (com.macrosoft.icms.htgl.DCDY_BGXX_SQ)bgList.get(i);
	String altconitem = bg.getALTCONITEM();
	String bgName = "";
	if("HF04067".equals(altconitem)){
		bgName="主债权的种类";
	}else if("HF04069".equals(altconitem)){
		bgName="主债权的数额";
	}else if("AF04032".equals(altconitem)){
		bgName="担保范围";
	}else if("AF040081".equals(altconitem)){
		bgName="履行债务起始时间";
	}else if("AF040082".equals(altconitem)){
		bgName="履行债务结束时间";
	}
%>
<tr>
<td width='20%'>变更内容：<%=bgName %></td>
<%if("HF04067".equals(altconitem)){ %>
<td  width='40%'>变更前：<%="01".equals(bg.getALTBE())?"购销":("02".equals(bg.getALTBE())?"借贷":"其他") %></td>
<td  width='40%'>变更后：<%="01".equals(bg.getALTAF())?"购销":("02".equals(bg.getALTAF())?"借贷":"其他") %></td>
<% }else{%>
<td  width='40%'>变更前：<%=bg.getALTBE() %></td>
<td  width='40%'>变更后：<%=bg.getALTAF() %></td>
<%} %></tr>
<%} %>
</table>
</td>
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
	<span style="font-size: 16pt"><center>动产抵押变更登记书</center></b><br><br></caption>
<tr>
	<td align='center' height=46 width="20%">动产抵押登记编号</td>
	<td width="40%"><%=AF0401.getAF04005()%></td>
	
	<td align='center' height=46 width="20%">登记日期</td>
	<td width="20%"><%=AF0401.getHF04061()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">抵押人名称（姓名）</td>
	<td colspan='3' width="40%"><%=DCDY_JBXX.getMORTGAGO()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">抵押权人名称（姓名）</td>
	<td colspan='3'><%=DCDY_JBXX.getMORE() %></td>
</tr>
<tr><td align='center' colspan='4'>变更内容</td></tr>
<tr>
<td align='center' colspan='4' height='80'>
<table>
<%for(int i=0;i<bgList.size();i++ ){ 
	com.macrosoft.icms.htgl.DCDY_BGXX_SQ bg = (com.macrosoft.icms.htgl.DCDY_BGXX_SQ)bgList.get(i);
	String altconitem = bg.getALTCONITEM();
	String bgName = "";
	if("HF04067".equals(altconitem)){
		bgName="主债权的种类";
	}else if("HF04069".equals(altconitem)){
		bgName="主债权的数额";
	}else if("AF04032".equals(altconitem)){
		bgName="担保范围";
	}else if("AF040081".equals(altconitem)){
		bgName="履行债务起始时间";
	}else if("AF040082".equals(altconitem)){
		bgName="履行债务结束时间";
	}
%>
<tr>
<td width='20%'>变更内容：<%=bgName %></td>
<%if("HF04067".equals(altconitem)){ %>
<td  width='40%'>变更前：<%="01".equals(bg.getALTBE())?"购销":("02".equals(bg.getALTBE())?"借贷":"其他") %></td>
<td  width='40%'>变更后：<%="01".equals(bg.getALTAF())?"购销":("02".equals(bg.getALTAF())?"借贷":"其他") %></td>
<% }else{%>
<td  width='40%'>变更前：<%=bg.getALTBE() %></td>
<td  width='40%'>变更后：<%=bg.getALTAF() %></td>
<%} %></tr>
<%} %>
</table>
</td>
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
	<span style="font-size: 16pt"><center>动产抵押变更登记书</center></b><br><br></caption>
<tr>
	<td align='center' height=46 width="20%">动产抵押登记编号</td>
	<td width="40%"><%=AF0401.getAF04005()%></td>
	
	<td align='center' height=46 width="20%">登记日期</td>
	<td width="20%"><%=AF0401.getHF04061()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">抵押人名称（姓名）</td>
	<td colspan='3' width="40%"><%=DCDY_JBXX.getMORTGAGO()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">抵押权人名称（姓名）</td>
	<td colspan='3'><%=DCDY_JBXX.getMORE() %></td>
</tr>
<tr><td align='center' colspan='4'>变更内容</td></tr>
<tr>
<td align='center' colspan='4' height='80'>
<table>
<%for(int i=0;i<bgList.size();i++ ){ 
	com.macrosoft.icms.htgl.DCDY_BGXX_SQ bg = (com.macrosoft.icms.htgl.DCDY_BGXX_SQ)bgList.get(i);
	String altconitem = bg.getALTCONITEM();
	String bgName = "";
	if("HF04067".equals(altconitem)){
		bgName="主债权的种类";
	}else if("HF04069".equals(altconitem)){
		bgName="主债权的数额";
	}else if("AF04032".equals(altconitem)){
		bgName="担保范围";
	}else if("AF040081".equals(altconitem)){
		bgName="履行债务起始时间";
	}else if("AF040082".equals(altconitem)){
		bgName="履行债务结束时间";
	}
%>
<tr>
<td width='20%'>变更内容：<%=bgName %></td>
<%if("HF04067".equals(altconitem)){ %>
<td  width='40%'>变更前：<%="01".equals(bg.getALTBE())?"购销":("02".equals(bg.getALTBE())?"借贷":"其他") %></td>
<td  width='40%'>变更后：<%="01".equals(bg.getALTAF())?"购销":("02".equals(bg.getALTAF())?"借贷":"其他") %></td>
<% }else{%>
<td  width='40%'>变更前：<%=bg.getALTBE() %></td>
<td  width='40%'>变更后：<%=bg.getALTAF() %></td>
<%} %></tr>
<%} %>
</table>
</td>
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
<font style="font-size: 9pt;" align='' >(置备于动产抵押登记簿以供查询)</font>
</p>
<table border="1" width="90%" align="center"  bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt"><center>动产抵押变更登记书</center></b><br><br></caption>
<tr>
	<td align='center' height=46 width="20%">动产抵押登记编号</td>
	<td width="40%"><%=AF0401.getAF04005()%></td>
	
	<td align='center' height=46 width="20%">登记日期</td>
	<td width="20%"><%=AF0401.getHF04061()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">抵押人名称（姓名）</td>
	<td colspan='3' width="40%"><%=DCDY_JBXX.getMORTGAGO()%></td>
</tr>
<tr>
	<td align='center' height=46 width="20%">抵押权人名称（姓名）</td>
	<td colspan='3'><%=DCDY_JBXX.getMORE() %></td>
</tr>
<tr><td align='center' colspan='4'>变更内容</td></tr>
<tr>
<td align='center' colspan='4' height='80'>
<table>
<%for(int i=0;i<bgList.size();i++ ){ 
	com.macrosoft.icms.htgl.DCDY_BGXX_SQ bg = (com.macrosoft.icms.htgl.DCDY_BGXX_SQ)bgList.get(i);
	String altconitem = bg.getALTCONITEM();
	String bgName = "";
	if("HF04067".equals(altconitem)){
		bgName="主债权的种类";
	}else if("HF04069".equals(altconitem)){
		bgName="主债权的数额";
	}else if("AF04032".equals(altconitem)){
		bgName="担保范围";
	}else if("AF040081".equals(altconitem)){
		bgName="履行债务起始时间";
	}else if("AF040082".equals(altconitem)){
		bgName="履行债务结束时间";
	}
%>
<tr>
<td width='20%'>变更内容：<%=bgName %></td>
<%if("HF04067".equals(altconitem)){ %>
<td  width='40%'>变更前：<%="01".equals(bg.getALTBE())?"购销":("02".equals(bg.getALTBE())?"借贷":"其他") %></td>
<td  width='40%'>变更后：<%="01".equals(bg.getALTAF())?"购销":("02".equals(bg.getALTAF())?"借贷":"其他") %></td>
<% }else{%>
<td  width='40%'>变更前：<%=bg.getALTBE() %></td>
<td  width='40%'>变更后：<%=bg.getALTAF() %></td>
<%} %>
</tr>
<%} %>
</table>
</td>
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
</body></html> --%>