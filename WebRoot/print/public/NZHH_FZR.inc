<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">ִ������ϻ��ˣ���ί�ɴ�������Ϣ</b><br><br></caption>	
<%
QYDJ_RYXX.setOPENO(OPENO);
QYDJ_RYXX.getDataByFr();
%>	
<tr >
	<td align="center" width="20%"  height=50>��    ��</td>
	<td colspan="3"><%=QYDJ_RYXX.getNAME()%></td>
</tr>
<tr>	
	<td align="center" width="20%" height=50>�̶��绰</td>
	<td width="30%"><%=QYDJ_RYXX.getTEL()%></td>
	<td align="center" width="20%"  height=50>�ƶ��绰</td>
	<td width="30%"><%=QYDJ_RYXX.getMOBTEL()%></td>
</tr>
<tr><td align="center" width="20%" height=50>��������</td>
	<td width="30%" colspan="3"><%=QYDJ_RYXX.getEMAIL()%></td></tr>	
<tr>
	<td align="center"  height=50>����֤������</td>
	<td colspan="3"><%=icms.getSysDm("CERTYPE",QYDJ_RYXX.getCERTYPE())%></td>
</tr>
<tr>
    <td align="center"  height=50>����֤������</td>
	<td colspan="3"><%=QYDJ_RYXX.getCERNO()%></td></tr>
	
<TR><TD COLSPAN=4 align="center" height="400px"><br/><br/><br/><br/><br/><br/>
(����֤����ӡ��ճ����)<br/><br/><br/><br/><br/><br/><br/>
</TD></TR>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>