<table align="center" border="1" width="90%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">分支机构负责人登记表</b><br><br></caption>	
<%
 ArrayList fddbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN='1'");  
 String NAME="",TEL="",CERTYPE="",CERNO="",COUNTRY="",NATDATE="";
 String SEX="",NATION="",HOUSEADD=""; 
 if(fddbr.size()>0){
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)fddbr.get(0);
 NAME=bTable.getNAME();
 SEX=bTable.getSEX();
 NATION=bTable.getNATION();
 NATDATE=bTable.getNATDATE();
 COUNTRY=bTable.getCOUNTRY();
 CERTYPE=bTable.getCERTYPE();
 CERNO=bTable.getCERNO();
 TEL =bTable.getTEL();
 HOUSEADD=bTable.getHOUSEADD();
 }
%>	
<tr >
	<td align="center" width="20%"  height=40>姓    名</td>
	<td width="20%"><%=NAME%></td>
	<td align="center" width="10%">性别</td>
	<td width="10%"><%=icms.getSysDm("SEX",SEX)%></td>
	<td align="center" width="10%">民族</td>
	<td width="15%"><%=icms.getSysDm("NATION",NATION)%></td>
	<td align="center" width="15%" rowspan="3">照<br>片</td>
</tr>
<tr>
	<td align="center" width="20%" nowrap="nowrap" height=40>出生日期</td>
	<td width="20%"><%=NATDATE%></td>
	<td align="center" width="20%" nowrap="nowrap" colspan=2>国别(地区)</td>
	<td width="25%" colspan="2"><%=icms.getSysDm("COUNTRY",COUNTRY)%></td>	
</tr>
<tr>
	<td align="center"  height=40 nowrap="nowrap" width="20%">证件类型</td>
	<td width="20%"><%=icms.getSysDm("CERTYPE",CERTYPE)%></td>

    <td align="center"  height=40 width="20%" colspan=2>证件号码</td>
	<td COLSPAN=2 width="25%"><%=CERNO%></td>
</tr>
<tr>
	<td align="center"  height=40 width="20%">联系电话</td>
	<td width="20%"><%=TEL%></td>
	
	<td align="center"  height=40 nowrap="nowrap" colspan=2>住所</td>
	<td COLSPAN=3><%=HOUSEADD %></td>    
</tr>	
<tr><td COLSPAN=7 align="center" height=500>身份证件复印件粘贴处</td></tr>
</table>