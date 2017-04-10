function login(){
	if(funcheck()){
		document.form1.submit();
	}
}
function funcheck()
{
	if (document.form1.QYMC.value=='')
	{
		alert("用户名不能为空");
		document.form1.QYMC.focus();
		return false;
	}
	if (document.form1.QYMC.value.length==0)
	{
		window.alert("请输入企业名称作为用户名!");
		document.form1.QYMC.focus();
		return(false);
	}
	else
	{
		return(true);
	}
}
function DOSTH(val)
{
	if (val==2)
	{
		document.getElementById("QYMC").style.display="none";
		document.getElementById("PASSWORD").style.display="none";
	}
	else
	{
		document.getElementById("QYMC").style.display="";
		document.getElementById("PASSWORD").style.display="";
	}
}

function AttachSign()
{
	var plain,signtext,temp_AttachSign_Result;
		plain="1";		// plain的值要改成服务器时间，精确到秒

	JITDSignOcx.SetCertChooseType(0);	
	//证书选择的类型（0 表示只有一张证书时也弹出证书选择框，1 表示只有一张证书时将不弹出证书选择框，默认值为0）

	JITDSignOcx.SetCert("SC","","","","","");

	temp_AttachSign_Result = JITDSignOcx.AttachSign("",plain);
				
	if(JITDSignOcx.GetErrorCode()!=0)
		{
		alert("错误码："+JITDSignOcx.GetErrorCode()+" 错误信息："+JITDSignOcx.GetErrorMessage());
		}
		else
			{
			 form1.signtext.value = temp_AttachSign_Result;
			}
//		form1.Enveloptype.value = 3;
	form1.submit();
}

function sub()
{
	var b=document.all("LOGSTYLE");
	var c=-1;

	
	for (var j=0; j<b.length; j++)
	{			
			if (b[j].checked)
			{	
				c=b[j].value;
			}
	
	}

	// 根据登录方式不同
	if (c==1)	//非ca
	{
		// 校验必填
		if (funcheck())
		{
			document.form1.submit();
		}
	}
	else
	{
		AttachSign();
	}
}
function focusNext(form, elemName, evt) {
	evt = (evt) ? evt : event;
	var charCode = (evt.charCode) ? evt.charCode :
	   ((evt.which) ? evt.which : evt.keyCode);
	if (charCode == 13 || charCode == 3) {
	   form.elements[elemName].focus();
	   return false;
	}
	return true;
	}
	function submitViaEnter(evt,Location) {
	evt = (evt) ? evt : event;
	var target = (evt.target) ? evt.target : evt.srcElement;
	var form = target.form;
	var charCode = (evt.charCode) ? evt.charCode :
	   ((evt.which) ? evt.which : evt.keyCode);
	if (charCode == 13 || charCode == 3) {
		document.form1.logsub.onclick();
		return false;
	}
	return true;
}
	