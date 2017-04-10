
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
	// ���ػ�����Ϣ
	ggdjJbxxSq.setId(openo);
	ggdjJbxxSq.loadData();
	// ����ý�������Ϣ
	ggdjMjmc.setSqxxId(openo);
	List<String> mediaNameList = ggdjMjmc.queryMediaNameListByMtbId();
	// ��������Ϣ
	ggdjLxrxx.setOpeno(openo);
	ggdjLxrxx.loadDataByOpeno();
	// ��Ա���
	ggdjRyqk.setSqxxid(openo);
	List<Map> ryList = ggdjRyqk.queryDataByMtbId();
%>
<html>
<head>
<link style="text/css" rel="stylesheet" href="css/print.css" />
<%
	out.print(pageshow.pagesetup_default());
%>
<title>��淢�������Ǽ������</title>
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
		<div class="title">��淢�������Ǽ������</div>
		<div class="printWidth">
			<table class="noBorder">
				<tr>
					<td class="tdLable" width="25%">��λ����</td>
					<td class="tdContent" colspan="3" width="75%"><%=SysUtility.doPreProcess(ggdjLxrxx.getComName())%></td>
				</tr>
				<tr>
					<td class="tdLable">��������</td>
					<td class="tdContent" colspan="3" width="75%"><%=SysUtility.doPreProcess(ggdjLxrxx.getAppTime())%></td>
				</tr>
				<tr>
					<td width="25%" class="tdLable">��ϵ��</td>
					<td class="tdContent" width="25%"><%=SysUtility.doPreProcess(ggdjLxrxx.getLinkMan())%></td>
					<td width="25%" class="tdLable">��ϵ��ʽ</td>
					<td class="tdContent" width="25%"><%=SysUtility.doPreProcess(ggdjLxrxx.getLinkType())%></td>
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
						&nbsp;&nbsp;&nbsp;&nbsp;3.�����������淢���Ǽǣ�����д���������⣬�����ύ����������ϣ���1�������ʸ�֤������2�����ý����׼�ļ�����3�����ҵ�����֤���ļ���
						��4����渺���������ļ�����5������ҵ��Ա�͹�������Ա֤���ļ�����6���������淢������Ӧ�ĳ���֤���ļ���<br>
						&nbsp;&nbsp;&nbsp;&nbsp;4.ͨ����������ģ���������ɨ��ΪͼƬ���ϴ���
				</td>
				</div>
			</table>
			<br /> <br />
			<div align="center">
				<font style="font-weight: bold;">�л����񹲺͹����ҹ������������ܾ���</font>
			</div>
			<div align="center">
				<h2>һ�� ����Ǽ�����</h2>
			</div>
			<br /> <br />
			<div>
				<table>
					<tr>
						<td class="tdLabel" width="35%">���뵥λ����</td>
						<td class="tdContent" width="65%"><%=SysUtility.doPreProcess(ggdjJbxxSq.getEntName())%></td>
					</tr>
					<tr>
						<td class="tdLabel">��λ��������������</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(ggdjJbxxSq.getLerep())%></td>
					</tr>
					<tr>
						<td class="tdLabel">��λʵ�ʾ�Ӫ��ַ</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(ggdjJbxxSq.getAddress())%></td>
					</tr>
					<tr>
						<td class="tdLabel">��λ����</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("GGFBDW", ggdjJbxxSq.getEntType()))%></td>
					</tr>
					<tr>
						<td class="tdLabel">��λ����</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("DWXZ", ggdjJbxxSq.getEntProp()))%></td>
					</tr>
					<tr>
						<td class="tdLabel">ý�弶��</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(icms.getSysDm("MTJB", ggdjJbxxSq.getMediaLevel()))%></td>
					</tr>
					<tr>
						<td class="tdLabel">��Ч����</td>
						<td class="tdContent"><%=SysUtility.doPreProcess(ggdjJbxxSq.getOpto())%></td>
					</tr>
					<%
						if (mediaNameList == null || mediaNameList.size() == 0) {
					%>
					<tr>
						<td class="tdLabel" rowspan="1">������¹�淢����ý������</td>
						<td class="tdContent"></td>
					</tr>
					<%
						}
					%>
					<%
						if (mediaNameList != null && mediaNameList.size() > 0) {
					%>
					<tr>
						<td class="tdLabel" rowspan="<%=mediaNameList.size()%>">������¹�淢����ý������</td>
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
				ע��1.����λʵ�ʾ�Ӫ��ַ��һ��Ӧ��д������ʵ�ʴ��¹�淢�����������ϸ��ַ��������¹�淢����ý��ʵ�ʴ��¹�淢���������һ�£������Ա�Ŷ�Ӧ������<br>
				&nbsp;&nbsp;&nbsp;&nbsp;2.����λ���͡�һ��Ӧ��д�㲥��̨������̨���������浥λ���������������͵����������<br>
				&nbsp;&nbsp;&nbsp;&nbsp;3.��������¹�淢����ý�����ơ�����ý����׼�ļ��˶�������Ϊ׼����λ�ж������׼��ý��ģ�����Ҫ���¹�淢����ý��������룬�ֱ��������ύ��Ӧ��ý����׼�ļ��������ڿռ䲻���ģ��ɵ�����ҳ���
			</div>
			<div align="center">
				<h2>��������ҵ��Ա����������Ա���</h2>
			</div>
			<div align="center">
				<table >
					<tr >
						<td  width="50%" >����</td>
						<td  width="50%" >��Ա����</td>
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
			<div align="left">ע�����ҵ����������˺͹�������Ա��������Ա������ע����</div>
			<div align="center">
				<h2>�������ύ���������˵��</h2>
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
						<td align="left">�����ʸ�֤���ļ�</td>
						<td align=""left"">ԭ����ӡ��</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">2</td>
						<td align="left">ý����׼�ļ�</td>
						<td align=""left"">ԭ����ӡ����ý����׼��λ�еĳ��浥λ���߱������ʸ�ģ�Ӧ������з����ʸ�����쵥λ������롣��</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">3</td>
						<td align="left">���ҵ��֤���ļ����为���������ļ�</td>
						<td align=""left"">����֤��ʽ�ļ����ṩԭ����ӡ��������ʽ�ļ����ṩ���ڹ��ҵ��������为���˵����˵���������뵥λ����ȷ�ϣ�ԭ������</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">4</td>
						<td align="left">����ҵ��Ա�͹�������Ա֤���ļ�</td>
						<td align=""left"">��λ���ߵĹ���ҵ��Ա�͹�������Ա֤���ļ���ԭ����ӡ����</td>
						<td align="center">1</td>
					</tr>
					<tr>
						<td align="center">5</td>
						<td align="left">����ʹ��֤���ļ�</td>
						<td align=""left"">��Ӫ������Ȩ֤�������޺�ͬ��ԭ����ӡ����</td>
						<td align="center">1</td>
					</tr>
				</table>
			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>