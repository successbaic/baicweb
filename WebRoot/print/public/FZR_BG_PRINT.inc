<table align="center" border="1" width="90%" height="40%" bordercolor='#000000'>
<caption>
<!--  p align="left"><b><span style="font-size: 16pt">变更登记附表</b><br -->
<p align="center"><b><span style="font-size: 16pt">负责人信息</b><br><br></caption>	
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
<!--<tr>
	<td align="center"  height=50>职    务</td>
	<td><%=icms.getSysDm("POSITION",POSITION)%></td>
    <td align="center"  height=50>任免机构</td>
	<td><%=APPOUNIT%></td></tr>
<tr>
	--><td align="center"  height=50>身份证件类型</td>
	<td COLSPAN=3><%=icms.getSysDm("CERTYPE",CERTYPE)%></td></tr>
<tr>
    <td align="center"  height=50>身份证件号码</td>
	<td COLSPAN=3><%=CERNO%></td></tr>
	
<TR><TD COLSPAN=4 align="center" height=350>(身份证件复印件粘贴处)</TD></TR>
<TR><TD COLSPAN=4 align="center" height=190><br><br>
负责人签字：<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<p align="right">
年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p><br><br><br>
</TD></TR>
</table>

<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						注：分公司、非公司企业法人的非法人分支机构、营业单位变更负责人填写此表。
						<br>
					</p>
				</td>
			</TR>
		</table>
<br>