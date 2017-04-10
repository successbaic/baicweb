
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.macrosoft.icms.ggdj.GgdjJbxxSq"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Expires", "0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page import="com.macrosoft.icms.ggdj.GgdjBgMtb"%>
<jsp:useBean id="icms" scope="application"
	class="com.macrosoft.icms.system.SysSystem" />
<jsp:useBean id="pageshow" scope="page"
	class="com.macrosoft.icms.system.PageShow" />
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
<jsp:useBean id="ggdjLxrxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjLxrxx" />

<%
	String openo = request.getParameter("openo");
	// 申请人信息
	ggdjLxrxx.setOpeno(openo);
	ggdjLxrxx.loadDataByOpeno();
	// 加载变更业务信息
	GgdjBgMtb bgMtb = new GgdjBgMtb();
	bgMtb.setOpeno(openo);
	bgMtb.loadDataByOpeno();
	String sqxxId = bgMtb.getSqxxId();
	// 加载基本信息
	ggdjJbxxSq.setId(sqxxId);
	ggdjJbxxSq.loadDataFromDb(); //从正式库中加载数据
	// 加载变更信息
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
	//String opfromaf = null;
	//String opfrombe = null;
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
			List<String> mediabeList = ggdjMjmc.queryMediaNameListByMtbIdFromDb(); // 从正式库中加载媒介材料信息
			for (int i = 0; i < mediabeList.size(); i++) {
				Map<String, String> mediaBgMap = new HashMap<String, String>();
				mediaBgMap.put("altbe", mediabeList.get(i));
				mediaBgMap.put("altaf", "");
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
		/* 	String altaf06 = ggdjBgsx6.getAltaf();
			if (!StringUtils.isEmpty(altaf06) && altaf06.indexOf(",") > -1) {
				String[] optime = altaf06.split(",");
				if (optime.length > 1) {
					opfromaf = optime[0];
					optoaf = optime[1];
				} else {
					optoaf = "";
					opfromaf = optime[0];
				}
			} else {
				optoaf = "";
				opfromaf = "";
			}
			String altbe06 = ggdjBgsx6.getAltbe();
			if (!StringUtils.isEmpty(altbe06) && altbe06.indexOf(",") > -1) {
				String[] optime = altbe06.split(",");
				if (optime.length > 1) {
					opfrombe = optime[0];
					optobe = optime[1];
				} else {
					opfrombe = optime[0];
					optobe = "";
				}
			} else {
				optobe = "";
				opfrombe = "";
			} */
			optobe = ggdjBgsx6.getAltbe();
			optoaf = ggdjBgsx6.getAltaf();			
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
		List<String> mediabeList = ggdjMjmc.queryMediaNameListByMtbIdFromDb(); // 从正式库中加载媒介材料信息
		for (int i = 0; i < mediabeList.size(); i++) {
			Map<String, String> mediaBgMap = new HashMap<String, String>();
			mediaBgMap.put("altbe", mediabeList.get(i));
			mediaBgMap.put("altaf", "");
			mediaBgMapList.add(mediaBgMap);
		}

		altaf04 = "";
		altbe04 = ggdjJbxxSq.getEntProp();

		altaf05 = "";
		altbe05 = ggdjJbxxSq.getLerep();

		//opfrombe = SysUtility.doPreProcess(ggdjJbxxSq.getOpfrom());
		optobe = SysUtility.doPreProcess(ggdjJbxxSq.getOpto());
		//opfromaf = "";
		optoaf = "";
	}
%>
<html>
<head>
<link style="text/css" rel="stylesheet" href="css/print.css" />
<%
	out.print(pageshow.pagesetup_default());
%>
<title>广告发布变更登记申请表</title>
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
						&nbsp;&nbsp;&nbsp;&nbsp;3.申请人申请变更广告业务登记，除填写完整本表外，还需提交与变更事项相关的证明文件。<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4.通过网上申请的，上述材料扫描为图片后上传。
				</td>
				</div>
			</table>
			<br /> <br />
			<div align="center">
				<font style="font-weight: bold;">中华人民共和国国家工商行政管理总局制</font>
			</div>
			<div align="center">
				<h2>一、申请变更登记事项</h2>
			</div>
			<br /> <br />
			<div>
				<table>
					<tr>
						<td class="tdLabel" width="30%">项 目</td>
						<td class="tdContent" width="35%">原登记内容</td>
						<td class="tdContent" width="35%">申请变更内容</td>
					</tr>
					<tr>
						<td class="tdLabel">申请单位</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(altbe01)%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess(altaf01)%></td>
					</tr>
					<tr>
						<td class="tdLabel">实际经营地址</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(altbe02)%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess(altaf02)%></td>
					</tr>
					<tr>
						<td class="tdLabel">单位性质</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("DWXZ", altbe04))%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("DWXZ", altaf04))%></td>
					</tr>
					<tr>
						<td class="tdLabel">有效期至</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(optobe)%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess(optoaf)%></td>
					</tr>
					<%
						if (mediaBgMapList == null || mediaBgMapList.size() == 0) {
					%>
					<tr>
						<td class="tdLabel" rowspan="1">申请从事广告发布的媒介名称</td>
						<td class="tdContent"></td>
						<td class="tdContent"></td>
					</tr>
					<%
						}
					%>
					<%
						if (mediaBgMapList != null && mediaBgMapList.size() > 0) {
							Map<String, String> bgMap1 = mediaBgMapList.get(0);
					%>
					<tr>
					<td class="tdLabel" rowspan="<%=mediaBgMapList.size()%>">申请从事广告发布的媒介名称</td>
						<td class="tdContent"><%=SysUtility.doPreProcess((bgMap1.get("altbe")))%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess((bgMap1.get("altaf")))%></td>
					</tr>
					<%
						for (int i = 1; i < mediaBgMapList.size(); i++) {
								Map<String, String> bgMap = mediaBgMapList.get(i);
					%>
					<tr>
						<td class="tdContent"><%=SysUtility.doPreProcess((bgMap.get("altbe")))%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess((bgMap.get("altaf")))%></td>
					</tr>
					<%
						}

						}
					%>

					<tr>
						<td colspan="3">
							<div style="text-align: left;">
								<div style="margin-left: 20px;">法定代表人签字：</div>
							</div> <br /> <br />
							<div style="float: right;">（单位盖章）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<br />
							<div style="float: right;">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</div>
						</td>
					</tr>
				</table>
			</div>
			<div align="left">
				注：1.“申请单位”的单位名称，或单位性质（例如由事业法人转变为企业法人）发生变化的，应当办理广告发布变更申请，重新提交法人资格证明文件。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;2.“媒介批准文件”发生以下变化的，应当办理广告发布变更申请：①与广告发布登记申请单位对应的单位主体发生变化的；②媒介批准文件的有效期限发生变化的；③申请单位认为需要增加或减少从事广告发布业务的媒介的（如只有一个媒介且申请减少的，应办理广告发布注销登记）<br>
			</div>
			<div align="center">
				<h2>二、需提交的材料说明</h2>
			</div>
			<div>
				<table>
					<tr>
						<td align="center" width="10%">序号</td>
						<td align="center" width="35%">材料名称</td>
						<td align="center" width="45%">说明</td>
						<td align="center" width="10%">份数</td>
					</tr>
					<tr>
						<td align="center">1</td>
						<td align="left">变更后的法人资格证明文件</td>
						<td align=""left"">原件复印件</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">2</td>
						<td align="left">变更后的媒介批准文件</td>
						<td align=""left"">原件复印件</td>
						<td align="center"></td>
					</tr>
					<tr>
						<td align="center">3</td>
						<td align="left">变更后的场所使用证明文件</td>
						<td align=""left"">经营场所产权证明或租赁合同（原件复印件）</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">4</td>
						<td align="left">仅办理减少广告发布媒介的变更</td>
						<td align=""left"">只需填写上表，无需提交材料</td>
						<td align="center"></td>
					</tr>
				</table>
			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>