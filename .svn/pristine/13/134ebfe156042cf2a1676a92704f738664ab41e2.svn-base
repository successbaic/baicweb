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
<span style="font-size: 16pt"><p align="center">拟设立分公司工商登记联络员信息</p></span>
<table align="center" border="1" width="80%" bordercolor='#000000'>
  <tr>
    <td width="20%" align="center">姓  名</td>
    <td align="center" height="45" width="20%"><%=llrname %></td>
    <td width="60%" rowspan="7" align="center">身份证明复印件粘贴处</td>
  </tr>
  <tr>
    <td width="20%" align="center">部  门</td>
    <td align="center" height="45" width="20%"><%=llrbm %></td>
  </tr>
  <tr>
    <td width="20%" align="center" rowspan="2">联系电话</td>
    <td align="left" height="45" width="20%">固定：<%=llrtel %></td>
  </tr>
  <tr>
    <td align="left" height="45" width="20%">移动：<%=llrmobtel %></td>
  </tr>
  <tr>
    <td width="20%" align="center">电子邮箱</td>
    <td align="center" height="45" width="20%"><%=llremail %></td>
  </tr>
  <tr>
    <td width="20%" align="center">联系地址</td>
    <td align="center" height="45" width="20%"><%=llraddr %></td>
  </tr>
  <tr>
    <td width="20%" align="center">邮政编码</td>
    <td align="center" height="45" width="20%"><%=llrpos %></td>
  </tr>
</table>