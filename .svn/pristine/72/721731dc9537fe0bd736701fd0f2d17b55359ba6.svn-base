<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">负责人信息</b><br><br></caption>	
<%
QYDJ_RYXX.setOPENO(OPENO);
QYDJ_RYXX.getDataByFr();
%>	
<tr >
	<td align="center" width="20%"  height=50>姓    名</td>
	<td width="30%"><%=QYDJ_RYXX.getNAME()%></td>
	<td align="center" width="20%"  height=50>国别（地区）</td>
	<td width="30%"><%=icms.getSysDm("COUNTRY",QYDJ_RYXX.getCOUNTRY())%></td>
</tr>	
<tr >
	<td align="center" width="20%">固定电话</td>
	<td width="30%"><%=QYDJ_RYXX.getTEL()%></td>
	<td align="center" width="20%"  height=50>移动电话</td>
	<td width="30%"><%=QYDJ_RYXX.getMOBTEL()%></td>
</tr>
<tr>	
	<td align="center" width="20%" height=50>电子邮箱</td>
	<td  colspan="3"><%=QYDJ_RYXX.getEMAIL()%></td></tr>	
<tr>
	<td align="center"  height=50>身份证件类型</td>
	<td colspan="3"><%=icms.getSysDm("CERTYPE",QYDJ_RYXX.getCERTYPE())%></td>
</tr>
<tr>
    <td align="center"  height=50>身份证件号码</td>
	<td colspan="3"><%=QYDJ_RYXX.getCERNO()%></td></tr>
	
<TR><TD COLSPAN=4 align="center" height=350>(身份证件复印件粘贴处)</TD></TR>
<TR><TD COLSPAN=4 align="center" height=200>
<font  style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责人签字：<u>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class='NOPRINT'  style='color:#CCCCCC'>&nbsp;&nbsp;<%=QYDJ_RYXX.getNAME()%>&nbsp;&nbsp;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</u></font>
<br/><br/>
<font  style="float:center">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
</font>
</TD></TR>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>