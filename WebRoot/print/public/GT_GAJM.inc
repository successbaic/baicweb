<table align="center" border="1" width="90%" height="40%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">���幤�̻���Ӫ��(�۰ľ���)�ǼǱ�</b><br><br></caption>	
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
    <td align="center" rowspan=4 nowrap=nowrap>��۾���<br>����֤��</td>
    <td align="center" height=40 colspan=4>֤������</td>
    <td align="center">֤������</td>
    <td align="center">֤����Ч��</td>
</tr>
<%
	String HCERTYPE=GTDJ_JYZXX.getHCERTYPE();
	
	String HCERNO=GTDJ_JYZXX.getHCERNO();
	String HCERVALPER=GTDJ_JYZXX.getHCERVALPER()+"";
	String MCERTYPE=GTDJ_JYZXX.getMCERTYPE();
	String MCERNO=GTDJ_JYZXX.getMCERNO();
	String MCERVALPER=GTDJ_JYZXX.getMCERVALPER()+"";
%>
<tr>
    <td colspan=4 height=40>1.��������Ծ�������֤</td>	
    <td>
    <%if(HCERTYPE.equals("1")){
		out.print(HCERNO);
	}%>
    </td>
    <td>
    <%if(HCERTYPE.equals("1")){
		out.print(HCERVALPER);
	}%>
    </td>
</tr>
<tr>   
    <td colspan=4 height=80>2.�۰ľ��������ڵ�ͨ��֤<%if("2".equals(HCERTYPE)){out.print(selected);}else{out.print(checkBox);} %>
    <br>&nbsp;&nbsp;����ر�����������<%if("3".equals(HCERTYPE)){out.print(selected);}else{out.print(checkBox);} %></td>	
    <td>
    <%
		if(HCERTYPE.equals("2") || HCERTYPE.equals("3")){
			out.print(HCERNO);
		}
	%></td>
    <td>
	<%if(HCERTYPE.equals("2") || HCERTYPE.equals("3")){
		out.print(HCERVALPER);
	}%>
	</td>
</tr>
<tr>   
    <td colspan=4>3.�����ʦ���й�ί�й�֤�ˣ����ߣ��й����ɷ�����ۣ����޹�˾ȷ�ϵ����ݺ�֤�ļ�</td>	
    <td>
    <%if(HCERTYPE.equals("4")){
		out.print(HCERNO);
	}%>
    </td>
    <td>
    <%if(HCERTYPE.equals("4")){
		out.print(HCERVALPER);
	}%>
    </td>
</tr>

<tr>   
	 <td align="center" rowspan=2 nowrap=nowrap>���ž���<br>����֤��</td>
    <td colspan=4 height=80>1.���������Ծ�������֤<%if("1".equals(MCERTYPE)){out.print(selected);}else{out.print(checkBox);} %>
    <br>&nbsp;&nbsp;���ž�������֤<%if("2".equals(MCERTYPE)){out.print(selected);}else{out.print(checkBox);} %></td>	
    <td>
    <%
    	if(MCERTYPE.equals("1") || MCERTYPE.equals("2")){
    		out.print(MCERNO);
    	}
     %></td>
    <td>
	<%
    	if(MCERTYPE.equals("1") || MCERTYPE.equals("2")){
    		out.print(MCERVALPER);
    	}
     %></td>
</tr>
<tr>   
    <td colspan=4 height=80>2.�����ر�����������<%if("2".equals(MCERTYPE)){out.print(selected);}else{out.print(checkBox);} %>
    <br>&nbsp;&nbsp;�����ر���������������֤���ֳ��ߵ�����֤����<%if("3".equals(MCERTYPE)){out.print(selected);}else{out.print(checkBox);} %></td>	
    <td>
    <%
    	if(MCERTYPE.equals("3") || MCERTYPE.equals("4")){
    		out.print(MCERNO);
    	}
     %></td>
    <td>
	<%
    	if(MCERTYPE.equals("3") || MCERTYPE.equals("4")){
    		out.print(MCERVALPER);
    	}
     %></td>
</tr>	
</table>
<table align="center" border="0" width="90%" >
			<tr>
				<td>
					<p align=left style="font-size:13px">
						ע��1��ס������ϵ�绰��������������д��Ӫ�����ڵص������Ϣ��
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2.ͬһ�����漰������������֤���ģ�ֻ��ѡ���ύһ�֣�
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3.��ѡ������� �� �д�̡�
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4.��������֤����ӡ��������
					</p>
				</td>
			</TR>
			
		</table>