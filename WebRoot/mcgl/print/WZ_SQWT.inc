<span style="font-size: 16pt"><p align="center"><b>ָ���������߹�ͬί�д����˵�֤��</b></p></span>
<%
String WTYW="���ƺ�׼�̡����������������ע����������������Ȩ���ʡ��������������������������ע�� �����������Ǽǡ�";
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
<%--��&nbsp;&nbsp;<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %>&nbsp;&nbsp;  --%>
��&nbsp;&nbsp;<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %>&nbsp;&nbsp;</p>



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
    <td colspan=2 height="400"><p align="center">��ָ��������ί�д����ˡ����徭��������֤����ӡ��ճ������</p></td>
  </tr>
</table>
<br/><br/>

<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����˸��»�ǩ��:&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p align="right"><%=(CONDATE==null || CONDATE.equals(""))?"":icms.getFormatDate(CONDATE) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 
	