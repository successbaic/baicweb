<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.system.SysUtility"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjLxrxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjLxrxx" />
<%
	String SIGN = Page.getSIGN(); //-1数据未保存,1已开业
	String OPENO = Page.getOPENO(); // ID 主键
	String OPETYPE = Page.getOPETYPE(); // 业务类型
	if (StringUtils.isEmpty(OPENO)) {
		OPENO = SysUtility.getUUID20();
		Page.setOPENO(OPENO);
	}
	ggdjLxrxx.setOpeno(Page.getOPENO());
	ggdjLxrxx.loadDataByOpeno();
	String sign = Page.getSIGN();
%>
<html>
<head>
<script type="text/javascript" src="js/ggdj_lxrxx.js">
	
</script>
<script type="text/javascript">
	var sign = '<%=sign%>';
</script>
</head>
<body>
	<%@include file="../top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<form id="form1" name="form1" method="POST"
		action="ggdj_lxrxx_action.jsp" target="editframe">
		<input type="hidden" name="id" value="<%=ggdjLxrxx.getId()%>">
		<table border="1" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td class="yxsm" colspan='4'>申请人信息</td>
			</tr>
			<tr>
				<td class="lc1">单位名称</td>
				<td class="lc2" align="right"><input id="comName"
					style="width: 200px" type="text" name="comName" title="单位名称"
					size="50" maxlength=50 disblank
					value='<%=SysUtility.doPreProcess(ggdjLxrxx.getComName())%>'><font
					color="red"> *</font></td>
				<td class="lc1">申请日期</td>
				<td class="lc2"><input type="text" name="appTime" size="15"
					title='申请日期' class="Wdate"
					value='<%=SysUtility.doPreProcess(ggdjLxrxx.getAppTime())%>'
					style="width: 200px"
					onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy年'})"
					readonly></td>
			</tr>
			<tr>
				<td class="lc1" align="right">联系人</td>
				<td class="lc2"><input id="lerep" type="text" name="linkMan"
					style="width: 200px" style="width: 150px" title="联系人" size="20"
					maxlength=20 disblank 
					value='<%=SysUtility.doPreProcess(ggdjLxrxx.getLinkMan())%>'><font
					color="red"> *</font></td>

				<td class="lc1" align="right">联系方式</td>
				<td class="lc2"><input id="lerep" type="text" name="linkType"
					style="width: 200px" style="width: 150px" title="联系方式" size="20"
					maxlength=20 disblank
					value='<%=SysUtility.doPreProcess(ggdjLxrxx.getLinkType())%>'><font
					color="red"> *</font></td>
			</tr>
		</table>
		<font color="red">&nbsp;&nbsp;*说明：申请日期指纸质材料提交当天日期</font> <br />
		<center>
			<%
				if (SIGN.equals("0")) {
			%>
			<div class="subImgs" onclick="subForm1();">下一步</div>
			<%
				} else {
			%>
			<div class="subImgs"
				onclick="window.location.href='<%=Page.getNextPage()[0]%>'">下一步</div>
			<%
				}
			%>
		</center>
	</form>
	<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
	<%@include file="/bottom.inc"%>
</body>
</html>

