<span style="font-size: 16pt"><p align="center"><b>指定代表或者共同委托代理人的证明</b></p></span>
<%
String WTYW="名称核准√、设立□、变更□、注销□、备案□、股权出质□（设立□、变更□、撤销□、注销 □）、其他登记□";
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
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;指定代表或者委托代理人 ：<%=SysSystem.toUnderlineStr(CONSIGNER,"center",15)%></p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托事项及权限：&nbsp;&nbsp;</p>
<table width="82%"  align="center" border="0">
  <tr><td>
	<p align="left" style="line-height:25px;" >
	&nbsp;&nbsp;&nbsp;1、办理<%=SysSystem.toUnderlineStr(DQENTNAME,"center",50)%>（单位名称）的<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=WTYW%>____________事宜。
	<br>
	&nbsp;&nbsp;&nbsp;2.同意<%if("1".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE1)){out.print(selected);}else{out.print(checkBox);}%> 核对登记材料中的复印件并签署核对意见；
	<br>
	&nbsp;&nbsp;&nbsp;3.同意<%if("1".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE2)){out.print(selected);}else{out.print(checkBox);}%> 修改企业自备文件的错误；
	<br>
	&nbsp;&nbsp;&nbsp;4.同意<%if("1".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE3)){out.print(selected);}else{out.print(checkBox);}%> 修改有关表格的填写错误；
	<br>
	&nbsp;&nbsp;&nbsp;5.同意<%if("1".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(IFLICENSE4)){out.print(selected);}else{out.print(checkBox);}%> 领取营业执照和有关文书。
	</p>
</td></tr>
</table>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;指定或委托的有效期限：
<%--自&nbsp;&nbsp;<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %>&nbsp;&nbsp;  --%>
至&nbsp;&nbsp;<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %>&nbsp;&nbsp;</p>



<table border="1" width="72%" bordercolor='#000000' align="center">
  <tr>
    <td width="40%" rowspan="3" align="center">指定代表或委托代理人或者经办人信息</td>
    <td align="left" height="30">单位：<span class="NOPRINT" style="color:#CCCCCC"><%=UNIT%></span></td>
  </tr>
  <tr>
    <td align="left" height="30">签字：<%=CONSIGNER %></td>
  </tr>
  <tr>
    <td align="left" height="30">联系电话：<%=(TEL1.equals("")?MOBTEL:TEL1)%></td>
  </tr>
  <tr>
    <td colspan=2 height="400"><p align="center">（指定代表或委托代理人、具体经办人身份证明复印件粘贴处）</p></td>
  </tr>
</table>
<br/><br/>

<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请人盖章或签字:&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p align="right"><%=(CONDATE==null || CONDATE.equals(""))?"":icms.getFormatDate(CONDATE) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> 
	