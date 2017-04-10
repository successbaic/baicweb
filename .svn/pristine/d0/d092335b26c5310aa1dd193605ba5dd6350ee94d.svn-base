<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.0 Transitional//EN">
<html>
	<head>
		<link href="../dhtmlxTree/css/css.css" rel="stylesheet"
			type="text/css">
		<link href="../dhtmlxTree/css/main.css" rel="stylesheet"
			type="text/css">
		<link href="../dhtmlxTree/dhtmlXTree.css" rel="stylesheet"
			type="text/css">
		<link href="../dhtmlxTree/css/dhtmlXTreeGrid.css" rel="stylesheet"
			type="text/css">
		<link href="../dhtmlxTree/css/editor.css" rel="stylesheet"
			type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/support/jquery-1.8.3.js"></script>
		<script
			src="<%=request.getContextPath()%>/support/dhtmlxTree/js/dhtmlxtree.js"></script>
		<script
			src="<%=request.getContextPath()%>/support/dhtmlxTree/js/dhtmlxcommon.js"></script>
		<script
			src="<%=request.getContextPath()%>/support/dhtmlxTree/js/ext/dhtmlxtree_json.js"></script>
		<script
			src="<%=request.getContextPath()%>/support/dhtmlxTree/js/ext/dhtmlxtree_rl.js"></script>
		<script language="JavaScript" type="text/JavaScript">
		<%
			String type = request.getParameter("type");
			String code = request.getParameter("code");
			String text = request.getParameter("text");
			String method = request.getParameter("method");
			String level = request.getParameter("level");
			if(type == null){
				type = "checkBox";
			}
			String title = "请选择";
			String djjg = "";
			String gxdw = "";
			if(method.equals("getQylx")){
				title = "企业类型";
			}else if(method.equals("getHydm")){
				title = "行业代码";
			}else if(method.equals("getJgxm")){
				title = "监管项目";
				djjg = request.getParameter("djjg"); 
				gxdw = request.getParameter("gxdw"); 
			}else if(method.equals("getTzrLx")){
				title = "投资人类型";
			}
		%>
		var type = "<%=type%>";
		var code = "<%=code%>";
		var text = "<%=text%>";
		var method = "<%=method%>";
		var djjg = "<%=djjg%>";
		var gxdw = "<%=gxdw%>";
		var jsondata;
		var tree;
		var id = "0";
		var childTree;
		var whichTree = "";
		//var checkedId;
		var checkedIdAll="";
		var checkedTextAll="";
		function updateInputValueAll(whichTree,isCheckedAll){
			var allIds = whichTree.getAllSubItems("0") ;
			var allIds = allIds.split(",");
			if(!isCheckedAll){
				for(var j = 0 ; j < allIds.length; j++){
					if(!whichTree.isItemChecked(allIds[j])){
						whichTree.setCheck(allIds[j],true);
						updateInputValue(whichTree,allIds[j]);
					}
				}
								//whichTree.setSubChecked("0",true);
			}else{
				for(var k = 0 ;k < allIds.length;k++){
					if(whichTree.isItemChecked(allIds[k])){
						whichTree.setCheck(allIds[k],false);
							updateInputValue(whichTree,allIds[k]);
					}
				}
							 	//whichTree.setSubChecked("0",false);
			}
			isCheckedAll = !isCheckedAll;
			return isCheckedAll;
							 	//updateInputValueAll(whichTree);
		}
	    function updateInputValue(whichTree,checkedId){
	    	if(type =="checkBox"){
		    	if(whichTree.isItemChecked(checkedId)){
					checkedTextAll = checkedTextAll+whichTree.getItemText(checkedId)+","; 
					checkedIdAll = checkedIdAll+checkedId+","; 
				}else{
					checkedTextAll = checkedTextAll.replace(new RegExp(whichTree.getItemText(checkedId).replace("(","\\(").replace(")","\\)")+","),"");
					checkedIdAll = checkedIdAll.replace(new RegExp(checkedId+","),"");
				}
				$("#text").val(checkedTextAll);
				$("#code").val(checkedIdAll);
	    	}else if(type =="radio"){
	    		if(whichTree.isItemChecked(checkedId)){
		    		$("#code").val(checkedId);
					$("#text").val(whichTree.getItemText(checkedId));
	    		}else{
	    			$("#code").val("");
					$("#text").val("");
	    		}
	    		
	    	}
	    }
		function getChildTree(checkId){
			var data;
			if(method == "getJgxm"){
				data= {"ID":checkId,"method":method,"action":"trees","level":3,"djjg":djjg,"gxdw":gxdw};
			}else{
				data= {"ID":checkId,"method":method,"action":"trees","level":3};
			}
			$.ajax(
				{
					 async:false,//提交是否采用同步方法
				     type:"post", 
					 //data:{"ID":checkId,"method":method,"action":"trees","level":3},
					 data:data,
					 dataType: "text",
					 url:"createTreesAction.action",
					 beforeSend:function (XMLHttpRequest) {
					 }, 
					 success:function (data, textStatus) {
					 	 if(type == "checkBox"){
					 		$("#child_tree").html("<input id='checkAll' type='checkbox' value='checkAll'/>全选");
					 	 }else if(type == "radio"){
						 	$("#child_tree").html("");
						 }
						 jsondata = eval("("+data+")");
						 childTree=new dhtmlXTreeObject("child_tree","100%","100%",0);
						 childTree.setImagePath("../dhtmlxTree/imgs/");
						 if(type == "checkBox"){
						 	childTree.enableCheckBoxes(true);//是否有checkbox
						 	childTree.setOnCheckHandler(function(id){
							 	updateInputValue(childTree,id);
						 	});
						 }else if(type == "radio"){
						 	childTree.enableRadioButtons(true); 
						 	childTree.setOnCheckHandler(function(id){
							 	updateInputValue(childTree,id);
						 	});
						 }
						 
						 childTree.loadJSONObject(jsondata);
						 if(type == "checkBox"){
							 var ids = checkedIdAll.split(",");
							 	for(var i = 0 ; i<ids.length; i ++){
							 			childTree.setCheck(ids[i],true);
							 }
						 }
						 
						var isCheckedAll  = false;
						 $("#checkAll").click(function(){
							isCheckedAll=updateInputValueAll(childTree,isCheckedAll);
						});
			
						 childTree.setOnClickHandler(function(id){
						 	if(childTree.isItemChecked(id)){
						 		childTree.setCheck(id,false);
						 	}else{
								childTree.setCheck(id,true);
						 	}
							updateInputValue(childTree,id);
						 });
					 }, 
					 complete:function (XMLHttpRequest, textStatus) {
					 }, 
					 error:function () {
						//请求出错处理
					 }
				 }
			);
		}
		$(document).ready(function(){
			var data ;
			if(method == "getJgxm"){
				data= {"ID":id,"method":method,"action":"trees","level":2,"djjg":djjg,"gxdw":gxdw};
			}else{
				data= {"ID":id,"method":method,"action":"trees","level":2};
			}
		$.ajax(
				{
					 async:false,//提交采用同步方法
				     type:"post", 
					 data:data,
					 dataType: "text",
					 url:"createTreesAction.action?",
					 beforeSend:function (XMLHttpRequest) {
					 }, 
					 success:function (data, textStatus) {
						 jsondata = eval("("+data+")");
						 tree=new dhtmlXTreeObject("parent_tree","100%","100%",0);
						 tree.setImagePath("../dhtmlxTree/imgs/csh_yellowbooks/");
						// tree.enableCheckBoxes(1);//是否有checkbox
						 //tree.enableRadioButtons(true); 
						 tree.loadJSONObject(jsondata);
						 tree.setOnClickHandler(function(id){
							//getAllCheckedId(childTree);
							getChildTree(id);
						 }); 
					 }, 
					 complete:function (XMLHttpRequest, textStatus) {
					 }, 
					 error:function () {
						//请求出错处理
					 }
				 }
			);
	});
	function cleartext(){
	    //$("#"+code,window.opener.document).val("");
		//$("#"+text,window.opener.document).val("");
	    $("#"+code,window.dialogArguments.document).val("");
		$("#"+text,window.dialogArguments.document).val("");
		window.close();
	}
	function check(){
		// $("#"+code,window.opener.document).val($("#code").val().replace(/,$/,""));
		// $("#"+text,window.opener.document).val($("#text").val().replace(/,$/,""));
		$("#"+code,window.dialogArguments.document).val($("#code").val().replace(/,$/,""));
	    $("#"+text,window.dialogArguments.document).val($("#text").val().replace(/,$/,""));
		window.close();
	}

</script>
<title><%=title %></title>
	</head>
	<body style="margin: 0px; border: 0px;background-color: #EEFBF7;">
		<table>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
		</table>
		<table width="98%" height="30" align="center" border="0"
			cellpadding="0" cellspacing="0" class="query_table">
			<tr>
				<td align="center" class="query_top1">
					<font size="3"><%=title %></font>
					<br>
					<%
						if ("checkBox".equals(type)) {
					%>
					(复选)
					<%
						} else if ("radio".equals(type)) {
					%>
					(单选)
					<%
						}
					%>
				</td>
			</tr>
			<tr>
				<td align="center" class="query_td1">
					已选择
					<input type='text' id='text' size='60'readonly="readonly">
					<input type='hidden' id='code'>
					<input type='hidden' id="fxdj">
				</td>
			</tr>
			<tr>
				<td align="center" class="query_td1">
					<input type="button" name="button" class="buttoninput" style="cursor:pointer;" value="确 定"
						onClick="check();">
					&nbsp;&nbsp;
					<input type="button" name="button" class="buttoninput" style="cursor:pointer;" value="清 空"
						onClick="cleartext();">
					&nbsp;&nbsp;
					<input type="button" name="button" class="buttoninput" style="cursor:pointer;" value="关 闭"
						onClick="self.close()">
				</td>
			</tr>
		</table>
		<table width="98%" border="1" align="center" cellpadding="1"
			cellspacing="1" class="query_table">
			<tr>
				<td valign="top">
					<div id="parent_tree"
						style="width: 250px; height: 100%; overflow: hide;">
					</div>
				</td>
				<td width="100%" valign="top" class="query_td1">
					<div id="child_tree"
						style="width: 100%; height: 100%; overflow: hide;">
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
