<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" %>
<%@ page import="com.macrosoft.icms.util.WSDJ_YYHM" %>
<%@ page import="com.macrosoft.icms.util.WSDJ_YYHM_REGORG"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ include file="/jspheader.inc"%>
<html>
<script type="text/javascript">
function doYy(sjd){
	if(document.form1.YYRQ.value==""){
		alert("请选择预约日期！");
		return;
	}
	if(window.confirm("您确定选择该日期该时间段作为预约日期？\n预约后不可修改。")){
		document.form1.SFYQ.value="N";
		document.form1.YYSXW.value=sjd;
		document.form1.submit();
	}	
}

function doYy2(sjd){
	if(document.form1.YYRQ.value==""){
		alert("请选择预约日期！");
		return;
	}
	if(window.confirm("您确定选择该日期作为预约日期？\n预约后不可修改。")){
		document.form1.SFYQ.value="Y";
		document.form1.YYSXW.value=sjd;
		document.form1.submit();
	}	
}
</script>
<body>
<%
String REGORG=request.getParameter("REGORG");
String xzyysj=request.getParameter("xzyysj");
String yysj=request.getParameter("yysj");
String OPENO=request.getParameter("OPENO");
String ENTNAME=request.getParameter("ENTNAME");
String type=request.getParameter("yytype");
WSDJ_YYHM_REGORG yyreg=new WSDJ_YYHM_REGORG();
yyreg.setREGORG(REGORG);
yyreg.setTYPE(type);
yyreg.doSelect();

int BH1=yyreg.getBH1();
int BH2=yyreg.getBH2();
int BH3=yyreg.getBH3();
int BH4=yyreg.getBH4();
int BH5=yyreg.getBH5();
int BH6=yyreg.getBH6();
int BH7=yyreg.getBH7();
//实际预约数
int sBH1=0;
int sBH2=0;
int sBH3=0;
int sBH4=0;
int sBH5=0;
int sBH6=0;
int sBH7=0;

//是否可以进行逾期预约
//如果选择的预约日期大于当前日期则可以点击逾期预约按钮
boolean sfkyy=false;
if(xzyysj!=null&&!"".equals(xzyysj)){
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c = Calendar.getInstance();
	Date dt=c.getTime();
	String dqrq=df.format(dt);
	try{
        Date dt1 = df.parse(xzyysj);
        Date dtdqrq = df.parse(dqrq);
        if (dt1.getTime() > dtdqrq.getTime()) {
        	sfkyy=true;
        }
	}catch(Exception e){
		e.printStackTrace();
	}
}
System.out.print("xzyysj="+xzyysj);
String sqlSelect="SELECT MAX(to_number(YYH)) AS YYH,YYSXW FROM WSDJ_YYHM WHERE REGORG='"+REGORG+"' AND to_char(YYSJ,'yyyy-MM-dd')='"+xzyysj+"' AND TYPE='"+type+"' GROUP BY YYSXW";
ResultSet rsSelect;	
rsSelect=dbc.executeQuery(sqlSelect);	
while(rsSelect.next())
{
	String yyh=rsSelect.getString("YYH");			
	if(yyh!=null && !yyh.equals("")){
		if(rsSelect.getString("YYSXW").equals("1")){
			sBH1=Integer.parseInt(yyh);
		}else if(rsSelect.getString("YYSXW").equals("2")){
			sBH2=Integer.parseInt(yyh);
		}else if(rsSelect.getString("YYSXW").equals("3")){
			sBH3=Integer.parseInt(yyh);
		}else if(rsSelect.getString("YYSXW").equals("4")){
			sBH4=Integer.parseInt(yyh);
		}else if(rsSelect.getString("YYSXW").equals("5")){
			sBH5=Integer.parseInt(yyh);
		}else if(rsSelect.getString("YYSXW").equals("6")){
			sBH6=Integer.parseInt(yyh);
		}else if(rsSelect.getString("YYSXW").equals("7")){
			sBH7=Integer.parseInt(yyh);
		}	
	}
}
WSDJ_YYHM yyhm=new WSDJ_YYHM();
boolean sfyq=false,sfxz=false;
if(yysj!=null && !yysj.equals("")){
	sfyq=!yyhm.checkDateAfterToday(yysj);
}
if(!yysj.equals("") && !sfyq){
	sfxz=true;
}
%>
<form name="form1" method="POST" action='wsyy_qyxz_aciton.jsp' target="editframe">
<input type="hidden" name="OPENO" value="<%=OPENO%>">
<input type="hidden" name="REGORG" value="<%=REGORG%>">
<input type="hidden" name="ENTNAME" value="<%=ENTNAME%>">
<input type="hidden" name="YYSXW">
<input type="hidden" name="SFYQ">
<input type="hidden" name="YYRQ" value=<%=xzyysj %>>
<input type="hidden" name="YYTYPE" value=<%=type %>>
<table width="100%" border="1">
<tr>
<td class="lc1">时间</td>
<td class="lc1">最大预约数</td>
<td class="lc1">实际预约数</td>
<td class="lc1">操作</td>
</tr>
<tr align="center">
<td>9:00~9:59</td>
<td><%=BH1 %></td>
<td><%=sBH1 %></td>
<td>
<%
if(yysj.equals("")){//尚未预约
	if(BH1>sBH1){%>
	  <INPUT type="button" value=" 预  约 " onclick="doYy(1)" class="inp_L1" >
    <%}else{ %>
      <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% }
}else{//已预约超期
	if(sfyq&&sfkyy){
		if(BH1>sBH1){%>
	     <INPUT type="button" value="逾期预约 " onclick="doYy2(1)" class="inp_L1" >
	    <%}else{ %>
	     <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% 	    }
    }else{%>
    <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled"> 
<%}
}%>
</td>
</tr>
<tr align="center">
<td>10:00~10:59</td>
<td><%=BH2 %></td>
<td><%=sBH2 %></td>
<td>
<%
if(yysj.equals("")){//尚未预约
	if(BH2>sBH2){%>
	  <INPUT type="button" value=" 预  约 " onclick="doYy(2)" class="inp_L1" >
    <%}else{ %>
      <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% }
}else{//已预约超期
	if(sfyq&&sfkyy){
		if(BH2>sBH2){%>
	     <INPUT type="button" value="逾期预约 " onclick="doYy2(2)" class="inp_L1" >
	    <%}else{ %>
	     <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% 	    }
    }else{%>
    <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled"> 
<%}
}%>
</td>
</tr>
<tr align="center">
<td>11:00~11:59</td>
<td><%=BH3 %></td>
<td><%=sBH3 %></td>
<td>
<%
if(yysj.equals("")){//尚未预约
	if(BH3>sBH3){%>
	  <INPUT type="button" value=" 预  约 " onclick="doYy(3)" class="inp_L1" >
    <%}else{ %>
      <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% }
}else{//已预约超期
	if(sfyq&&sfkyy){
		if(BH3>sBH3){%>
	     <INPUT type="button" value="逾期预约 " onclick="doYy2(3)" class="inp_L1" >
	    <%}else{ %>
	     <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% 	    }
    }else{%>
    <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled"> 
<%}
}%>
</td>
</tr>
<tr align="center">
<td>1:30~2:29</td>
<td><%=BH4 %></td>
<td><%=sBH4 %></td>
<td>
<%
if(yysj.equals("")){//尚未预约
	if(BH4>sBH4){%>
	  <INPUT type="button" value=" 预  约 " onclick="doYy(4)" class="inp_L1" >
    <%}else{ %>
      <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% }
}else{//已预约超期
	if(sfyq&&sfkyy){
		if(BH4>sBH4){%>
	     <INPUT type="button" value="逾期预约 " onclick="doYy2(4)" class="inp_L1" >
	    <%}else{ %>
	     <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% 	    }
    }else{%>
    <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled"> 
<%}
}%>
</td>
</tr>
<tr align="center">
<td>2:30~3:29</td>
<td><%=BH5 %></td>
<td><%=sBH5 %></td>
<td>
<%
if(yysj.equals("")){//尚未预约
	if(BH5>sBH5){%>
	  <INPUT type="button" value=" 预  约 " onclick="doYy(5)" class="inp_L1" >
    <%}else{ %>
      <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% }
}else{//已预约超期
	if(sfyq&&sfkyy){
		if(BH5>sBH5){%>
	     <INPUT type="button" value="逾期预约 " onclick="doYy2(5)" class="inp_L1" >
	    <%}else{ %>
	     <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% 	    }
    }else{%>
    <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled"> 
<%}
}%>
</td>
</tr>
<tr align="center">
<td>3:30~4:29</td>
<td><%=BH6 %></td>
<td><%=sBH6 %></td>
<td>
<%
if(yysj.equals("")){//尚未预约
	if(BH6>sBH6){%>
	  <INPUT type="button" value=" 预  约 " onclick="doYy(6)" class="inp_L1" >
    <%}else{ %>
      <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% }
}else{//已预约超期
	if(sfyq&&sfkyy){
		if(BH6>sBH6){%>
	     <INPUT type="button" value="逾期预约 " onclick="doYy2(6)" class="inp_L1" >
	    <%}else{ %>
	     <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% 	    }
    }else{%>
    <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled"> 
<%}
}%>
</td>
</tr>
<tr align="center">
<td>4:30~5:29</td>
<td><%=BH7 %></td>
<td><%=sBH7 %></td>
<td>
<%
if(yysj.equals("")){//尚未预约
	if(BH7>sBH7){%>
	  <INPUT type="button" value=" 预  约 " onclick="doYy(7)" class="inp_L1" >
    <%}else{ %>
      <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% }
}else{//已预约超期
	if(sfyq&&sfkyy){
		if(BH7>sBH7){%>
	     <INPUT type="button" value="逾期预约 " onclick="doYy2(7)" class="inp_L1" >
	    <%}else{ %>
	     <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled">
<% 	    }
    }else{%>
    <INPUT type="button" value=" 预  约 " class="inp_L1" disabled="disabled"> 
<%}
}%>
</td>
</tr>
</table>
</form>
<iframe height="0" width="100" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0"></iframe>
</body>
</html>