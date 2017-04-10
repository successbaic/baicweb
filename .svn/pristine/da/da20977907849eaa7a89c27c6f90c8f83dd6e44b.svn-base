<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">农民专业合作社成员名册</b><br><br></caption>	
<tr>    
	<td height="40" width='7%' align='center'>序号</td>
	<td width='18%' align="center">成员姓名<br>或名称</td>
	<td width='27%' align="center">证件名称及号码</td>
	<td width='31%' align="center">住所</td>
	<td width='17%' align="center">成员类型</td>
</tr>	
<%
 int Num=0;
 for (int i=0;i<temp;i++){
 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ cTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)rsdwtz.get(i);

  Num=Num+1;
%>
  <tr>
  <td height="40" align="center"><%=i+1 %></td>  
  <td align="center"><%=cTable.getINV()%></td><!--成员名称或姓名-->
<%if(cTable.getINVTYPE().equals("1")||cTable.getINVTYPE().equals("2"))
  {%>
  <td align="center"><%=icms.getSysDm("CERTYPE",cTable.getCERTYPE())%><br>&nbsp;&nbsp;<%=cTable.getCERNO() %></td>
<%}else{ %>
  <td align="center"><%=icms.getSysDm("BLICTYPE",cTable.getBLICTYPE())%><br>&nbsp;&nbsp;<%=cTable.getBLICNO()%></td>
<%} %>
  <td align="center"><%=cTable.getDOM()%></td><!--住所-->  
  <td align="center"><%=icms.getSysDm("MEMTYPE",cTable.getINVTYPE())%></td>    
 </tr>
<% 
 }

 while (Num<12) 
 {
	out.print("<tr><td height='40'></td><td></td><td></td><td></td><td></td></tr>");
	Num++;
 }
%>
<tr>
   <td colspan="5">
   <p style="line-height: 25px">成员总数：<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getMEMNUM()),"left",30)%>&nbsp;&nbsp;(名)<br>
&nbsp;&nbsp;&nbsp;&nbsp;其中：农民成员：<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getPEAMEMNUM()),"left",25)%>(名)所占比例：<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getPEAMEMRATE()),"left",10)%>%<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业、事业单位或社会团体成员：<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getGROMEMNUM()),"left",5)%>(名)所占比例：<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getGROMEMRATE()),"left",10)%>%</p>
   </td>
</tr>	
</table>
<br>
<table align="center" border="0" width="90%" >
    <tr>
        <td>
         <p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;本农民专业合作社的成员符合《农民专业合作社登记管理条例》第十三条、第十四条的规定，并对此承诺的真实性承担责任。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br><br>
       </td>
    </tr>
    <tr>
       <td>
         <p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="right">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>         
       </td>
    </tr>			
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>