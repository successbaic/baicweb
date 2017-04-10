var sFeatures = "scrollbars=yes;dialogWidth=600px;dialogHeight=500px;left=300px;top=50px;";
//企业类型树
function showQylx(code,text,type){
	var url =webPath+"/support/trees/treeUtil.jsp?&method=getQylx&type="+type+"&code="+code+"&text="+text;
	window.showModalDialog(url,window,sFeatures);
}
//行业代码树
function showHydm(code,text,type){
	var url = webPath+"/support/trees/treeUtil.jsp?&method=getHydm&type="+type+"&code="+code+"&text="+text;
	window.showModalDialog(url,window,sFeatures);
}
//监管项目树
function showJgxm(code,text,type){
	var djjg = $("#gxdw").val();
	var gxdw = $("#gss").val();
	var url = webPath+"/support/trees/treeUtil.jsp?method=getJgxm&type="+type+"&code="+code+"&text="+text+"&djjg="+djjg+"&gxdw="+gxdw;
	window.showModalDialog(url,window,sFeatures);
}
//责任区
function showZrq(code,text,type){
	var url = webPath+"/support/trees/treeUtil.jsp?method=getZrq&level=3&type="+type+"&code="+code+"&text="+text;
	window.showModalDialog(url,window,sFeatures);
}
//管辖单位
function showGxdw(code,text,type){
	var url = webPath+"/support/trees/treeUtil.jsp?method=getGxdw&level=3&type="+type+"&code="+code+"&text="+text;
	window.showModalDialog(url,window,sFeatures);
}
//投资人类型
function showTzrLx(code,text,type){
	sFeatures = "scrollbars=yes;dialogWidth=600px;dialogHeight=300px;left=300px;top=50px;";
	var url = webPath+"/support/trees/treeUtil.jsp?&method=getTzrLx&type="+type+"&code="+code+"&text="+text;
	window.showModalDialog(url,window,sFeatures);
	setInIitem();
}