<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption align="center"><b>
	<span style="font-size: 16pt">�ϻ��˳��������</b><br><br></caption>
<tr>
	<td height="30" nowrap align="center" rowspan="2">�ϻ�������<br>������</td>
	<td height="30" nowrap align="center" rowspan="2">����<br>��������</td>
	<td height="30" nowrap align="center" rowspan="2">ס��</td>
	<td height="30" nowrap align="center" rowspan="2">�е�����<br>��ʽ</td>
	<td height="30" nowrap align="center" rowspan="2">֤��<br>����</td>
	<td height="30" nowrap align="center" rowspan="2">֤������</td>
	<td height="15" nowrap align="center" colspan="3">Э���м���</td>
</tr>
<tr>
	<td height="15" nowrap align="center" >�Ͻɳ��ʶ�<br>����Ԫ��</td>
	<td height="15" nowrap align="center">����<br>��ʽ</td>
	<td height="15" align="center" nowrap="nowrap">����ȫ���ɸ�<br>��λ����</td>
</tr>
<%

	ArrayList newrsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'");
	int temp = newrsdwtz.size();
	int Nu=0;
	String sflx="";
     for (int i=0;i<temp;i++)
      {
      	Nu++;
        com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)newrsdwtz.get(i);
		if(((String)icms.getSysDm("CERTYPE",bTable.getCERTYPE())).startsWith("�л����񹲺͹�")){
		sflx=((String)icms.getSysDm("CERTYPE",bTable.getCERTYPE())).substring(7);
		}
		
		String certype="",cerno="";
		if(bTable.getINVTYPE().equals("20") || bTable.getINVTYPE().equals("21") ||bTable.getINVTYPE().equals("22") ||bTable.getINVTYPE().equals("35") ||bTable.getINVTYPE().equals("36")){
			cerno=bTable.getCERNO();
			certype=icms.getSysDm("CERTYPE",bTable.getCERTYPE());
		}else{
			cerno=bTable.getBLICNO();
			certype=icms.getSysDm("BLICTYPE",bTable.getBLICTYPE());
		}
%>
	<tr>
		<td height="30" align="center"><%=bTable.getINV()%></td>
		<td height="30" align="center"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
		<td height="30" align="center"><%=bTable.getDOM()%></td>
		<td height="30" align="center"><%=icms.getSysDm("ONDUTYSTY",bTable.getONDUTYSTY())%></td>
		<td height="30" align="center" nowrap><%=certype%></td>
		<td height="30" align="center"><%=cerno%></td>
		<td height="30" align="center"><%=String.valueOf(bTable.getSUBCONAM())%></td>
		<td height="30" align="center"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>
		<td height="30" align="center"><%=bTable.getBALDELTERM()%>ǰ</td>
		
	</tr>
	
<%if (Nu!=0&&Nu%15==0){ 
%>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption align="center"><b>
	<span style="font-size: 16pt">�ϻ��˳��������</span></b><br><br></caption>
<tr>
	<td height="30" nowrap align="center" rowspan="2">�ϻ�������<br>������</td>
	<td height="30" nowrap align="center" rowspan="2">����<br>��������</td>
	<td height="30" nowrap align="center" rowspan="2">ס��</td>
	<td height="30" nowrap align="center" rowspan="2">�е�����<br>��ʽ</td>
	<td height="30" nowrap align="center" rowspan="2">֤��<br>����</td>
	<td height="30" nowrap align="center" rowspan="2">֤������</td>
	<td height="15" nowrap align="center" colspan="3">Э���м���</td>
</tr>
<tr>
	<td height="15" nowrap align="center" >�Ͻɳ��ʶ�<br>����Ԫ��</td>
	<td height="15" nowrap align="center">����<br>��ʽ</td>
	<td height="15" align="center" nowrap="nowrap">����ȫ���ɸ�<br>��λ����</td>
</tr>
<% 			}
	  }
        if(Nu%15>0 && Nu%15<15){
			for(int i=0;i<15-Nu%15;i++){
			out.print("<tr><td height='30'></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");

		 	}
		}
		
%>
</table>
<p align="left">ע��1���˱�������д�ģ��ɸ�ӡ�ձ���д��<br/>
    2���е����η�ʽѡ�����룺�����������Ρ�������ͨ�ϻ������Ρ��������Ρ�<br/>
    3��֤������ѡ�����룺����֤�����ա�Ӫҵִ�ա�������<br/>
    4�����ʷ�ʽѡ�����룺���ҡ�ʵ�֪ʶ��Ȩ������ʹ��Ȩ�������ǻ��ҲƲ���
</p>