<table align="center" border="1" width="80%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">法定代表人信息</b><br><br></caption>	
<%
QYDJ_RYXX.setOPENO(OPENO);
QYDJ_RYXX.getDataByFr();
%>	
<tr >
	<td align="center" width="20%"  height=50>姓    名</td>
	<td width="30%"><%=QYDJ_RYXX.getNAME()%></td>
	<td align="center" width="20%">固定电话</td>
	<td width="30%"><%=QYDJ_RYXX.getTEL()%></td></tr>
<tr >
	<td align="center" width="20%"  height=50>移动电话</td>
	<td width="30%"><%=QYDJ_RYXX.getMOBTEL()%></td>
	<td align="center" width="20%">电子邮箱</td>
	<td width="30%"><%=QYDJ_RYXX.getEMAIL()%></td></tr>	
<tr>
	<td align="center"  height=50>身份证件类型</td>
	<td ><%=icms.getSysDm("CERTYPE",QYDJ_RYXX.getCERTYPE())%></td>

    <td align="center"  height=50>身份证件号码</td>
	<td ><%=QYDJ_RYXX.getCERNO()%></td></tr>
	
<TR><TD COLSPAN=4 align="center" height=350>(身份证件复印件粘贴处)</TD></TR>
<TR><TD COLSPAN=4 align="center" height=200>
<font  style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法定代表人签字：<u>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span class='NOPRINT'  style='color:#CCCCCC'>&nbsp;&nbsp;<%=QYDJ_RYXX.getNAME()%>&nbsp;&nbsp;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</u></font>
<font  style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
</TD></TR>
<!--<TR><TD COLSPAN=4 align="center" height=250>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;以上法定代表人信息真实有效，身份证件与原件一致，符合《公司法》、《企业法人法定代表人登记管理规定》关于法定代表人任职资格的有关规定，谨此对真实性承担责任。<br><br><br></p>
<p align="right">（盖章或者签字）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br></p>
<p align="left" style="font-size:13px">
&nbsp;&nbsp;&nbsp;&nbsp;注：依照《公司法》、公司章程的规定程序，出资人、股东会确定法定代表人的，由二分之一以上出资人、股东签署；董事会确定法定代表人的，由二分之一以上董事签署。
</p>
</TD></TR>-->
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>