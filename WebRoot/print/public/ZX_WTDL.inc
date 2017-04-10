<span style="font-size: 16pt"><p align="center"><b>指定代表或者共同委托代理人的证明</b></p></span>
<%
 String APPPER="",CONSIGNER="",IFLICENSE1="",IFLICENSE2="",IFLICENSE3="",CONFROM="",CONTO="",TEL1="",MOBTEL="",CONDATE=""; 
 ArrayList sqwt=QYDJ_SQWT.getList(" where OPENO='"+OPENO+"'");
 if(sqwt.size()>0){
 com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
 APPPER=bTable.getAPPPER();
 CONSIGNER =bTable.getCONSIGNER();
 IFLICENSE1=bTable.getIFLICENSE1();
 IFLICENSE2=bTable.getIFLICENSE2();
 IFLICENSE3=bTable.getIFLICENSE3();
 CONFROM=bTable.getCONFROM();
 CONTO=bTable.getCONTO();
 TEL1=bTable.getTEL();
 MOBTEL=bTable.getMOBTEL();
 CONDATE=bTable.getCONDATE();
 }
%>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申 请 人 :<%=SysSystem.toUnderlineStr(APPPER,"left",60)%></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;指定代表或者委托代理人 ：<%=SysSystem.toUnderlineStr(CONSIGNER,"left",45)%></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托事项及权限：&nbsp;&nbsp;</p>
<table width="72%"  align="center" border="0">
  <tr><td>
	<p align="left" style="line-height:30px;" >
	&nbsp;&nbsp;&nbsp;1、办理<%=SysSystem.toUnderlineStr(QYDJ_JBXX.getENTNAME(),"center",50)%>（企业名称）的注销手续。
	<br>
	&nbsp;&nbsp;&nbsp;2.同意<%if("1".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%> 核对登记材料中的复印件并签署核对意见；
	<br>
	&nbsp;&nbsp;&nbsp;3.同意<%if("1".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%> 修改企业自备文件的错误；
	<br>
	&nbsp;&nbsp;&nbsp;4.同意<%if("1".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%> 修改有关表格的填写错误；
	</p>
</td></tr>
</table>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;指定或委托的有效期限：
自<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 至<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %>&nbsp;&nbsp;</p>

<table border="1" width="72%" height="60" bordercolor='#000000' align="center">
  <tr>
    <td width="40%" rowspan="3" align="center">指定代表或委托代理人或者经办人信息</td>
    <td align="left" height="40">签    字：</td>
  </tr>
  <tr>
    <td align="left" height="40">固定电话：<%=TEL1%></td>
  </tr>
  <tr>
    <td align="left" height="40">移动电话：<%=MOBTEL%></td>
  </tr>
</table>
<br>
<table border="1" width="72%" height="220" bordercolor='#000000' align="center">
  <tr>
    <td><p align="center">（指定代表或委托代理人、具体经办人身份证明复印件粘贴处）</p></td>
  </tr>
</table>
<br><br>
<table align="center" border="0" width="90%" >
<tr><td>
<p align="right">（申请人盖章或签字）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p align="right"><%=(CONDATE==null || CONDATE.equals(""))?"":icms.getFormatDate(CONDATE) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 

<p align="left" style="font-size: 13px">注：1、手工填写表格和签字请使用黑色或蓝黑色钢笔、毛笔或签字笔，请勿使用圆珠笔。<br> 
&nbsp;&nbsp;&nbsp;&nbsp;2、委托事项及权限：第2、3、4项选择“同意”或“不同意”并在□中打√。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3、指定代表或者委托代理人可以是自然人，也可以是其他组织；指定代表或者委托代理人是其他组织的，应当另行提交其他组织证书复印件及其指派具体经办人的文件、具体经办人的身份证件。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4、自然人申请人由本人签字，非自然人申请人加盖公章。
</p>
</td>
</tr>
</table>