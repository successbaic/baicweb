<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.util.UPLOAD_FILE"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%
	String openo = Page.getOPENO();
	UPLOAD_FILE uploadFile = new UPLOAD_FILE();
	// ��ѯδ�ύ�ļ�
	String sqlWhere = " WHERE OPENO = " + SysUtility.doPreProcess3(openo) + " AND FILESIZE = '0'";
	ArrayList<UPLOAD_FILE> fileList = uploadFile.getList(sqlWhere);
	if (fileList == null) {
		out.print(SysUtility.setAlertScript("�ύ�ļ���ѯʧ��!", ""));
		return;
	}

	if (fileList.size() > 0) {
		StringBuffer msgBuffer = new StringBuffer();
		msgBuffer.append("���ϴ�");
		for (int i = 0; i < fileList.size(); i++) {
			if (i > 0) {
				msgBuffer.append("��");
			}
			UPLOAD_FILE fileData = fileList.get(i);
			msgBuffer.append(fileData.getFILENAME());
		}
		msgBuffer.append("���ļ���");
		out.print(SysUtility.setAlertScript(msgBuffer.toString(), ""));
		return;
	}

	out.print(SysUtility.setAlertScript("����ɹ�!", "parent.window.location.href='ggdj_dotj.jsp';"));
%>
