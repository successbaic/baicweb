<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ZJ_ZZJGJBXX" scope="page"
	class="com.macrosoft.icms.bean.ZJ_ZZJGJBXX" />
<jsp:useBean id="QYDJ_JBXX" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" />
<html>
<head>
<title>ӡ����Ϣ����</title>
<%
	String OPENO = Page.getOPENO();
	String SIGN = Page.getSIGN(); //1�鿴��2�޸�   
	String ENTTYPE = Page.getENTTYPE();
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
%>
<style type="text/css">
.checkbox {
	vertical-align: middle;
}
</style>
<script type="" src="<%=request.getContextPath()%>/support/basic.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%@include file="top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<form name="form1" method="POST" action='web/wsdj_zj_action.jsp'
		target="editframe">
		<input type="hidden" name="OPENO" value="<%=OPENO%>"> <input
			type="hidden" name="PRIPID"> <input type="hidden"
			name="SBZT"> <input type="hidden" name="YXQZ"> <input
			type="hidden" name="HYML94"> <input type="hidden"
			name="HYDM94"> <input type="hidden" name="HYML02">
		<input type="hidden" name="HYDM02"> <input type="hidden"
			name="S_EXT_TIMESTAMP">

		<table width="95%" border=1 cellpadding="0" cellspacing="0">
			<tr>
				<td class="yxsm" colspan="4">&nbsp;����������Ϣ����</td>
			</tr>
			<tr>
				<td class="lc1">����</td>
				<td class="lc2" colspan="3"><input type="text" name="ENTNAME"
					size="50" title='����' maxlength='150'
					value="<%=QYDJ_JBXX.getENTNAME()%>" disblank disabled="disabled"></td>
			</tr>
			<tr>
				<td class="lc1">�Ƿ񷢿�</td>
				<td class="lc2" style="width:400px;">��<input type="radio"
					name="SFFK" value="1" title='�Ƿ񷢿�' checked="checked">
					&nbsp;��<input title='�Ƿ񷢿�' type="radio" name="SFFK" value="0">
					&nbsp;<font color=red>*</font>
				</td>
				<td class="lc1">��ϵ�绰</td>
				<td class="lc2"><input type="text" name="LXDH" title='��ϵ�绰'
					datatype="TEL" maxlength='30' size="29" disblank>&nbsp;<font
					color=red>*</font></td>
			</tr>
			<tr>
				<td class="lc1">������</td>
				<td class="lc2"><input type="text" name="ZBSL" title='������'
					maxlength='1' size="20" datatype="INT" disblank>&nbsp;<font
					color=red>*</font></td>
				<td class="lc1">������</td>
				<td class="lc2"><input type="text" name="FBSL" title='������'
					maxlength='2' size="20" datatype="INT" disblank>&nbsp;<font
					color=red>*</font></td>
			</tr>
			<tr>
				<td class="lc1">���ܲ��Ŵ���</td>
				<td class="lc2"><input type="text" name="ZGBMDM"
					title='���ܲ��Ŵ���' maxlength='9' datatype="NUM" size="29"></td>
				<td class="lc1">���ܲ�������</td>
				<td class="lc2"><input type="text" name="ZGBMMC" title='���ܲ�������'
					maxlength='50' size="35"></td>
			</tr>
			<tr>
				<td class="lc1">ְ������</td>
				<td class="lc2"><input type="text" name="ZGRS" title='ְ������'
					maxlength='6' size="20" datatype="INT" disblank>&nbsp;<font
					color=red>*</font></td>
				<td class="lc1">С΢��ҵ����</td>
				<td class="lc2"><select size="1" name="XWBZ" title="С΢��ҵ����"
					disblank style="width:192px; ">
						<option value=''>��ѡ��С΢��ҵ����</option>
						<%=icms.getSysDmList("XWBZ")%>
				</select> &nbsp;<font color=red>*</font></td>
			</tr>
			<tr>
				<td class="lc1">�Ƿ�����</td>
				<td class="lc2" colspan="3">
					<div>
						<table width="100%" border=1 cellpadding="0" cellspacing="0">
							<tr>
								<td style="width:150px;text-align: center;">��<input type="radio" name="SFSM"
									value="1" title="�Ƿ�����"> &nbsp;��<input type="radio"
									name="SFSM" value="0" checked="checked" title="�Ƿ�����">
									&nbsp;<font color=red>*</font>
								<td class="lc1">������Ŀ</td>
								<td class="lc2"><input type="text" name="SMXM"
									title='������Ŀ' maxlength='4' size="60"></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td class="lc1">��Ҫ��Ʒ</td>
				<td class="lc2" colspan="3"><textarea rows="8" cols="100"
						name="ZYCP" title="��Ҫ��Ʒ" maxlength="1000"></textarea></td>
			</tr>
		</table>
		<br />
		<center>
			<%
				if (SIGN.equals("1")) {
			%>
			<div class="subImgs"
				onclick="window.location.href='<%=Page.getNextPage()[0]%>'">��һҳ</div>
			<%
				} else {
			%>
			<div class="subImgs"
				onclick="if(form1errorCheck()){document.form1.submit();}">��һҳ</div>
			<%
				}
			%>
		</center>
	</form>
	<%@include file="bottom.inc"%>
	<iframe height="0" width="100" name="editframe" src="" id="editframe"
		scrolling="no" border="1" align='center' frameborder="0"></iframe>
</body>
<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
</html>

<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());

	ValueDefault vf = new ValueDefault();
	vf.setFormName("form1");
	ZJ_ZZJGJBXX.setOPENO(OPENO);
	//vf.setFormData("ENTNAME", GA_ZJXX.getENTNAME());

	vf.setData(ZJ_ZZJGJBXX.getData());

	out.print(vf.ValueDefaultScript());
%>

