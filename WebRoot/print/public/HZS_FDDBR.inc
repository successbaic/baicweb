<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">������������Ϣ</b><br><br></caption>	
<%
QYDJ_RYXX.setOPENO(OPENO);
QYDJ_RYXX.getDataByFr();
%>	
<tr >
	<td align="center" width="20%"  height=50>��    ��</td>
	<td width="30%"><%=QYDJ_RYXX.getNAME()%></td>
	<td align="center" width="20%">�̶��绰</td>
	<td width="30%"><%=QYDJ_RYXX.getTEL()%></td></tr>
<tr >
	<td align="center" width="20%"  height=50>�ƶ��绰</td>
	<td width="30%"><%=QYDJ_RYXX.getMOBTEL()%></td>
	<td align="center" width="20%">��������</td>
	<td width="30%"><%=QYDJ_RYXX.getEMAIL()%></td></tr>	
<tr>
	<td align="center"  height=50>����֤������</td>
	<td ><%=icms.getSysDm("CERTYPE",QYDJ_RYXX.getCERTYPE())%></td>

    <td align="center"  height=50>����֤������</td>
	<td ><%=QYDJ_RYXX.getCERNO()%></td></tr>
	
<TR><TD COLSPAN=4 align="center" height=350>(����֤����ӡ��ճ����)</TD></TR>
</table>
<P><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
���л����񹲺͹�ũ��רҵ�����編������ʮ���涨����ũ��רҵ����������³������¡��������ü���ҵ��������ͬ������ũ��רҵ����������³������¡����¡�������������ʮһ���涨����ִ����ũ��רҵ������ҵ���йصĹ������Ա�����õ���ũ��רҵ����������³������¡����¡��������߲�������Ա����
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;���˷��ϡ��л����񹲺͹�ũ��רҵ�����編������ʮ��������ʮһ���Ĺ涨�����Դ˳�ŵ����ʵ�Գе����Ρ�
<br/><br/><br/>
����������ǩ����
<br/><br/>
<br/>
<font style="float:right">
  ��     ��     ��
&nbsp;&nbsp;&nbsp;&nbsp;
</font>
</P>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>