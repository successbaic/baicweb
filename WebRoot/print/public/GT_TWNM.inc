<table align="center" border="1" width="90%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">���幤�̻���Ӫ��(̨��ũ��)�ǼǱ�</b><br><br></caption>	
<tr>
	<td align="center" width="10%"  height=40>��    ��</td>
	<td width="20%"><%=GTDJ_JYZXX.getNAME()%></td>
	<td align="center" width="10%" nowrap=nowrap>�Ա�</td>
	<td width="15%"><%=icms.getSysDm("SEX",GTDJ_JYZXX.getSEX())%></td>
	<td align="center" width="10%" nowrap="nowrap">��������</td>
	<td width="20%"><%=GTDJ_JYZXX.getBIRTHDAY()%></td>
	<td align="center" width="15%" rowspan="4">��  Ƭ<br>ճ����</td>
</tr>
<tr>	
	<td align="center" width="10%" height=40>�Ļ��̶�</td>
	<td><%=icms.getSysDm("LITEDEG",GTDJ_JYZXX.getLITEDEG()) %></td>
	<td align="center" colspan=2>ְҵ״��</td>
	<td colspan=2><%=GTDJ_JYZXX.getOCCSTBEAPP() %></td>
</tr>
<tr>
    <td align="center" height=40>ס��</td>	
    <td colspan=5><%=GTDJ_JYZXX.getDOM() %></td>
</tr>
<tr>
    <td align="center" height=40>��������</td>	
    <td colspan=5><%=GTDJ_JYZXX.getEMAIL() %></td>
</tr>
<tr>
    <td align="center" height=40 colspan=2>��������</td>
    <td colspan=2><%=GTDJ_JYZXX.getPOSTALCODE() %></td>
    <td align="center">��ϵ�绰</td>
    <td colspan=2><%=GTDJ_JYZXX.getTEL() %></td>
</tr>
<Tr>
    <td align="center" rowspan=4 nowrap=nowrap>����֤��</td>
    <td align="center" height=40 colspan=4>֤������</td>
    <td align="center">֤������</td>
    <td align="center">֤����Ч��</td>
</tr>
<%
	String TCERTYPE=GTDJ_JYZXX.getTCERTYPE();
	String TCERNO=GTDJ_JYZXX.getTCERNO();
	String TCERVALPER=GTDJ_JYZXX.getTCERVALPER()+"";
	String TCERNAME=GTDJ_JYZXX.getTCERNAME();
	String TCERNUM=GTDJ_JYZXX.getTCERNUM();
%>
<tr>
    <td colspan=4 height=40>1.��ס֤</td>	
    <td>
    <%if(TCERTYPE.equals("1")){out.print(TCERNO);}  %>
    </td>
    <td><%if(TCERTYPE.equals("1")){out.print(TCERVALPER);}  %></td>
</tr>
<tr>   
    <td colspan=4 height=40>2.̨�����������½ͨ��֤</td>	
   <td>
    <%if(TCERTYPE.equals("2")){out.print(TCERNO);}  %>
    </td>
    <td><%if(TCERTYPE.equals("2")){out.print(TCERVALPER);}  %></td>
</tr>
<tr>   
    <td colspan=4 height=40>3.̨���������֤��</td>	
    <td>
    <%if(TCERTYPE.equals("3")){out.print(TCERNO);}  %>
    </td>
    <td><%if(TCERTYPE.equals("3")){out.print(TCERVALPER);}  %></td>
</tr>
<tr>
    <td align="center" colspan=2 height=40>̨��ũ������֤��<br>�ļ�����</td>
    <td colspan=3><%=TCERNAME %></td>
    <td align="center">�ļ����</td>
    <td><%=TCERNUM %></td>
</tr>	
</table>
<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						ע��1��ס������ϵ�绰��������������д��Ӫ���ڴ�½�������Ϣ��
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2.����Ǽ�Ϊ̨��ũ����幤�̻��ģ�Ӧ���ύ̨��ũ������֤���ļ�,����������̨��ũҵ��֤֯����̨��ũ�񽡿�����֤����̨��ũ���������֤���ȣ�ֻ���ύһ�֣���
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3.��������֤����ӡ��������
					</p>
				</td>
			</TR>
			
		</table>