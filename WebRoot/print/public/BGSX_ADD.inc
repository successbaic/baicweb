<table align="center" border="1" width="80%" bordercolor='#000000'>
	<caption><p align="center"><b>
		<span style="font-size: 16pt">���������Ϣ</b><br><br>
	</caption>	
			<tr>
				<td align="center" height=30 width="20%" >�����Ŀ</td>
				<td align="center" width="40%">ԭ�Ǽ�����</td>
				<td align="center" width="40%">��������</td>
			</tr>

				<% 
				for(int i=4;i<bgsxList.size();i++){
				List temp = (List)bgsxList.get(i);
				%>
				<tr>
					<td height='30' align="center" ><%=temp.get(0) %></td>
					<td align="center" ><%=temp.get(1) %></td>
					<td align="center" ><%=temp.get(2) %></td>
				</tr>
 
<% 
 }

 for(int i=bgsxList.size();i<15;i++)
 {
	out.print("<tr><td height='30'></td><td></td><td></td></tr>");
 }
%>	
</table>
<br>