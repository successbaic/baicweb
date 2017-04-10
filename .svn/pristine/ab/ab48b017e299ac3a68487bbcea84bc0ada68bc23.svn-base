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
		out.print(SysUtility.setAlertScript("参数错误：访问该页必须指定参数！请不要直接访问该页面！",""));	
	}
	else
	{
		if (remark.equals("delete"))
		{
		   File f=new File(fullfile);
           if(f.delete()){
		     if(UPLOAD_FILE.doDelete(fileid,openo)){		             
		        out.print(SysUtility.setAlertScript("文件删除成功!","parent.window.location.reload();"));
		     }else{
		     	out.print(SysUtility.setAlertScript("删除文件信息失败!",""));
		     }
		   }else{
		      out.print(SysUtility.setAlertScript("文件删除失败!",""));
		   }					
		}else if (remark.equals("detail"))
		{
		   try{
		        //在SmartUpload类用于下载文件的downloadFile()方法中，最终通过response.getOutputStream().write()方法
		        //将要下载的文件数据写入到相应客户的输出流提供给用户进行下载,所以要先清空输出流
		        response.reset();
                out.clear();
                out=pageContext.pushBody();	
                //初始化
                SmartUpload smartupload=new SmartUpload();
                smartupload.initialize(pageContext);	
                //设定contentDisposition为null以禁止浏览器自动打开文件,保证点击链接后是下载文件。
                //若不设定，则下载的文件扩展名为doc时，浏览器将自动用word打开它。扩展名为pdf时,浏览器将用acrobat打开。   
    	        smartupload.setContentDisposition(null);  
    	        //下载
    	        smartupload.downloadFile(fullfile);    
               }catch(Exception e){
                out.print(SysUtility.setAlertScript("文件下载失败，请重新下载!",""));
               }
		}
	}
%>
</html>
<%
dbc.close();
%>
