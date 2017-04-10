
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
	// ��������Ϣ
	ggdjLxrxx.setOpeno(openo);
	ggdjLxrxx.loadDataByOpeno();
	// ���ر��ҵ����Ϣ
	GgdjBgMtb bgMtb = new GgdjBgMtb();
	bgMtb.setOpeno(openo);
	bgMtb.loadDataByOpeno();
	String sqxxId = bgMtb.getSqxxId();
	// ���ػ�����Ϣ
	ggdjJbxxSq.setId(sqxxId);
	ggdjJbxxSq.loadDataFromDb(); //����ʽ���м�������
	// ���ر����Ϣ
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
	// �����������
	//String opfromaf = null;
	//String opfrombe = null;
	String optoaf = null;
	String optobe = null;
	if (!StringUtils.isEmpty(bgMtb.getId())) {
		String bgxxId = bgMtb.getId();
		// ���뵥λ���Ʊ����01
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
		// ���뵥λ��ַ�����02
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
		// ý�����Ʊ����03
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
			List<String> mediabeList = ggdjMjmc.queryMediaNameListByMtbIdFromDb(); // ����ʽ���м���ý�������Ϣ
			for (int i = 0; i < mediabeList.size(); i++) {
				Map<String, String> mediaBgMap = new HashMap<String, String>();
				mediaBgMap.put("altbe", mediabeList.get(i));
				mediaBgMap.put("altaf", "");
				mediaBgMapList.add(mediaBgMap);
			}
		}
		// ���뵥λ���ʱ����04
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
		// ���˱����05
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
		// ��Ч���ޱ����06
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
		List<String> mediabeList = ggdjMjmc.queryMediaNameListByMtbIdFromDb(); // ����ʽ���м���ý�������Ϣ
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
<title>��淢������Ǽ������</title>
</head>
<body onload="pagesetup_default()" style="width: 100%; height: 100%;">
	<div style="text-align: right;" class="noPrint">
		<div>
			<input type="button" value="��ӡ������" onclick="window.print();">
			<input name=back type="button" value="��   ��"
				onclick="window.close();">
		</div>
		<div>
			<font color="red" style="font-size: 9pt;">
				(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE->�ļ�->ҳ�����á��н���ҳü"�͡�ҳ�š����) </font>
		</div>
	</div>
	<div style="width: 100%; height: 100%; text-align: center;">
		<div class="title">��淢������Ǽ������</div>
		<div class="printWidth">
			<table class="noBorder">
				<tr>
					<td class="tdLable" width="25%">��λ����</td>
					<td colspan="3" width="75%"><%=SysUtility.doPreProcess(ggdjLxrxx.getComName())%></td>
				</tr>
				<tr>
					<td class="tdLable">��������</td>
					<td colspan="3" width="75%"><%=SysUtility.doPreProcess(ggdjLxrxx.getAppTime())%></td>
				</tr>
				<tr>
					<td width="25%" class="tdLable">��ϵ��</td>
					<td width="25%"><%=SysUtility.doPreProcess(ggdjLxrxx.getLinkMan())%></td>
					<td width="25%" class="tdLable">��ϵ��ʽ</td>
					<td width="25%"><%=SysUtility.doPreProcess(ggdjLxrxx.getLinkType())%></td>
				</tr>
			</table>
			<br /> <br />
			<table>
				<td align="left">
					<div align="center">
						<font style="font-weight: bold;">˵ ��</font>
					</div>
					<div align="left">
						&nbsp;&nbsp;&nbsp;&nbsp;1.��ǩ���ļ������ǰ��������Ӧ�����Ķ����л����񹲺͹�������ɷ��������л����񹲺͹���淨�������ҹ����ܾ֡���淢���Ǽǹ���涨���ȷ��ɡ�����͹��£�ȷ֪���Ȩ��������
						<br>&nbsp;&nbsp;&nbsp;&nbsp;2.�����˶��ύ���ϵĺϷ��ԡ���Ч�ԡ���ʵ�Գе����Ρ�<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3.���������������ҵ��Ǽǣ�����д���������⣬�����ύ����������ص�֤���ļ���<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4.ͨ����������ģ���������ɨ��ΪͼƬ���ϴ���
				</td>
				</div>
			</table>
			<br /> <br />
			<div align="center">
				<font style="font-weight: bold;">�л����񹲺͹����ҹ������������ܾ���</font>
			</div>
			<div align="center">
				<h2>һ���������Ǽ�����</h2>
			</div>
			<br /> <br />
			<div>
				<table>
					<tr>
						<td class="tdLabel" width="30%">�� Ŀ</td>
						<td class="tdContent" width="35%">ԭ�Ǽ�����</td>
						<td class="tdContent" width="35%">����������</td>
					</tr>
					<tr>
						<td class="tdLabel">���뵥λ</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(altbe01)%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess(altaf01)%></td>
					</tr>
					<tr>
						<td class="tdLabel">ʵ�ʾ�Ӫ��ַ</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(altbe02)%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess(altaf02)%></td>
					</tr>
					<tr>
						<td class="tdLabel">��λ����</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("DWXZ", altbe04))%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("DWXZ", altaf04))%></td>
					</tr>
					<tr>
						<td class="tdLabel">��Ч����</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(optobe)%></td>
						<td class="tdContent"><%=SysUtility.doPreProcess(optoaf)%></td>
					</tr>
					<%
						if (mediaBgMapList == null || mediaBgMapList.size() == 0) {
					%>
					<tr>
						<td class="tdLabel" rowspan="1">������¹�淢����ý������</td>
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
					<td class="tdLabel" rowspan="<%=mediaBgMapList.size()%>">������¹�淢����ý������</td>
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
								<div style="margin-left: 20px;">����������ǩ�֣�</div>
							</div> <br /> <br />
							<div style="float: right;">����λ���£�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<br />
							<div style="float: right;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</div>
						</td>
					</tr>
				</table>
			</div>
			<div align="left">
				ע��1.�����뵥λ���ĵ�λ���ƣ���λ���ʣ���������ҵ����ת��Ϊ��ҵ���ˣ������仯�ģ�Ӧ�������淢��������룬�����ύ�����ʸ�֤���ļ���<br>
				&nbsp;&nbsp;&nbsp;&nbsp;2.��ý����׼�ļ����������±仯�ģ�Ӧ�������淢��������룺�����淢���Ǽ����뵥λ��Ӧ�ĵ�λ���巢���仯�ģ���ý����׼�ļ�����Ч���޷����仯�ģ������뵥λ��Ϊ��Ҫ���ӻ���ٴ��¹�淢��ҵ���ý��ģ���ֻ��һ��ý����������ٵģ�Ӧ�����淢��ע���Ǽǣ�<br>
			</div>
			<div align="center">
				<h2>�������ύ�Ĳ���˵��</h2>
			</div>
			<div>
				<table>
					<tr>
						<td align="center" width="10%">���</td>
						<td align="center" width="35%">��������</td>
						<td align="center" width="45%">˵��</td>
						<td align="center" width="10%">����</td>
					</tr>
					<tr>
						<td align="center">1</td>
						<td align="left">�����ķ����ʸ�֤���ļ�</td>
						<td align=""left"">ԭ����ӡ��</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">2</td>
						<td align="left">������ý����׼�ļ�</td>
						<td align=""left"">ԭ����ӡ��</td>
						<td align="center"></td>
					</tr>
					<tr>
						<td align="center">3</td>
						<td align="left">�����ĳ���ʹ��֤���ļ�</td>
						<td align=""left"">��Ӫ������Ȩ֤�������޺�ͬ��ԭ����ӡ����</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">4</td>
						<td align="left">��������ٹ�淢��ý��ı��</td>
						<td align=""left"">ֻ����д�ϱ������ύ����</td>
						<td align="center"></td>
					</tr>
				</table>
			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>