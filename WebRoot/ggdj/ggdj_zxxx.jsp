<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.system.SysUtility"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq" />
<jsp:useBean id="ggdjMjmc" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjMjmc" />
<jsp:useBean id="ggdjZxxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjZxxx" />
<%
	String SIGN = Page.getSIGN(); //-1数据未保存,1已开业
	String OPENO = Page.getOPENO(); // 业务 主键
	String OPETYPE = Page.getOPETYPE(); // 业务类型
	if (StringUtils.isEmpty(OPENO)) {
		OPENO = SysUtility.getUUID20();
		Page.setOPENO(OPENO);
	}
	// 注销信息
	ggdjZxxx.setId(Page.getOPENO());
	ggdjZxxx.loadData();
	String canRea = ggdjZxxx.getCanRea();
	String sqxxId = !StringUtils.isEmpty(Page.getSqxxId()) ? Page.getSqxxId() : ggdjZxxx.getSqxxId();
	Page.setSqxxId(sqxxId);
	// 申请表信息
	ggdjJbxxSq.setId(Page.getSqxxId());
	ggdjJbxxSq.loadDataFromDb(); //从正式库中加载信息
	String entType = SysUtility.doPreProcess(ggdjJbxxSq.getEntType());
	// 媒介材料：
	ggdjMjmc.setSqxxId(Page.getSqxxId());
	ggdjMjmc.queryMediaNameListByMtbIdFromDb(); // 从正式库加载数据
	List mnList = ggdjMjmc.getMediaNameList();
%>
<html>
<head>
<script type="text/javascript">
var sign = '<%=SIGN%>';
var entType = '<%=entType%>';
var canRea = '<%=canRea%>';
</script>
<script type="text/javascript" src="js/ggdj_zxxx.js">
	
</script>
</head>
<body>
	<%@include file="../top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<form id="form1" method="POST" action="ggdj_zxxx_action.jsp"
		target="editframe">
		<input type="hidden" name="id" value="<%=OPENO%>" /> <input
			type="hidden" name="CDDL" value="9" /> <input type="hidden"
			name="sqxxId" value="<%=Page.getSqxxId()%>" /> <input type="hidden"
			name="entName"
			value="<%=SysUtility.doPreProcess(ggdjJbxxSq.getEntName())%>" /> <input
			type="hidden" name="lerep"
			value="<%=SysUtility.doPreProcess(ggdjJbxxSq.getLerep())%>" />
		<table border="1" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td class="yxsm" colspan='4'>单位信息</td>
			</tr>
			<tr>
				<td class="lc1">申请单位名称</td>
				<td class="lc2" align="right"><input type="text" name="entName"
					title="申请单位名称" size="45"
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getEntName())%>'
					disabled="true"><font color="red"> *</font></td>
				<td class="lc1" align="right">单位法定代表人姓名</td>
				<td class="lc2"><input type="text" name="lerep"
					style="width: 150px" title="单位法定代表人姓名" size="20"
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getLerep())%>'
					disabled="true"><font color="red"> *</font></td>
			</tr>
			<tr>
				<td class="lc1">单位实际经营地址</td>
				<td class="lc2"><input type="text" name="address" size="45"
					title="单位实际经营地址"
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getAddress())%>'
					disabled="true"><font color="red"> *</font></td>
				<td class="lc1">单位类型</td>
				<td class="lc2"><select id="entType" name="entType"
					title="单位类型" disabled="true" style="width: 150px">
						<option value="">请选择</option>
						<%=icms.getSysDmList("GGFBDW")%>
				</select><font color="red"> *</font></td>
			</tr>
			<tr>
				<td class="yxsm" colspan='4'>申请从事广告发布的媒介名称</td>
			</tr>

			<%
				for (int i = 0; i < mnList.size(); i++) {
			%>

			<tr>
				<td align="center" class="lc1"><%= i+1 %></td>
				<td class="lc2" colspan="3"><input type="text" name="MJMC"
					size="80" title="媒介材料" disblank maxlength=50
					value='<%=mnList.get(i)%>' disabled="true"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td class="yxsm" colspan='4'>申请登记注销原因</td>
			</tr>
			<tr>
				<td class="lc1" colspan='1'>注销原因</td>
				<td class="lc2" colspan='3'><select id="canRea" name="canRea"  disblank  title = "注销原因"
					style="width: 400px"><option value="">请选择</option><%=icms.getSysDmList("GGFBCANREA")%></select>&nbsp;<font color="red">*</font> </td>
			</tr>
			<br />
		</table>
		<br />
		<center>
			<%
				if (SIGN.equals("0")) {
			%>
			<div class="subImgs" onclick="subForm1();">下一步</div>
			<%
				} else {
			%>
			<div class="subImgs" onclick="window.location.href='ggdj_dotj.jsp'">下一步</div>
			<%
				}
			%>
		</center>
	</form>
	<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
	<%@include file="/bottom.inc"%>
</body>
</html>