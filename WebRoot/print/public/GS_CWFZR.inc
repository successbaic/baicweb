<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">财务负责人信息</b><br><br></caption>	
<%
  QYDJ_CWFZR.setOPENO(OPENO);
  QYDJ_CWFZR.doSelect();
%>	
<tr >
	<td align="center" width="20%"  height=50>姓    名</td>
	<td width="30%"><%=QYDJ_CWFZR.getNAME()%></td>
	<td align="center" width="20%">固定电话</td>
	<td width="30%"><%=QYDJ_CWFZR.getTEL()%></td></tr>
<tr >
	<td align="center" width="20%"  height=50>移动电话</td>
	<td width="30%"><%=QYDJ_CWFZR.getMOBTEL()%></td>
	<td align="center" width="20%">电子邮箱</td>
	<td width="30%"><%=QYDJ_CWFZR.getEMAIL()%></td></tr>	
<tr>
	<td align="center"  height=50>身份证件类型</td>
	<td ><%=icms.getSysDm("CERTYPE",QYDJ_CWFZR.getCERTYPE())%></td>

    <td align="center"  height=50>身份证件号码</td>
	<td ><%=QYDJ_CWFZR.getCERNO()%></td></tr>
<tr>
<td colspan="4" align="center">
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
（身份证件复印件粘贴处）
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</td>
</tr>	
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>