<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="QYDJ_SQWT" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ" />
<jsp:useBean id="GTDJ_JBXX" scope="page"  class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"/>
<html>
	<head>
		<title>指定代表或者共同委托代理人的证明</title>
		<script type="text/javascript">
			//验证身份证号
			function checkCerno(){
				var CERTYPE = $("#CERTYPE");
					if("10" == CERTYPE){
					
					
					var cerno = $("#CERNO").val();
					var isValidate = validateIdCard(cerno);
					if(!isValidate){
						alert("非法的身份证号！");
						return false;
					}
				}
				return true;
			}
</script>
	</head>
	<body>
		<%@include file="top.inc"%>
		<%
			String pageheader = Page.pageheader(request.getRequestURI());
			out.println(pageheader);
			String OPENO = Page.getOPENO();
			String SIGN = Page.getSIGN(); //1查看，2修改
			if(!SIGN.equals("1")){
				GTDJ_JBXX.setOPENO(OPENO);
				GTDJ_JBXX.doSelect();
			}
		%>
		<form name="form1" method="POST" action='web/qydj_sqwt_action.jsp'
			target="editframe">
			<input type="hidden" name="OPENO" value=<%=OPENO%>>
			<input type="hidden" name="SIGN" value=0>
			<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
			<input type="hidden" name="action" value="1">
			<br>
			<%@ include file="public/gtdj_sqwt_ini.inc"%>
			<br>
			<CENTER>
			<div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
				<br/>
				数据查询中，请等待...<br/>&nbsp;
			</div>
				<%
					if (SIGN.equals("1")) {
				%>
				<div class="subImgs"
					onclick="window.location.href='<%=Page.getNextPage()[0]%>'">
					下一页
				</div>
				<%
					} else {
				%>
				<div  class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">
					下一页
				</div>
				<%
					}
				%>
			</CENTER>
		</form>
		<iframe height="0" width="100" name="editframe" src="" id="editframe"
			scrolling="no" border="1" align='center' frameborder="0"></iframe>
		<%@include file="bottom.inc"%>
	</body>
	<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
</html>
<script type="text/javascript">
function isBenren(){
				var isBenren = window.confirm("如果经营者本人去登记部门办理登记业务，请点【确定】跳过授权委托页面，否则请点【取消】并填写授权委托信息");
				if(!isBenren){
					//var checked = form1errorCheck();
					//if(checked){
					//	document.form1.submit();
					//}
				}else{
					window.location.href="<%=Page.getNextPage()[0]%>";
				}
			}
</script> 
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.dateOrderCheck("CONFROM", "CONTO", "有效期限终止日期应该大于等于起始日期!");
	ec.FormErrorCheck();
	ec.setUserFunction("checkCerno()");
	out.print(ec.ErrorCheckScript());
	
	ValueDefault vf = new ValueDefault();
	
	vf.setFormName("form1");
	
	if (!SIGN.equals("1")) {
		vf.setUserFunction("isBenren()");
	}
		QYDJ_SQWT.setOPENO(OPENO);
		vf.setData(QYDJ_SQWT.getData());
		out.print(vf.ValueDefaultScript());
%>

