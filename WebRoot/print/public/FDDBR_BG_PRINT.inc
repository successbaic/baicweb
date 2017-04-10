<table align="center" border="1" width="90%" height="40%" bordercolor='#000000'>
<caption>
<p align="left"><b><span style="font-size: 16pt">变更登记附表</b><br>
<p align="center"><b><span style="font-size: 16pt">法定代表人信息</b><br><br></caption>	
<%
 ArrayList fddbr=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"' AND LEREPSIGN='1'");  
 String NAME="",TEL="",POSITION="",APPOUNIT="",CERTYPE="",CERNO=""; 
 if(fddbr.size()>0){
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)fddbr.get(0);
 NAME=bTable.getNAME();
 TEL =bTable.getTEL();
 POSITION=bTable.getPOSITION();
 APPOUNIT=bTable.getAPPOUNIT();
 CERTYPE=bTable.getCERTYPE();
 CERNO=bTable.getCERNO();
 }
%>	
<tr >
	<td align="center" width="20%"  height=50>姓    名</td>
	<td width="30%"><%=NAME%></td>
	<td align="center" width="20%">联系电话</td>
	<td width="30%"><%=TEL%></td></tr>
<tr>
	<td align="center"  height=50>职    务</td>
	<td><%=icms.getSysDm("POSITION",POSITION)%></td>
    <td align="center"  height=50>任免机构</td>
	<td><%=APPOUNIT%></td></tr>
<tr>
	<td align="center"  height=50>身份证件类型</td>
	<td COLSPAN=3><%=icms.getSysDm("CERTYPE",CERTYPE)%></td></tr>
<tr>
    <td align="center"  height=50>身份证件号码</td>
	<td COLSPAN=3><%=CERNO%></td></tr>
	
<TR><TD COLSPAN=4 align="center" height=300>(身份证件复印件粘贴处)</TD></TR>
<TR><TD COLSPAN=4 align="center" height=100>
法定代表人签字：<%=SysSystem.toUnderlineStr("","left",15)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日
</TD></TR>
<TR><TD COLSPAN=4 align="center" height=200>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;以上法定代表人信息真实有效，身份证件与原件一致，符合《公司法》或者《企业法人登记管理条例》、《企业法人法定代表人登记管理规定》关于法定代表人任职资格的有关规定，谨此对真实性承担责任。<br><br><br><br></p>
<p align="right">（公司/非公司企业法人）加盖公章&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br><br>
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br></p>
</TD></TR>
</table>

<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						注：公司、非公司企业法人变更法定代表人填写此表。
						<br>
					</p>
				</td>
			</TR>
		</table>
<br>