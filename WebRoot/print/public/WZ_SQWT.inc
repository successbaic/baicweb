<span style="font-size: 16pt"><p align="center"><b>ָ���������߹�ͬί�д����˵�֤��</b></p></span>
<%
 String APPPER="",CONSIGNER="",IFLICENSE1="",IFLICENSE2="",IFLICENSE3="",IFLICENSE4="",CONFROM="",CONTO="",TEL1="",MOBTEL="",CONDATE="",UNIT=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 APPPER=bTable.getAPPPER();
 CONSIGNER =bTable.getCONSIGNER();
 IFLICENSE1=bTable.getIFLICENSE1();
 IFLICENSE2=bTable.getIFLICENSE2();
 IFLICENSE3=bTable.getIFLICENSE3();
 IFLICENSE4=bTable.getIFLICENSE4();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 TEL1=bTable.getTEL();
 MOBTEL=bTable.getMOBTEL();
 CONDATE=bTable.getCONDATE();
 UNIT=bTable.getUNIT();
 }
%>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ָ����������ί�д����� ��<%=SysSystem.toUnderlineStr(CONSIGNER,"center",15)%></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ί�����Ȩ�ޣ�&nbsp;&nbsp;</p>
<table width="82%"  align="center" border="0">
  <tr><td>
	<p align="left" style="line-height:25px;" >
	&nbsp;&nbsp;&nbsp;1������<%=SysSystem.toUnderlineStr(DQENTNAME,"center",50)%>����λ���ƣ���<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=WTYW%>____________���ˡ�
	<br>
	&nbsp;&nbsp;&nbsp;2.ͬ��<%if("1".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%> �˶ԵǼǲ����еĸ�ӡ����ǩ��˶������
	<br>
	&nbsp;&nbsp;&nbsp;3.ͬ��<%if("1".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%> �޸���ҵ�Ա��ļ��Ĵ���
	<br>
	&nbsp;&nbsp;&nbsp;4.ͬ��<%if("1".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%> �޸��йر������д����
	<br>
	&nbsp;&nbsp;&nbsp;5.ͬ��<%if("1".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%> ��ȡӪҵִ�պ��й����顣
	</p>
</td></tr>
</table>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ָ����ί�е���Ч���ޣ�
��&nbsp;&nbsp;<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %>&nbsp;&nbsp; ��&nbsp;&nbsp;<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %>&nbsp;&nbsp;</p>



<table border="1" width="72%" bordercolor='#000000' align="center">
  <tr>
    <td width="40%" rowspan="3" align="center">ָ��������ί�д����˻��߾�������Ϣ</td>
    <td align="left" height="30">��λ��<span class="NOPRINT" style="color:#CCCCCC"><%=UNIT%></span></td>
  </tr>
  <tr>
    <td align="left" height="30">ǩ�֣�<%=CONSIGNER %></td>
  </tr>
  <tr>
    <td align="left" height="30">��ϵ�绰��<%=(TEL1.equals("")?MOBTEL:TEL1)%></td>
  </tr>
  <tr>
    <td colspan=2 height="270"><p align="center">��ָ��������ί�д����ˡ����徭��������֤����ӡ��ճ������</p></td>
  </tr>
</table>
<br/><br/>
<table align="center" border="0" width="90%" >
	<tr>
		<td>
			<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����˸��»�ǩ��:&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<p align="right"><%=(CONDATE==null || CONDATE.equals(""))?"":icms.getFormatDate(CONDATE) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 
		</td>
	</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
<br><p class="PageNext"><br>
<%
	ArrayList wjsdlist=QYDJ_WZWJSD.getList(" WHERE OPENO='"+OPENO+"'");
	com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ wjsd = new com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ();
    if(wjsdlist.size()>0){
       wjsd=(com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ)wjsdlist.get(0); 
        }
 %>
<span style="font-size: 16pt"><p align="center"><b>����Ͷ����ҵ�����ļ��ʹ�<br/>��Ȩί����
</b></p></span>
<table width="82%"  align="center" border="0" >
<tr>
<td colspan="4">
<br>
<p align="left">��Ȩ�ˣ�<%=SysSystem.toUnderlineStr("","center",50)%></p>
<p align="left">����Ȩ�ˣ�<%=SysSystem.toUnderlineStr(wjsd.getNAME(),"center",50)%></p>
<p align="left">��Ȩ��Χ������<%=SysSystem.toUnderlineStr(wjsd.getNAME(),"center",40)%>������Ȩ�����ƻ�����������</p>
<p align="left"><%=SysSystem.toUnderlineStr("","center",40)%>����Ȩ�����ƻ����������й����ڽ�����ҵ�Ǽǻ��ط����ļ�</p>
<p align="left">�ʹֱ�������ȨΪֹ��</p>
<br/>
</td>
</tr>
</table>
<table width="82%"  align="center" border="1" bordercolor='#000000'>
<tr>
<td align="center" style="width:15%" height="30">����Ȩ�˵�ַ</td>
<td align="center" style="width:35%"><%=wjsd.getADDR() %></td>
<td align="center" style="width:15%" height="30">��������</td>
<td align="center" style="width:35%"><%=wjsd.getPOSTALCODE() %></td>
</tr>

<tr>
<td align="center" height="30">����Ȩ����ϵ��</td>
<td align="center"><%=wjsd.getLINKMAN() %></td>
<td align="center" height="30">�����ʼ�</td>
<td align="center"><%=wjsd.getEMAIL() %></td>
</tr>
<tr>
<td rowspan="2" align="center" height="30">����Ȩ����ϵ��<br>��ϵ�绰</td>
<td colspan="3" height="30">�̶���<%=wjsd.getTEL() %></td>
</tr>
<tr>
<td colspan="3" height="30">�ƶ���<%=wjsd.getMOBTEL() %></td>
</tr>
</table>
<table width="82%"  align="center" border="0" >
<tr>
<td colspan="4">
<br>
<br>
<p align="center">��Ȩ��ǩ�ֻ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����Ȩ��ǩ�ֻ����</p><br><br>
</td>
</tr>
<tr>
<td colspan="4">
<p align="right" syle="line-heigth:10px">��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</p><br><br>
</td>

</tr>

<tr>
<td colspan="4" align="left">
&nbsp;&nbsp;&nbsp;&nbsp;ע��������Ͷ����ҵ�����ļ��ʹ���Ȩί���顷�����Ͷ���ߣ���Ȩ�ˣ��뾳�ڷ�����<br/>
���ʹ�����ˣ�����Ȩ�ˣ�ǩ�𡣱���Ȩ�˿��������Ͷ���������ķ�֧��������������<br/>
��˾������Ȩ��Ϊ�������Ĺ�˾�ģ���˾������ί����Ч���������������йص�λ���<br/>
�ˡ�����Ȩ�ˡ�����Ȩ�˵�ַ�����������ģ�Ӧ��ǩ���µġ�����Ͷ����ҵ�����ļ�<br/>
�ʹ���Ȩί���顷��ʱ����ҵ�Ǽǻ��ر�����
</td>
</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
