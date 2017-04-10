<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="A_BM_JYFWGF" scope="page"  class="com.macrosoft.icms.util.A_BM_JYFWGF"/>
<%
	String key=A_BM_JYFWGF.doPreProcess(A_BM_JYFWGF.convertCode(request.getParameter("key")));
	String remark=A_BM_JYFWGF.doPreProcess(request.getParameter("remark"));
	String str=remark+key+"";	
	String content=A_BM_JYFWGF.doPreProcess(A_BM_JYFWGF.convertCode(request.getParameter("content")));
	
	ArrayList contentList=new ArrayList();
	String wheSql="";	
	if(!"".equals(key)){
		wheSql=" where (bm like'"+str+"%' or nr like '%"+str+"%') order by bm";
	}
	if(!content.equals("")){
		wheSql=" where (bm like'"+content+"%' or nr like '%"+content+"%') order by bm";		
	}
	if(wheSql.equals("")){
		wheSql=" where 1>1 order by bm ";
	}
	contentList=A_BM_JYFWGF.getList(wheSql);
	
	String td="Td00Center";
%>
<html>
<head>
<LINK href="<%=request.getContextPath()%>/css/jyfw.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	var str = "<%=str%>";
</script>
</head>
<body topmargin="0" leftmargin="0">
<form name=f1 action="" >
<table border="1" width="100%" id="stockmanID">
  <tr>
    <td class="TitleCenter" width="100%">说明</td>
  </tr>
  <%for(int i=0;i<contentList.size();i++){
  com.macrosoft.icms.util.A_BM_JYFWGF map = (com.macrosoft.icms.util.A_BM_JYFWGF)contentList.get(i);
  td=td=="Td00Center"?"Td01Center":"Td00Center";
  %>
  <tr onclick="changeItem('','<%=(String)map.getNR()%>','stockmanID',<%=i+1%>)" onmouseout="this.style.cursor ='default'"  onmouseover="this.style.cursor ='hand'">
     <td class=<%=td%> >&nbsp;<%=(String)map.getNR()%></td>
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
	/*
	*author:vincent
	*限制同一经营范围的多次点击
	*/
	var oldJyfwCode = parent.document.all.JYFWCode.value;
	oldJyfwCode = oldJyfwCode.split(",");
	var newJyfwCode = str + "_"+selectnum;
	for(var i = 0;i < oldJyfwCode.length;i++){
		if(oldJyfwCode[i] == newJyfwCode){
			alert("请不要重复选择同一经营范围！")
			return;
		}
	}
	parent.document.all.JYFWCode.value = parent.document.all.JYFWCode.value+newJyfwCode+",";
	/*
	end
	*/
	//var strAdd = "（依法须经批准的项目，经相关部门批准后方可开展经营活动）";
	//parent.document.all.JYFWContent.value=parent.document.all.JYFWContent.value.replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"")+xnameExplain+strAdd;
	parent.document.all.JYFWContent.value=parent.document.all.JYFWContent.value+xnameExplain;
}
</script>
<input type="hidden" name=selectItem value="">
<input type="hidden" name=selectItemExplain value="">
<input type="hidden" name=selectRow value="">
</form>
</body>
</html>