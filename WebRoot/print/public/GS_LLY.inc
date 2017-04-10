<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">联络员信息</b><br><br></caption>	
<%
  QYDJ_WZLLR.setOPENO(OPENO);
  QYDJ_WZLLR.doSelect();
%>	
<tr >
	<td align="center" width="20%"  height=50>姓    名</td>
	<td width="30%"><%=QYDJ_WZLLR.getNAME()%></td>
	<td align="center" width="20%">固定电话</td>
	<td width="30%"><%=QYDJ_WZLLR.getTEL()%></td></tr>
<tr >
	<td align="center" width="20%"  height=50>移动电话</td>
	<td width="30%"><%=QYDJ_WZLLR.getMOBTEL()%></td>
	<td align="center" width="20%">电子邮箱</td>
	<td width="30%"><%=QYDJ_WZLLR.getEMAIL()%></td></tr>	
<tr>
	<td align="center"  height=50>身份证件类型</td>
	<td ><%=icms.getSysDm("CERTYPE",QYDJ_WZLLR.getCERTYPE())%></td>

    <td align="center"  height=50>身份证件号码</td>
	<td ><%=QYDJ_WZLLR.getCERNO()%></td></tr>
<tr>
<td colspan="4" align="center">
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
（身份证件复印件粘贴处）
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</td>
</tr>	
</table><br/>
<table align="center" border="0" width="80%" bordercolor='#000000'>
<tr><td>
注：联络员主要负责本企业与登记机关的联系沟通，以本人个人信息登录企业信用信息公示系统依法向社会公示本企业有关信息等。联络员应了解登记相关法规和企业信息公示有关规定，熟悉操作企业信用信息公示系统。
</td></tr></table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>