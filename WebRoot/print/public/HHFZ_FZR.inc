<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">��������Ϣ</b><br><br></caption>		
<tr >
	<td align="center" width="20%"  height=50>��    ��</td>
	<td colspan="3"><%=QYDJ_RYXX.getNAME()%></td>
</tr>
<tr>	
	<td align="center" width="20%"  height=50>�̶��绰</td>
	<td width="20%"><%=QYDJ_RYXX.getTEL()%></td>
	<td align="center" width="20%"  height=50>�ƶ��绰</td>
	<td width="20%"><%=QYDJ_RYXX.getMOBTEL()%></td>
</tr>
<tr>
	<td align="center" width="20%" height=50>��������</td>
	<td colspan="3"><%=QYDJ_RYXX.getEMAIL()%></td>
</tr>
<tr>	
	<td align="center" width="20%"  height=50>����ǰְҵ״��</td>
	<td colspan="3"><%=QYDJ_RYXX.getOCCSTBEAPP()%></td>
</tr>	
<tr>
	<td align="center"  height=50>����֤������</td>
	<td colspan="3"><%=icms.getSysDm("CERTYPE",QYDJ_RYXX.getCERTYPE())%></td>
</tr>	
<tr>	
    <td align="center"  height=50>����֤������</td>
	<td colspan="3"><%=QYDJ_RYXX.getCERNO()%></td>
</tr>
	
<TR><TD COLSPAN=4 align="center" height="370px"><br/><br/><br/><br/><br/><br/>
(����֤����ӡ��ճ����)<br/><br/><br/><br/><br/><br/><br/>
</TD></TR>

<TR><TD COLSPAN=4 align="center" height=140>
<font  style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ǩ�֣�<u>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class='NOPRINT'  style='color:#CCCCCC'>&nbsp;&nbsp;<%=QYDJ_RYXX.getNAME()%>&nbsp;&nbsp;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</u></font>
<font  style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
</TD></TR>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>