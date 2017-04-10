<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>提交材料信息</title>
<script language="javascript">
function showSpan(v){
	var id="span_"+v;
	if(document.getElementById(id).style.display=="none"){
		document.getElementById(id).style.display="";
	}else{
		document.getElementById(id).style.display="none";
	}
}
</script>
</head>
<body>
<%@include file="/top.inc"%>
<%
StepShow stepShow= new StepShow();
String num="2";
if(Page.getOPETYPE().equals("20")){
num="1";
}
%>
<%=stepShow.getStep(num,Page.getDL()+Page.getOPETYPE(),Page.getOPENO())%>
<table width="100%" align="center" border="1">
<tr class="lc1">
<td>需要提交的材料</td>
<td width="60px"></td>
</tr>
<%
if(Page.getOPETYPE().equals("20")){
%>
<tr class="lc2">
<td>
（一）《户外广告登记申请表》。
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
（二）户外广告发布单位和广告主的营业执照或者具有同等法律效力的经营资格证明文件。
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
（三）发布户外广告的场地或者设施的使用权证明。包括场地或设施的产权证明、使用协议等。
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
（四）户外广告样件。
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
（五）法律、法规和国家工商行政管理总局规定需要提交的其他文件。
</td>
<td nowrap>
</td>
</tr>
<%}else if(Page.getOPETYPE().equals("30")){
%>
<tr class="lc2">
<td>
（一）《户外广告变更登记申请表》
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
（二）原《户外广告登记证》
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
（三）本办法第九条规定的，与变更事项相关的文件
</td>
<td nowrap>
</td></tr>
<tr class="lc2">
<td>
需要改变户外广告发布单位、户外广告发布地点及具体位置的，户外广告发布单位应当向原登记机关缴回《户外广告登记证》，并按照规定重新申请户外广告登记。
</td>
<td nowrap>
</td></tr>
<%}%>
</table>
<br/> 
 <CENTER>
  <div class="subImgs" onclick="window.location.href='hwgg_control.jsp'">下一步</div>
</CENTER> 
<%@include file="/bottom.inc"%>
</body>
</html>