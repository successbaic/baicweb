<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.IPTIMESTAMP"%>
<%@ page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="com.macrosoft.icms.system.*"%>

<jsp:useBean id='UPLOAD_FILE' scope='page' class='com.macrosoft.icms.util.CommonUPLOAD_FILE'/>
<jsp:useBean id="IPTimeStamp" scope="page"  class="com.macrosoft.icms.util.IPTIMESTAMP"/>
<%
	// �½�һ��SmartUpload����
	SmartUpload su = new SmartUpload();
	// �ϴ���ʼ��
	su.initialize(pageContext);
	// --------------- �趨�ϴ����� ---------------
	// 1.����ÿ���ϴ��ļ�����󳤶ȡ�
	//su.setMaxFileSize(1020);
	// 2.�������ϴ����ݵĳ��ȡ�
	// su.setTotalMaxFileSize(20000);
	// 3.�趨�����ϴ����ļ���ͨ����չ�����ƣ�,������jpg,gif,txt,pdf,tif,word��excel��ʽ�ļ���
	su.setAllowedFilesList("rar,zip,jpg,gif,txt,doc,docx,xlsx,xls,tif,bmp,pdf,TIF,JPG,GIF,TXT,DOC,XLS,BMP,PDF");
	// 4.�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�,��ֹ�ϴ�����exe,bat,jsp,htm,html��չ�����ļ���û����չ�����ļ���
	su.setDeniedFilesList("exe,bat,jsp,");
	su.upload();

    //ȡ��ҵ���š��ϴ����û������ļ�˵�����ļ������ļ����
    String OPENO = (System.currentTimeMillis())+"" ;

   	String FILENAME = SysUtility.doPreProcess(su.getRequest().getParameter("FILENAME"));
   	String REMARKS = SysUtility.doPreProcess(su.getRequest().getParameter("REMARKS"));
   	String YWLX = SysUtility.doPreProcess(su.getRequest().getParameter("YWLX"));
	System.out.println("YWLXYWLXYWLX"+YWLX);
	// ��һ��ȡ�ϴ��ļ���Ϣ��ͬʱ�ɱ����ļ���
	com.jspsmart.upload.File file = su.getFiles().getFile(0);
	// ���ļ������������
	if (file.isMissing()) return;
	// ���ļ�����	
	if(!file.isMissing())
	{
		  //ȡ���û��ϴ�ʱ���ļ���
		  //String fname=file.getFileName();
		  //ȡ���ϴ��ļ��Ĵ�С
		  double size=file.getSize();
		  size=size/1024/1024;
		  System.out.println("size="+size);
		  
		  if(size>10){
		     out.print(SysUtility.setAlertScript("�ļ�����10M,�ϴ�ʧ��!",""));
		  }else{
		     String filesize=Double.toString(size);
		     UPLOAD_FILE.setFILESIZE(filesize);
		     // ȡ���ϴ����ļ���׺
             String ext = file.getFileExt();
             
           //  IPTIMESTAMP its = new IPTIMESTAMP(ip) ;
           IPTIMESTAMP its = new IPTIMESTAMP() ;
             String fileid = OPENO+""+its.getIPTimeRand2() + "." + ext ;
             UPLOAD_FILE.setFILEID(fileid);
           
             file.saveAs("/commin_upload/"+fileid,su.SAVE_VIRTUAL);
           
             // ����ip+ʱ���+��λ�������
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
	         UPLOAD_FILE.setYWLX(YWLX);
	         if (UPLOAD_FILE.doAdd()){
%>
<script language="javascript">
alert("�ļ��ϴ��ɹ�");
parent.window.uploadSucess('<%=UPLOAD_FILE.getFILEID() %>');
window.close();
</script>
<%		         
	         }else{
		         out.print(SysUtility.setAlertScript("�ļ��ϴ�ʧ��!",""));
		     } 
		  }		 	
		}
		
%>