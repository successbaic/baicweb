<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_RECODERS"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER_LS"%>
<%@ page import="com.macrosoft.icms.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ include file="/jspheader.inc"%>
<html>
	<head>
		<title>����ԤԼ</title>
		<script type="text/javascript">
function doYy(timeCut){
	if($("#dateYy").val()==""){
		alert("��ѡ��ԤԼ���ڣ�");
		return;
	}
	if(window.confirm("��ȷ��ҪԤԼ��")){
		$("#YYRQ").val($("#dateYy").val()+" "+timeCut);
		document.form1.submit();
	}	
}

function doYy2(sjd){
	if(document.form1.YYRQ.value==""){
		alert("��ѡ��ԤԼ���ڣ�");
		return;
	}
	if(window.confirm("��ȷ��ѡ���������ΪԤԼ���ڣ�\nԤԼ�󲻿��޸ġ�")){
		document.form1.SFYQ.value="Y";
		document.form1.YYSXW.value=sjd;
		document.form1.submit();
	}	
}
$(function(){
	$("#dateYy").bind("input propertychange",function(){
		//$("#YYRQ").val($(this).val());
	 	document.form0.submit();
	});
});
function reflesh(){
 	document.form0.submit();
}
</script>
		<%
			String OPENO = SysUtility.doPreProcess(request
					.getParameter("OPENO"));
			String type = SysUtility.doPreProcess(request
					.getParameter("YYTYPE"));
			String YYSTATUS = SysUtility.doPreProcess(request
					.getParameter("YYSTATUS"));
			String dateYy = SysUtility.doPreProcess(request
					.getParameter("dateYy"));
			if ("".equals(dateYy)) {
				dateYy = DateUtils.getTodayStr(null);
			}
			QYDJ_YWSB_SQ ywsb = new QYDJ_YWSB_SQ();
			ywsb.setOPENO(OPENO);
			ywsb.doSelect();
			String REGORG = ywsb.getREGORG();
			String ENTNAME = ywsb.getENTNAME();

			List<ONLINE_ORDER_RECODERS> list = new ONLINE_ORDER_RECODERS()
					.getOrderNumList(REGORG, dateYy);
		%>
	</head>
	<body>
		<form name="form0" method="POST" action="#">

			<table width="100%" border="1">
				<CAPTION>
					����ԤԼ
				</CAPTION>
				<tr>
					<td class="lc1">
						��ҵ����
					</td>
					<td class="lc2"><%=ywsb.getENTNAME()%></td>
					<td class="lc1">
						����������
					</td>
					<td class="lc2"><%=ywsb.getLEREP()%></td>
				</tr>

				<tr>
					<td class="lc1">
						ҵ������
					</td>
					<td class="lc2"><%=icms.getSysDm("OPETYPE", ywsb.getOPETYPE())%></td>
					<td class="lc1">
						��ǰ״̬
					</td>
					<td class="lc2">
						<%
							if ("0".equals(YYSTATUS)) {
								out.println("��δԤԼ");
							} else if ("1".equals(YYSTATUS)) {
								out.println("��ԤԼ");
							} else if ("2".equals(YYSTATUS)) {
								out.println("������");
							}
						%>
					</td>
				</tr>
				<tr>
					<td class="lc1">
						����ص�
					</td>
					<td class="lc2"><%=icms.getSysDm("REGORG", REGORG)%>
					</td>
					<td class="lc1">
						ԤԼʱ��
					</td>
					<td class="lc2">
						<input type="text" name="dateYy" id="dateYy" value="<%=dateYy%>"
							onclick="dropdowndate(this)" datatype="DATE" readonly="readonly">
					</td>
				</tr>
			</table>
			<br>
		</form>

		<form name="form1" method="POST" action='wsyy_qyxz_aciton.jsp'
			target="editframe">
			<input type="hidden" name="OPENO" value="<%=OPENO%>">
			<input type="hidden" name="YYSTATUS" value="<%=YYSTATUS%>">
			<input type="hidden" name="REGORG" value="<%=REGORG%>">
			<input type="hidden" id="YYRQ" name="YYRQ">
			<input type="hidden" name="YYTYPE" value=<%=type%>>
			<input type="hidden" name="YYSTATUS" value=<%=YYSTATUS%>>
			<table width="100%" border="1">
				<tr>
					<td class="lc1">
						ʱ��
					</td>
					<td class="lc1">
						���ԤԼ��
					</td>
					<td class="lc1">
						ʵ��ԤԼ��
					</td>
					<td class="lc1">
						����
					</td>
				</tr>
				<tr>
					<%
						for (int i = 0; i < list.size(); i++) {
							ONLINE_ORDER_RECODERS bean = list.get(i);
					%>
				
				<tr>
					<td align="center">
						<%=bean.getTimeCut()%>
					</td>
					<td align="center">
						<%=bean.getOrderMaxNum()%>
					</td>
					<td align="center">
						<%=bean.getOrderNum()%>
					</td>
					<td align="center">
						<%
							if (DateUtils.isCanYy(dateYy, bean.getTimeCut(), icms, REGORG)) {
									if (bean.getOrderMaxNum() > bean.getOrderNum()) {
										if ("0".equals(YYSTATUS)) {
						%>
						<input type="button" style="cursor: pointer;" value="ԤԼ" onclick="doYy('<%=bean.getTimeCut()%>');" />
						<%
							}else if("1".equals(YYSTATUS)){
						%>
						<input type="button" style="cursor: pointer;" value="����ԤԼ"
							onclick="doYy('<%=bean.getTimeCut()%>');" />
						<%		
							} else if ("2".equals(YYSTATUS)){
						%>
						<input type="button" style="cursor: pointer;" value="����ԤԼ"
							onclick="doYy('<%=bean.getTimeCut()%>');" />
						<%
							}
									}
								} else {
									if ("0".equals(YYSTATUS)){
						%>
						<input type="button" value="ԤԼ" disabled="disabled"
							onclick="javascript:alert('ԤԼ');" />
						<%
							}else if("1".equals(YYSTATUS)){
						%>
						<input type="button" value="����ԤԼ" disabled="disabled"
							onclick="javascript:alert('����ԤԼ');" />
						<%
							}else if ("2".equals(YYSTATUS)){
						%>
						<input type="button" value="����ԤԼ" disabled="disabled"
							onclick="javascript:alert('����ԤԼ');" />
						<%
							}
								}
						%>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</form>
		<iframe height="0" width="100" name="editframe" src="" id="editframe"
			scrolling="no" border="1" align='center' frameborder="0"></iframe>

		<table width="100%" border="1">
			<CAPTION>
				ԤԼ˵��
			</CAPTION>
			<tr>
				<td class="lc2">
					&nbsp;&nbsp;&nbsp;&nbsp;1��
					<strong>������ѡ��<%=icms.getSysRemark("WSDJ_CFG", "YYGZRS")%>���������ڵ�ԤԼ��ע�⣺�ǹ���ʱ�䲻����ΪԤԼ���ڡ�</strong>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;2��ԤԼ�ɹ�����Я����ز��ϵ����̾�ָ���Ĵ��ڰ���������ҵ��
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;3�����δ��ԤԼʱ�����ҵ������޷��ٴ�ԤԼ��
					<strong>���ԤԼ���ڣ������޷��ٴ�ԤԼ��</strong>���ڵ����ִ̾����ŶӰ���ҵ��
					<br />
				</td>
			</tr>
		</table>
		<br />
	</body>
</html>