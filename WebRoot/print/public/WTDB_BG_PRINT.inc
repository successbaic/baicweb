<span style="font-size: 16pt"><p align="center"><b>ָ���������߹�ͬί�д����˵�֤��</b></p></span>
<%
 String APPPER="",CONSIGNER="",IFLICENSE1="",IFLICENSE2="",IFLICENSE3="",IFLICENSE4="",CONFROM="",CONTO="",TEL1="",MOBTEL="",CONDATE=""; 
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
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� �� �� :<%=SysSystem.toUnderlineStr(APPPER,"left",105)%></p>

<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ָ����������ί�д����� ��<%=SysSystem.toUnderlineStr(CONSIGNER,"left",90)%></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ί�����Ȩ�ޣ�&nbsp;&nbsp;</p>
<table width="72%"  align="center" border="0">
  <tr><td>
	<p align="left" style="line-height:30px;" >
	&nbsp;&nbsp;&nbsp;1������<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getENTNAME(),"center",50)%>����ҵ���ƣ��ġ������̱����ע����������___________________������
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
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ָ����ί�е���Ч���ޣ�
��<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> ��<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %></p>

<table border="1" width="72%" height="60" bordercolor='#000000' align="center">
  <tr>
    <td width="40%" rowspan="3" align="center">ָ��������ί�д����˻��߾�������Ϣ</td>
    <td align="left" height="40">ǩ    �֣�</td>
  </tr>
  <tr>
    <td align="left" height="40">�̶��绰��<%=TEL1%></td>
  </tr>
  <tr>
    <td align="left" height="40">�ƶ��绰��<%=MOBTEL%></td>
  </tr>
</table>
<br>
<table border="1" width="72%" height="220" bordercolor='#000000' align="center">
  <tr>
    <td><p align="center">��ָ��������ί�д����ˡ����徭��������֤����ӡ��ճ������</p></td>
  </tr>
</table>
<br><br>
<table align="center" border="0" width="90%" >
<tr><td>
<p align="right">�������˸��»�ǩ�֣�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p align="right"><%=(CONDATE==null || CONDATE.equals(""))?"":icms.getFormatDate(CONDATE) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 

<p align="left" style="font-size: 13px">ע��1���ֹ���д�����ǩ����ʹ�ú�ɫ������ɫ�ֱʡ�ë�ʻ�ǩ�ֱʣ�����ʹ��Բ��ʡ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;2�������Ǽǣ��������ι�˾������Ϊȫ��ɶ������ж��ʹ�˾������Ϊ����Ժ��ط��������������ʲ��ල�����������ɷ����޹�˾������Ϊ���»᣻�ǹ�˾��ҵ������Ϊ�����ˣ������ע���Ǽ�������Ϊ����ҵ����ҵ���ŵǼ�������Ϊĸ��˾��<br> 
&nbsp;&nbsp;&nbsp;&nbsp;3��ί�����Ȩ�ޣ���1��Ӧ��ѡ����Ӧ����Ŀ���ڡ��д�̣� ����ע�������������ݣ���2��3��4��5��ѡ��ͬ�⡱�򡰲�ͬ�⡱���ڡ��д�̡�<br>
&nbsp;&nbsp;&nbsp;&nbsp;4��ָ����������ί�д����˿�������Ȼ�ˣ�Ҳ������������֯��ָ����������ί�д�������������֯�ģ�Ӧ�������ύ������֤֯�鸴ӡ������ָ�ɾ��徭���˵��ļ������徭���˵�����֤����<br>
&nbsp;&nbsp;&nbsp;&nbsp;5����Ȼ���������ɱ���ǩ�֣�����Ȼ�������˼Ӹǹ��¡�
</p>
</td>
  </tr>
</table>