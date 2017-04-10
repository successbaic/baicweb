<%@page language="java" import="java.io.*,java.net.*,javax.servlet.ServletOutputStream" contentType="application/x-msdownload"    pageEncoding="GBK"%>

<%
response.setContentType("application/x-download");//设置为下载application/x- download
String fpath = (String)request.getParameter("fpath");
String fileId = (String)request.getParameter("fileId");
String filenamedownload = fpath +"/"+ fileId;
System.out.println(filenamedownload);

response.reset();//可以加也可以不加
response.addHeader("Content-Disposition","attachment;filename=" + fileId);
ServletOutputStream outp = null;
FileInputStream in = null;
try
{
    outp = response.getOutputStream();
    in = new FileInputStream(filenamedownload);
    byte[] b = new byte[1024];
    int i = 0;
    while((i = in.read(b)) > 0)
    {
        outp.write(b, 0, i);
    }       
    
}
catch(Exception e)
{
    System.out.println("Error!");

}
finally
{
    if(in != null)
    {
        in.close();
        in = null;
    }
    if(outp != null)
    {
      outp.flush();
        outp.close();
        outp = null;
    }
}
%>
