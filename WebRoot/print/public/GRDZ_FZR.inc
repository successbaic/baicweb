<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">Ͷ������Ϣ</b><br><br></caption>	
<%
QYDJ_RYXX.setOPENO(OPENO);
QYDJ_RYXX.getDataByFr();
%>	
<tr >
	<td align="center" width="20%"  height=50>��    ��</td>
	<td><%=QYDJ_RYXX.getNAME()%></td>
	<td align="center" width="20%"  height=50>��    ��</td>
	<td><%=icms.getSysDm("SEX",QYDJ_RYXX.getSEX())%></td>
</tr>

<tr >
	<td align="center" width="20%"  height=50>��������</td>
	<td><%=QYDJ_RYXX.getNATDATE()%></td>
	<td align="center" width="20%"  height=50>��  ��</td>
	<td><%=icms.getSysDm("NATION",QYDJ_RYXX.getNATION())%></td>
</tr>

<tr >
	<td align="center" width="20%"  height=50>�Ļ��̶�</td>
	<td><%=icms.getSysDm("LITEDEG",QYDJ_RYXX.getLITEDEG())%></td>
	<td align="center" width="20%"  height=50>������ò</td>
	<td><%=icms.getSysDm("POLSTAND",QYDJ_RYXX.getPOLSTAND())%></td>
</tr>

<tr>	
	<td align="center" width="20%"  height=50>�ƶ��绰</td>
	<td width="20%"><%=QYDJ_RYXX.getMOBTEL()%></td>
	<td align="center" width="20%" height=50>��������</td>
	<td width="20%"><%=QYDJ_RYXX.getEMAIL()%></td>
</tr>	
<tr>
	<td align="center"  height=50>����֤������</td>
	<td><%=icms.getSysDm("CERTYPE",QYDJ_RYXX.getCERTYPE())%></td>
    <td align="center"  height=50>����֤������</td>
	<td><%=QYDJ_RYXX.getCERNO()%></td>
</tr>

<tr>	
	<td align="center" width="20%"  height=50>�ӡ�  ��</td>
	<td><%=QYDJ_RYXX.getHOUSEADD()%></td>
	<td align="center" width="20%" height=50>��������</td>
	<td><%=QYDJ_RYXX.getPOSTALCODE()%></td>
</tr>	

<tr>	
	<td align="center" width="20%"  height=50>����ǰְҵ״��</td>
	<td colspan="3"><%=QYDJ_RYXX.getOCCSTBEAPP()%></td>
</tr>	
	
<TR><TD COLSPAN=4 align="center" height="400px"><br/><br/><br/><br/><br/><br/>
(����֤����ӡ��ճ����)<br/><br/><br/><br/><br/><br/><br/>
</TD></TR>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>