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
<%
	String SIGN = Page.getSIGN(); //-1数据未保存,1已开业
	String OPENO = Page.getOPENO(); // ID 主键
	String OPETYPE = Page.getOPETYPE(); // 业务类型
	if (StringUtils.isEmpty(OPENO)) {
		OPENO = SysUtility.getUUID20();
		Page.setOPENO(OPENO);
	}
	// 申请表信息
	ggdjJbxxSq.setId(OPENO);
	ggdjJbxxSq.loadData();
	String entType = SysUtility.doPreProcess(ggdjJbxxSq.getEntType());
	String entProp = SysUtility.doPreProcess(ggdjJbxxSq.getEntProp());
	String mediaLevel = SysUtility.doPreProcess(ggdjJbxxSq.getMediaLevel());
	// 媒介材料
	ggdjMjmc.setSqxxId(OPENO);
	ggdjMjmc.queryMediaNameListByMtbId();
	List mnList = ggdjMjmc.getMediaNameList();
%>
<html>
<head>
<script type="text/javascript">
var sign = '<%=SIGN%>';
var entType = '<%=entType%>';
var entProp = '<%=entProp%>';
var mediaLevel = '<%=mediaLevel%>';
</script>
<script type="text/javascript" src="js/ggdj_jbxx.js">
	
</script>
</head>
<body>
	<%@include file="../top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<form id="form1" name="form1" method="POST"
		action="ggdj_jbxx_action.jsp" target="editframe">
		<input type="hidden" name="id" value="<%=OPENO%>"> <input
			type="hidden" name="CDDL" value="9">
		<table border="1" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td class="yxsm" colspan='4'>单位信息</td>
			</tr>
			<tr>
				<td class="lc1"  width="15%">申请单位名称</td>
				<td class="lc2" colspan='3' align="right"><input id="entName"
					style="width: 500px" type="text" name="entName" title="申请单位名称"
					size="50" maxlength=50 disblank
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getEntName())%>'><font
					color="red"> *</font></td>
			</tr>
			<tr>
			<tr>
				<td class="lc1">单位类型</td>
				<td class="lc2"><select id="entType" name="entType"
					title="单位类型" style="width: 200px" disblank>
						<option value="">请选择</option>
						<%=icms.getSysDmList("GGFBDW")%>
				</select><font color="red"> *</font></td>
				<td class="lc1"  width="15%">单位性质</td>
				<td class="lc2"><select id="entProp" name="entProp"
					title="单位性质" style="width: 200px" disblank>
						<option value="">请选择</option><%=icms.getSysDmList("DWXZ")%>
				</select><font color="red"> *</font></td>
			</tr>
			<tr>
				<td class="lc1" align="right">单位法定代表人姓名</td>
				<td class="lc2"><input id="lerep" type="text" name="lerep"
					style="width: 200px" style="width: 150px" title="单位法定代表人姓名"
					size="20" maxlength=20 disblank
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getLerep())%>'><font
					color="red"> *</font></td>
				<td class="lc1">媒体级别</td>
				<td class="lc2"><select id="mediaLevel" name="mediaLevel"
					title="媒体级别" style="width: 200px" disblank>
						<option value="">请选择</option><%=icms.getSysDmList("MTJB")%>
				</select><font color="red"> *</font></td>
				<!-- 				<td class="lc1" align="right">编号</td>
				<td class="lc2"><input id="lerep" type="text" name="serialNo"
					style="width: 200px" style="width: 150px" title="编号" size="20"
					maxlength=20 disblank value=''><font color="red"> *</font></td> -->
			</tr>
			<tr>
				<td class="lc1" align="right">有效期至</td>
				<td class="lc2" colspan='3'><input type="text" name="opto"
					size="20" title='有效期限至' disblank class="Wdate"
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getOpto())%>'
					onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy年MM月dd日'})"
					readonly>
				</td>
			</tr>
			<tr>
				<td class="lc1">单位实际经营地址</td>
				<td class="lc2" colspan="3"><input id="address"
					style="width: 500px" type="text" name="address" size="45"
					title="单位实际经营地址" disblank maxlength=50
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getAddress())%>'><font
					color="red"> *</font></td>
			</tr>
			<tr>
				<td class="yxsm" colspan='4'>申请从事广告发布的媒介名称</td>
			</tr>
			<tr>
				<%
					if ("0".equals(SIGN)) {
				%>
				<td class="lc1" colspan='4'><input class="button" type="button"
					onclick="addRow(this);" value="增加"></td>
				<%
					}
				%>
				<%
					for (int i = 0; i < mnList.size(); i++) {
				%>
			
			<tr>
				<td class="lc2" colspan="3"><input type="text" name="MJMC"
					size="80" title="媒介材料" disblank maxlength=50 style="width: 400px"
					value='<%=mnList.get(i)%>'>&nbsp;<font color="red">*</font>
			<%
				if ("0".equals(SIGN)) {
			%>
			<td align="center" class="lc1"><input class="button"
				type="button" onclick="delRow(this);" value="删除"></input></td>
			<%
				} else {
			%>

			<td align="center" class="lc1"></td>
			<%
				}
			%>
			</tr>
			<%
				}
			%>
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
			<div class="subImgs" onclick="window.location.href='ggdj_ryqk.jsp'">下一步</div>
			<%
				}
			%>
		</center>
	</form>
	<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
	<%@include file="/bottom.inc"%>
</body>
</html>

