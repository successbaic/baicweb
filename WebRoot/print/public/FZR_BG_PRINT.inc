<table align="center" border="1" width="90%" height="40%" bordercolor='#000000'>
<caption>
<!--  p align="left"><b><span style="font-size: 16pt">����ǼǸ���</b><br -->
<p align="center"><b><span style="font-size: 16pt">��������Ϣ</b><br><br></caption>	
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
	<td align="center" width="20%"  height=50>��    ��</td>
	<td width="30%"><%=NAME%></td>
	<td align="center" width="20%">��ϵ�绰</td>
	<td width="30%"><%=TEL%></td></tr>
<!--<tr>
	<td align="center"  height=50>ְ    ��</td>
	<td><%=icms.getSysDm("POSITION",POSITION)%></td>
    <td align="center"  height=50>�������</td>
	<td><%=APPOUNIT%></td></tr>
<tr>
	--><td align="center"  height=50>����֤������</td>
	<td COLSPAN=3><%=icms.getSysDm("CERTYPE",CERTYPE)%></td></tr>
<tr>
    <td align="center"  height=50>����֤������</td>
	<td COLSPAN=3><%=CERNO%></td></tr>
	
<TR><TD COLSPAN=4 align="center" height=350>(����֤����ӡ��ճ����)</TD></TR>
<TR><TD COLSPAN=4 align="center" height=190><br><br>
������ǩ�֣�<%=SysSystem.toUnderlineStr("","left",30)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<p align="right">
��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p><br><br><br>
</TD></TR>
</table>

<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						ע���ֹ�˾���ǹ�˾��ҵ���˵ķǷ��˷�֧������Ӫҵ��λ�����������д�˱���
						<br>
					</p>
				</td>
			</TR>
		</table>
<br>