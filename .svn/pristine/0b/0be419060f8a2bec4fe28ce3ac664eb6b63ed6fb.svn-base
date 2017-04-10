<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">执行事务合伙人（含委派代表）信息</b><br><br></caption>	
<%
QYDJ_RYXX.setOPENO(OPENO);
QYDJ_RYXX.getDataByFr();
%>	
<tr >
	<td align="center" width="20%"  height=50>姓    名</td>
	<td colspan="3"><%=QYDJ_RYXX.getNAME()%></td>
</tr>
<tr>	
	<td align="center" width="20%" height=50>固定电话</td>
	<td width="30%"><%=QYDJ_RYXX.getTEL()%></td>
	<td align="center" width="20%"  height=50>移动电话</td>
	<td width="30%"><%=QYDJ_RYXX.getMOBTEL()%></td>
</tr>
<tr><td align="center" width="20%" height=50>电子邮箱</td>
	<td width="30%" colspan="3"><%=QYDJ_RYXX.getEMAIL()%></td></tr>	
<tr>
	<td align="center"  height=50>身份证件类型</td>
	<td colspan="3"><%=icms.getSysDm("CERTYPE",QYDJ_RYXX.getCERTYPE())%></td>
</tr>
<tr>
    <td align="center"  height=50>身份证件号码</td>
	<td colspan="3"><%=QYDJ_RYXX.getCERNO()%></td></tr>
	
<TR><TD COLSPAN=4 align="center" height="400px"><br/><br/><br/><br/><br/><br/>
(身份证件复印件粘贴处)<br/><br/><br/><br/><br/><br/><br/>
</TD></TR>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>