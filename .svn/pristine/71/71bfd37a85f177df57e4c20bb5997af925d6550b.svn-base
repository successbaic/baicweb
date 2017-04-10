<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SW_LXRXX" scope="page"
	class="com.macrosoft.icms.bean.SW_LXRXX" />
<html>
<head>
<title>人员信息</title>
<%
	String action = SysUtility.doPreProcess(request
			.getParameter("action"));
	String RECID = SysUtility.doPreProcess(request
			.getParameter("RECID"));
	String OPENO = SysUtility.doPreProcess(request
			.getParameter("OPENO"));
	String LEREPSIGN = SysUtility.doPreProcess(request
			.getParameter("LEREPSIGN"));
	String PRIPID = "";
	String fddbrFlag = "disabled";
	String ENTTYPE = Page.getENTTYPE();
	ArrayList ryList = null;
	if (action.equals("2") || action.equals("4")) {
		SW_LXRXX.setRECID(RECID);
		SW_LXRXX.setOPENO(OPENO);
		ryList = SW_LXRXX.getData();
	}
%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/support/basic.js"></script>
<script type="text/javascript">
	var action="<%=action%>";
	function checkSFZH() {
		var ret = true;
		if (document.form1.ZJLX.value == "10") // 身份证
		{
			ret = validatezjhm(document.form1.ZJHM.value);
			if (!ret) {
				document.form1.btSave.disabled = false;
			}
		}
		return ret;
	}
	function RYLX() {

	}
	function init() {
		if (action == "2" || action == "4") {
			if ($("#RYLX").val() == "3") {
				$("#td_XM").text("税务代理人名称");
				$("#XM").attr("title", "税务代理人名称");
				$("#td_ZJHM").text("税务代理人识别号");
				$("#ZJHM").attr("title", "税务代理人识别号");
				$("#ZJLX").attr("disabled",true);
				$("#ZJLX").val("");
				$("#tr_ZJLX").hide();
			}
		}
		$("#RYLX").change(function() {
			if ($("#RYLX").val() == "3") {
				$("#td_XM").text("税务代理人名称");
				$("#XM").attr("title", "税务代理人名称");
				$("#td_ZJHM").text("税务代理人识别号");
				$("#ZJHM").attr("title", "税务代理人识别号");
				$("#ZJLX").attr("disabled",true);
				$("#ZJLX").val("");
				$("#tr_ZJLX").hide();
			} else {
				$("#td_XM").text("姓名");
				$("#XM").attr("title", "姓名");
				$("#td_ZJHM").text("证件类型");
				$("#ZJHM").attr("title", "证件号码");
				$("#ZJLX").attr("disabled",false);
				$("#ZJLX").val("");
				$("#tr_ZJLX").show();
			}
		});
	}
</script>
</head>

<body>
	<form name="form1" method="POST" action='web/wsdj_sw_lxrxx_action.jsp'
		target="editframe">
		<input type="hidden" name="OPENO" value=<%=OPENO%>> <input
			type="hidden" name="PRIPID" value="<%=Page.getPRIPID()%>"> <input
			type="hidden" name="RECID" value=<%=RECID%>> <input
			type="hidden" name="action" value="<%=action%>">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<caption></caption>
		</table>
		<table border="1" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="lc1" style=width:120px;"">联系人类型</td>
				<td class="lc2" colspan="3"><select size="1" id="RYLX"
					name="RYLX" title="联系人类型" style="width:200px;" disblank>
						<option value=''>------请填写联系人类型------</option>
						<%=icms.getSysDmList("SWLXRLX")%>
				</select> &nbsp;<font color=red>*</font></td>
			</tr>
			<tr>
				<td class="lc1" id="td_XM">姓名</td>
				<td class="lc2" colspan="3"><input type="text" id="XM" style="width:300px;" 
					name="XM" disblank title="姓名" maxlength=50>&nbsp;<font
					color=red>*</font></td>
			</tr>
			<tr id="tr_ZJLX">
				<td class="lc1" id="td_ZJLX">证件类型</td>
				<td class="lc2"><select size="1" id="ZJLX" name="ZJLX" style="width:200px;"
					title="证件类型" disblank>
						<option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select>
					&nbsp;<font color=red>*</font>
				</td>
			</tr>
			<tr id="tr_ZJHM">
				<td class="lc1" id="td_ZJHM">证件号码</td>
				<td class="lc2" colspan="3"><input type="text" id="ZJHM" name="ZJHM"
					disblank title="证件号码" maxlength=20 style="width:300px;" > &nbsp;<font
					color=red>*</font></td>
			</tr>
			<tr>
				<td class="lc1">联系电话</td>
				<td class="lc2"><input type="text" name="LXDH" disblank
					maxlength=15 title="联系电话" style="width:300px;"> &nbsp;<font color=red>*</font></td>
				<td class="lc1">电子邮箱</td>
				<td class="lc2"><input type="text" name="DZYX" maxlength=30 style="width:300px;">
				</td>
			</tr>
		</table>
		<br>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td align=center>
					<%
						if (action.equals("4")) {
					%> <input name="btRet" type="button" value="返  回"
					onclick="parent.window.location.reload();" class="inp_L1"
					onMouseOver="this.className='inp_L2'"
					onMouseOut="this.className='inp_L1'"> <%
 	} else {
 %> <input name="btSave" type="submit" value="保  存" class="inp_L1"
					onMouseOver="this.className='inp_L2'"
					onMouseOut="this.className='inp_L1'"> <%
 	}
 %>
				</td>
			</tr>
		</table>
	</form>
	<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
	<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	ec.setUserFunction("checkSFZH()");
	out.print(ec.ErrorCheckScript());

	ValueDefault vf = new ValueDefault();
	vf.setFormName("form1");
	vf.setData(ryList);
	vf.setUserFunction("init()");
	out.print(vf.ValueDefaultScript());
%>
