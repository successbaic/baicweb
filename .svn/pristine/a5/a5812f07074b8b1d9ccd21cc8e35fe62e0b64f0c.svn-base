 <%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.IPTIMESTAMP"%>
<%@ page import="com.jspsmart.upload.SmartUpload"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<jsp:useBean id='UPLOAD_FILE' scope='page'
	class='com.macrosoft.icms.util.UPLOAD_FILE' />
<jsp:useBean id="IPTimeStamp" scope="page"
	class="com.macrosoft.icms.util.IPTIMESTAMP" />
<%
	// 新建一个SmartUpload对象
	SmartUpload su = new SmartUpload();
	// 上传初始化
	su.initialize(pageContext);
	// --------------- 设定上传限制 ---------------
	// 1.限制每个上传文件的最大长度。
	// su.setMaxFileSize(1020);
	// 2.限制总上传数据的长度。
	// su.setTotalMaxFileSize(20000);
	// 3.设定允许上传的文件（通过扩展名限制）,仅允许jpg,gif,txt,pdf,tif,word和excel格式文件。
	su.setAllowedFilesList(
			"rar,zip,jpg,gif,png,txt,doc,docx,xlsx,xls,tif,bmp,pdf,TIF,JPG,GIF,TXT,DOC,XLS,BMP,PDF");
	// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
	su.setDeniedFilesList("exe,bat,jsp,");
	su.upload();

	//取得业务编号、上传者用户名、文件说明，文件名，文件编号
	String OPENO = SysUtility.doPreProcess(su.getRequest().getParameter("OPENO"));
	String fileId = SysUtility.doPreProcess(su.getRequest().getParameter("FILEID"));
	//String ATTACHPER = cConvert.convertUTF8(su.getRequest().getParameter("ATTACHPER"));
	//String FILEDES = SysUtility.doPreProcess(su.getRequest().getParameter("FILEDES"));
	String FILENAME = SysUtility.doPreProcess(su.getRequest().getParameter("FILENAME"));
	//String WJBH = SysUtility.doPreProcess(su.getRequest().getParameter("WJBH"));
	//System.out.println("===="+request.getRemoteAddr());
	// 逐一提取上传文件信息，同时可保存文件。
	com.jspsmart.upload.File file = su.getFiles().getFile(0);
	// 若文件不存在则继续
	if (file.isMissing())
		return;
	// 将文件另存	
	if (!file.isMissing()) {
		//取得用户上传时的文件名
		//String fname=file.getFileName();
		//取得上传文件的大小
		double size = file.getSize();
		size = size / 1024 / 1024;
		//System.out.println("size=" + size);
		int sizeLength = 2;
		if (webuser.getXZQH().equals("3713")) {
			sizeLength = 5;
		}
		if (size > sizeLength) {
			out.print(SysUtility.setAlertScript("文件大于" + sizeLength + "M,上传失败!",
					"parent.window.location.reload();"));
		} else {
			String filesize = Double.toString(size);
			UPLOAD_FILE.setFILESIZE(filesize);
			// 取得上传的文件后缀
			String ext = file.getFileExt();

			//  IPTIMESTAMP its = new IPTIMESTAMP(ip) ;
			IPTIMESTAMP its = new IPTIMESTAMP();
			String fileid;
			if (!StringUtils.isEmpty(fileId)) {
				fileid = fileId;
				int index = fileId.indexOf(".");
				if (index == -1) {
					fileid = fileId + "." + ext;
				} else {
					fileid = fileId.substring(0,index+1)+ "." + ext;;
				}
			} else {
				fileid = OPENO + "" + its.getIPTimeRand2() + "." + ext;
			}
			UPLOAD_FILE.setFILEID(fileid);
			// 保存文件
			//String fpath = this.getServletContext().getRealPath("/")+ "upload/";
			// 另存到以WEB应用程序的根目录为文件根目录的目录下
			//路径C:\Documents and Settings\Administrator\workspace\.metadata\.plugins\com.genuitec.eclipse.easie.tomcat.myeclipse\tomcat\webapps\wsdj\\upload
			//file.saveAs("/upload/"+fileid,su.SAVE_VIRTUAL);

			// 另存到操作系统的根目录为文件根目录的目录下
			//file.saveAs("d:\\upload\\"+fileid,su.SAVE_PHYSICAL); 
			//file.saveAs("d:\\upload\\"+fileid,su.SAVE_PHYSICAL);
			file.saveAs("/upload/" + fileid, SmartUpload.SAVE_VIRTUAL);

			// 根据ip+时间戳+三位随机数：
			String ip = "";
			if (request.getHeader("x-forwarded-for") == null) {
				ip = request.getRemoteAddr();
			} else {
				ip = request.getHeader("x-forwarded-for");
			}

			UPLOAD_FILE.setOPENO(OPENO);
			//  UPLOAD_FILE.setATTACHPER(ATTACHPER);
			//   UPLOAD_FILE.setFILEDES(FILEDES);
			UPLOAD_FILE.setFILENAME(FILENAME);
			UPLOAD_FILE.setATTACHDATE(IPTimeStamp.getDateComplete2());
			UPLOAD_FILE.setWJBH(0);
			boolean uploadRet;
			if (StringUtils.isEmpty(fileId)) {
				uploadRet = UPLOAD_FILE.doAdd();
			} else {
				uploadRet = UPLOAD_FILE.doModifyByFileId(fileId);
			}
			if (uploadRet) {
%>
<script language="javascript">
alert("文件上传成功");
parent.window.location.href="ggdj_fjxx_list.jsp?OPENO=<%=OPENO%>";
</script>
<%
	} else {
				out.print(SysUtility.setAlertScript("文件上传失败!", ""));
			}
		}
	}
%>
