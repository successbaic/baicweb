<table align="center" border="1" width="80%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">分支机构信息</b><br><br></caption>	
	<tr>
	<td align="center" height=40>分支机构名称</td>   	 	 
	<td align="center" height=40>性质</td>	     
	<td align="center" height=40>登记机关</td>	 	 
	<td align="center" height=40>登记日期</td>	     
	<td align="center" height=40>登记类型</td>	
   </tr>
<%
 int fzjgNo=0;
 for (int i=1;i<fzjgList.size();i++){
com.macrosoft.icms.qydj.QYDJ_FZJG_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_FZJG_SQ)fzjgList.get(i);
 fzjgNo=fzjgNo+1;
 String REGULATION=bTable.getREGULATION();
 if(REGULATION.equals("0")){REGULATION="新设";}
 if(REGULATION.equals("1")){REGULATION="注销";}
 if(REGULATION.equals("2")){REGULATION="名称变更";}
%>      
   <tr>
   <td height=40 align="center"><%=bTable.getBRNAME()%></td>
   <td align="center"><%if("0".equals(bTable.getREGNO())){out.print("法人");}else{out.print("非法人");} %></td>
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
