<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.system.SysUtility"%>
<%@page import="com.macrosoft.icms.ggdj.GgdjBgMtb"%>
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq" />
<jsp:useBean id="ggdjMjmc" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjMjmc" />
<jsp:useBean id="ggdjBgsx1" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjbgxxSq" />
<jsp:useBean id="ggdjBgsx2" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjbgxxSq" />
<jsp:useBean id="ggdjBgsx3" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjbgxxSq" />
<jsp:useBean id="ggdjBgsx4" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjbgxxSq" />
<jsp:useBean id="ggdjBgsx5" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjbgxxSq" />
<jsp:useBean id="ggdjBgsx6" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjbgxxSq" />
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<title>变更信息</title>
<%
	String SIGN = Page.getSIGN(); //-1数据未保存,1已开业
	String sqxxId = Page.getSqxxId();
	String OPENO = Page.getOPENO();
	//加载申请表信息
	ggdjJbxxSq.setId(sqxxId);
	ggdjJbxxSq.loadDataFromDb();//从正式库加载数据
	// 加载变更业务信息
	GgdjBgMtb bgMtb = new GgdjBgMtb();
	bgMtb.setOpeno(OPENO);
	bgMtb.loadDataByOpeno();
	boolean altitem01 = false;
	boolean altitem02 = false;
	boolean altitem03 = false;
	boolean altitem04 = false;
	boolean altitem05 = false;
	boolean altitem06 = false;
	String altaf01 = null;
	String altbe01 = null;
	String altbe02 = null;
	String altaf02 = null;
	List<Map<String, String>> mediaBgMapList = null;
	String altbe04 = null;
	String altaf04 = null;
	String altbe05 = null;
	String altaf05 = null;
	// 变更有限期限
	//	String opfromaf = null;
	//	String opfrombe = null;
	String optoaf = null;
	String optobe = null;
	if (!StringUtils.isEmpty(bgMtb.getId())) {
		String bgxxId = bgMtb.getId();
		// 申请单位名称变更：01
		ggdjBgsx1.setBgxxId(bgxxId);
		ggdjBgsx1.setAltitem("01");
		ggdjBgsx1.loadDataByBgxxId();
		if (!StringUtils.isEmpty(ggdjBgsx1.getId())) {
			altaf01 = ggdjBgsx1.getAltaf();
			altitem01 = true;
			altbe01 = ggdjBgsx1.getAltbe();
		} else {
			altaf01 = "";
			altitem01 = false;
			altbe01 = ggdjJbxxSq.getEntName();
		}
		// 申请单位地址变更：02
		ggdjBgsx2.setBgxxId(bgxxId);
		ggdjBgsx2.setAltitem("02");
		ggdjBgsx2.loadDataByBgxxId();
		if (!StringUtils.isEmpty(ggdjBgsx2.getId())) {
			altaf02 = ggdjBgsx2.getAltaf();
			altbe02 = ggdjBgsx2.getAltbe();
			altitem02 = true;
		} else {
			altaf02 = "";
			altbe02 = ggdjJbxxSq.getAddress();
			altitem02 = false;
		}
		// 媒介名称变更：03
		ggdjBgsx3.setBgxxId(bgxxId);
		ggdjBgsx3.setAltitem("03");
		ggdjBgsx3.loadDataByBgxxId();
		if (!StringUtils.isEmpty(ggdjBgsx3.getId())) {
			altitem03 = true;
			mediaBgMapList = ggdjBgsx3.queryMediaMapList();
		} else {
			mediaBgMapList = new ArrayList<Map<String, String>>();
			altitem03 = false;
			ggdjMjmc.setSqxxId(sqxxId);
			List<String> mediabeList = ggdjMjmc.queryMediaNameListByMtbIdFromDb(); //从正式库加载数据
			for (int i = 0; i < mediabeList.size(); i++) {
				Map<String, String> mediaBgMap = new HashMap<String, String>();
				mediaBgMap.put("altbe", mediabeList.get(i));
				mediaBgMap.put("altaf", mediabeList.get(i));
				mediaBgMapList.add(mediaBgMap);
			}
		}
		// 申请单位性质变更：04
		ggdjBgsx4.setBgxxId(bgxxId);
		ggdjBgsx4.setAltitem("04");
		ggdjBgsx4.loadDataByBgxxId();
		if (!StringUtils.isEmpty(ggdjBgsx4.getId())) {
			altitem04 = true;
			altaf04 = ggdjBgsx4.getAltaf();
			altbe04 = ggdjBgsx4.getAltbe();
		} else {
			altitem04 = false;
			altaf04 = "";
			altbe04 = ggdjJbxxSq.getEntProp();
		}
		// 法人变更：05
		ggdjBgsx5.setBgxxId(bgxxId);
		ggdjBgsx5.setAltitem("05");
		ggdjBgsx5.loadDataByBgxxId();
		if (!StringUtils.isEmpty(ggdjBgsx5.getId())) {
			altitem05 = true;
			altaf05 = ggdjBgsx5.getAltaf();
			altbe05 = ggdjBgsx5.getAltbe();
		} else {
			altitem05 = false;
			altaf05 = "";
			altbe05 = ggdjJbxxSq.getLerep();
		}
		// 有效期限变更：06
		ggdjBgsx6.setBgxxId(bgxxId);
		ggdjBgsx6.setAltitem("06");
		ggdjBgsx6.loadDataByBgxxId();
		if (!StringUtils.isEmpty(ggdjBgsx6.getId())) {
			altitem06 = true;
			optoaf = ggdjBgsx6.getAltaf();
			optobe = ggdjBgsx6.getAltbe();
			
			/* String altaf06 = ggdjBgsx6.getAltaf();
			if (!StringUtils.isEmpty(altaf06) && altaf06.indexOf(",") > -1) {
				String[] optime = altaf06.split(",");
				if (optime.length > 1) {
					//	opfromaf = optime[0];
					optoaf = optime[1];
				} else {
					optoaf = "";
					//	opfromaf = optime[0];
				}
			} else {
				optoaf = "";
				//	opfromaf = "";
			}
			String altbe06 = ggdjBgsx6.getAltbe();
			if (!StringUtils.isEmpty(altbe06) && altbe06.indexOf(",") > -1) {
				String[] optime = altbe06.split(",");
				if (optime.length > 1) {
					//	opfrombe = optime[0];
					optobe = optime[1];
				} else {
					//	opfrombe = optime[0];
					optobe = "";
				}
			} else {
				optobe = "";
				//	opfrombe = "";
			} */
		} else {
			altitem06 = false;
			//	opfrombe = SysUtility.doPreProcess(ggdjJbxxSq.getOpfrom());
			optobe = SysUtility.doPreProcess(ggdjJbxxSq.getOpto());
			//	opfromaf = "";
			optoaf = "";
		}
	} else {
		altaf01 = "";
		altbe01 = ggdjJbxxSq.getEntName();

		altaf02 = "";
		altbe02 = ggdjJbxxSq.getAddress();

		mediaBgMapList = new ArrayList<Map<String, String>>();
		ggdjMjmc.setSqxxId(sqxxId);
		List<String> mediabeList = ggdjMjmc.queryMediaNameListByMtbId();
		for (int i = 0; i < mediabeList.size(); i++) {
			Map<String, String> mediaBgMap = new HashMap<String, String>();
			mediaBgMap.put("altbe", mediabeList.get(i));
			mediaBgMap.put("altaf", mediabeList.get(i));
			mediaBgMapList.add(mediaBgMap);
		}

		altaf04 = "";
		altbe04 = ggdjJbxxSq.getEntProp();

		altaf05 = "";
		altbe05 = ggdjJbxxSq.getLerep();

		//	opfrombe = SysUtility.doPreProcess(ggdjJbxxSq.getOpfrom());
		optobe = SysUtility.doPreProcess(ggdjJbxxSq.getOpto());
		//	opfromaf = "";
		optoaf = "";
	}
%>
<script type="text/javascript" src="js/ggdj_bgsx.js">	
</script>
<script type="text/javascript">
var entProBe = '<%=SysUtility.doPreProcess(altbe04)%>';
var entProAf = '<%=SysUtility.doPreProcess(altaf04)%>';
var sign = '<%=SIGN%>';
</script>
<body>
	<%@include file="../top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<form name="form1" method="POST" action="ggdj_bgsx_action.jsp"
		target="editframe">
		<table border="1" width="100%">
			<caption>变更登记事项</caption>
			<tr>
				<td class="yxsm" align="center" colspan="2">项目</td>
				<td class="yxsm" align="center">原登记事项</td>
				<td class="yxsm" align="center">申请变更登记事项</td>
			</tr>
			<tr>
				<td class="lc1"><input name="ALTITEM" value="01"
					type="checkbox" onclick="setvalue(this)" <%if (altitem01) {%>
					checked="checked" <%}%>></td>
				<td class='lc1'>申请单位名称</td>
				<td class='lc2'><input type="text" name="ALTBE01" disabled
					title="申请单位名称变更前内容" value="<%=SysUtility.doPreProcess(altbe01)%>"></td>
				<td class='lc2'><input type="text" size="50" name="ALTAF01"
					maxlength='50' title="申请单位名称变更后内容" disblank
					value="<%=SysUtility.doPreProcess(altaf01)%>" <%if (!altitem01) {%>
					disabled="disabled" <%}%>></td>
			</tr>
			<tr>
				<td class="lc1"><input name="ALTITEM" value="04"
					type="checkbox" onclick="setvalue(this)" <%if (altitem04) {%>
					checked="checked" <%}%>></td>
				<td class='lc1'>申请单位性质</td>
				<td class='lc2'><select id="entProBe" name="ALTBE04" disabled><option
							value="">请选择</option><%=icms.getSysDmList("DWXZ")%>
				</select>
				<td class='lc2'><select id="entProAf" name="ALTAF04" disblank
					title="申请单位性质变更后内容" <%if (!altitem04) {%> disabled="disabled" <%}%>><option
							value="">请选择</option><%=icms.getSysDmList("DWXZ")%></select></td>
			</tr>
			<tr>
				<td class='lc1'><input name="ALTITEM" value="05"
					type="checkbox" onclick="setvalue(this)" <%if (altitem05) {%>
					checked="checked" <%}%>></td>
				<td class='lc1'>法定代表人</td>
				<td class='lc2'><input type="text" size="45" name="ALTBE05"
					disabled title="法定代表人变更前内容"
					value="<%=SysUtility.doPreProcess(altbe05)%>"></td>
				<td class='lc2'><input type="text" size="45" name="ALTAF05"
					disblank title="法定代表人变更后内容"
					value="<%=SysUtility.doPreProcess(altaf05)%>" maxlength='50'
					<%if (!altitem05) {%> disabled="disabled" <%}%>></td>
			</tr>
			<tr>
				<td class='lc1'><input name="ALTITEM" value="06"
					type="checkbox" onclick="setvalue(this)" <%if (altitem06) {%>
					checked="checked" <%}%>></td>
				<td class='lc1'>有效期至</td>
				<td class='lc2'><input type="text" name="optobe" size="20"
					title='变更前有效期限至' class="Wdate"
					value='<%=SysUtility.doPreProcess(optobe)%>'
					onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy年MM月dd日'})"
					disabled></td>
				<td class='lc2'><input type="text" name="optoaf" size="20"
					readonly title='变更后有效期限至' disblank class="Wdate"
					value='<%=SysUtility.doPreProcess(optoaf)%>'
					onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy年MM月dd日'})"
					<%if (!altitem06) {%> disabled="disabled" <%}%>></td>
			</tr>
			<tr>
				<td class='lc1'><input name="ALTITEM" value="02"
					type="checkbox" onclick="setvalue(this)" <%if (altitem02) {%>
					checked="checked" <%}%>></td>
				<td class='lc1'>实际经营地址</td>
				<td class='lc2'><input type="text" size="45" name="ALTBE02"
					disabled title="实际经营地址变更前内容"
					value="<%=SysUtility.doPreProcess(altbe02)%>" diabled></td>
				<td class='lc2'><input type="text" size="45" name="ALTAF02"
					disblank title="实际经营地址变更后内容"
					value="<%=SysUtility.doPreProcess(altaf02)%>" maxlength='50'
					<%if (!altitem02) {%> disabled="disabled" <%}%>></td>
			</tr>
			<tr>
				<td class='lc1'><input name="ALTITEM" value="03"
					onclick="setvalue(this)" type="checkbox" <%if (altitem03) {%>
					checked="checked" <%}%>></td>
				<td class='lc1'>媒介批准文件</td>
				<td class='lc1' colspan="2"><input class="button" type="button"
					id="addButton" onclick="addRow(this);" value="新增" align="center"
					<%if (!altitem03) {%> disabled="disabled" <%}%>></td>
				</td>
			</tr>
			<%
				for (int i = 0; i < mediaBgMapList.size(); i++) {
					Map<String, String> mediaMap = mediaBgMapList.get(i);
			%>
			<tr>
				<td class='lc1'></td>
				<td class='lc1'></td>
				<td class='lc2'><input type="text" size="45" name="mediabe"
					title="变更前媒介名称"
					value="<%=SysUtility.doPreProcess(mediaMap.get("altbe"))%>"
					disabled></td>
				<td><input type="text" size="45" name="mediaaf" title="变更后媒介名称"
					disblank maxlength='50'
					value="<%=SysUtility.doPreProcess(mediaMap.get("altaf"))%>"
					<%if (!altitem03) {%> disabled="disabled" <%}%>> <%
 	if (StringUtils.isEmpty(mediaMap.get("altbe"))) {
 %><input name="delRowBtn" class="button" type="button"
					onclick="delRow(this);" value="删除"></input> <%
 	}
 %></td>
			</tr>
			<%
				}
			%>

		</table>
		<br>
		<CENTER>
			<div id="waitdiv" style="display: none">
				<img src="../images/blue-loading.gif"> <br /> 数据查询中，请等待...<br />&nbsp;
			</div>
			<%
				if (SIGN.equals("1")) {
			%>
			<div class="subImgs"
				onclick="window.location.href='<%=Page.getNextPage()[0]%>'">下一页</div>
			<%
				} else {
			%>
			<div class="subImgs" id="subid" onclick="doSub()">下一页</div>
			<%
				}
			%>
		</CENTER>

	</form>
	<IFRAME height="0" width="0" name="editframe" id="editframe"></IFRAME>
	<%@include file="../bottom.inc"%>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf = new ValueDefault();
	vf.setFormName("form1");
%>