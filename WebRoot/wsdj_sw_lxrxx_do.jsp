<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SW_LXRXX" scope="page"
	class="com.macrosoft.icms.bean.SW_LXRXX" />
<html>
<head>
<title>��Ա��Ϣ</title>
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
		if (document.form1.ZJLX.value == "10") // ���֤
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
				$("#td_XM").text("˰�����������");
				$("#XM").attr("title", "˰�����������");
				$("#td_ZJHM").text("˰�������ʶ���");
				$("#ZJHM").attr("title", "˰�������ʶ���");
				$("#ZJLX").attr("disabled",true);
				$("#ZJLX").val("");
				$("#tr_ZJLX").hide();
			}
		}
		$("#RYLX").change(function() {
			if ($("#RYLX").val() == "3") {
				$("#td_XM").text("˰�����������");
				$("#XM").attr("title", "˰�����������");
				$("#td_ZJHM").text("˰�������ʶ���");
				$("#ZJHM").attr("title", "˰�������ʶ���");
				$("#ZJLX").attr("disabled",true);
				$("#ZJLX").val("");
				$("#tr_ZJLX").hide();
			} else {
				$("#td_XM").text("����");
				$("#XM").attr("title", "����");
				$("#td_ZJHM").text("֤������");
				$("#ZJHM").attr("title", "֤������");
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
				<td class="lc1" style=width:120px;"">��ϵ������</td>
				<td class="lc2" colspan="3"><select size="1" id="RYLX"
					name="RYLX" title="��ϵ������" style="width:200px;" disblank>
						<option value=''>------����д��ϵ������------</option>
						<%=icms.getSysDmList("SWLXRLX")%>
				</select> &nbsp;<font color=red>*</font></td>
			</tr>
			<tr>
				<td class="lc1" id="td_XM">����</td>
				<td class="lc2" colspan="3"><input type="text" id="XM" style="width:300px;" 
					name="XM" disblank title="����" maxlength=50>&nbsp;<font
					color=red>*</font></td>
			</tr>
			<tr id="tr_ZJLX">
				<td class="lc1" id="td_ZJLX">֤������</td>
				<td class="lc2"><select size="1" id="ZJLX" name="ZJLX" style="width:200px;"
					title="֤������" disblank>
						<option value=''>��ѡ��֤������</option><%=icms.getSysDmList("CERTYPE")%></select>
					&nbsp;<font color=red>*</font>
				</td>
			</tr>
			<tr id="tr_ZJHM">
				<td class="lc1" id="td_ZJHM">֤������</td>
				<td class="lc2" colspan="3"><input type="text" id="ZJHM" name="ZJHM"
					disblank title="֤������" maxlength=20 style="width:300px;" > &nbsp;<font
					color=red>*</font></td>
			</tr>
			<tr>
				<td class="lc1">��ϵ�绰</td>
				<td class="lc2"><input type="text" name="LXDH" disblank
					maxlength=15 title="��ϵ�绰" style="width:300px;"> &nbsp;<font color=red>*</font></td>
				<td class="lc1">��������</td>
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
					%> <input name="btRet" type="button" value="��  ��"
					onclick="parent.window.location.reload();" class="inp_L1"
					onMouseOver="this.className='inp_L2'"
					onMouseOut="this.className='inp_L1'"> <%
 	} else {
 %> <input name="btSave" type="submit" value="��  ��" class="inp_L1"
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
