<table align="center" border="1" width="80%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">��֧������Ϣ</b><br><br></caption>	
	<tr>
	<td align="center" height=40>��֧��������</td>   	 	 
	<td align="center" height=40>����</td>	     
	<td align="center" height=40>�Ǽǻ���</td>	 	 
	<td align="center" height=40>�Ǽ�����</td>	     
	<td align="center" height=40>�Ǽ�����</td>	
   </tr>
<%
 int fzjgNo=0;
 for (int i=1;i<fzjgList.size();i++){
com.macrosoft.icms.qydj.QYDJ_FZJG_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(i);
 fzjgNo=fzjgNo+1;
 String REGULATION=bTable.getREGULATION();
 if(REGULATION.equals("0")){REGULATION="����";}
 if(REGULATION.equals("1")){REGULATION="ע��";}
 if(REGULATION.equals("2")){REGULATION="���Ʊ��";}
%>      
   <tr>
   <td height=40 align="center"><%=bTable.getBRNAME()%></td>
   <td align="center"><%if("0".equals(bTable.getREGNO())){out.print("����");}else{out.print("�Ƿ���");} %></td>
   <td align="center"><%=bTable.getREGORG()%></td>
   <td align="center"><%=bTable.getREGDATE()%></td>
   <td align="center"><%=REGULATION%></td>
   </tr>
<%   
	 }
 while (fzjgNo<=18) 
 {
	out.print("<tr><td height='40'></td><td></td><td></td><td></td><td></td></tr>");
	fzjgNo++;
 }
%>	
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>