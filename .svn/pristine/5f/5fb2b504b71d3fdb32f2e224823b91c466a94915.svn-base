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
	// 查询未提交文件
	String sqlWhere = " WHERE OPENO = " + SysUtility.doPreProcess3(openo) + " AND FILESIZE = '0'";
	ArrayList<UPLOAD_FILE> fileList = uploadFile.getList(sqlWhere);
	if (fileList == null) {
		out.print(SysUtility.setAlertScript("提交文件查询失败!", ""));
		return;
	}

	if (fileList.size() > 0) {
		StringBuffer msgBuffer = new StringBuffer();
		msgBuffer.append("请上传");
		for (int i = 0; i < fileList.size(); i++) {
			if (i > 0) {
				msgBuffer.append("、");
			}
			UPLOAD_FILE fileData = fileList.get(i);
			msgBuffer.append(fileData.getFILENAME());
		}
		msgBuffer.append("等文件！");
		out.print(SysUtility.setAlertScript(msgBuffer.toString(), ""));
		return;
	}

	out.print(SysUtility.setAlertScript("保存成功!", "parent.window.location.href='ggdj_dotj.jsp';"));
%>
