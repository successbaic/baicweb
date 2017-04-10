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
</table>
<P><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
《中华人民共和国农民专业合作社法》第三十条规定：“农民专业合作社的理事长、理事、经理不得兼任业务性质相同的其他农民专业合作社的理事长、理事、监事、经理。”第三十一条规定：“执行与农民专业合作社业务有关的公务的人员，不得担任农民专业合作社的理事长、理事、监事、经理或者财务会计人员。”
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;本人符合《中华人民共和国农民专业合作社法》第三十条、第三十一条的规定，并对此承诺的真实性承担责任。
<br/><br/><br/>
法定代表人签名：
<br/><br/>
<br/>
<font style="float:right">
  年     月     日
&nbsp;&nbsp;&nbsp;&nbsp;
</font>
</P>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>