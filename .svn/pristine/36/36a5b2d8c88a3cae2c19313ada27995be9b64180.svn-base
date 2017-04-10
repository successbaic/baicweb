<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow"%>
<%@ page import="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"%>
<%@ include file="/jspheader.inc"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
	<head>
		<style type="text/css">
a:link {
	color: #FF0000;
	text-decoration: underline;
}

a:visited {
	color: #AB3C37;
	text-decoration: none;
}

a:hover {
	color: #000000;
	text-decoration: none;
}

a:active {
	color: #FFFFFF;
	text-decoration: none;
}
</style>
		<title>名称登记</title>
		<%
			MCGL_JBXX_SQ ywsb = new MCGL_JBXX_SQ();
								ywsb.setOPENO(Page.getOPENO());
								ywsb.doSelect();
			String pregorg = ywsb.getPREREGORG();
			String gss = ywsb.getLOCALADM();
			String entclass = ywsb.getENTCLASS();
			String pregorgText;
			pregorgText = icms.getSysDm("REGORG", pregorg);
		 %>
		<script type="text/javascript">
			function goback(){
				window.location.href="mcgl_jbxx.jsp";
			}
			function onBeforeSub(){
				var isAgree=$('input:radio[name="isAgree"]:checked').val();
				if(isAgree == "1"){
					if(window.confirm("请确认信息填报准确，提交后数据不能再进行修改。\n\n预审通过后请进入【已办业务查询】中打印申请书。\n\n预审驳回后可以对填写信息进行修改，重新申报。\n\n确定要提交至工商局预审吗？")){
						document.form1.submit();
					}
				}else{
					alert("请同意提交的材料真实有效！");
				}	
			}
		</script>
	</head>
	<body>
		<%@include file="/top.inc"%>
		<%
			StepShow stepShow = new StepShow();
			out.println(stepShow.getStep("4", Page.getDL() + Page.getOPETYPE(),
					Page.getOPENO()));
		%>
		<br />
		<form name="form1" method="post" action="mcgl_dotj_action.jsp"
			target="editframe">
			<table width="600px" align="center"
				style="border-color: #A1C3E7; background-color: #F6F9FF;" border="1">
				<tr>
					<td height="120px" valign="top"
						style="line-height: 40px; border: 0px;">
						<center>
							<strong> <font color="red" style="font-size: 21px;">
									说&nbsp;明 </font> </strong>
						</center>
						&nbsp;&nbsp;
						<%
							if (Page.getSIGN().equals("1")) {
								String STATUS = ywsb.getNAMESTATUS();
								if (STATUS.equals("4")) {
						%>
						当前业务信息已核准通过，请返回
						<a href='<%=webPath%>/content.jsp' style=""> 已办业务查询 </a>，打印申请书及通知书，然后携带相关材料，前往工商局办理业务。
						<%
							} else {
						%>
						当前业务信息已提交至<%=pregorgText %>，请耐心等待工作人员的预审及核准，
						<font color="red">预审及核准期间数据不能再进行修改</font>。核准通过后,请重新登陆系统，进入【已办业务查询】中打印申请书。预审驳回后可以对填写信息进行修改，重新申报！
						<%
							}
						%>
						<%
							} else {
						%>
						请确认信息填报准确，数据提交至<%=pregorgText %>后，请耐心等待工作人员的预审及核准，
						<font color="red">预审及核准期间数据不能再进行修改</font>。核准通过后请进入【已办业务查询】中打印申请书。预审驳回后可以对填写信息进行修改，重新申报！

						<%
							}
						%>
					</td>
				</tr>
				<%
					if (!(Page.getSIGN().equals("1"))) {
				%>
				<tr>
					<td height="60px" valign="top"
						style="line-height: 40px; border: 0px;">
						<center>
							<strong> <font color="red" style="font-size: 19px;">
									承诺声明 </font> </strong>
						</center>
					</td>
				</tr>
				<tr>
					<td style="border: 0px">
						<font color="red">&nbsp;&nbsp;本企业依照企业登记相关法律法规，申请相关业务，承诺提交材料真实有效。</font>
					</td>
				</tr>

				<tr>
					<td align="center" style="height: 40px;">
						<input type="radio" name="isAgree" value="1" checked="checked">
						同意
						<input type="radio" name="isAgree" value="0">
						不同意
					</td>
				</tr>
				<tr>
					<td align="center" height="40px">
						<div style="margin-top: 20px;">
							<div onclick="onBeforeSub();"
								style="float: left; margin-left: 180px; cursor: pointer; width: 114px; height: 34px;">
								<img src="<%=request.getContextPath()%>/images/submit.png"
									style="width: 114px; height: 34px;" />
								<font
									style="position: relative; top: -30px; font-family: cursive;">
									提交工商局 </font>
							</div>
							<div onclick="goback();"
								style="float: left; margin-left: 10px; cursor: pointer; width: 114px; height: 34px;">
								<img src="<%=request.getContextPath()%>/images/submit.png"
									style="cursor: pointer;" />
								<font
									style="position: relative; top: -30px; left: 0px; font-family: cursive;">
									返回修改 </font>
							</div>
						</div>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<IFRAME height="350" width="100%" name="editframe" src=""
				id="editframe" scrolling="no" border="0" align="middle"
				frameborder="0"></IFRAME>
			<%@include file="/bottom.inc"%>
	</body>
</html>
