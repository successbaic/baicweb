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
<TR><TD COLSPAN=4 align="center" height=200>
<font  style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������ǩ�֣�<u>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class='NOPRINT'  style='color:#CCCCCC'>&nbsp;&nbsp;<%=QYDJ_RYXX.getNAME()%>&nbsp;&nbsp;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</u></font>
<font  style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
</TD></TR>
<!--<TR><TD COLSPAN=4 align="center" height=250>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;���Ϸ�����������Ϣ��ʵ��Ч������֤����ԭ��һ�£����ϡ���˾����������ҵ���˷��������˵Ǽǹ����涨�����ڷ�����������ְ�ʸ���йع涨�����˶���ʵ�Գе����Ρ�<br><br><br></p>
<p align="right">�����»���ǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br></p>
<p align="left" style="font-size:13px">
&nbsp;&nbsp;&nbsp;&nbsp;ע�����ա���˾��������˾�³̵Ĺ涨���򣬳����ˡ��ɶ���ȷ�����������˵ģ��ɶ���֮һ���ϳ����ˡ��ɶ�ǩ�𣻶��»�ȷ�����������˵ģ��ɶ���֮һ���϶���ǩ��
</p>
</TD></TR>-->
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>