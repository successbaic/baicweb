<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">ũ��רҵ�������Ա����</b><br><br></caption>	
<tr>    
	<td height="40" width='7%' align='center'>���</td>
	<td width='18%' align="center">��Ա����<br>������</td>
	<td width='27%' align="center">֤�����Ƽ�����</td>
	<td width='31%' align="center">ס��</td>
	<td width='17%' align="center">��Ա����</td>
</tr>	
<%
 int Num=0;
 for (int i=0;i<temp;i++){
 com.macrosoft.icms.qydj.QYDJ_CZXX_SQ cTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)rsdwtz.get(i);

  Num=Num+1;
%>
  <tr>
  <td height="40" align="center"><%=i+1 %></td>  
  <td align="center"><%=cTable.getINV()%></td><!--��Ա���ƻ�����-->
<%if(cTable.getINVTYPE().equals("1")||cTable.getINVTYPE().equals("2"))
  {%>
  <td align="center"><%=icms.getSysDm("CERTYPE",cTable.getCERTYPE())%><br>&nbsp;&nbsp;<%=cTable.getCERNO() %></td>
<%}else{ %>
  <td align="center"><%=icms.getSysDm("BLICTYPE",cTable.getBLICTYPE())%><br>&nbsp;&nbsp;<%=cTable.getBLICNO()%></td>
<%} %>
  <td align="center"><%=cTable.getDOM()%></td><!--ס��-->  
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
   <p style="line-height: 25px">��Ա������<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getMEMNUM()),"left",30)%>&nbsp;&nbsp;(��)<br>
&nbsp;&nbsp;&nbsp;&nbsp;���У�ũ���Ա��<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getPEAMEMNUM()),"left",25)%>(��)��ռ������<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getPEAMEMRATE()),"left",10)%>%<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ҵ����ҵ��λ����������Ա��<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getGROMEMNUM()),"left",5)%>(��)��ռ������<%=SysSystem.toUnderlineStr(String.valueOf(QYDJ_JBXX.getGROMEMRATE()),"left",10)%>%</p>
   </td>
</tr>	
</table>
<br>
<table align="center" border="0" width="90%" >
    <tr>
        <td>
         <p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;��ũ��רҵ������ĳ�Ա���ϡ�ũ��רҵ������Ǽǹ�����������ʮ��������ʮ�����Ĺ涨�����Դ˳�ŵ����ʵ�Գе����Ρ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br><br>
       </td>
    </tr>
    <tr>
       <td>
         <p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;����������ǩ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<p align="right">��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>         
       </td>
    </tr>			
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>