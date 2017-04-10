<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="UPLOAD_FILE" scope="page"  class="com.macrosoft.icms.util.UPLOAD_FILE"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
	<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<html>
<head>
<title></title>
</head>

<%
	String remark=WEB_USER.doPreProcess(request.getParameter("REMARK"));
	String openo=WEB_USER.doPreProcess(request.getParameter("OPENO"));
	String fileid=WEB_USER.doPreProcess(request.getParameter("FILEID"));

	String filepath="E:\\Program Files\\Tomcat 5.0\\webapps\\lywsdj\\upload\\";
	String fullfile=filepath+fileid;
	System.out.println(fullfile);
	if(remark.equals("")||openo.equals("")||fileid.equals(""))
	{
		out.print(SysUtility.setAlertScript("�������󣺷��ʸ�ҳ����ָ���������벻Ҫֱ�ӷ��ʸ�ҳ�棡",""));	
	}
	else
	{
		if (remark.equals("delete"))
		{
		   File f=new File(fullfile);
           if(f.delete()){
		     if(UPLOAD_FILE.doDelete(fileid,openo)){		             
		        out.print(SysUtility.setAlertScript("�ļ�ɾ���ɹ�!","parent.window.location.reload();"));
		     }else{
		     	out.print(SysUtility.setAlertScript("ɾ���ļ���Ϣʧ��!",""));
		     }
		   }else{
		      out.print(SysUtility.setAlertScript("�ļ�ɾ��ʧ��!",""));
		   }					
		}else if (remark.equals("detail"))
		{
		   try{
		        //��SmartUpload�����������ļ���downloadFile()�����У�����ͨ��response.getOutputStream().write()����
		        //��Ҫ���ص��ļ�����д�뵽��Ӧ�ͻ���������ṩ���û���������,����Ҫ����������
		        response.reset();
                out.clear();
                out=pageContext.pushBody();	
                //��ʼ��
                SmartUpload smartupload=new SmartUpload();
                smartupload.initialize(pageContext);	
                //�趨contentDispositionΪnull�Խ�ֹ������Զ����ļ�,��֤������Ӻ��������ļ���
                //�����趨�������ص��ļ���չ��Ϊdocʱ����������Զ���word��������չ��Ϊpdfʱ,���������acrobat�򿪡�   
    	        smartupload.setContentDisposition(null);  
    	        //����
    	        smartupload.downloadFile(fullfile);    
               }catch(Exception e){
                out.print(SysUtility.setAlertScript("�ļ�����ʧ�ܣ�����������!",""));
               }
		}
	}
%>
</html>
<%
dbc.close();
%>
