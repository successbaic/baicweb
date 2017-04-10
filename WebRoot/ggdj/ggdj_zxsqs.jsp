
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Expires", "0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="icms" scope="application"
	class="com.macrosoft.icms.system.SysSystem" />
<jsp:useBean id="pageshow" scope="page"
	class="com.macrosoft.icms.system.PageShow" />
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq" />
<jsp:useBean id="ggdjMjmc" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjMjmc" />
<jsp:useBean id="ggdjZxxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjZxxx" />
<jsp:useBean id="ggdjLxrxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjLxrxx" />
<%
	String openo = request.getParameter("openo");
	// 加载注销信息
	ggdjZxxx.setId(openo);
	ggdjZxxx.loadData();
	String sqxxId = ggdjZxxx.getSqxxId();

	// 加载基本信息
	ggdjJbxxSq.setId(sqxxId);
	ggdjJbxxSq.loadDataFromDb(); //从正式库中加载数据

	// 加载媒介信息
	ggdjMjmc.setSqxxId(sqxxId);
	List<String> mediaList = ggdjMjmc.queryMediaNameListByMtbIdFromDb();

	// 加载联系人信息
	ggdjLxrxx.setOpeno(openo);
	ggdjLxrxx.loadDataByOpeno();
%>
<html>
<head>
<link style="text/css" rel="stylesheet" href="css/print.css" />
<%
	out.print(pageshow.pagesetup_default());
%>
<title>广告发布注销登记申请表</title>
</head>
<body onload="pagesetup_default()" style="width: 100%; height: 100%;">
	<div style="text-align: right;" class="noPrint">
		<div>
			<input type="button" value="打印申请书" onclick="window.print();">
			<input name=back type="button" value="关   闭"
				onclick="window.close();">
		</div>
		<div>
			<font color="red" style="font-size: 9pt;">
				(请用A4纸打印,在打印之前请在IE->文件->页面设置“中将”页眉"和“页脚”清空) </font>
		</div>
	</div>
	<div style="width: 100%; height: 100%; text-align: center;">
		<div class="title">广告发布变更登记申请表</div>
		<div class="printWidth">
			<table class="noBorder">
				<tr>
					<td class="tdLable" width="25%">单位名称</td>
					<td colspan="3" width="75%"><%=SysUtility.doPreProcess(ggdjLxrxx.getComName())%></td>
				</tr>
				<tr>
					<td class="tdLable">申请日期</td>
					<td colspan="3" width="75%"><%=SysUtility.doPreProcess(ggdjLxrxx.getAppTime())%></td>
				</tr>
				<tr>
					<td width="25%" class="tdLable">联系人</td>
					<td width="25%"><%=SysUtility.doPreProcess(ggdjLxrxx.getLinkMan())%></td>
					<td width="25%" class="tdLable">联系方式</td>
					<td width="25%"><%=SysUtility.doPreProcess(ggdjLxrxx.getLinkType())%></td>
				</tr>
			</table>
			<br /> <br />
			<table>
				<td align="left">
					<div align="center">
						<font style="font-weight: bold;">说 明</font>
					</div>
					<div align="left">
						&nbsp;&nbsp;&nbsp;&nbsp;1.在签署文件和填表前，申请人应当已阅读《中华人民共和国行政许可法》、《中华人民共和国广告法》、国家工商总局《广告发布登记管理规定》等法律、法规和规章，确知相关权利和义务。
						<br>&nbsp;&nbsp;&nbsp;&nbsp;2.申请人对提交材料的合法性、有效性、真实性承担责任。<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3.申请人申请注销广告业务登记，需填写单位基本情况及申请注销登记原因，无需提交其他材料。<br>
				</td>
				</div>
			</table>
			<br /> <br />
			<div align="center">
				<font style="font-weight: bold;">中华人民共和国国家工商行政管理总局制</font>
			</div>
			<div align="center">
				<h2>一、单位基本情况</h2>
			</div>
			<br /> <br />
			<div>
				<table>
					<tr>
						<td class="tdLabel" width="35%">单位名称</td>
						<td class="tdContent" width="65%"><%=SysUtility.doPreProcess(ggdjJbxxSq.getEntName())%></td>
					</tr>
					<tr>
						<td class="tdLabel">单位法定代表人姓名</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(ggdjJbxxSq.getLerep())%></td>
					</tr>
					<tr>
						<td class="tdLabel">单位实际经营地址</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(ggdjJbxxSq.getAddress())%></td>
					</tr>

					<%
						if (mediaList == null || mediaList.size() == 0) {
					%>
					<tr>
						<td class="tdLabel" rowspan="1">原申请从事广告发布的 媒介名称</td>
						<td class="tdContent"></td>
					</tr>
					<%
						}
					%>
					<%
						if (mediaList != null && mediaList.size() > 0) {
					%>
					<tr>
						<td class="tdLabel" rowspan=<%=mediaList.size()%>>原申请从事广告发布的
							媒介名称</td>
						<td class="tdContent"><%=mediaList.get(0)%></td>
					</tr>
					<%
						for (int i = 1; i < mediaList.size(); i++) {
					%>
					<tr>

						<td class="tdContent"><%=mediaList.get(i)%></td>
					</tr>
					<%
						}
						}
					%>
				</table>
			</div>
			<div align="center">
				<h2>二、申请注销登记原因</h2>
			</div>
			<div>
				<table>
					<tr>
						<td colspan="3"><br /> <br />
							<div style="text-align: left;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=SysUtility.doPreProcess(icms.getSysDm("GGFBCANREA", ggdjZxxx.getCanRea()))%>
							</div> <br /> <br />

							<div style="text-align: left;">
								<div style="float: right;">法定代表人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							</div> <br>
							<div style="float: right;">（单位盖章）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<br />
							<div style="float: right;">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</div>
						</td>
					</tr>
				</table>
			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>