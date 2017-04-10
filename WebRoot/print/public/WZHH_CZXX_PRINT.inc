<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption align="center"><b>
	<span style="font-size: 16pt">合伙人出资情况表</b><br><br></caption>
<tr>
	<td height="30" nowrap align="center" rowspan="2">合伙人名称<br>或姓名</td>
	<td height="30" nowrap align="center" rowspan="2">国别<br>（地区）</td>
	<td height="30" nowrap align="center" rowspan="2">住所</td>
	<td height="30" nowrap align="center" rowspan="2">承担责任<br>方式</td>
	<td height="30" nowrap align="center" rowspan="2">证件<br>类型</td>
	<td height="30" nowrap align="center" rowspan="2">证件号码</td>
	<td height="15" nowrap align="center" colspan="3">协议中记载</td>
</tr>
<tr>
	<td height="15" nowrap align="center" >认缴出资额<br>（万元）</td>
	<td height="15" nowrap align="center">出资<br>方式</td>
	<td height="15" align="center" nowrap="nowrap">出资全部缴付<br>到位期限</td>
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
		if(((String)icms.getSysDm("CERTYPE",bTable.getCERTYPE())).startsWith("中华人民共和国")){
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
		<td height="30" align="center"><%=bTable.getBALDELTERM()%>前</td>
		
	</tr>
	
<%if (Nu!=0&&Nu%15==0){ 
%>
</table>
<br><p class="PageNext"><br>
<!--########### -->
<table align="center" border="1" width="100%" bordercolor='#000000'>
<caption align="center"><b>
	<span style="font-size: 16pt">合伙人出资情况表</span></b><br><br></caption>
<tr>
	<td height="30" nowrap align="center" rowspan="2">合伙人名称<br>或姓名</td>
	<td height="30" nowrap align="center" rowspan="2">国别<br>（地区）</td>
	<td height="30" nowrap align="center" rowspan="2">住所</td>
	<td height="30" nowrap align="center" rowspan="2">承担责任<br>方式</td>
	<td height="30" nowrap align="center" rowspan="2">证件<br>类型</td>
	<td height="30" nowrap align="center" rowspan="2">证件号码</td>
	<td height="15" nowrap align="center" colspan="3">协议中记载</td>
</tr>
<tr>
	<td height="15" nowrap align="center" >认缴出资额<br>（万元）</td>
	<td height="15" nowrap align="center">出资<br>方式</td>
	<td height="15" align="center" nowrap="nowrap">出资全部缴付<br>到位期限</td>
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
<p align="left">注：1、此表不够填写的，可复印空表填写。<br/>
    2、承担责任方式选择填入：无限连带责任、特殊普通合伙人责任、有限责任。<br/>
    3、证件类型选择填入：身份证、护照、营业执照、其他。<br/>
    4、出资方式选择填入：货币、实物、知识产权、土地使用权、其他非货币财产。
</p>