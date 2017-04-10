<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.WSDJ_YYHM" %>
<%@ include file="/jspheader.inc"%>
<html>
<HEAD><TITLE></TITLE></HEAD>
<body>
<%
String YYRQ=SysUtility.doPreProcess(request.getParameter("YYRQ"));
String YYSXW=SysUtility.doPreProcess(request.getParameter("YYSXW"));
String REGORG=SysUtility.doPreProcess(request.getParameter("REGORG"));
String SWBH=SysUtility.doPreProcess(request.getParameter("SWBH"));
if(SWBH.equals("")){SWBH="0";}
String YYRQ_SPLIT[]=YYRQ.split("-");
String year=YYRQ_SPLIT[0];
String month=YYRQ_SPLIT[1];
String day=YYRQ_SPLIT[2];
if(month.length()==1){month="0"+month;}
if(day.length()==1){day="0"+day;}
YYRQ=year+"-"+month+"-"+day;
String info="",maxBh="";

WSDJ_YYHM wsyy=new WSDJ_YYHM();
if(wsyy.checkDateAfterToday(YYRQ)){
	info=wsyy.zm_check(YYRQ);
	if(info.equals("go")){
		info=wsyy.jjr_check(YYRQ);
		if(info.equals("go")){
			maxBh=wsyy.getMaxBh(REGORG,YYRQ,YYSXW);
		}	
	}
}
	
%>
<table width="100%" border="1" id="yyy">
<CAPTION>已预约人数</CAPTION>
<tr>
<td>
<%
if(info.equals("go")){
int mmbb=0;
if(maxBh!=null && !maxBh.equals("")){
	mmbb=Integer.parseInt(maxBh);
}
int nSWBH=Integer.parseInt(SWBH);
%>
当前已预约 <%=mmbb%> 人，还可预约 <%=(nSWBH-mmbb)%> 人
<%
}else{
out.println(info);
}
%>

</td>
</tr>
</table>
</body>
</html>
