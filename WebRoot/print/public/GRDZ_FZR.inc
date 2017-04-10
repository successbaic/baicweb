<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">投资人信息</b><br><br></caption>	
<%
QYDJ_RYXX.setOPENO(OPENO);
QYDJ_RYXX.getDataByFr();
%>	
<tr >
	<td align="center" width="20%"  height=50>姓    名</td>
	<td><%=QYDJ_RYXX.getNAME()%></td>
	<td align="center" width="20%"  height=50>性    别</td>
	<td><%=icms.getSysDm("SEX",QYDJ_RYXX.getSEX())%></td>
</tr>

<tr >
	<td align="center" width="20%"  height=50>出生日期</td>
	<td><%=QYDJ_RYXX.getNATDATE()%></td>
	<td align="center" width="20%"  height=50>民　  族</td>
	<td><%=icms.getSysDm("NATION",QYDJ_RYXX.getNATION())%></td>
</tr>

<tr >
	<td align="center" width="20%"  height=50>文化程度</td>
	<td><%=icms.getSysDm("LITEDEG",QYDJ_RYXX.getLITEDEG())%></td>
	<td align="center" width="20%"  height=50>政治面貌</td>
	<td><%=icms.getSysDm("POLSTAND",QYDJ_RYXX.getPOLSTAND())%></td>
</tr>

<tr>	
	<td align="center" width="20%"  height=50>移动电话</td>
	<td width="20%"><%=QYDJ_RYXX.getMOBTEL()%></td>
	<td align="center" width="20%" height=50>电子邮箱</td>
	<td width="20%"><%=QYDJ_RYXX.getEMAIL()%></td>
</tr>	
<tr>
	<td align="center"  height=50>身份证件类型</td>
	<td><%=icms.getSysDm("CERTYPE",QYDJ_RYXX.getCERTYPE())%></td>
    <td align="center"  height=50>身份证件号码</td>
	<td><%=QYDJ_RYXX.getCERNO()%></td>
</tr>

<tr>	
	<td align="center" width="20%"  height=50>居　  所</td>
	<td><%=QYDJ_RYXX.getHOUSEADD()%></td>
	<td align="center" width="20%" height=50>邮政编码</td>
	<td><%=QYDJ_RYXX.getPOSTALCODE()%></td>
</tr>	

<tr>	
	<td align="center" width="20%"  height=50>申请前职业状况</td>
	<td colspan="3"><%=QYDJ_RYXX.getOCCSTBEAPP()%></td>
</tr>	
	
<TR><TD COLSPAN=4 align="center" height="400px"><br/><br/><br/><br/><br/><br/>
(身份证件复印件粘贴处)<br/><br/><br/><br/><br/><br/><br/>
</TD></TR>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>