<table align="center" border="1" width="90%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">ũ��רҵ�������Ա�����嵥</b><br></caption>	
<tr>    
	<td width='15%' align='center'>���</td>
	<td width='25%' align="center">���ʳ�Ա<br>����������</td>
	<td width='20%' align="center">���ʷ�ʽ</td>
	<td width='15%' align="center">���ʶ�<br>��Ԫ��</td>
	<td width='25%' align="center">���ʳ�Ա<br>ǩ�������</td>
</tr>	
<%
 int No=0;
 ArrayList rsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int temp = rsdwtz.size();
 for (int i=0;i<temp;i++){
 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)rsdwtz.get(i);
  No=No+1;
%>
  <tr>
  <td height="40" align="center"><%=i+1 %></td>  
  <td align="center"><%=bTable.getINV()%></td><!--���ʳ�Ա���ƻ�����-->
  <td align="center"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td><!--���ʷ�ʽ--> 
  <td align="center"><%=bTable.getSUBCONAM()%></td><!--���ʶ�-->  
  <td align="center"></td>    
 </tr>
<% 
 }

 while (No<=15) 
 {
	out.print("<tr><td height='40'></td><td></td><td></td><td></td><td></td></tr>");
	No++;
 }
%>	
</table>
<br>
<table align="center" border="0" width="90%" >
    <tr>
        <td>
         <p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;��Ա�����ܶ�:<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getREGCAP()),"center",30)%>(Ԫ)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
       </td>
    </tr>
    <tr>
       <td>
         <p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;����������ǩ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="right">
��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br></p>         
       </td>
    </tr>			
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>