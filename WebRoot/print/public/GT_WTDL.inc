<span style="font-size: 16pt"><p align="center"><b>ί�д�����֤��</b></p></span>
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
 UNIT=bTable.getUNIT();
 TEL1=bTable.getTEL();
 MOBTEL=bTable.getPOSTALCODE();
 CONDATE=bTable.getCONDATE();
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ί�������� :<%=SysSystem.toUnderlineStr(APPPER,"left",50)%></p>

<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ί�д��������� ��<%=SysSystem.toUnderlineStr(CONSIGNER,"left",50)%></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ί�д���Ȩ�ޣ�&nbsp;&nbsp;</p>
<table width="72%"  align="center" border="0">
  <tr><td>
	<p align="left" style="line-height:30px;" >
	&nbsp;&nbsp;&nbsp;1.ͬ��<%if("1".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%> �˶ԵǼǲ����еĸ�ӡ����ǩ��˶������
	<br>
	&nbsp;&nbsp;&nbsp;2.ͬ��<%if("1".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%> �޸��йر������д����
	<br>
	&nbsp;&nbsp;&nbsp;3.ͬ��<%if("1".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%> ��ȡ����֪ͨ�飻
	<br>
	&nbsp;&nbsp;&nbsp;4.ͬ��<%if("1".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%>  ��ͬ��<%if("2".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%> ��ȡ���幤�̻�Ӫҵִ�ա�
	</p>
</td></tr>
</table>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ί����Ч���ޣ�
��<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> &nbsp;&nbsp;&nbsp;&nbsp;��<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %></p>

<table border="1" width="72%" height="60" bordercolor='#000000' align="center">
  <tr>
    <td width="40%" align="center" colspan=2 height="40">ί�д�����ס��</td>
    <td colspan=2><%=UNIT %></td>
  </tr>
  <tr>
    <td align="center" height="40" width="20%">�������룺</td>
    <td><%=MOBTEL %></td>
    <td align="center" height="40" width="20%">��ϵ�绰��</td>
    <td><%=TEL1 %></td>
  </tr>
  <tr>
    <td colspan=4 height="270"><p align="center">��ί�д���������֤��ӡ��ճ������</p></td>
  </tr>
</table>
<br><br>
<table align="center" border="0" width="90%" >
<tr><td>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;ί����ǩ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p align="right">&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 

<p align="left" style="font-size: 13px">��֪��1��ί�д����˵�ί��������Ҫ��������������Ԥ�Ⱥ�׼����ҵ�Ǽǡ�����ǼǺ�ע���Ǽǵȡ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2��ί����Ӧ��ָ��ί�д����˸����йز��ϵ�Ȩ�ޣ���ѡ��ͬ�⡱�򡰲�ͬ�⡱��� �� �д�̡�<br> 
</p>
</td>
  </tr>
</table>
<br/><%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>