<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.StepShow" %>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<%@ page import="com.macrosoft.icms.util.DesUtil"%>
<%@ page import="com.macrosoft.icms.util.PDFCreator"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"%>

<%
String openo = Page.getOPENO();
QYDJ_JBXX_SQ jbxx = new QYDJ_JBXX_SQ();
jbxx.setOPENO(openo);
jbxx.doSelect();
String entcode = jbxx.getENTTYPE();
PDFCreator pdfcreate = new PDFCreator();
String opetypeName="";
if(!"".equals(entcode) && entcode != null){
	opetypeName= pdfcreate.getDmdzByTypeAndCode("ENTTYPE",entcode,"2");		
}else{
	opetypeName = "USUAL";
}
String fpath = PropertiesConfigUtil.getValue("SQS_PATH") + "/"+opetypeName ;
DesUtil desutil = new DesUtil();
//加密
String encryptopeno=desutil.encrypt(openo);
String pathurl =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
String nosignurl =icms.getCURRENTURL()+"/wsdj_fjxx_edit.jsp?openo="+encryptopeno;
//String nosignurl =pathurl+"/wsdj_fjxx_edit.jsp?openo="+encryptopeno;
String url_qcdz = request.getContextPath() + "/djbg/djbg.jsp";
%>
<html>
<head><title>提交材料</title>
<style>
</style>
<script language="javascript" src="<%=request.getContextPath()%>/eid/eIDPluginHelper2.0.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/eid/base64.js"></script>
	<script language="javascript" src='<%=request.getContextPath()%>/eid/jquery-1.8.2.js'></script>
	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.js'></script>
   	<script language="javascript" src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/eIDUI-common.js'></script>
    <link   rel="stylesheet" href="<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.css">
<script language="javascript">
function eIDSign(openo,fileid,filedes,fpath){
	//window.open('tjwj_sign.jsp?OPENO='+openo+"&FILEID="+fileid+"&FILEDES="+filedes+"&FPATH="+fpath,"","height=300, width=400, top=300,left=600, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
	if(fileid=="" || fileid==null){
		alert("请先上传文件才能对文件进行签名！");
		return;
	}
	window.location.href = '<%=nosignurl%>';
}

function seeFile(fpath,fileId)
{  
	var url = "tjwj_download.jsp?fpath=" + fpath+"&fileId="+fileId;
	window.location.href = url;
}

function createFile(openo,fileId,wjid,bh)
{  
	var url = "tjwj_create.jsp?openo=" + openo+"&fileId="+fileId+"&wjid="+wjid+"&bh="+bh;
	window.location.href = url;
}

function uploadWj(wjid){
	var url = "tjwj_upload.jsp?wjid="+wjid;
    var tmp=window.showModalDialog(url,window,"dialogHeight=200px;dialogWidth=500px;status:yes;scroll:yes;resizable:no;center:yes");
    if(tmp!=undefined){
    	window.location.reload();	
    }
}

</script>
</head>
<body>
<form name="form2">
<table align="center" width="100%" cellpadding="0" cellspacing="0" id="fullElecUrl">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;width:30%;">
免登陆数字签名URL:</td>
<td style="width:70%;"><a href='<%=nosignurl%>'  target= _blank  style="text-decoration:underline;"><%=nosignurl%></a></td>
</tr></table>
</br>
<table align="center" width="100%" cellpadding="0" cellspacing="0" id="fullElecFj">
<tr><td style="font-size:14px;padding-left: 2px;color:blue;font-weight: bold;line-height: 25px;text-align: left;">
附件信息</td>
</tr></table>

<table bgcolor="#FFFFFF" align="center" border="1" width="100%" cellpadding="0" cellspacing="0" id="table2">
  <tr class="yxsm">		
    <td align="center" style="width:50%;">文件名</td>    
    <td align="center" style="width:20%;">上传附件</td>
    <td align="center" style="width:10%;">操作</td>
    <td align="center" style="width:20%;">备注</td>
  </tr>
<%
String OPETYPE=Page.getOPETYPE();
String DL=Page.getDL();
if(DL.equals("1")){
	DL="QYDJ";
	}else if (DL.equals("2")){
		DL="GTDJ";
	}else if (DL.equals("3")){
		DL="HZSDJ";
	}else if (DL.equals("4")){
		DL="HWGG";
	}else if (
		DL.equals("1")){
		DL="DCDY";
}
String ENTTYPE=Page.getENTTYPE();
String sqls="SELECT * FROM QCDZ_WSDJ_TBXX WHERE OPETYPE='"+OPETYPE+"' AND DL='"+DL+"' AND XL='"+ENTTYPE+"'  ORDER BY BH ";
DbConnection db=new DbConnection();
ResultSet rs=db.executeQuery(sqls);
String wjsm="";
String wjid="";
String ifsign="";
String ifflag="";
String bh="";
String remark="";
while(rs.next()){
wjsm=SysUtility.doPreProcess(rs.getString("WJSM"));
wjid=rs.getString("WJID");
ifsign = rs.getString("IFSIGN");
ifflag = rs.getString("IFFLAG");
bh =  rs.getString("BH");
remark = rs.getString("REMARK");
if(remark==null){
	remark="";
}
%>
<tr class="lc2">
<td>
<%=wjsm%>
</td>
<td style="text-align:center;">
<%
String upsql="SELECT COUNT(*),FILEID,FILENAME,FILEDES  FROM UPLOAD_FILE_ELEC WHERE WJID='"+wjid+"' AND OPENO = '"+openo+"'  GROUP BY FILEID,FILENAME,FILEDES";
DbConnection db1=new DbConnection();
String fileId ="";
String filename="";
String filedes="";
ResultSet rs1=db1.executeQuery(upsql);
int num=0;
if(rs1.next()){
	fileId = rs1.getString("FILEID");
	filename=rs1.getString("FILENAME");
	filedes=rs1.getString("FILEDES");
	num=rs1.getInt(1);
}%>
<%
if(num==0){
%>
<%if("1".equals(ifflag)){%>
<a href='#'  onclick="createFile('<%=openo%>','<%=fileId %>','<%=wjid%>','<%=bh%>');">生成</a>
<% }else if("2".equals(ifflag)){%>
<a href='#'  onclick="framejumpTo('tjwj_upload.jsp','openo=<%=openo%>&wjid=<%=wjid%>&fpath=<%=fpath %>');">上传</a>
<% }else if("3".equals(ifflag)){%>
<a href='#'  onclick="createFile('<%=openo%>','<%=fileId %>','<%=wjid%>','<%=bh%>');">生成</a>&nbsp;or
<a href='#'  onclick="framejumpTo('tjwj_upload.jsp','openo=<%=openo%>&wjid=<%=wjid%>&fpath=<%=fpath %>');">上传</a>
<% }%>
<%}else if(num>0){%>
<%if("2".equals(ifflag) || "3".equals(ifflag)){%>
<a href='#' onclick="framejumpToC('tjwj_delete.jsp','openo=<%=openo%>&wjid=<%=wjid%>&fpath=<%=fpath %>&fileId=<%=fileId %>','确定删除该记录吗?');"><img border=0 src='images/icon/icon_delete.gif' alt='删除'>删除</a>						
<% }else{%>
<a href='#'  onclick="createFile('<%=openo%>','<%=fileId %>','<%=wjid%>','<%=bh%>');">重新生成</a>
<% }%>
<a href='#'  onclick="seeFile('<%=fpath %>','<%=fileId %>');" ><img border=0 src='images/icon/icon.gif' alt='查看'>查看</a>
<% 
}
%>
</td>
<td style="text-align:center;">
<%
if("1".equals(ifsign)){%>
<a href='#'  onclick ="eIDSign('<%=openo%>','<%=fileId%>','<%=filedes%>','<%=fpath %>')"  value="签名">签名</a>
<%}else if("3".equals(ifsign)){%>
<a href='#'  onclick ="eIDSign('<%=openo%>','<%=fileId%>','<%=filedes%>','<%=fpath %>')"  value="选择性签名">选择性签名</a>
<%}%>
</td>
<td>
<%if(remark.indexOf("下载")!=-1){ %>
<a href='#'  onclick="window.open('<%=url_qcdz %>')">
<%=remark%>
</a>
<%}else{ %>
<%=remark%>
<%} %>
</td>
</tr>
<%
}
%>
<tr>
</tr>
</table>
</form>
</body>
</html>
