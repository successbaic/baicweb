<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" %>
<%@ include file="/jspheader.inc"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<html>
	<head>
		<title>
			提交申请
		</title>
	</head>
	<body>
		<%@include file="/top.inc"%>
		<%StepShow stepShow = new StepShow();
		String num="4";
		//if(Page.getOPETYPE().equals("20")){
		//num="3";
		//}
			out.println(stepShow.getStep(num, Page.getDL()+Page.getOPETYPE(),Page.getOPENO()));
		%>
		<br/>
		<form name="form1" method="post" action="ggdj_dotj_action.jsp" target="editframe">
		<table width="600px" align="center" style="border-color:#A1C3E7;background-color: #F6F9FF;" border="1">
			<tr>
				<td height="220px" valign="top" style="line-height:40px">
					<center>
						<strong>
							<font color="red" style="font-size:22px">
								说 &nbsp; 明
							</font>
						</strong>
					</center>
					&nbsp;&nbsp; 
					<%
					if(Page.getSIGN().equals("1")){
					QYDJ_YWSB_SQ ywsb=new QYDJ_YWSB_SQ();
					ywsb.setOPENO(Page.getOPENO());
					ywsb.doSelect();
					String STATUS=ywsb.getSTATUS();
					if(STATUS.equals("1")){
					%>
					当前业务信息已提交至工商局，请耐心等待工商局工作人员的预审，预审期间数据不能再进行修改。预审通过后请进入【已办业务查询】中打印申请书。预审驳回后需要重新填写信息！
					<%
					}else if(STATUS.equals("2") || STATUS.equals("4")){
					%>
					当前业务信息已预审通过，请返回<a href='content.jsp'> 已办业务查询 </a>，打印申请书及通知书，然后携带相关材料，前往工商局办理业务。
					<%
					}
					%>
					
					<%
					}else{
					%>
					请确认信息填报准确，数据提交至工商局后，请耐心等待工商局工作人员的预审，预审期间数据不能再进行修改。预审通过后请进入【已办业务查询】中打印申请书。预审驳回后需要重新填写信息！
					<%}%>
				</td>
			</tr>
			<tr>
				<td align="center" height="40px">
					<%
					if(Page.getSIGN().equals("1")){
					
					}else{%>
					<img src="../images/sub.gif" style="cursor:pointer" onclick="document.form1.submit()">
					<%}%>
				</td>
			</tr>
			
		</table>
		<IFRAME height="350" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="0" align="middle"  frameborder="0"></IFRAME>		
		<%@include file="/bottom.inc"%>
	</body>
</html>
