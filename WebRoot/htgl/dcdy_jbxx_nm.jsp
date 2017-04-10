<%@page import="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"%>
<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="DCDY_JBXX" scope="page"  class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ"/>
<html>
<head>
<title>基本情况</title>
</head>

<body>
<%@include file="/top.inc"%>
<%
String pageheader=Page.pageheader(request.getRequestURI());

out.println(pageheader);
String SIGN = Page.getSIGN();	//-1数据未保存,1已开业
String OPENO =Page.getOPENO();
String OPETYPE =Page.getOPETYPE();
//System.out.println("SIGN="+SIGN+",OPENO="+OPENO+",OPETYPE="+OPETYPE);
%>
<br/>
<form name="form1" action="action/dcdy_jbxx_nm_action.jsp" method="post" target="editframe">
<input type="hidden" name="MORTGAGOTYPE">
<input type="hidden" name="STATUS">
<input type="hidden" name="APPDATE" value="<%=webuser.getCurrentDate()%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
<input type="hidden" name="OPETYPE" value="20">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<table border="1" width="100%" >
<caption>抵押人信息</caption>
<tr>      
	<td class="lc1">抵押人类别</td>
	<td class="lc2" colspan="6">
	    <input type="radio" value="0" name="MORTGAGOTYPE" disabled="disabled"> 企业&nbsp;		
		<input type="radio" value="1" name="MORTGAGOTYPE" disabled="disabled"> 个体工商户&nbsp;
		<input type="radio" value="2" name="MORTGAGOTYPE" checked> 农业生产经营者
	</td>
</tr>

<tr>
	<td class="lc1"  >企业名称</td>
	<td class="lc2" colspan="1"   >
	<input id="entname" type="text" name="MORTGAGO" size="30"  title="企业名称" ></td>
	 
	<td class="lc1" >统一社会信用代码/注册号</td>
	<td class="lc2"  colspan="4" >
	<input id="regno" type="text" name="REGORUN" size="30"  title="统一社会信用代码/注册号" ></td>
</tr> 
<tr> 
	<td class="lc1" >企业类型</td> 
	<td class="lc2" >
	<select id ="enttype" size="1" name="ENTTYPE"   title="企业类型">
	<OPTION></OPTION>
			<%=icms.getSysDmList("ENTTYPE")%>
		</select></td> 
	<td class="lc1" >住所</td> 
	<td class="lc2" colspan="4" >
	<input id="dom" type="text" name="MORTGAGOADDRESS" size="40"  title="住所" ></td> 
</tr>
<tr> 
	<td class="lc1" >法人证照类型</td> 
	<td class="lc2" >
	<select id ="certype" size="1" name="MORTGAGOCERTYPE"   title="法人证照类型">
	<OPTION></OPTION>
			<%=icms.getSysDmList("CERTYPE")%>
		</select></td> 
	<td class="lc1" >证照号码</td> 
	<td class="lc2"  colspan="4" >
	<input id="cerno" type="text" name="MORTGAGORPERNO" size="20"  title="证照号码" ></td> 
</tr>
<tr>      
	<td class="lc1" >法人名称(姓名)</td>      
	<td class="lc2" colspan="6"  >
	<input id="name" type="text" name="MORTGAGOAGENT" size="40"  title="法人名称（姓名）" ></td>
</tr>
<%--tr> 
	<td class="lc1" >代理人证照类型</td>
	<td class="lc2">
	<select size="1" name="DYRDLZZLX"   title="抵押人代理人证照类型">
			<%=icms.getSysDmList("CERTYPE")%>
		</select></td>
	<td class="lc1" >代理人证照号码</td>
	<td class="lc2" colspan="4" >
	<input type="text" name="DYRDLZZHM" size="20"  title="抵押人代理人证照号码" ></td>
</tr--%>  
</table>
<table border="1" width="100%" >
<caption>抵押权人信息</caption>
<tr>
	<td class='lc1'>抵押权人名称(姓名)</td>
	<td class='lc2' colspan="6">
	<input type="text" name="MORE" size="67"  title="抵押权人名称（姓名）" ></td>  
	
</tr>
<tr>      
	<td class="lc1" >抵押权人证照类型</td>   
	<td class="lc2" >
	<select size="1" name="MORECERTYPE"   title="抵押权人证照类型"><OPTION></OPTION>
			<%=icms.getSysDmList("CERTYPE")%>
		</select></td>
	<td class="lc1" >抵押权人证照号码</td>
	<td class="lc2"  colspan="4" >
	<input type="text" name="MOREPERNO" size="20"  title="抵押权人证照号码" ></td>
</tr>     
<tr>      
	<td class="lc1" >抵押权人代理人名称(姓名)</td>   
	<td class="lc2"  colspan="6">
	<input type="text" name="MOREAGENT" size="60"  title="抵押权人代理人名称（姓名）" ></td>
</tr>
<%--tr>
	<td class="lc1" >代理人证照类型</td>
	<td class="lc2">
	<select size="1" name="DYQRDLZZLX"   title="抵押权人代理人证照类型">
			<%=icms.getSysDmList("HTCERTYPE")%>
		</select></td>
	<td class="lc1" >代理人证照号码</td>
	<td class="lc2" colspan="4">
	<input type="text" name="DYQRDLZZHM" size="20"  title="抵押权人代理人证照号码" ></td>
</tr--%>      

</table>
<table border="1" width="100%" >
<caption>被担保债权信息</caption>
<tr>      
	<td class="lc1"  >被担保的主债权种类</td>      
	<td class="lc2"  >
	<select size="1" name="MAINCONTTYPE"   title="被担保的主合同种类" disblank>
			<option value=''>请选择</option><option value='1'>购销</option><option value='2'>借贷</option><option value='3'>其它</option>
		</select></td>
	<td class="lc1" >主债权数额</td>
	<td class="lc2" >
	<input type="text" name="MAINCONTAM" size="10"  title="被担保的主合同金额" datatype=NUM disblank>万元</td>
</tr> 

<tr>
	<td class="lc1" >履行期限自</td>
	<td class="lc2" colspan="3"   >
	<input type="text" name="PEFPERFROM"  datatype=date  size="10" title="履行期限自" onclick="dropdowndate(this);">&nbsp;&nbsp; 
	至<input type="text" name="PEFPERTO"  datatype=date  size="10" title="履行期限至" onclick="dropdowndate(this);"></td>  

</tr>
<tr>      
	<td class="lc1"  >担保范围</td>      
	<td class="lc2" colspan="3" >
	<textarea rows="5" name="PRICRE" cols="70"></textarea></td>     
</tr>
<%--tr>      
	<td class="lc1"  >合同的其他约定</td>      
	<td class="lc2" colspan="3" >
	<input type="text" name="CONTOTHSTI" size="70"  title="合同的其他约定" ></td>      
</tr--%>
<tr>      
	<td class="lc1"  >登记机关</td>      
	<td class="lc2"  colspan="3">
	<select size="1" name="REGORG"  disblank title="登记机关">
	<OPTION VALUE="">
	<%	
	     out.print(icms.getSysDmList("REGORG"));	  
	%>
	</select>
	</td>	
</tr>
<tr>      
	<td class="lc1"  >备注</td>      
	<td class="lc2" colspan="3" >
	<textarea rows="5" name="REMARK" cols="70"></textarea></td>      
</tr>
</table>
<center>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一页</div>
<%
}
%>
</center>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<%@include file="/bottom.inc"%>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	//ec.setUserFunction("checkMORTGAGOTYPE()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	System.out.println("OPENO="+OPENO);
	if ("".equals(OPENO)||OPENO==null||"null".equals(OPENO)){

	}else{
	   DCDY_JBXX.setOPENO(OPENO);
	   vf.setData(DCDY_JBXX.getData());
	}	
	//vf.setUserFunction("showDylx()");
	out.print(vf.ValueDefaultScript());
%>