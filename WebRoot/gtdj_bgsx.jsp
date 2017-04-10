<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id='GTDJ_BGXX' scope='page' class='com.macrosoft.icms.qydj.GTDJ_BGXX_SQ'/>
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS"/>
<jsp:useBean id="GTDJ_JYZXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JYZXX_ZS"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='GTDJ_JBXX_SQ' scope='page' class='com.macrosoft.icms.qydj.GTDJ_JBXX_SQ'/>
<html><head>
<title>变更信息</title>
<%
	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();

 	String SIGN =Page.getSIGN();

	GTDJ_JBXX_ZS.setPRIPID(PRIPID);
	GTDJ_JBXX_ZS.doSelect();
	
	GTDJ_JYZXX_ZS.setPRIPID(PRIPID);
	GTDJ_JYZXX_ZS.doSelect();
	String XZQH=webuser.getXZQH();
 	boolean isMcyh = false;
 	String bgEntname = "";
 	boolean isWzh = false;
 %>
<script type="text/javascript">
var isMcyh = "<%=isMcyh%>";
var bgEntname = "<%=bgEntname%>";
var isWzh = "<%=isWzh%>";
function getDom(openo){
	var url = "support/getGtDom.jsp?openo="+openo+"&lx=gt";
	var info="dialogHeight:400px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		document.form1.ALTAF16.value=ret[6];
		document.form1.ALTAF161.value=ret[0];
		document.form1.ALTAF162.value=ret[1];
		document.form1.ALTAF163.value=ret[2];
		document.form1.ALTAF164.value=ret[3];
		document.form1.ALTAF165.value=ret[4];
		document.form1.ALTAF166.value=ret[5];
	}
}
//根据通知书文号提取名称
function getName(){
	$("#div_getMc").show();
}
//名称变更自动设置
function nameChange(){
	$("input[type='checkbox'][name='ALTITEM'][ value='01']").click(function(){
		if($(this).is(":checked")){
			if(bgEntname == ""){
				if(isMcyh == "true"){
					if(isWzh == "false"){
						alert("变更名称请先办理名称变更业务!");
						$(this).attr("checked",false);
						$("input[name='ALTAF01']").attr("disabled","disabled");
						return;
					}else{
						$("#fromAPPRNO").show();
						$("input[name='ALTAF01']").attr("disabled","disabled");
					}
				}
			}else{
				$("input[name='ALTAF01']").val(bgEntname).attr("disabled","disabled");
			}
		}else{
			$("input[name='ALTAF01']").val();
			$("#fromAPPRNO").hide();
		}
	});
	$("#closeGetMc").click(function(){
		$("#div_getMc").hide();
	});
	$("#getMc").click(function(){
		var APPRNO = $("#APPRNO").val();
		if(APPRNO == ""){
			alert("请先输入名称通知书文号!");
			return;
		}
		$.ajax(
			{
				async:true,//提交采用异步方法
				type:"post", 
				data:{"APPRNO":APPRNO},
				dataType: "text",
				//method:getGSS,
				//contentType:"application/json",
				url:"getNameFromAPPRNO.action",
				beforeSend:function (XMLHttpRequest) {
				}, 
				success:function (entname, textStatus) {
					if(entname == ""){
						alert("提取失败,请确定正确填写名称通知书文号!");
					}else{
						$("input[name='ALTAF01']").val(entname);
						$("#div_getMc").hide();
					}
				}, 
				complete:function (XMLHttpRequest, textStatus) {
				}, 
				error:function () {
						//请求出错处理
					alert("系统错误，请稍后重试或联系管理员！");
				}
			}
		);
	});
}
</script>
</head>
<body>
<%@include file="top.inc"%>
<%	
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	
	String SPANAME1=Page.getXGBH();
	if(SPANAME1.equals("")){
		GTDJ_JBXX_SQ.setOPENO(OPENO);
		GTDJ_JBXX_SQ.doSelect();
		SPANAME1=GTDJ_JBXX_SQ.getSPANAME1();
	}
%>
<div>
<form name="form1" method="POST" action="web/gtdj_bgsx_action.jsp" target="editframe">
<input type="hidden" name = "PRIPID" value=<%=PRIPID%>>
<input type="hidden" name = "OPENO" value=<%=OPENO%>>
<input type="hidden" name = "REGORG" value="<%=GTDJ_JBXX_ZS.getREGORG() %>">
<input type="hidden" name="TYPE" value="2">
<input type="hidden" name="SPANAME1" value="<%=SPANAME1%>">
<%-- <input type="hidden" name="ALTBE161" value="<%=GTDJ_JBXX_ZS.getPROVINCE() %>">
<input type="hidden" name="ALTBE162" value="<%=GTDJ_JBXX_ZS.getCITY() %>">
<input type="hidden" name="ALTBE163" value="<%=GTDJ_JBXX_ZS.getCOUNTY() %>">
<input type="hidden" name="ALTBE164" value="<%=GTDJ_JBXX_ZS.getSTREET() %>">
<input type="hidden" name="ALTBE165" value="<%=GTDJ_JBXX_ZS.getROAD() %>">
<input type="hidden" name="ALTBE166" value="<%=GTDJ_JBXX_ZS.getDOORPLATE() %>"> --%>
<input type="hidden" name="ALTBE161">
<input type="hidden" name="ALTBE162">
<input type="hidden" name="ALTBE163">
<input type="hidden" name="ALTBE164">
<input type="hidden" name="ALTBE165">
<input type="hidden" name="ALTBE166">
<input type="hidden" name="ALTAF161">
<input type="hidden" name="ALTAF162">
<input type="hidden" name="ALTAF163">
<input type="hidden" name="ALTAF164">
<input type="hidden" name="ALTAF165">
<input type="hidden" name="ALTAF166">
<table border="1" width="100%" >
<caption>个体工商户变更登记事项</caption>
 <tr class='tc'>
	<td colspan="2">项目</td>
	<td>原登记事项</td>
	<td>申请变更登记事项</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="01" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>字号名称</td>
	<td class='lc2'><input type="hidden" name = "APPRNO">
	<input type="text" size="45" name="ALTBE01" disabled title="名称变更前内容" maxlength='50' value="<%=GTDJ_JBXX_ZS.getTRANAME() %>"></td>
	<td class='lc2'><input type="text" size="40" name="ALTAF01" maxlength='50'>
		<input id="fromAPPRNO" style="display: none;" type="button" value="名称提取" onclick="getName();">
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="16" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营场所</td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTBE16" disabled title="经营场所变更前内容" maxlength='50' value="<%=GTDJ_JBXX_ZS.getOPLOC() %>"></td>
	<td class='lc2'>
	<input type="text" size="40" name="ALTAF16" title="经营场所变更后内容" maxlength='50' readonly>
	<input type="button" value="点击录入" onclick="getDom('<%=OPENO%>')">
	</td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="09" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营者姓名</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE09" disabled title="经营者姓名变更前内容" maxlength='20' value="<%=GTDJ_JBXX_ZS.getOPERNAME() %>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF09" title="经营者姓名变更后内容" maxlength='20'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="68" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营者性别</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE68" disabled title="经营者性别变更前内容" maxlength='20' value="<%=icms.getSysDm("SEX",GTDJ_JYZXX_ZS.getSEX())%>"></td>
	<td class='lc2'>
	<select size="1" name="ALTAF68" title="经营者性别变更后内容">
	<option  value=''>请选择性别</option>
	<%=icms.getSysDmList("SEX")%></select>
    </td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="64" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营者民族</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE64" disabled title="经营者民族变更前内容" maxlength='20' value="<%=icms.getSysDm("NATION",GTDJ_JYZXX_ZS.getNATION())%>"></td>
	<td class='lc2'>
	<select size="1" name="ALTAF64" title="经营者民族变更后内容">
	<option  value=''>请选择民族</option>
	<%=icms.getSysDmList("NATION")%></select>
    </td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="70" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营者政治面貌</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE70" disabled title="经营者政治面貌变更前内容" maxlength='20' value="<%=icms.getSysDm("POLSTAND",GTDJ_JYZXX_ZS.getPOLSTAND())%>"></td>
	<td class='lc2'>
	<select size="1" name="ALTAF70" title="经营者政治面貌变更后内容">
	<option  value=''>请选择政治面貌</option>
	<%=icms.getSysDmList("POLSTAND")%></select>
    </td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="71" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营者文化程度</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE71" disabled title="经营者文化程度变更前内容" maxlength='20' value="<%=icms.getSysDm("LITEDEG",GTDJ_JYZXX_ZS.getLITEDEG())%>"></td>
	<td class='lc2'>
	<select size="1" name="ALTAF71" title="经营者文化程度变更后内容">
	<option  value=''>请选择文化程度</option>
	<%=icms.getSysDmList("LITEDEG")%></select>
    </td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="72" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营者职业状况</td>
	<td class='lc2'>
	<input type="text" size="30" name="ALTBE72" disabled title="经营者职业状况变更前内容" maxlength='50' value=""></td>
	<td class='lc2'>
	<input type="text" size="30" name="ALTAF72" title="经营者职业状况变更后内容" maxlength='50'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="66" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营者身份证号码</td>
	<td class='lc2'>
	<input type="text" size="30" name="ALTBE66" disabled title="经营者身份证号码变更前内容" maxlength='20' value="<%=GTDJ_JYZXX_ZS.getCERNO() %>"></td>
	<td class='lc2'>
	<input type="text" size="30" name="ALTAF66" title="经营者身份证号码变更后内容" maxlength='20'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="67" type="checkbox" onclick="setvalue(this)"> </td>
	<td class='lc1'>经营者住所</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE67" disabled title="经营者住所变更前内容" value="<%=GTDJ_JYZXX_ZS.getDOM() %>"></td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF67" title="经营者住所变更后内容" maxlength='100'>
	</td>	
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="73" type="checkbox" onClick="setvalue(this)" ></td>
	<td class='lc1'>经营者邮政编码</td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTBE73" disabled title="经营者邮政编码变更前内容" maxlength='6' value="<%=GTDJ_JYZXX_ZS.getPOSTALCODE() %>"></td>
	<td class='lc2'>
	<input type="text" size="10" name="ALTAF73" datatype=int title="经营者邮政编码变更后内容" maxlength='6'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="74" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>经营者联系电话</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE74" disabled title="经营者联系电话变更前内容" value="<%=GTDJ_JYZXX_ZS.getTEL() %>"></td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF74" datatype=int title="经营者联系电话变更后内容" maxlength='16'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="75" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>经营者电子邮箱</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE75" disabled title="经营者电子邮箱变更前内容" value="<%=GTDJ_JYZXX_ZS.getEMAIL() %>"></td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF75" title="经营者电子邮箱变更后内容" maxlength='30'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="76" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>经营者移动电话</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE76" disabled title="经营者移动电话变更前内容" value="<%=GTDJ_JYZXX_ZS.getMOBTEL() %>"></td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTAF76" title="经营者移动电话变更后内容" maxlength='30'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="13" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>从业人数</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE13" disabled title="从业人数变更前内容" maxlength='12' datatype="NUM" value="<%=GTDJ_JBXX_ZS.getEMPNUM() %>"> </td>
	<td class='lc2'><input type="text" size="20" name="ALTAF13" title="从业人数变更后内容" maxlength='12' datatype="NUM"> </td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="04" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>资金数额</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE04" disabled title="资金数额变更前内容" maxlength='12' value="<%=GTDJ_JBXX_ZS.getCAPAM() %>"> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAF04" title="资金数额变更后内容" maxlength='12' datatype="NUM"> 万元</td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="50" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>联系电话</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE50" disabled title="联系电话变更前内容" maxlength='12'  value="<%=GTDJ_JBXX_ZS.getTEL() %>"> </td>
	<td class='lc2'><input type="text" size="20" name="ALTAF50" title="联系电话变更后内容" maxlength='12' > </td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="69" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>邮政编码</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBE69" disabled title="邮政编码变更前内容" maxlength='12' value="<%=GTDJ_JBXX_ZS.getPOSTALCODE() %>"></td>
	<td class='lc2'><input type="text" size="20" name="ALTAF69" title="邮政编码变更后内容" maxlength='12'></td>
</tr>

<tr>
	<td class='lc1'><input name="ALTITEM" value="14" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>组成形式</td>
	<td class='lc2'>
	<input type="radio" value="1" name="ALTBE14" disabled>个人经营   
	<input type="radio" value="2" name="ALTBE14" disabled>家庭经营</td>
	<td class='lc2'><input type="radio" value="1" checked name="ALTAF14">个人经营   
	<input type="radio" value="2" name="ALTAF14" >家庭经营</td>
</tr>
<tr>
<td class='lc1'><input name="ALTITEM" value="65" type="checkbox" onclick="setvalue(this)"></td>
<td class='lc1'>
家庭成员姓名<br/>
及身份证号码
</td>
<td>
<textarea rows="4" cols="40" name="ALTBE65" disabled></textarea>
</td>
<td>
<textarea rows="4" cols="40" name="ALTAF65"></textarea>
</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTITEM" value="15" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>经营范围及方式</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBE15" disabled title="经营范围变更前内容" maxlength='500'><%=GTDJ_JBXX_ZS.getBUSSCOANDFORM() %></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAF15" title="经营范围变更后内容" maxlength='500'></textarea></td>
</tr>
</table>
<br/>
<center>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
</div>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" id="subid" onclick="predo()">下一页</div>
<%
}
%>
</center>
</form>
</div>
<div id="div_getMc" style="width:500px;height:200px;display:none;
	position:absolute;left:expression((body.clientWidth-500)/2);top:expression((body.clientHeight-200)/2);
	background: window;">
	<table style="margin-top: 25px;">
		<caption style="text-align: center;">请输入名称预先核准通知书文号</caption>
		<tr style="margin-top: 10px;">
			<td align="center" >
				 第<input type="text" id="APPRNO"/>号 &nbsp;<input type="button" id="getMc" value="提取"/>&nbsp;<input type="button" id="closeGetMc" value="关闭"/>
			</td>
			</td>
		</tr>
		<tr>
			<td>
				<font style="font-size: 12px;">名称预先核准通知书文号录入说明:
				<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;1.新系统申请的文号如（山）登记内名预核字[2011]第01xxx6号，只要填写01xxx6即可;其他老系统申请的文号请全部输入。
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;2.如果名称预先核准通知书,变更名称时请先做名称变更业务.
				</font>
			</td>
		</tr>
	</table>
</div>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="bottom.inc"%>
<script type="text/javascript">
function form1errorCheck()
{
	if(!funCheckInForm(document.form1))
	{
		return(false);
	}
	var ALTITEM=document.form1.ALTITEM;

	var b = false;

	for (var i=0;i<ALTITEM.length;i++)
	{
		if (ALTITEM[i].checked==true)
		{
			b=true;
			var v=eval("document.form1.ALTAF"+ALTITEM[i].value);

			if (v.value=="" && ALTITEM[i].value!="64" && ALTITEM[i].value!="17")
			{
				alert("\n["+v.title+"]:输入不能为空字符!");
				v.focus();
				return false;
			}
		}
	}
	if (b==true)
	{
		return true;
	}
	else
	{
		alert('请选择要调整的项再保存！');
		return false;
	}		
}
document.form1.onsubmit=form1errorCheck;

function predo()
{
	if (form1errorCheck())
	{
		document.form1.action="web/gtdj_bgsx_action.jsp";
		document.getElementById('subid').disabled=true;
		document.getElementById('waitdiv').style.display='';
		document.form1.submit();
	}
}
function setDis(){
    var altitem = form1.ALTITEM;
	var nLength;
	nLength=altitem.length;	
	for (var j=0; j<nLength; j++)
	{
		if (altitem[j].type=="checkbox"){	
			if (altitem[j].checked){
			   eval("document.form1.ALTAF"+altitem[j].value+".disabled=false");
			}else{
			   eval("document.form1.ALTAF"+altitem[j].value+".value=''");
	           eval("document.form1.ALTAF"+altitem[j].value+".disabled=true"); 
			}
	     }
	}
}
function setvalue(obj){
	if(obj.checked){
	   eval("document.form1.ALTAF"+obj.value+".disabled=false");
	}else{
	   eval("document.form1.ALTAF"+obj.value+".value=''");
	   eval("document.form1.ALTAF"+obj.value+".disabled=true");
	}
}
</SCRIPT>
</body></html>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");		
	vf.setFormData("ALTBE14", GTDJ_JBXX_ZS.getCOMPFORM());
	GTDJ_BGXX.setOPENO(OPENO);	
	vf.setData(GTDJ_BGXX.getDataList());
    vf.setUserFunction("setDis()");
    //变更是否先做名称变更
	vf.setUserFunction("nameChange()");
	out.print(vf.ValueDefaultScript());
%> 