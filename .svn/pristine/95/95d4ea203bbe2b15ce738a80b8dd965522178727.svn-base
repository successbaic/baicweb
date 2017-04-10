<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="SYS_DMDZ" scope="page"  class="com.macrosoft.icms.util.SYS_DMDZ"/>
<%
try{
	String key=SYS_DMDZ.doPreProcess(request.getParameter("key"));
	ArrayList contentList = SYS_DMDZ.getList(" WHERE type='INDUSTRYPHY' and (code like '"+new String(key.getBytes("ISO-8859-1"))+"%' or content like '%"+new String(key.getBytes("ISO-8859-1"))+"%') ORDER BY CODE");
	String td="Td00Center";
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<LINK href="<%=request.getContextPath()%>/css/jyfw.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0" leftmargin="0">
<form name=f1 action="" >
<table border="1" width="100%" id="stockmanID">
  <tr>    
    <td class="TitleCenter" width="15%">编码</td>
    <td class="TitleCenter" width="85%">说明</td>
  </tr>
  <%for(int i=0;i<contentList.size();i++){
  com.macrosoft.icms.util.SYS_DMDZ map = (com.macrosoft.icms.util.SYS_DMDZ)contentList.get(i);
  td=td=="Td00Center"?"Td01Center":"Td00Center";
  %>
  <tr onclick="changeItem('<%=(String)map.getCODE()%>','<%=(String)map.getCONTENT()%>','stockmanID',<%=i+1%>)" onmouseout="this.style.cursor ='default'"  onmouseover="this.style.cursor ='hand'">    
    <td class=<%=td%>>&nbsp;<%=(String)map.getCODE()%></td>
    <td class=<%=td%> >&nbsp;<%=(String)map.getCONTENT()%></td>
  </tr>
  <%}%>
</table>
<script>
function changeItem(xnameV,xnameExplain,stockman,selectnum){
	var rowT=document.all(stockman);
	var i=0;
	var j=0;
	var rowsNum=rowT.rows.length;
	var log=0;

	if(document.all.selectRow.value!=""){
		for(j=0;j<rowT.rows[document.all.selectRow.value].cells.length;j++){
			if((document.all.selectRow.value)%2==0){
				rowT.rows[document.all.selectRow.value].cells[j].className="Td01Center";
			}else{
				rowT.rows[document.all.selectRow.value].cells[j].className="Td00Center";
			}
		}
	}

	for(j=0;j<rowT.rows[selectnum].cells.length;j++){
			rowT.rows[selectnum].cells[j].className="Td03Center";
	}

	document.all.selectItem.value=xnameV;
	document.all.selectItemExplain.value=xnameExplain;
	document.all.selectRow.value=selectnum;
	parent.tradeCodeFrame.location='selectTradeContent.jsp?key='+xnameV;
}
</script>
<input type="hidden" name=selectItem value="">
<input type="hidden" name=selectItemExplain value="">
<input type="hidden" name=selectRow value="">
</form>
</body>
</html>
<%}
catch(Exception ex){
out.print(new Throwable());
}%>