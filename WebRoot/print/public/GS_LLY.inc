<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">����Ա��Ϣ</b><br><br></caption>	
<%
  QYDJ_WZLLR.setOPENO(OPENO);
  QYDJ_WZLLR.doSelect();
%>	
<tr >
	<td align="center" width="20%"  height=50>��    ��</td>
	<td width="30%"><%=QYDJ_WZLLR.getNAME()%></td>
	<td align="center" width="20%">�̶��绰</td>
	<td width="30%"><%=QYDJ_WZLLR.getTEL()%></td></tr>
<tr >
	<td align="center" width="20%"  height=50>�ƶ��绰</td>
	<td width="30%"><%=QYDJ_WZLLR.getMOBTEL()%></td>
	<td align="center" width="20%">��������</td>
	<td width="30%"><%=QYDJ_WZLLR.getEMAIL()%></td></tr>	
<tr>
	<td align="center"  height=50>����֤������</td>
	<td ><%=icms.getSysDm("CERTYPE",QYDJ_WZLLR.getCERTYPE())%></td>

    <td align="center"  height=50>����֤������</td>
	<td ><%=QYDJ_WZLLR.getCERNO()%></td></tr>
<tr>
<td colspan="4" align="center">
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
������֤����ӡ��ճ������
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</td>
</tr>	
</table><br/>
<table align="center" border="0" width="80%" bordercolor='#000000'>
<tr><td>
ע������Ա��Ҫ������ҵ��Ǽǻ��ص���ϵ��ͨ���Ա��˸�����Ϣ��¼��ҵ������Ϣ��ʾϵͳ��������ṫʾ����ҵ�й���Ϣ�ȡ�����ԱӦ�˽�Ǽ���ط������ҵ��Ϣ��ʾ�йع涨����Ϥ������ҵ������Ϣ��ʾϵͳ��
</td></tr></table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>