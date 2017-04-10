<span style="font-size: 16pt"><p align="center"><b>指定代表或者共同委托代理人的证明</b></p></span>
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
自&nbsp;&nbsp;<%=(CONFROM==null || CONFROM.equals(""))?"":icms.getFormatDate(CONFROM) %>&nbsp;&nbsp; 至&nbsp;&nbsp;<%=(CONTO==null || CONTO.equals(""))?"":icms.getFormatDate(CONTO) %>&nbsp;&nbsp;</p>



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
    <td colspan=2 height="270"><p align="center">（指定代表或委托代理人、具体经办人身份证明复印件粘贴处）</p></td>
  </tr>
</table>
<br/><br/>
<table align="center" border="0" width="90%" >
	<tr>
		<td>
			<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请人盖章或签字:&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
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
<span style="font-size: 16pt"><p align="center"><b>外商投资企业法律文件送达<br/>授权委托书
</b></p></span>
<table width="82%"  align="center" border="0" >
<tr>
<td colspan="4">
<br>
<p align="left">授权人：<%=SysSystem.toUnderlineStr("","center",50)%></p>
<p align="left">被授权人：<%=SysSystem.toUnderlineStr(wjsd.getNAME(),"center",50)%></p>
<p align="left">授权范围：授予<%=SysSystem.toUnderlineStr(wjsd.getNAME(),"center",40)%>（被授权人名称或姓名）代表</p>
<p align="left"><%=SysSystem.toUnderlineStr("","center",40)%>（授权人名称或姓名）在中国境内接受企业登记机关法律文件</p>
<p align="left">送达，直至解除授权为止。</p>
<br/>
</td>
</tr>
</table>
<table width="82%"  align="center" border="1" bordercolor='#000000'>
<tr>
<td align="center" style="width:15%" height="30">被授权人地址</td>
<td align="center" style="width:35%"><%=wjsd.getADDR() %></td>
<td align="center" style="width:15%" height="30">邮政编码</td>
<td align="center" style="width:35%"><%=wjsd.getPOSTALCODE() %></td>
</tr>

<tr>
<td align="center" height="30">被授权人联系人</td>
<td align="center"><%=wjsd.getLINKMAN() %></td>
<td align="center" height="30">电子邮件</td>
<td align="center"><%=wjsd.getEMAIL() %></td>
</tr>
<tr>
<td rowspan="2" align="center" height="30">被授权人联系人<br>联系电话</td>
<td colspan="3" height="30">固定：<%=wjsd.getTEL() %></td>
</tr>
<tr>
<td colspan="3" height="30">移动：<%=wjsd.getMOBTEL() %></td>
</tr>
</table>
<table width="82%"  align="center" border="0" >
<tr>
<td colspan="4">
<br>
<br>
<p align="center">授权人签字或盖章&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被授权人签字或盖章</p><br><br>
</td>
</tr>
<tr>
<td colspan="4">
<p align="right" syle="line-heigth:10px">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</p><br><br>
</td>

</tr>

<tr>
<td colspan="4" align="left">
&nbsp;&nbsp;&nbsp;&nbsp;注：《外商投资企业法律文件送达授权委托书》由外国投资者（授权人）与境内法律文<br/>
件送达接受人（被授权人）签署。被授权人可以是外国投资者设立的分支机构、拟设立的<br/>
公司（被授权人为拟设立的公司的，公司设立后委托生效）或者其他境内有关单位或个<br/>
人。被授权人、被授权人地址等事项发生变更的，应当签署新的《外商投资企业法律文件<br/>
送达授权委托书》及时向企业登记机关备案。
</td>
</tr>
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>

