<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<%@ page import="java.text.SimpleDateFormat"%>
<%
String fieldName=(String)request.getParameter("fieldName");
String fieldValue=(String)request.getParameter("fieldValue");
//fieldValue.replaceAll("（依法须经批准的项目，经相关部门批准后方可开展经营活动）","");
%>
<html>
<head>
<title>经营范围选择</title>
<LINK href="<%=request.getContextPath()%>/css/jyfw.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$(".hasChange").bind("input propertychange",function(){
		check($(this).attr("id"),$(this).val());
	});
});
</script>
</head>
<body>
<form name="form1" method="POST" action='' target="_self">
<table border="1" width="100%" class="">
	<tr>
        <td colspan=3>查询条件输入选择：<font color="blue">输入编码或汉字进行模糊查询，输入【行业门类】可快速定位大类，输入【行业代码】可快速定位中小类，输入【规范用语】可快速定位说明信息。</font></td>
	</tr>
	<tr>
        <td width="220">行业门类:<input class="hasChange" type=text size=20 id="tradeCoding" name=tradeCoding ></td>
        <td width="230">行业代码:<input class="hasChange" type=text size=20 id="tradeContent" name=tradeContent></td>
        <td>规范用语:<input class="hasChange" type=text size=28 id="content" name=content></td>
	</tr>
	<tr >
        <td width="220"><iframe name="tradeFrame" width="99%" height="300" marginwidth=0 marginheight=0 hspace=0 vspace=0 frameborder=0 scrolling=auto bordercolor="#000000" src="selectTradeCoding.jsp"></iframe></td>
        <td width="230"><iframe name="tradeCodeFrame" width="99%" height="100%" marginwidth=0 marginheight=0 hspace=0 vspace=0 frameborder=0 scrolling=auto bordercolor="#000000" src="selectTradeContent.jsp"></iframe></td>
        <td><iframe name="contentFrame" width="99%" height="100%" marginwidth=0 marginheight=0 hspace=0 vspace=0 frameborder=0 scrolling=auto bordercolor="#000000" src="selectContent.jsp"></iframe></td>
	</tr>
	<tr>
        <td colspan=3>编辑经营范围</td>
	</tr>	
	<tr>
        <td colspan=3><textarea style="width:98%" rows=8 name=JYFWContent><%=new String(fieldValue.getBytes("ISO-8859-1"))%></textarea>
        <input type="hidden" name="JYFWCode" id="JYFWCode" value=""/>
        </td>
	</tr>		
</table>
<table>
  <tr>
        <td colspan=3>详细说明：<font color="blue">最左边一栏是行业大类，选择大类后，中间一栏会显示对应的中类和小类，选择中类或小类后，最右边一栏会显示常用行业说明，点击常用行业说明，内容会显示到【经营范围】中，【经营范围】可手工输入，也可以对选择的说明进行再编辑，选择时会在原来基础上进行追加，编辑完经营范围点击【确定】即可；取消刚才的编辑内容可点击【重填】。</font></td>
  </tr>

  <tr>
  	<td align="center">
  	
		<input type=button class=button value=" 确  定 " onclick="selectOpr();">&nbsp;&nbsp;&nbsp;<input type=reset class=button value=" 重  填 ">&nbsp;&nbsp;&nbsp;<input type=button class=button value=" 取  消" onclick="cancelWin();">
  	</td>
  </tr>
</table>
<br>
<input type="hidden" name="BUSSCOPE" id="BUSSCOPE"/>
</form>

</body>  
</html> 
<script>
function check(id,valu){
	if(id=="tradeCoding"){
		document.frames["tradeFrame"].location='selectTradeCoding.jsp?key='+valu.toUpperCase();
	}else
	if(id=="tradeContent"){
		document.frames["tradeCodeFrame"].location='selectTradeContent.jsp?content='+valu;
	}else
	if(id=="content"){
		document.frames["contentFrame"].location='selectContent.jsp?content='+valu;
	}		
}	

function selectOpr(){
	window.returnValue=document.all.JYFWContent.value;
    	window.close();
}
function cancelWin(){
	window.returnValue="";
	window.close();
}
</script>