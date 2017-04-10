
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
<jsp:useBean id="ggdjLxrxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjLxrxx" />
<jsp:useBean id="ggdjRyqk" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjRyqk" />
<%
	String openo = request.getParameter("openo");
	// 加载基本信息
	ggdjJbxxSq.setId(openo);
	ggdjJbxxSq.loadData();
	// 加载媒介材料信息
	ggdjMjmc.setSqxxId(openo);
	List<String> mediaNameList = ggdjMjmc.queryMediaNameListByMtbId();
	// 申请人信息
	ggdjLxrxx.setOpeno(openo);
	ggdjLxrxx.loadDataByOpeno();
	// 人员情况
	ggdjRyqk.setSqxxid(openo);
	List<Map> ryList = ggdjRyqk.queryDataByMtbId();
%>
<html>
<head>
<link style="text/css" rel="stylesheet" href="css/print.css" />
<%
	out.print(pageshow.pagesetup_default());
%>
<title>广告发布设立登记申请表</title>
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
		<div class="title">广告发布设立登记申请表</div>
		<div class="printWidth">
			<table class="noBorder">
				<tr>
					<td class="tdLable" width="25%">单位名称</td>
					<td class="tdContent" colspan="3" width="75%"><%=SysUtility.doPreProcess(ggdjLxrxx.getComName())%></td>
				</tr>
				<tr>
					<td class="tdLable">申请日期</td>
					<td class="tdContent" colspan="3" width="75%"><%=SysUtility.doPreProcess(ggdjLxrxx.getAppTime())%></td>
				</tr>
				<tr>
					<td width="25%" class="tdLable">联系人</td>
					<td class="tdContent" width="25%"><%=SysUtility.doPreProcess(ggdjLxrxx.getLinkMan())%></td>
					<td width="25%" class="tdLable">联系方式</td>
					<td class="tdContent" width="25%"><%=SysUtility.doPreProcess(ggdjLxrxx.getLinkType())%></td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;3.申请人申请广告发布登记，除填写完整本表外，还需提交下列申请材料：（1）法人资格证明；（2）相关媒介批准文件；（3）广告业务机构证明文件；
						（4）广告负责人任命文件；（5）广告从业人员和广告审查人员证明文件；（6）具有与广告发布相适应的场所证明文件。<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4.通过网上申请的，上述材料扫描为图片后上传。
				</td>
				</div>
			</table>
			<br /> <br />
			<div align="center">
				<font style="font-weight: bold;">中华人民共和国国家工商行政管理总局制</font>
			</div>
			<div align="center">
				<h2>一、 申请登记事项</h2>
			</div>
			<br /> <br />
			<div>
				<table>
					<tr>
						<td class="tdLabel" width="35%">申请单位名称</td>
						<td class="tdContent" width="65%"><%=SysUtility.doPreProcess(ggdjJbxxSq.getEntName())%></td>
					</tr>
					<tr>
						<td class="tdLabel">单位法定代表人名称</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(ggdjJbxxSq.getLerep())%></td>
					</tr>
					<tr>
						<td class="tdLabel">单位实际经营地址</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(ggdjJbxxSq.getAddress())%></td>
					</tr>
					<tr>
						<td class="tdLabel">单位类型</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("GGFBDW", ggdjJbxxSq.getEntType()))%></td>
					</tr>
					<tr>
						<td class="tdLabel">单位性质</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("DWXZ", ggdjJbxxSq.getEntProp()))%></td>
					</tr>
					<tr>
						<td class="tdLabel">媒体级别</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("MTJB", ggdjJbxxSq.getMediaLevel()))%></td>
					</tr>
					<tr>
						<td class="tdLabel">有效期至</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(ggdjJbxxSq.getOpto())%></td>
					</tr>
					<%
						if (mediaNameList == null || mediaNameList.size() == 0) {
					%>
					<tr>
						<td class="tdLabel" rowspan="1">申请从事广告发布的媒介名称</td>
						<td class="tdContent"></td>
					</tr>
					<%
						}
					%>
					<%
						if (mediaNameList != null && mediaNameList.size() > 0) {
					%>
					<tr>
						<td class="tdLabel" rowspan="<%=mediaNameList.size()%>">申请从事广告发布的媒介名称</td>
						<td class="tdContent"><%=mediaNameList.get(0)%>></td>
					</tr>
					<%
						for (int i = 1; i < mediaNameList.size(); i++) {
					%>
					<tr>
						<td class="tdContent"><%=mediaNameList.get(i)%></td>
					</tr>
					<%
						}
					%>
					<%
						}
					%>
					<tr>
						<td colspan="2">
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
				注：1.“单位实际经营地址”一栏应填写申请人实际从事广告发布活动场所的详细地址；如果从事广告发布的媒介实际从事广告发布活动场所不一致，可以以编号对应列明。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;2.“单位类型”一栏应填写广播电台、电视台、报刊出版单位，不属于上述类型的填“其他”。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;3.“申请从事广告发布的媒介名称”，以媒介批准文件核定的名称为准，单位有多个经批准的媒介的，对需要从事广告发布的媒介提出申请，分别列明并提交相应的媒介批准文件。（表内空间不够的，可单独另附页填报）
			</div>
			<div align="center">
				<h2>二、广告从业人员、广告审查人员情况</h2>
			</div>
			<div align="center">
				<table >
					<tr >
						<td  width="50%" >姓名</td>
						<td  width="50%" >人员类型</td>
					</tr>
					<%
						if (ryList != null && ryList.size() > 0) {
							for (int i = 0; i < ryList.size(); i++) {
								Map ryMap = ryList.get(i);
					%>
					<tr>
						<td class="tdContent"><%=SysUtility.doPreProcess((String) ryMap.get("NAME"))%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess((String) ryMap.get("PERSONTYPE"))%></td>
					</tr>
					<%
						}
						}
					%>
				</table>
			</div>
			<div align="left">注：广告业务机构负责人和广告审查人员，请在人员类型中注明。</div>
			<div align="center">
				<h2>三、需提交的申请材料说明</h2>
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
						<td align="left">法人资格证明文件</td>
						<td align=""left"">原件复印件</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">2</td>
						<td align="left">媒介批准文件</td>
						<td align=""left"">原件复印件（媒介批准单位中的出版单位不具备法人资格的，应由其具有法人资格的主办单位提出申请。）</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">3</td>
						<td align="left">广告业务证明文件及其负责人任命文件</td>
						<td align=""left"">已有证正式文件的提供原件复印件；无正式文件的提供关于广告业务机构及其负责人的情况说明，由申请单位盖章确认（原件）。</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">4</td>
						<td align="left">广告从业人员和广告审查人员证明文件</td>
						<td align=""left"">单位出具的广告从业人员和广告审查人员证明文件（原件复印件）</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">5</td>
						<td align="left">场地使用证明文件</td>
						<td align=""left"">经营产所产权证明或租赁合同（原件复印件）</td>
						<td align="center">1</td>
					</tr>
				</table>
			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>