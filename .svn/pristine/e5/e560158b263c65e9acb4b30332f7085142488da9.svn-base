<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="GGGL_JYDW_HDSX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_HDSX"/>
<%  	
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String ADBULICNO=Page.getpageKey();
	int INSYEAR=Page.getipageKey();
	String SIGN=Page.getpageKey1();
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();
	String V01=GGGL_JYDW_JBXX.getADBUENT();
	String V02=GGGL_JYDW_JBXX.getDOM();
	String V03=GGGL_JYDW_JBXX.getLEREP();
	String V04=GGGL_JYDW_JBXX.getADTYPE();	
	String V05=GGGL_JYDW_JBXX.getOPTO();
	String V06=GGGL_JYDW_JBXX.getOPDOMAREA()+"";
	String V07=GGGL_JYDW_JBXX.getREGCAP()+"";
	String V08=GGGL_JYDW_JBXX.getBUSSCOPE();
	String V09=GGGL_JYDW_JBXX.getEMPNUM()+"";
	String V012=GGGL_JYDW_JBXX.getCERDATE();	
	String V011=GGGL_JYDW_JBXX.getOPFROM();
	String V10=GGGL_JYDW_JBXX.getJUCOLNUM()+"";
	
	ArrayList list=GGGL_JYDW_HDSX.getList(" WHERE ADBULICNO='"+ADBULICNO+"' AND INSYEAR="+INSYEAR);
	StringBuffer scriptBf=new StringBuffer();
	if(list.size()<1){
		for(int k=1;k<=12;k++){
			String vk="0"+k;
			if(k>=10){
				vk=""+k;
			}
			scriptBf.append("document.getElementById('V"+vk+"').disabled=true;\n");		
			scriptBf.append("document.getElementById('V"+vk+"').value=document.getElementById('SV"+vk+"').value;\n");	
		}
	}
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.ggxkz.GGGL_JYDW_HDSX hdsx=(com.macrosoft.icms.ggxkz.GGGL_JYDW_HDSX)list.get(i);
		String ti=hdsx.getADINSCHEPRO();		
		if(hdsx.getMATSIGN().equals("1")){			
			scriptBf.append("document.getElementsByName('T"+ti+"')[0].checked=true;\n");			
			scriptBf.append("document.getElementById('V"+ti+"').value=document.getElementById('SV"+ti+"').value;\n");
			scriptBf.append("document.getElementById('V"+ti+"').disabled=true;\n");							
		}else{
			scriptBf.append("document.getElementsByName('T"+ti+"')[1].checked=true;\n");			
			scriptBf.append("document.getElementById('V"+ti+"').value='"+hdsx.getINSACST()+"';\n");			
		}			
	}
 %>
<html>
<head>
<title>核对事项</title>
<script language="javascript">
function body_load(){	
	<%=scriptBf.toString()%>	
}
function T_CHE(tv,value){
	var id="V"+tv;
	var svid="SV"+tv;	
	if(value=="1"){		
		document.getElementById(id).disabled=true;
		document.getElementById(id).value=document.getElementById(svid).value;
	}else{		
		document.getElementById(id).disabled=false;
		document.getElementById(id).value="";
	}
}
function doSub(){
	for(var i=1;i<=12;i++){
		var ti="0"+i;
		if(i>=10){
			ti=i;
		}
		var id="T"+ti;
		var t=document.getElementsByName(id);
		if(!(t[0].checked) && !(t[1].checked)){
			alert(t[0].title);
			return;
		}else{
			if(t[1].checked){				
				var sid="V"+ti;					
				if(document.getElementById(sid).value==""){
					var stitle=document.getElementById(sid).title;
					alert(stitle+"与登记事项不一致，请填写实际的"+stitle+"!");
					return;					
				}
			}
		}
	}
	if(document.form1.V09.value=="" || document.form1.V09.value<4){
		alert("广告从业人员总人数不应小于4人");
		return;
	}
	if(document.form1.V10.value=="" || document.form1.V10.value<2){
		alert("中大专以上学历人数不应小于2人");
		return;
	}
	if(!funCheckInForm2(document.form1)){
		return;
	}
	document.all("divWaitInfo").style.display="block";
	document.form1.submit();
}

function funCheckInForm2(form)
{
	var svid="";
	var objarr=form.elements;
	var pw="";
	var certype="";
	for (var i=0;i<objarr.length;i++)
	{
		obj=objarr[i];
		if(obj.name=="PASSWORD"){pw=obj.value;}
		if(obj.name=="CERTYPE"){certype=obj.value;}
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
					  if(obj.value!=""){
					    if (fucCheckTEL(obj.value)==0)
						{							
							svid+="\n["+title+"]:数据格式应为电话格式,且不少于6位!";
						}
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
					case "PWCONFORM":
					{
					    if(obj.value!=pw){
					       svid+="\n["+title+"]:两次输入的密码不一致!";
					    }
					    break;
					}
					case "CERNO":
					{
					    if(certype=="1"){
					       if (fucCheckSFZHM(obj.value)==0)
						   {							
							svid+="\n["+title+"]:数据格式应为身份证件格式!";
						   }
					    }
					    break;
					}
				}
			}
		}
	}
	if (svid=="")
	{
		document.getElementById("saveinfo").disabled=true;
		return true;
	}
	else
	{
		alert(svid);
		return false;
	}
}
</script>
</head> 
<body onload="body_load()">
<form name="form1" method="POST" action='ggxkz_hdsx_action.jsp' target="editframe">
<input type="hidden" name="SV01" id="SV01" value="<%=V01%>">
<input type="hidden" name="SV02" id="SV02" value="<%=V02%>">
<input type="hidden" name="SV03" id="SV03" value="<%=V03%>">
<input type="hidden" name="SV04" id="SV04" value="<%=V04%>">
<input type="hidden" name="SV05" id="SV05" value="<%=V05%>">
<input type="hidden" name="SV06" id="SV06" value="<%=V06%>">
<input type="hidden" name="SV07" id="SV07" value="<%=V07%>">
<input type="hidden" name="SV08" id="SV08" value="<%=V08%>">
<input type="hidden" name="SV09" id="SV09" value="<%=V09%>">
<input type="hidden" name="SV10" id="SV10" value="<%=V10%>">
<input type="hidden" name="SV11" id="SV11" value="<%=V011%>">
<input type="hidden" name="SV12" id="SV12" value="<%=V012%>">
<table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-bottom-width:0;">
  <caption>广告经营资格基本情况核对</caption>
  <tr id="yxsm"> 
  <td align="center">
   项 &nbsp; 目
  </td>
  <td align="center">与登记是否一致</td>
  <td align="center">广告经营资格检查时情况</td>
  </tr>
  
  <tr>
  <td class='lc1'>单位名称</td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T01" value="1" onclick="T_CHE('01','1')" title="请选择单位名称与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T01" value="2" onclick="T_CHE('01','2')">
  </td>
  <td class='lc2'><input type="text" id="V01" name="V01" style="width:280px" title="单位名称"></td>
  </tr>
  
   <tr>
  <td class='lc1'>住 &nbsp; 所</td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T02" value="1" onclick="T_CHE('02','1')" title="请选择住所与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T02" value="2" onclick="T_CHE('02','2')">
  </td>
  <td class='lc2'><input type="text" id="V02" name="V02" style="width:280px" title="住所"></td>
  </tr>
  
   <tr>
  <td class='lc1'>法定代表人（负责人）
  </td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T03" value="1" onclick="T_CHE('03','1')" title="请选择法定代表人与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T03" value="2" onclick="T_CHE('03','2')">
  </td>
  <td class='lc2'><input type="text" id="V03" name="V03" style="width:280px" title="法定代表人"></td>
  </tr>
  
   <tr>
  <td class='lc1'>单位类型</td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T04" value="1" onclick="T_CHE('04','1')" title="请选择单位类型与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T04" value="2" onclick="T_CHE('04','2')">
  </td>
  <td class='lc2'>
  <select id="V04" name="V04" title="单位类型">
  <option></option>    
  <option value="30">电视台</option>
  <option value="40">广播电台</option>
  <option value="50">报社</option>
  <option value="60">期刊社</option>
  <option value="70">网站</option>
  <option value="80">其他</option>
  </select> 
  </td>
  </tr>
  
  <tr>
  <td class='lc1'>营业期限起</td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T11" value="1" onclick="T_CHE('11','1')" title="请选择营业期限起与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T11" value="2" onclick="T_CHE('11','2')">
  </td>
  <td class='lc2'><input type="text" id="V11" name="V11" datatype='date' onclick="dropdowndate(this)" title="营业期限起"></td>
  </tr>
  
  <tr>
  <td class='lc1'>营业期限至</td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T05" value="1" onclick="T_CHE('05','1')" title="请选择营业期限至与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T05" value="2" onclick="T_CHE('05','2')">
  </td>
  <td class='lc2'><input type="text" id="V05" name="V05" datatype='date' onclick="dropdowndate(this)" title="营业期限至"></td>
  </tr>
  
   <tr>
  <td class='lc1'>经营场所面积
  </td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T06" value="1" onclick="T_CHE('06','1')" title="请选择经营场所面积与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T06" value="2" onclick="T_CHE('06','2')">
  </td>
  <td class='lc2'><input type="text" id="V06" name="V06" style="width:80px" title="经营场所面积"> （平方米）</td>
  </tr>
  
   <tr>
  <td class='lc1'>注册资本（资金数额）
  </td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T07" value="1" onclick="T_CHE('07','1')" title="请选择注册资本与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T07" value="2" onclick="T_CHE('07','2')">
  </td>
  <td class='lc2'>
  <input type="text" id="V07" name="V07" style="width:80px" title="注册资本"> （万元）
  </td>
  </tr>
  
   <tr>
  <td class='lc1'>广告经营范围
</td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T08" value="1" onclick="T_CHE('08','1')" title="请选择广告经营范围与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T08" value="2" onclick="T_CHE('08','2')">
  </td>
  <td class='lc2'>
  <textarea rows="4" cols="60" id="V08" name="V08" title="广告经营范围"></textarea>
  </td>
  </tr>
  
  <tr>
  <td class='lc1'>广告从业人员总人数
  </td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T09" value="1" onclick="T_CHE('09','1')" title="请选择广告从业人员情况与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T09" value="2" onclick="T_CHE('09','2')">
  </td>
  <td class='lc2'>
  <input type="text" id="V09" name="V09" style="width:50px" title="广告从业人员总人数"> 人<font color="red">（至少4人）</font><br/>  
  </td>
  </tr>
  
  <tr>
  <td class='lc1'>其中: 中大专以上学历人数
  </td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T10" value="1" onclick="T_CHE('10','1')" title="请选择中大专以上学历人数与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T10" value="2" onclick="T_CHE('10','2')">
  </td>
  <td class='lc2'>
  <input type="text" id="V10" name="V10" style="width:50px" title="中大专以上学历人数"> 人<font color="red">（至少2人）</font>
  </td>
  </tr>
  
   <tr>
  <td class='lc1'>发证日期</td>
  <td class='lc2'>
  与登记一致<input type="radio" name="T12" value="1" onclick="T_CHE('12','1')" title="请选择发证日期与登记事项是否一致">
  &nbsp;&nbsp;
  与登记不一致<input type="radio" name="T12" value="2" onclick="T_CHE('12','2')">
  </td>
  <td class='lc2'><input type="text" id="V12" name="V12" title="发证日期" datatype='date' onclick="dropdowndate(this)"></td>
  </tr>
</table>
<%
if(SIGN.equals("1")){

}else{
%>
<table border="1" width="100%" >
<tr>
	<td colspan="4" align='center'><INPUT name="saveinfo" id="saveinfo" onclick="doSub()" type="button" value="保  存" class="butontType"></td>
</tr>
</table>
<%}%>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<div id="divwaitinfo" class=wait><b>页面请求正在执行......</b></div>
</body>     
</html>
<script>
<%=scriptBf.toString()%>
</script>