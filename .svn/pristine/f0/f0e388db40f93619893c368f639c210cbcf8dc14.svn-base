<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.IPTIMESTAMP"%>
<%@ page import="com.jspsmart.upload.SmartUpload"%>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<jsp:useBean id='UPLOAD_FILE_ELEC' scope='page'
	class='com.macrosoft.icms.util.UPLOAD_FILE_ELEC' />
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
	// 3.设定允许上传的文件（通过扩展名限制）,仅允许word格式文件。
	su.setAllowedFilesList("rar,zip,jpg,gif,png,txt,doc,docx,xlsx,xls,tif,bmp,pdf,TIF,JPG,GIF,PNG,TXT,DOC,XLS,BMP,PDF");
	// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
	su.setDeniedFilesList("exe,bat,jsp,");
	try{
	su.upload();
	}catch(Exception e){
		out.print(SysUtility.setAlertScript("文件上传失败,请检查上传文件格式是否符合要求!", "parent.window.location.reload();"));
		return;
	}

	//取得业务编号、上传者用户名、文件说明，文件名，文件编号
	String OPENO = SysUtility.doPreProcess(su.getRequest().getParameter("openo"));
	String WJID = SysUtility.doPreProcess(su.getRequest().getParameter("wjid"));
	String FPATH = SysUtility.doPreProcess(su.getRequest().getParameter("fpath"));
	String FILENAME = SysUtility.doPreProcess(su.getRequest().getParameter("FILENAME"));
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
		size = size / 1024 ;
		int sizeLength=6144;
		if (size > sizeLength) {
			out.print(SysUtility.setAlertScript("文件大于"+sizeLength+"kb,上传失败!","parent.window.location.reload();"));
		} else {
			String filesize = Double.toString(size);
			UPLOAD_FILE_ELEC.setFILESIZE(filesize);
			// 取得上传的文件后缀
			String ext = file.getFileExt();

			IPTIMESTAMP its = new IPTIMESTAMP();
			String fileid = OPENO + "" + its.getIPTimeRand2() + "."
					+ ext;
			UPLOAD_FILE_ELEC.setFILEID(fileid);
			// 保存文件
             file.saveAs(FPATH+"/"+fileid,SmartUpload.SAVE_PHYSICAL);
            //file.saveAs("/upload/" + fileid, SmartUpload.SAVE_VIRTUAL);
			// 根据ip+时间戳+三位随机数：
			String ip = "";
			if (request.getHeader("x-forwarded-for") == null) {
				ip = request.getRemoteAddr();
			} else {
				ip = request.getHeader("x-forwarded-for");
			}

			UPLOAD_FILE_ELEC.setOPENO(OPENO);
			UPLOAD_FILE_ELEC.setWJID(WJID);
			UPLOAD_FILE_ELEC.setFILENAME(FILENAME);
			UPLOAD_FILE_ELEC.setATTACHDATE(IPTimeStamp.getDateComplete2());
			UPLOAD_FILE_ELEC.setFILEPATH(FPATH+"/"+ fileid);
			UPLOAD_FILE_ELEC.setWJBH(0);
			//生成文件哈希值字符串
			String FILEDES = UPLOAD_FILE_ELEC.getHash(FPATH+"/"+ fileid);
			UPLOAD_FILE_ELEC.setFILEDES(FILEDES);
			if (UPLOAD_FILE_ELEC.doAdd(WJID)) {						
%>
<script language="javascript">
alert("文件上传成功");
parent.window.document.getElementById('editDiv').style.display='none';
parent.window.location.href="wsdj_fjxx_list.jsp?OPENO=<%=OPENO%>";
</script>
<%
	} else {
				out.print(SysUtility.setAlertScript("文件上传失败!", ""));
			}
		}
	}
%>
