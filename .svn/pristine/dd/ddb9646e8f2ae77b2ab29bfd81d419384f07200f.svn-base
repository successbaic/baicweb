<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">董事、监事、经理（联合管理委员会成员）情况表</b><br>
</caption>	
 <tr>
		  <td height="30" align="center">姓 名</td>
		  
		  <td height="30"align="center">职 务</td>  

		   <td height="30" align="center">国别<br>(地区)</td>  

		   <td align="center" height="30">身份证件类型</td>
		 
		  <td height="30" align="center">身份证件号码</td>
		  
</tr>
<%
 ArrayList rstz=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int rytemp = rstz.size();
 int ryNum=0;
 for (int i=0;i<rytemp;i++){
 ryNum++;
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)rstz.get(i);
%>  

<tr>
<td align="center" height="40"><%=bTable.getNAME()%></td>
<td align="center"><%=icms.getSysDm("POSITION",bTable.getPOSITION())%></td>
<td align="center"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
<td align="center"><%=icms.getSysDm("CERTYPE",bTable.getCERTYPE())%></td>
<td align="center"><%=bTable.getCERNO()%></td>
</tr>
<% 
 if (ryNum!=0&&ryNum%15==0){ 
  out.print("</table><br><p class='PageNext'><br><table align='center' border='1' width='100%' bordercolor='#000000'>");
 }
 }
 if (15-ryNum>0){ 
 for(int i=0;i<15-ryNum;i++){
  out.print("<tr><td height='40'></td><td></td><td></td><td></td><td></td></tr>");
  }
 }
%>	
</table>
<br>
<p>注：此表不够填写的，可复印空表填写。 </p>
<br>

<p class="PageNext"><br></p>
<!--########### -->
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">         
<caption align="center"><b>
	<span style="font-size: 16pt">董事、监事、经理（联合管理委员会成员）证件复印件粘贴处</span>
</b><br></caption>
<%
 int Nu=0;
String sflx="";
 for (int i=0;i<rytemp;i++){
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)rstz.get(i);
if(((String)icms.getSysDm("CERTYPE",bTable.getCERTYPE())).startsWith("中华人民共和国")){
sflx=((String)icms.getSysDm("CERTYPE",bTable.getCERTYPE())).substring(7);
}
 Nu=Nu+1;
%>
 <tr><td align='center' colspan=3 >
   <table align="center" border="0" width="100%" bordercolor='#000000'>
		<tr>  
			<td height="20" nowrap="nowrap">姓名:<%=SysSystem.toUnderlineStr((String)bTable.getNAME(),"center",5)%></td>
			<td nowrap="nowrap">职务:<%=SysSystem.toUnderlineStr((String)icms.getSysDm("POSITION",bTable.getPOSITION()),"center",8)%></td>  
			<td nowrap="nowrap">身份证件类型:<%=SysSystem.toUnderlineStr(sflx,"center",8)%></td>  
			<td nowrap="nowrap">身份证件号码:<%=SysSystem.toUnderlineStr((String)bTable.getCERNO(),"center",18)%></td>  
		</tr>
		<tr>
	      <td align='center' colspan=4 height=270>(身份证件复印件粘贴处)</td>
	  </tr>
   </table>
 </td></tr>
<% 
 if (Nu!=0&&Nu%3==0){ 
  out.print("</table><br><p class='PageNext'><br><table align='center' border='1' width='90%' bordercolor='#000000'>");
 }
 }
	 if(Nu>0 && Nu<3){
	   for (int j=0; j<3-Nu;j++){
%>
  <tr><td align='center' colspan=3 >
    <table align="center" border="0" width="100%" bordercolor='#000000'>
        <tr>  
		  <td height="30" nowrap="nowrap">姓名:<%=SysSystem.toUnderlineStr("","left",5)%></td>
		  <td nowrap="nowrap">职务:<%=SysSystem.toUnderlineStr("","left",8)%></td>  
		  <td nowrap="nowrap">身份证件类型:<%=SysSystem.toUnderlineStr("","left",15)%></td>  
		  <td nowrap="nowrap">身份证件号码:<%=SysSystem.toUnderlineStr("","left",18)%></td>  
	    </tr>
	    <tr>
	      <td align='center' colspan=4 height=270>(身份证件复印件粘贴处)</td>
	    </tr>
    </table>
 </td></tr>
<%   
	   }
	 }
 if (Nu==0) out.print("<tr><td colspan=3 align='center'>无此项内容</td></tr>");
%>	
</table>