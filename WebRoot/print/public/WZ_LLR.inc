<%
 String llrname="",llrbm="",llrtel="",llrmobtel="",llremail="",llraddr="",llrpos=""; 
 ArrayList wzllr=QYDJ_WZLLR.getList(" where OPENO='"+OPENO+"'");
 if(wzllr.size()>0){
 com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ wzllrTable = (com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ)wzllr.get(0);
 llrname=wzllrTable.getNAME();
 llrbm=wzllrTable.getDEPARTMENT();
 llrtel=wzllrTable.getTEL();
 llrmobtel=wzllrTable.getMOBTEL();
 llremail=wzllrTable.getEMAIL();
 llraddr=wzllrTable.getADDR();
 llrpos=wzllrTable.getPOSTALCODE();
 }
%>
<br>
<span style="font-size: 16pt"><p align="center">�������ֹ�˾���̵Ǽ�����Ա��Ϣ</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"><%=llrname %></td>
    <td width="60%" rowspan="7" align="center">����֤����ӡ��ճ����</td>
  </tr>
  <tr>
    <td width="20%" align="center">��  ��</td>
    <td align="center" height="45" width="20%"><%=llrbm %></td>
  </tr>
  <tr>
    <td width="20%" align="center" rowspan="2">��ϵ�绰</td>
    <td align="left" height="45" width="20%">�̶���<%=llrtel %></td>
  </tr>
  <tr>
    <td align="left" height="45" width="20%">�ƶ���<%=llrmobtel %></td>
  </tr>
  <tr>
    <td width="20%" align="center">��������</td>
    <td align="center" height="45" width="20%"><%=llremail %></td>
  </tr>
  <tr>
    <td width="20%" align="center">��ϵ��ַ</td>
    <td align="center" height="45" width="20%"><%=llraddr %></td>
  </tr>
  <tr>
    <td width="20%" align="center">��������</td>
    <td align="center" height="45" width="20%"><%=llrpos %></td>
  </tr>
</table>