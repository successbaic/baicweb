<table align="center" border="1" width="90%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">农民专业合作社成员出资清单</b><br></caption>	
<tr>    
	<td width='15%' align='center'>序号</td>
	<td width='25%' align="center">出资成员<br>姓名或名称</td>
	<td width='20%' align="center">出资方式</td>
	<td width='15%' align="center">出资额<br>（元）</td>
	<td width='25%' align="center">出资成员<br>签名或盖章</td>
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
  <td align="center"><%=bTable.getINV()%></td><!--出资成员名称或姓名-->
  <td align="center"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td><!--出资方式--> 
  <td align="center"><%=bTable.getSUBCONAM()%></td><!--出资额-->  
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
&nbsp;&nbsp;&nbsp;&nbsp;成员出资总额:<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getREGCAP()),"center",30)%>(元)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
       </td>
    </tr>
    <tr>
       <td>
         <p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="right">
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br></p>         
       </td>
    </tr>			
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>