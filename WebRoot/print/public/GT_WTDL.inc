<span style="font-size: 16pt"><p align="center"><b>委托代理人证明</b></p></span>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托人姓名 :<%=SysSystem.toUnderlineStr(APPPER,"left",50)%></p>

<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托代理人姓名 ：<%=SysSystem.toUnderlineStr(CONSIGNER,"left",50)%></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托代理权限：&nbsp;&nbsp;</p>
<table width="72%"  align="center" border="0">
  <tr><td>
	<p align="left" style="line-height:30px;" >
	&nbsp;&nbsp;&nbsp;1.同意<%if("1".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%> 核对登记材料中的复印件并签署核对意见；
	<br>
	&nbsp;&nbsp;&nbsp;2.同意<%if("1".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%> 修改有关表格的填写错误；
	<br>
	&nbsp;&nbsp;&nbsp;3.同意<%if("1".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%> 领取各类通知书；
	<br>
	&nbsp;&nbsp;&nbsp;4.同意<%if("1".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%> 领取个体工商户营业执照。
	</p>
</td></tr>
</table>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托有效期限：
自<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %> &nbsp;&nbsp;&nbsp;&nbsp;至<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %></p>

<table border="1" width="72%" height="60" bordercolor='#000000' align="center">
  <tr>
    <td width="40%" align="center" colspan=2 height="40">委托代理人住所</td>
    <td colspan=2><%=UNIT %></td>
  </tr>
  <tr>
    <td align="center" height="40" width="20%">邮政编码：</td>
    <td><%=MOBTEL %></td>
    <td align="center" height="40" width="20%">联系电话：</td>
    <td><%=TEL1 %></td>
  </tr>
  <tr>
    <td colspan=4 height="270"><p align="center">（委托代理人身份证复印件粘贴处）</p></td>
  </tr>
</table>
<br><br>
<table align="center" border="0" width="90%" >
<tr><td>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;委托人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p align="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 

<p align="left" style="font-size: 13px">须知：1、委托代理人的委托事项主要包括：办理名称预先核准、开业登记、变更登记和注销登记等。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、委托人应当指定委托代理人更正有关材料的权限，在选择“同意”或“不同意”后的 □ 中打√。<br> 
</p>
</td>
  </tr>
</table>
<br/><%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>
