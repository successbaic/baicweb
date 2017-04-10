<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.IPTIMESTAMP"%>
<%@ page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="com.macrosoft.icms.system.*"%>

<jsp:useBean id='UPLOAD_FILE' scope='page' class='com.macrosoft.icms.util.CommonUPLOAD_FILE'/>
<jsp:useBean id="IPTimeStamp" scope="page"  class="com.macrosoft.icms.util.IPTIMESTAMP"/>
<%
	// 新建一个SmartUpload对象
	SmartUpload su = new SmartUpload();
	// 上传初始化
	su.initialize(pageContext);
	// --------------- 设定上传限制 ---------------
	// 1.限制每个上传文件的最大长度。
	//su.setMaxFileSize(1020);
	// 2.限制总上传数据的长度。
	// su.setTotalMaxFileSize(20000);
	// 3.设定允许上传的文件（通过扩展名限制）,仅允许jpg,gif,txt,pdf,tif,word和excel格式文件。
	su.setAllowedFilesList("rar,zip,jpg,gif,txt,doc,docx,xlsx,xls,tif,bmp,pdf,TIF,JPG,GIF,TXT,DOC,XLS,BMP,PDF");
	// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
	su.setDeniedFilesList("exe,bat,jsp,");
	su.upload();

    //取得业务编号、上传者用户名、文件说明，文件名，文件编号
    String OPENO = (System.currentTimeMillis())+"" ;

   	String FILENAME = SysUtility.doPreProcess(su.getRequest().getParameter("FILENAME"));
   	String REMARKS = SysUtility.doPreProcess(su.getRequest().getParameter("REMARKS"));

	// 逐一提取上传文件信息，同时可保存文件。
	com.jspsmart.upload.File file = su.getFiles().getFile(0);
	// 若文件不存在则继续
	if (file.isMissing()) return;
	// 将文件另存	
	if(!file.isMissing())
	{
		  //取得用户上传时的文件名
		  //String fname=file.getFileName();
		  //取得上传文件的大小
		  double size=file.getSize();
		  size=size/1024/1024;
		  System.out.println("size="+size);
		  
		  if(size>1){
		     out.print(SysUtility.setAlertScript("文件大于10M,上传失1败!","alert()"));
		  }else{
		     String filesize=Double.toString(size);
		     UPLOAD_FILE.setFILESIZE(filesize);
		     // 取得上传的文件后缀
             String ext = file.getFileExt();
             
           //  IPTIMESTAMP its = new IPTIMESTAMP(ip) ;
           	 IPTIMESTAMP its = new IPTIMESTAMP() ;
             String fileid = OPENO+""+its.getIPTimeRand2() + "." + ext ;
             UPLOAD_FILE.setFILEID(fileid);
             // 保存文件
             //String fpath = this.getServletContext().getRealPath("/")+ "upload/";
             // 另存到以WEB应用程序的根目录为文件根目录的目录下
             //路径C:\Documents and Settings\Administrator\workspace\.metadata\.plugins\com.genuitec.eclipse.easie.tomcat.myeclipse\tomcat\webapps\wsdj\\upload
             //file.saveAs("/upload/"+fileid,su.SAVE_VIRTUAL);
                        
             // 另存到操作系统的根目录为文件根目录的目录下
             //file.saveAs("d:\\upload\\"+fileid,su.SAVE_PHYSICAL); 
             //file.saveAs("d:\\upload\\"+fileid,su.SAVE_PHYSICAL);
           
             file.saveAs("/commin_upload/"+fileid,su.SAVE_VIRTUAL);
           
             // 根据ip+时间戳+三位随机数：
             String ip="";
	         if(request.getHeader("x-forwarded-for")==null){
	  	         ip=request.getRemoteAddr();
	         }else{
	             ip=request.getHeader("x-forwarded-for");
	         }
	         
             UPLOAD_FILE.setOPENO(OPENO);
	         UPLOAD_FILE.setFILENAME(FILENAME);
	         UPLOAD_FILE.setREMARKS(REMARKS);
	         UPLOAD_FILE.setATTACHDATE(IPTimeStamp.getDateComplete2());
	         if (UPLOAD_FILE.doAdd()){
%>
<script language="javascript">
alert("文件上传成功");
parent.window.location.href="file_Upload_list.jsp?OPENO=<%=OPENO%>";
</script>
<%		         
	         }else{
		         out.print(SysUtility.setAlertScript("文件上传失败!",""));
		     } 
		  }		 	
		}
		
%>
