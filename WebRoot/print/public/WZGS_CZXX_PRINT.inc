
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">
<caption  align="center"><b>
	<span style="font-size: 16pt">Ͷ���ߣ��ɶ��������ˣ����������</span></b><br><br></caption>
<tr>
	<td height="50" align="center" rowspan="2">Ͷ�������ƻ�����</td>
	<td height="50" align="center" rowspan="2" nowrap="nowrap">����<br>��������</td>
	<td height="50" align="center" rowspan="2">֤��<br>����</td>
	<td height="50" align="center" rowspan="2">֤������</td>
	<td height="30" align="center" colspan="3">�³��м���</td>
</tr>
<tr>
	<td height="20" align="center" nowrap="nowrap">�Ͻɳ��ʶ�<br>����Ԫ��</td>
	<td height="20" align="center" nowrap="nowrap">����<br>��ʽ</td>
	<td height="20" align="center" nowrap="nowrap">����ȫ���ɸ�<br>��λ����</td>
	</tr>
<%

	ArrayList rsdwtz=QYDJ_CZXX.getList(" WHERE OPENO='"+OPENO+"'");
	int temp = rsdwtz.size();
	int czxxNum=0;
     for (int i=0;i<temp;i++)
      {
      	czxxNum++;
        com.macrosoft.icms.qydj.QYDJ_CZXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_CZXX_SQ)rsdwtz.get(i);
        String CONDATE=bTable.getCONDATE();
		if(CONDATE.length()>10)
			CONDATE=CONDATE.substring(0,10);
		String BALDELTERM=bTable.getBALDELTERM();
		if(BALDELTERM.length()>10)
			BALDELTERM=BALDELTERM.substring(0,10);
			
		String certype="",cerno="";
		if(bTable.getINVTYPE().equals("20") ||bTable.getINVTYPE().equals("21") ||bTable.getINVTYPE().equals("220") ||bTable.getINVTYPE().equals("35") ||bTable.getINVTYPE().equals("36")){
			cerno=bTable.getCERNO();
			certype=icms.getSysDm("CERTYPE", bTable.getCERTYPE());
		}else{
			cerno=bTable.getBLICNO();
			certype=icms.getSysDm("BLICTYPE", bTable.getBLICTYPE());
		}	
%>
	<tr>
		<td height="30"><%=bTable.getINV()%></td>
		<td height="30"><%=icms.getSysDm("COUNTRY",bTable.getCOUNTRY())%></td>
		<td height="30"><%=certype%></td>
		<td height="30"><%=cerno%></td>
		<td height="15"><%=String.valueOf(bTable.getSUBCONAM())%></td>
		<td height="15"><%=icms.getSysDm("CONFORM",bTable.getCONFORM())%></td>
		<td height="15"><%=bTable.getBALDELTERM()%>&nbsp;&nbsp;&nbsp;ǰ</td>
		
	</tr>
	
<%
	  if (czxxNum!=0&&czxxNum%15==0){ 
  			out.print("</table><br><p class='PageNext'><br><table align='center' border='1' height='75%' width='100%' bordercolor='#000000'>");
		 }
	}
    if(15-czxxNum>0){
		for(int i=0;i<15-czxxNum;i++){
			out.print("<tr><td height='30'></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
		 }
	}
		
%>

</table>
<p>ע��1���˱�������д�ģ��ɸ�ӡ�ձ���д��
    2��֤������ѡ�����룺����֤�����ա�Ӫҵִ�ա�������
    3�����ʷ�ʽѡ�����룺���ҡ�ʵ�֪ʶ��Ȩ������ʹ��Ȩ�������ǻ��ҲƲ���</p>