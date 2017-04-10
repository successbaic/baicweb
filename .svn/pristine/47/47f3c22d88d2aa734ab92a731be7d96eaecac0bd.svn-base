
<table border="1" width="100%" align="center" height="75%" bordercolor="#000000">
<caption  align="center"><b>
	<span style="font-size: 16pt">投资者（股东、发起人）出资情况表</span></b><br><br></caption>
<tr>
	<td height="50" align="center" rowspan="2">投资者名称或姓名</td>
	<td height="50" align="center" rowspan="2" nowrap="nowrap">国别<br>（地区）</td>
	<td height="50" align="center" rowspan="2">证件<br>类型</td>
	<td height="50" align="center" rowspan="2">证件号码</td>
	<td height="30" align="center" colspan="3">章程中记载</td>
</tr>
<tr>
	<td height="20" align="center" nowrap="nowrap">认缴出资额<br>（万元）</td>
	<td height="20" align="center" nowrap="nowrap">出资<br>方式</td>
	<td height="20" align="center" nowrap="nowrap">出资全部缴付<br>到位期限</td>
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
		<td height="15"><%=bTable.getBALDELTERM()%>&nbsp;&nbsp;&nbsp;前</td>
		
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
<p>注：1、此表不够填写的，可复印空表填写。
    2、证件类型选择填入：身份证、护照、营业执照、其他。
    3、出资方式选择填入：货币、实物、知识产权、土地使用权、其他非货币财产。</p>