
<%
	ArrayList wjsdlist=QYDJ_WZWJSD.getList(" WHERE OPENO='"+OPENO+"'");
	com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ wjsd = new com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ();
    if(wjsdlist.size()>0){
       wjsd=(com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ)wjsdlist.get(0); 
        }
 %>
<span style="font-size: 16pt"><p align="center"><b>����Ͷ����ҵ�����ļ��ʹ�<br/>��Ȩί����
</b></p></span>
<table width="82%"  align="center" border="0" >
<tr>
<td colspan="4">
<br>
<p align="left">��Ȩ�ˣ�<%=SysSystem.toUnderlineStr("","center",50)%></p>
<p align="left">����Ȩ�ˣ�<%=SysSystem.toUnderlineStr(wjsd.getNAME(),"center",50)%></p>
<p align="left">��Ȩ��Χ������<%=SysSystem.toUnderlineStr(wjsd.getNAME(),"center",40)%>������Ȩ�����ƻ�����������</p>
<p align="left"><%=SysSystem.toUnderlineStr("","center",40)%>����Ȩ�����ƻ����������й����ڽ�����ҵ�Ǽǻ��ط����ļ�</p>
<p align="left">�ʹֱ�������ȨΪֹ��</p>
<br/>
</td>
</tr>
</table>
<table width="82%"  align="center" border="1" bordercolor='#000000'>
<tr>
<td align="center" style="width:15%" height="30">����Ȩ�˵�ַ</td>
<td align="center" style="width:35%"><%=wjsd.getADDR() %></td>
<td align="center" style="width:15%" height="30">��������</td>
<td align="center" style="width:35%"><%=wjsd.getPOSTALCODE() %></td>
</tr>

<tr>
<td align="center" height="30">����Ȩ����ϵ��</td>
<td align="center"><%=wjsd.getLINKMAN() %></td>
<td align="center" height="30">�����ʼ�</td>
<td align="center"><%=wjsd.getEMAIL() %></td>
</tr>
<tr>
<td rowspan="2" align="center" height="30">����Ȩ����ϵ��<br>��ϵ�绰</td>
<td colspan="3" height="30">�̶���<%=wjsd.getTEL() %></td>
</tr>
<tr>
<td colspan="3" height="30">�ƶ���<%=wjsd.getMOBTEL() %></td>
</tr>
</table>
<table width="82%"  align="center" border="0" >
<tr>
<td colspan="4">
<br>
<br>
<p align="center">��Ȩ��ǩ�ֻ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����Ȩ��ǩ�ֻ����</p><br><br>
</td>
</tr>
<tr>
<td colspan="4">
<p align="right" syle="line-heigth:10px">��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</p><br>
</td>
</tr>
<tr>
<td colspan="4" align="left">
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;ע��������Ͷ����ҵ�����ļ��ʹ���Ȩί���顷�����Ͷ���ߣ���Ȩ�ˣ��뾳�ڷ�����<br/>
���ʹ�����ˣ�����Ȩ�ˣ�ǩ�𡣱���Ȩ�˿��������Ͷ���������ķ�֧��������������<br/>
��˾������Ȩ��Ϊ�������Ĺ�˾�ģ���˾������ί����Ч���������������йص�λ���<br/>
�ˡ�����Ȩ�ˡ�����Ȩ�˵�ַ�����������ģ�Ӧ��ǩ���µġ�����Ͷ����ҵ�����ļ�<br/>
�ʹ���Ȩί���顷��ʱ����ҵ�Ǽǻ��ر�����
</td>
</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>