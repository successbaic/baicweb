<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GTDJ_JYZXX" scope="page"  class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>经营者信息</title>
<script language="javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
</head> 
<body>
<%@include file="top.inc"%>
<%
  	String OPENO = Page.getOPENO();  	
  	String SIGN = Page.getSIGN();	//-1默认值,1已开业 查看
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);	
 %>
<form name="form1" method="POST" action='web/gtdj_jyzxx_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<%
  String title="经营者信息";
%>
<table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-bottom-width:0;">
  <tr>
    <td class="yxsm" colspan="6" align="center">
      <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080><%=title %></font>           
      </p>
    </td>
  </tr>
	 <tr>
    <td class="lc1" nowrap>姓名</td>
    <td class="lc2"><input type="text" name="NAME" size="16" title="姓名" maxlength=10 disblank><font color=red >*</font></td>
    <td class="lc1" nowrap>出生日期</td>
    <td class="lc2"><input type="text" name="BIRTHDAY" size="16" title="出生日期" datatype=date onclick="dropdowndate(this);"></td>
    <td class="lc1" nowrap>性别</td>         
    <td class="lc2" ><input type="radio" value="1" checked name="SEX">男&nbsp;&nbsp;<input type="radio" value="2" name="SEX">女
   </td>              
  </tr>                   
  <tr>
  
  	 <td class="lc1">经营者类别：</td> 
    <td class="lc2">
	<select size="1" name="WHETHERHKMAC" id="WHETHERHKMAC" style="width:110" title="经营者身份类别" onchange="sflb_change()">
	  <option value='1'>中国大陆</option>
	  <option value='2'>台湾</option>
	  <option value='3'>香港</option>
	  <option value='4'>澳门</option>
     </select>
	</td>
    <td class="lc1">联系电话</td>
    <td class="lc2" title="联系电话">
	<input type="text" name="TEL" size="16"  maxlength=20 title="联系电话" disblank><font color=red >*</font></td>
	
	<td class="lc1">邮政编码</td>
    <td class="lc2" >
    <input type="text" name="POSTALCODE" datatype=num size="16" title="邮政编码" maxlength=6 disblank><font color=red >*</font>
	</td>
  </tr>                  
  <tr>
	<td class="lc1">电子邮箱</td>
    <td class="lc2" >
    <input type="text" name="EMAIL" datatype=EMAIL size="16" title="电子邮箱" maxlength=30>
	</td>
	<td class="lc1">移动电话</td>                  
    <td class="lc2" colspan="3">
    <input type="text" name="MOBTEL"  size="16" title="移动电话" maxlength=30 disblank><font color=red >*</font>
    </td>
</tr>
<tr>
<td class="lc1">住所</td>                  
    <td class="lc2" colspan="5">
	<input type="text" name="DOM" size="70" title="住所" maxlength=90 disblank><font color=red >*</font></td>
</tr>
<tr>
     <td class="lc1">文化程度</td>                   
    <td class="lc2" >
    <select size="1" name="LITEDEG" style="width:180" title="文化程度">
		<option value=''>&nbsp;</option>
			<%=icms.getSysDmList("LITEDEG")%>
		</select>
	</td>	
	 <td class="lc1">职业状况</td>                 
    <td class="lc2" colspan="3"><input type="text" name="OCCSTBEAPP" size="50" maxlength=50 title="职业状况"></td>
</tr>    
 <tr>
 	<td class="lc1">政治面貌</td>                 
    <td class="lc2">
    <select size="1" name="POLSTAND" style="width:180" title="政治面貌">
		<option value=''>&nbsp;</option>
			<%=icms.getSysDmList("POLSTAND")%>
		</select>
    </td>                  
    <td class="lc1">民族</td>                  
    <td class="lc2"colspan="3">
    <select size="1" name="NATION" style="width:110" title="民族">
		<option value=''>&nbsp;</option>
			<%=icms.getSysDmList("NATION")%>
		</select>
		</td> 
 </tr> 
  <tr id="trdl">
  <td class="lc1">大陆居民身份证件</td>
  <td colspan="5">
  		<table cellpadding="0" cellspacing="0" width="100%" border="1" frame=void>
  			 <tr id="trdl1">			  
			    <td class="lc1">证件类型</td>                 
			    <td class="lc2">
				<select size="1" name="CERTYPE" style="width:180" disblank title="证件类型" disabled="disabled">
						<%=icms.getSysDmList("CERTYPE")%>
					</select><font color=red >*</font>
				</td>                 
			    <td class="lc1">证件号码</td>                  
			    <td class="lc2" colspan="3"><input type="text" name="CERNO" size="25" disblank title="证件号码" maxlength=20><font color=red >*</font></td>                  
			 </tr>
  		</table>
  </td>
  <tr>
  
  <tr id="trtw">
  <td class="lc1">台湾农民<br>身份证件</td>
  <td colspan="5">
  		<table cellpadding="0" cellspacing="0" width="100%" border="1" frame=void>
  			 <tr id="trtw1">
			    <td class="lc1">证件名称</td>                 
			    <td class="lc2">
				<select size="1" name="TCERTYPE" style="width:160" disblank title="台湾农民身份证件名称">
						<%=icms.getSysDmList("TCERTYPE")%>
					</select><font color=red >*</font></td>                 
			    <td class="lc1">证件号码</td>                  
			    <td class="lc2"><input type="text" name="TCERNO" size="25" disblank title="台湾农民身份证件号码" maxlength=20><font color=red >*</font></td>                  
			  	<td class="lc1">证件有效期</td>                  
			    <td class="lc2"><input type="text" name="TCERVALPER" size="15" title="台湾农民身份证件有效期" datatype=NUM>年</td>                  
			 </tr>  
			 <tr id="trtw2">
			 <td class="lc1">台湾农民身份<br/>证明文件名称</td>                  
			    <td class="lc2" colspan="3"><input type="text" name="TCERNAME" size="50" title="台湾农民身份证明文件名称" maxlength=20></td>
			    <td class="lc1">文件编号</td>                  
			    <td class="lc2"><input type="text" name="TCERNUM" size="25" title="台湾农民身份证明文件编号" maxlength=20></td>
			 </tr>
  		</table>
  </td>
  <tr>
  
  <tr id="trxg">
  <td class="lc1">香港居民<br>身份证件</td>
  <td colspan="5">
  		<table cellpadding="0" cellspacing="0" width="100%" border="1">
		  <tr id="trxg1">                  
		    <td class="lc1">证件名称</td>                 
		    <td class="lc2">
			<select size="1" name="HCERTYPE" style="width:180" disblank title="香港居民身份证件名称">
					<%=icms.getSysDmList("HCERTYPE")%>
				</select><font color=red >*</font></td>                 
		    <td class="lc1">证件号码</td>                  
		    <td class="lc2"><input type="text" name="HCERNO" size="25" disblank title="香港居民身份证件号码" maxlength=20><font color=red >*</font></td>                  
		  	<td class="lc1">证件有效期</td>                  
		    <td class="lc2"><input type="text" name="HCERVALPER" size="15" title="香港居民身份证件有效期" datatype=NUM>年</td>                  
		 </tr>
  		</table>
  </td>
  <tr>
  
  <tr id="tram">
  <td class="lc1">澳门居民<br>身份证件</td>
  <td colspan="5">
  		<table cellpadding="0" cellspacing="0" width="100%" border="1">
  		 <tr id="tram1">
		    <td class="lc1">证件名称</td>                 
		    <td class="lc2">
			<select size="1" name="MCERTYPE" style="width:180" disblank title="澳门居民身份证件名称">
					<%=icms.getSysDmList("MCERTYPE")%>
				</select><font color=red >*</font></td>                 
		    <td class="lc1">证件号码</td>                  
		    <td class="lc2"><input type="text" name="MCERNO" size="25" disblank title="澳门居民身份证件号码" maxlength=20><font color=red >*</font></td>                  
		  	<td class="lc1">证件有效期</td>                  
		    <td class="lc2"><input type="text" name="MCERVALPER" size="15" title="澳门居民身份证件有效期" datatype=NUM>年</td>                  
		 </tr>
  		</table>
  </td>
  <tr>
</table>
<table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-bottom-width:0;">
  <tr>
	<td class="lc2" colspan="8">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。
	<br>	
  </tr>
</table>
<br>
<CENTER>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
</div>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">下一页</div>
<%
}
%>
</CENTER>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
<%@include file="bottom.inc"%>
</body>
</html>
<div id="divwaitinfo" class=wait><b>页面请求正在执行......</b></div>
<!--  错误检查代码开始  //-->
<script language='javascript'> 
function form1errorCheck()
{
	if(checkSFZH()==false)
	{
		return false;
	}
 	var WHETHERHKMAC=document.getElementById("WHETHERHKMAC").value;
	if(!funCheckInForm2(document.form1,WHETHERHKMAC))
	{
		return(false);
	}
document.all("divWaitInfo").style.display="block";
return true;
}
//document.form1.onsubmit=form1errorCheck;
</script>
<script language='javascript'> 
function checkSFZH()
{	
	var ret=true;
	if (document.form1.WHETHERHKMAC.value=="1" && document.form1.CERTYPE.value=="10")	// 身份证
	{
		ret=validatezjhm(document.form1.CERNO.value);
		if(ret){
		
		}else{
			//document.form1.btSave.disabled=false;
		}
	}
	return ret;
}

function sflb_change(){
	var WHETHERHKMAC=document.getElementById("WHETHERHKMAC").value;
	if(WHETHERHKMAC=="1"){
		document.getElementById("trdl").style.display="";
		document.getElementById("trxg").style.display="none";
		document.getElementById("tram").style.display="none";
		document.getElementById("trtw").style.display="none";
	}else if(WHETHERHKMAC=="2"){
		document.getElementById("trdl").style.display="none";
		document.getElementById("trxg").style.display="none";
		document.getElementById("tram").style.display="none";
		document.getElementById("trtw").style.display="";
	}else if(WHETHERHKMAC=="3"){
		document.getElementById("trdl").style.display="none";
		document.getElementById("trxg").style.display="";
		document.getElementById("tram").style.display="none";
		document.getElementById("trtw").style.display="none";
	}else if(WHETHERHKMAC=="4"){
		document.getElementById("trdl").style.display="none";
		document.getElementById("trxg").style.display="none";
		document.getElementById("tram").style.display="";
		document.getElementById("trtw").style.display="none";
	}
}
function funCheckInForm2(form,WHETHERHKMAC)
{
	var svid="";
	var objarr=form.elements;
	for (var i=0;i<objarr.length;i++)
	{
		obj=objarr[i];
		if (obj!=null)
		{	
			title=obj.title;
			if (title==null||title=="")
				title="";
			//长度超长
			maxlength=obj.maxlength;
			
			if (maxlength!=null&&maxlength!="")
			{	// 注: maxlength 仅对textarea起作用
				if (fucCheckLength(obj.value)>maxlength)
				{
					svid+="\n["+title+"]:输入请少于["+maxlength+"]个字符!";
				}
				
			}
			//不能为空
			disblank=obj.disblank;
			if (disblank!=null&&obj.disabled==false)
			{
				if(WHETHERHKMAC=="1"){
					if(obj.name=="MCERTYPE"||obj.name=="MCERNO" 
					|| obj.name=="HCERTYPE"||obj.name=="HCERNO"
					|| obj.name=="TCERTYPE"||obj.name=="TCERNO"
					){
						continue;
					}
				}else if (WHETHERHKMAC=="2"){
					if(obj.name=="CERTYPE"||obj.name=="CERNO" 
					|| obj.name=="MCERTYPE"||obj.name=="MCERNO" 
					|| obj.name=="HCERTYPE"||obj.name=="HCERNO"
					){						
						continue;
					}
				}else if (WHETHERHKMAC=="3"){
					if(obj.name=="CERTYPE"||obj.name=="CERNO" 
					|| obj.name=="MCERTYPE"||obj.name=="MCERNO" 
					|| obj.name=="TCERTYPE"||obj.name=="TCERNO"
					){
						continue;
					}
				}else if (WHETHERHKMAC=="4"){
					if(obj.name=="CERTYPE"||obj.name=="CERNO" 
					|| obj.name=="HCERTYPE"||obj.name=="HCERNO"
					|| obj.name=="TCERTYPE"||obj.name=="TCERNO"
					){
						continue;
					}
				}
				
				if (obj.type.toUpperCase()=="RADIO")
				{
					if (getCheckedValue(form.name+"."+obj.name)=="")
					{
						svid+="\n["+title+"]:必须选择一项数据!";
					}
				}
				else if (fucCheckLength(obj.value)<=0)
				{
					svid+="\n["+title+"]:必须输入数据!";
				}
				
				
			}
			//输入类型
			datatype=obj.datatype;
			
			if (datatype!=null)
			{
				switch (datatype.toUpperCase())
				{
					case "DATE":
					{
						if (fucCheckDate(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为日期型!";							
						}
						break;
					}
					case "INT":
					{
						if (fucCheckInt(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为整数型!";
						}
						break;
					}
					case "NUM":
					{
						if (fucCheckNUM(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为数字型!";
						}
						break;
					}
					case "NOTZERO":
					{
						if (fucCheckNotZero(obj.value)==0)
						{							
							svid+="\n"+title+":数字应为大于零!";
						}
						break;
					}
					case "TEL":
					{
						if (fucCheckTEL(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为电话格式!";
						}
						break;
					}
					case "EMAIL":
					{
						if (fucCheckEmail(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为Email格式!";
						}
						break;
					}
					case "SFZHM":
					{
						if (fucCheckSFZHM(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为身份证件格式!";
						}
						break;
					}
					case "ENTTYPE":
					{
						if (fucCheckEntType(obj.value)==0)
						{							
							svid+="\n["+title+"]:请选择较为精确的企业类型!";
						}
						break;
					}
					
				}
			}
		}
	}
	if (svid=="")
	{
		if(WHETHERHKMAC=="1"){
			document.getElementById("TCERTYPE").value="";
			document.getElementById("TCERNO").value="";
			document.getElementById("TCERVALPER").value="";
			document.getElementById("TCERNAME").value="";
			document.getElementById("TCERNUM").value="";
			
			document.getElementById("HCERTYPE").value="";
			document.getElementById("HCERNO").value="";
			document.getElementById("HCERVALPER").value="";
			
			document.getElementById("MCERTYPE").value="";
			document.getElementById("MCERNO").value="";
			document.getElementById("MCERVALPER").value="";					
		}else if (WHETHERHKMAC=="2"){
			document.getElementById("CERTYPE").value="";
			document.getElementById("CERNO").value="";
			
			document.getElementById("HCERTYPE").value="";
			document.getElementById("HCERNO").value="";
			document.getElementById("HCERVALPER").value="";
			
			document.getElementById("MCERTYPE").value="";
			document.getElementById("MCERNO").value="";
			document.getElementById("MCERVALPER").value="";
								
		}else if (WHETHERHKMAC=="3"){
			document.getElementById("CERTYPE").value="";
			document.getElementById("CERNO").value="";
			
			document.getElementById("TCERTYPE").value="";
			document.getElementById("TCERNO").value="";
			document.getElementById("TCERVALPER").value="";
			document.getElementById("TCERNAME").value="";
			document.getElementById("TCERNUM").value="";												
			
			document.getElementById("MCERTYPE").value="";
			document.getElementById("MCERNO").value="";
			document.getElementById("MCERVALPER").value="";
		}else if (WHETHERHKMAC=="4"){
			document.getElementById("CERTYPE").value="";
			document.getElementById("CERNO").value="";
			
			document.getElementById("TCERTYPE").value="";
			document.getElementById("TCERNO").value="";
			document.getElementById("TCERVALPER").value="";
			document.getElementById("TCERNAME").value="";
			document.getElementById("TCERNUM").value="";
			
			document.getElementById("HCERTYPE").value="";
			document.getElementById("HCERNO").value="";
			document.getElementById("HCERVALPER").value="";					
		}
		for (var i=0;i<objarr.length;i++)
		{
			obj=objarr[i];			
			if (obj!=null)
				obj.disabled=false;
			if (obj.type.toUpperCase()=="SUBMIT")
				obj.disabled=true;
		}	

		return true;
	}
	else
	{
		alert(svid);
		return false;
	}
}
</script>
 <%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	GTDJ_JYZXX.setOPENO(OPENO);	
	vf.setData(GTDJ_JYZXX.getData());
	vf.setUserFunction("sflb_change()");
 	out.print(vf.ValueDefaultScript());
%>
