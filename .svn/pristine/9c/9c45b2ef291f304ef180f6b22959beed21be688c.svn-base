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
		<title>网上预约</title>
		<script type="text/javascript">
function doYy(timeCut){
	if($("#dateYy").val()==""){
		alert("请选择预约日期！");
		return;
	}
	if(window.confirm("您确定要预约？")){
		$("#YYRQ").val($("#dateYy").val()+" "+timeCut);
		document.form1.submit();
	}	
}

function doYy2(sjd){
	if(document.form1.YYRQ.value==""){
		alert("请选择预约日期！");
		return;
	}
	if(window.confirm("您确定选择该日期作为预约日期？\n预约后不可修改。")){
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
					网上预约
				</CAPTION>
				<tr>
					<td class="lc1">
						企业名称
					</td>
					<td class="lc2"><%=ywsb.getENTNAME()%></td>
					<td class="lc1">
						法定代表人
					</td>
					<td class="lc2"><%=ywsb.getLEREP()%></td>
				</tr>

				<tr>
					<td class="lc1">
						业务类型
					</td>
					<td class="lc2"><%=icms.getSysDm("OPETYPE", ywsb.getOPETYPE())%></td>
					<td class="lc1">
						当前状态
					</td>
					<td class="lc2">
						<%
							if ("0".equals(YYSTATUS)) {
								out.println("尚未预约");
							} else if ("1".equals(YYSTATUS)) {
								out.println("已预约");
							} else if ("2".equals(YYSTATUS)) {
								out.println("已逾期");
							}
						%>
					</td>
				</tr>
				<tr>
					<td class="lc1">
						办理地点
					</td>
					<td class="lc2"><%=icms.getSysDm("REGORG", REGORG)%>
					</td>
					<td class="lc1">
						预约时间
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
						时间
					</td>
					<td class="lc1">
						最大预约数
					</td>
					<td class="lc1">
						实际预约数
					</td>
					<td class="lc1">
						操作
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
						<input type="button" style="cursor: pointer;" value="预约" onclick="doYy('<%=bean.getTimeCut()%>');" />
						<%
							}else if("1".equals(YYSTATUS)){
						%>
						<input type="button" style="cursor: pointer;" value="重新预约"
							onclick="doYy('<%=bean.getTimeCut()%>');" />
						<%		
							} else if ("2".equals(YYSTATUS)){
						%>
						<input type="button" style="cursor: pointer;" value="逾期预约"
							onclick="doYy('<%=bean.getTimeCut()%>');" />
						<%
							}
									}
								} else {
									if ("0".equals(YYSTATUS)){
						%>
						<input type="button" value="预约" disabled="disabled"
							onclick="javascript:alert('预约');" />
						<%
							}else if("1".equals(YYSTATUS)){
						%>
						<input type="button" value="重新预约" disabled="disabled"
							onclick="javascript:alert('重新预约');" />
						<%
							}else if ("2".equals(YYSTATUS)){
						%>
						<input type="button" value="逾期预约" disabled="disabled"
							onclick="javascript:alert('逾期预约');" />
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
				预约说明
			</CAPTION>
			<tr>
				<td class="lc2">
					&nbsp;&nbsp;&nbsp;&nbsp;1、
					<strong>您可以选择<%=icms.getSysRemark("WSDJ_CFG", "YYGZRS")%>个工作日内的预约。注意：非工作时间不能作为预约日期。</strong>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;2、预约成功后，请携带相关材料到工商局指定的窗口办理具体相关业务。
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;3、如果未在预约时间办理业务可能无法再次预约。
					<strong>如果预约过期，可能无法再次预约。</strong>须在到工商局窗口排队办理业务。
					<br />
				</td>
			</tr>
		</table>
		<br />
	</body>
</html>