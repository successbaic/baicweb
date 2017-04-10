<%@page import="com.macrosoft.icms.mcgl.DOMCCC"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.SysUtility"%>
<%@page import="com.macrosoft.icms.gsnw.MCGL_ZHJY_ZS"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"%>
<html>
<head>
<title>名称预查</title>
<%
	String nametype = SysUtility.doPreProcess(request
			.getParameter("nametype"));
	String hy = SysUtility.doPreProcess(SysUtility.convertCode(request
			.getParameter("hy")));
	String lx = SysUtility.doPreProcess(request.getParameter("lx"));
	String PREREGORG = SysUtility.doPreProcess(request
			.getParameter("djjg"));
	String ENTCLASS = SysUtility.doPreProcess(request
			.getParameter("ENTCLASS"));

	String ENTTRA = SysUtility.doPreProcess(SysUtility
			.convertCode(request.getParameter("ENTTRA")));
	String TRADPINY = SysUtility.doPreProcess(request
			.getParameter("TRADPINY"));
	String zzxs = SysUtility.doPreProcess(SysUtility
			.convertCode(request.getParameter("zzxs")));
	String sqqymc = SysUtility.doPreProcess(SysUtility
			.convertCode(request.getParameter("sqqymc")));
	if (zzxs.equals("")) {
		if (ENTCLASS.equals("6")) {
			zzxs = "专业合作社";
		}
	}
	String xzqh = webuser.getXZQH();
	String xzqhjx = SysUtility.doPreProcess(SysUtility
			.convertCode(request.getParameter("xzqhjx")));
	String xzqhjxDisabled = "";
	if (xzqhjx.equals("")) {
		
		//区划命名规则 普通申请从代码表里取
		if (nametype.equals("1")) {
			xzqhjx = icms.getSysDm("NAMEORG", PREREGORG);
		} else if (nametype.equals("2")) {
			//冠市名统一
			xzqhjx = icms.getSysDm("XZQH", xzqh);
			if(xzqh.equals("3703")){
				xzqhjx=xzqhjx.substring(0,2);
			}
		} else if(nametype.equals("3")){
			xzqhjx= icms.getSjName().substring(0,2);
		}
		//个体户排除市名字样
		if (ENTCLASS.equals("5") && xzqhjx.length() >= 4) {
			xzqhjx = xzqhjx.substring(3);
		}
		//特殊处理
		if (xzqhjx.equals("淄博齐鲁") || xzqhjx.equals("齐鲁")) {
			xzqhjx = "临淄区";
		}
	}
	if(xzqhjx.equals("淄博市")){
		xzqhjx="淄博";
	}
	//xzqh不可改
	if (ENTCLASS.equals("5")) {

	} else {
		if (!xzqhjx.equals("") && xzqh.equals("3703")) {
			xzqhjxDisabled = "disabled";
		}
	}
	String findWay = "0";
	if (nametype.equals("2")) {
		findWay = "2";
	}

	String ttjc = "";
	if (xzqhjx.equals("")) {
		ttjc = "山东";
	} else {
		ttjc = xzqhjx;
	}
	//if (ttjc.length() > 2) {
	//	ttjc = ttjc.substring(0, 2);
	//}
%>
<SCRIPT language="javascript">
<%String zhName = SysUtility.doPreProcess(SysUtility
					.convertCode(request.getParameter("zhName")));%>
	var zhName = "<%=zhName%>";
	var entClass = "<%=ENTCLASS%>";
	var sqqymc = "<%=sqqymc%>";
function changeSqqymc(){
	var sqqymc = "";
	$(".qymcChange").each(function(){
			sqqymc = sqqymc + $.trim($(this).val());
	});
	$("#sqqymc").val(sqqymc);
}
$(document).ready(function(){
	if($("#ENTTRA").val() == "" && zhName != ""){
		$("#ENTTRA").val(zhName).trigger("change");
	}
	$("#sqqymc").val(sqqymc);
	$(".qymcChange").bind("input propertychange",function(){
		changeSqqymc();
	});
	$("#choseOne").attr("disabled",false);
	$("#sqqymc").bind("input propertychange",function(){
		if($("#choseOne").length > 0){
			$("#choseOne").attr("disabled",true);
		}
	});
});

//校验字号
function validateZh(){

	var myReg = /^[\u4e00-\u9fa5]+$/;
	var	myRegTex = "字号中不能含有拼音、数字等特殊字符！";
	if(entClass == "5"){
		myReg = /^[\u4e00-\u9fa5\d]+$/;
		myRegTex = "字号中不能含有拼音等特殊字符！";
	}
	if (!(myReg.test($.trim($("#ENTTRA").val())))){
		alert(myRegTex);
		return false;
	}
	return true;
}


function zhChange(){
	if(!validateZh()){
		return;
	}
	document.getElementById("hiddenframe").contentWindow.location.href="mc_gethypy.jsp?ENTTRA="+document.form1.ENTTRA.value;
}
function doSub(){
	var lx=document.form1.lx.value;
	var zh=document.form1.ENTTRA.value;
	var zhpy=document.form1.TRADPINY.value;
	//if(document.form1.xzqhjx.value==""){
	//	alert("请录入行政区划！");
	//	return false;
	//}
	if(zh==""){
		alert("请录入字号！");
		return false;
	}
	if(zh.length<2){
		alert("字号长度不能小于两位！");
		return false;
	}
	if(zhpy==""){
		alert("请录入字号拼音！");
		return false;
	}
	zhpy = zhpy.toUpperCase();
	var dgzhpy=zhpy.split(" ");
	$("#TRADPINY").val(zhpy);
	if(dgzhpy.length<2){
		alert("字号拼音直接应有空格！如XING HUA。不能是XINGHUA！");
		return;
	}
	for(var i=0;i<dgzhpy.length;i++){
		var parent=/^[A-Z]+$/;
		if(parent.test(dgzhpy[i])){
		
		}else{
			alert("字号拼音只能是大写字母！");
			return;
		}
	}
	
	if(document.form1.hy.value==""){
		alert("请录入字号行业！");
		return false;
	}
	if(document.form1.zzxs.value==""){
		alert("请录入字号组织形式！");
		return false;
	}
	if(!validateZh()){
		return;
	}
	document.form1.submit();
}
function choseOne(){
	var lx=document.form1.lx.value;
	var zh=document.form1.ENTTRA.value;
	var zhpy=document.form1.TRADPINY.value;
	//if(document.form1.xzqhjx.value==""){
	//	alert("请录入行政区划！");
	//	return false;
	//}
	if(zh==""){
		alert("请录入字号！");
		return false;
	}
	if(zh.length<2){
		alert("字号长度不能小于两位！");
		return false;
	}
	if(zhpy==""){
		alert("请录入字号拼音！");
		return false;
	}
	if(document.form1.hy.value==""){
		alert("请录入字号行业！");
		return false;
	}
	if(document.form1.zzxs.value==""){
		alert("请录入字号组织形式！");
		return false;
	}
	var qymc = $("#sqqymc").val();
	if(qymc.indexOf(zh) < 0){
		alert("名称中必须包含字号！");
		return false;
	}
	if(document.form1.nametype.value == ""){
		window.opener.document.form1.ALTAF01.value=qymc;
		window.close();
		return;
	}
	window.opener.document.form1.NAMEIND.value=document.form1.hy.value;
	if(lx=="0"){
		window.opener.document.form1.TRADPINY.value=zhpy;
		window.opener.document.form1.ENTTRA.value=zh;
		window.opener.document.form1.ENTNAME.value=qymc;
	}else if(lx=="1"){
		window.opener.document.form1.TRADPINY1.value=zhpy;
		window.opener.document.form1.SPANAME1.value=zh;
		window.opener.document.form1.ENTNAME1.value=qymc;
	}else if(lx=="2"){
		window.opener.document.form1.TRADPINY2.value=zhpy;
		window.opener.document.form1.SPANAME2.value=zh;
		window.opener.document.form1.ENTNAME2.value=qymc;
	}else if(lx=="3"){
		window.opener.document.form1.TRADPINY3.value=zhpy;
		window.opener.document.form1.SPANAME3.value=zh;
		window.opener.document.form1.ENTNAME3.value=qymc;
	}
	window.close();
}
function showExplain(){
	if($("#div_explain").is(":hidden")){
		$("#drop_explain").attr("src","<%=request.getContextPath()%>/images/drop_up.png");
		$("#text_explain").css("float","left");
		$("#font_explain").text("说明：");
		$("#font_explain").attr("size","3");
		$("#div_explain").show();
	}else{
		$("#drop_explain").attr("src","<%=request.getContextPath()%>/images/drop_down.png");
		$("#text_explain").css("float","right");
		$("#font_explain").text("(点击查看说明)");
		$("#font_explain").attr("size","2");
		$("#div_explain").hide();
	}
}
</SCRIPT>
</head>
<body bgcolor="#FFFFFF"
	style="margin-top: 0px; margin-bottom: 0; margin-left: 15px;">

	<form name="form1" method="POST" action='zhcc.jsp'>
		<input type="hidden" name="model" value="model"> 
		<input
			type="hidden" name="lx" value="<%=lx%>"> 
			<input type="hidden"
			name="nametype" value="<%=nametype%>"> 
			<input type="hidden"
			name="djjg" value="<%=PREREGORG%>"> 
			<input type="hidden"
			name="findWay" value="<%=findWay%>">
			 <input type="hidden"
			name="ENTCLASS" value="<%=ENTCLASS%>">
		<table width=500 border="0" align="center" cellpadding=0 cellspacing=0>
			<tr>
				<td>
					<table width="100%" border="0" align="center" cellpadding="5"
						cellspacing="1" bgcolor="#A4BCC9" class="text1">
						<tr bgcolor="#FFFFFF">
							<td align="center">行政区划</td>
							<td align="center">字号</td>
							<td align="center">字号拼音</td>
							<td align="center">行业</td>
							<td align="center">组织形式</td>
						</tr>
						<tr>
							<td><input class="qymcChange" type="text" name="xzqhjx"
								size="20" value="<%=xzqhjx%>" title="行政区划" disblank
								<%=xzqhjxDisabled%> /></td>
							<td><input class="qymcChange" type="text" id="ENTTRA"
								name="ENTTRA" size="20" maxlength="6" value="<%=ENTTRA%>"
								id="ENTTRA" title="字号" disblank onchange="zhChange()" /></td>
							<td><input type="text" id="TRADPINY" name="TRADPINY"
								size="20" value="<%=TRADPINY%>" id="TRADPINY" title="字号拼音"
								disblank /></td>
							<td><input class="qymcChange" type="text" name="hy"
								size="20" value="<%=hy%>" title="行业" id="hy" disblank /></td>
							<td><input class="qymcChange" type="text" name="zzxs"
								size="20" value="<%=zzxs%>" title="组织形式" id="zzxs" disblank
								style="width: 120px">
								<div style="position: absolute;">
									<span
										style="margin-left: -35px; width: 30px; overflow: hidden; position: absolute; left: 10px; top: 2px">
										<select style="width: 53px; margin-left: -35px"
										onchange="zzxs.value=this.value">
											<option value=""></option>
											<%
												if (ENTCLASS.equals("6")) {
											%>
											<option value="专业合作社">专业合作社</option>
											<option value="专业合作社联社">专业合作社联社</option>
											<%
												} else if (ENTCLASS.equals("5")) {
											%>
											<option value="店">店</option>
											<option value="所">所</option>
											<option value="商行">商行</option>
											<option value="服务部">服务部</option>
											<option value="中心">中心</option>

											<%
												} else {
											%>
											<option value="有限公司">有限公司</option>
											<option value="有限责任公司">有限责任公司</option>
											<option value="股份有限公司">股份有限公司</option>
											<%
												}
											%>
									</select> </span>
								</div></td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td><font color=blue> 如： <%=ttjc%>。 </font></td>
							<td><font color=blue> 如:蓝凌。字号长度不能超过6个字，如有特殊情况，请到大厅查名。
							</font></td>
							<td><font color=blue>
									字号拼音可自动生成，不必手工录入。如果字号为多音字，请选择正确拼音。 </font></td>
							<td><font color=blue> <%
 	if (ENTCLASS.equals("5")) {
 %> 如：家常菜、五金。 <%
 	} else {
 %> 如:信息技术。 <%
 	}
 %> </font></td>
							<td><font color=blue> <%
 	if (ENTCLASS.equals("5")) {
 %> 如：馆、铺、店等。 如选择项中没有适合的组织形式，也可自己输入 <%
 	} else {
 %> 如:有限公司。 <%
 	}
 %> </font></td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td colspan="5" align="center"><input type="button"
								onclick="doSub()" id="query" value=" 查    重 " /></td>
						</tr>
						<tr>
							<td colspan="1" align="left" style="font-size: 15px; color: red;">
								您申请的名称：</td>
							<%
								if (ENTCLASS.equals("8")) {
							%>

							<td colspan="4" align="left">
								<input type="text" id="sqqymc"
								name="sqqymc"
								style="font-size: 15px; color: black;font-stretch: wider; font-weight: bold;width: 300px;" />
							</td>
							<%
							} else {
							%>
							<td colspan="4" align="left">
								<input type="text" id="sqqymc" readonly="readonly"
								name="sqqymc"
								style="font-size: 15px; color: black;font-stretch: wider; font-weight: bold;width: 300px;" />
							</td>
							<%
								}
							%>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td>
					<div style="text-align: left;  width: 100%;">
						<div style="float: right;">
							<img id="drop_explain" style="text-align: right;cursor: pointer;"
								onclick="showExplain();"
								src="<%=request.getContextPath()%>/images/drop_down.png"
								alt="点击查看详细说明" />
						</div>
						<div id="text_explain"
							style="float: right; margin-left: 10px; margin-top: 8px;">
							<font id="font_explain" color="red" size="2">(点击查看说明)</font>
						</div>
						<div id="div_explain" style="display: none; clear: both;">
							<font size="2pt">
								&nbsp;&nbsp;&nbsp;&nbsp;1、名称应当由行政区划、字号、行业、组织形式依次组成。 例如：<%=ttjc%>东方科技有限公司。其中“<%=ttjc%>”是行政区划，“东方”是字号，“科技”是行业（经营特点），“有限公司”为组织形式。
								<br />&nbsp;&nbsp;&nbsp;&nbsp;2、名称中的字号不能含有拼音、数字等特殊字符！。 <br />&nbsp;&nbsp;&nbsp;&nbsp;3、字号拼音都为大写字母，字号拼音直接用空格隔开。
								<br />&nbsp;&nbsp;&nbsp;&nbsp;4、请按要求正确填写申请的企业名称，然后点击"查重"按钮。 </font>
						</div>

					</div></td>
			</tr>
		</table>
	</form>
	<%
		if (request.getParameter("model") != null
				&& !request.getParameter("model").equals("")) {

			String zh = SysUtility.doPreProcess(SysUtility
					.convertCode(request.getParameter("ENTTRA")));
			String zhpy = SysUtility.doPreProcess(SysUtility
					.convertCode(request.getParameter("TRADPINY")));
			DOMCCC domccc = new DOMCCC();
			String info = domccc.CheckZh(PREREGORG, nametype, zh, zhpy,
					xzqhjx, hy, zzxs, sqqymc,ENTCLASS);
			out.println(info);
		}
	%>


	<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
</body>
</html>
