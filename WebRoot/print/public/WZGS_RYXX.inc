<table align="center" border="1" width="80%" bordercolor='#000000'>
<caption><p align="center"><b>
	<span style="font-size: 16pt">���¡����¡�������Ϣ</b><br><br></caption>	
<%
 int Nu=0;
 ArrayList rstz=QYDJ_RYXX.getList(" WHERE OPENO='"+OPENO+"'"); 
 int rytemp = rstz.size();
 for (int i=0;i<rytemp;i++){
 com.macrosoft.icms.qydj.QYDJ_RYXX_SQ bTable = (com.macrosoft.icms.qydj.QYDJ_RYXX_SQ)rstz.get(i);
 String posbrf=bTable.getPOSBRFORM();if(posbrf==null){posbrf="";}
    if(posbrf.equals("1")){
    	posbrf="ѡ��";
    }else if(posbrf.equals("2")){
    	posbrf="Ƹ��";
    }else if(posbrf.equals("3")){
    	posbrf="ί��";
    }else if(posbrf.equals("4")){
    	posbrf="����";
    }
    sflx=icms.getSysDm("CERTYPE",bTable.getCERTYPE());
    if(((String)icms.getSysDm("CERTYPE",bTable.getCERTYPE())).startsWith("�л����񹲺͹�")){
		sflx=((String)icms.getSysDm("CERTYPE",bTable.getCERTYPE())).substring(7);
	}
 Nu=Nu+1;
%>
 <tr>
    <td align="center" style="">
    ���� &nbsp;<%=SysSystem.toUnderlineStr(bTable.getNAME(),"center",15)%>
    ���𣨵����� &nbsp;<%=SysSystem.toUnderlineStr(icms.getSysDm("COUNTRY",bTable.getCOUNTRY()),"center",15)%>
   ����֤������ &nbsp;<%=SysSystem.toUnderlineStr(sflx,"center",15)%>
   <br/>
    ����֤������ &nbsp;<%=SysSystem.toUnderlineStr(bTable.getCERNO(),"center",15)%>
     &nbsp;ְ �� &nbsp;<%=SysSystem.toUnderlineStr(icms.getSysDm("POSITION",bTable.getPOSITION()),"center",15)%>
   &nbsp;
   ������ʽ &nbsp;<%=SysSystem.toUnderlineStr(posbrf,"center",15)%>
   <br/><br/><br/><br/><br/><br/>
   ������֤����ӡ��ճ������
   <br/><br/><br/><br/><br/><br/>
    </td>
  </tr>  
<%
 if (Nu!=0&&Nu%3==0){
  out.print("</table><br><p class='PageNext'><br><table align='center' border='1' width='80%' bordercolor='#000000'>");
 }
 }
 
 if(Nu>0 && Nu<3){
	 for (int j=0; j<3-Nu;j++){
%>
  <tr>
    <td align="center" style="">
    ���� &nbsp;<%=SysSystem.toUnderlineStr("","center",15)%>
    ���𣨵����� &nbsp;<%=SysSystem.toUnderlineStr("","center",15)%>
   ����֤������ &nbsp;<%=SysSystem.toUnderlineStr("","center",15)%>
   <br/>
    ����֤������ &nbsp;<%=SysSystem.toUnderlineStr("","center",15)%>
     &nbsp;ְ �� &nbsp;<%=SysSystem.toUnderlineStr("","center",15)%>
   &nbsp;
   ������ʽ &nbsp;<%=SysSystem.toUnderlineStr("","center",15)%>
   <br/><br/><br/><br/><br/>
   ������֤����ӡ��ճ������
   <br/><br/><br/><br/><br/>
    </td>
  </tr>  
<%   
	   }
	 }
 if (Nu==0) out.print("<tr><td align='center'>�޴�������</td></tr>");
%>	
</table>
<br/>
<%
out.println(twodc.getImageTable(twoFlag,OPENO,"60"));
%>