<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<script type="text/javascript">
function doSub(){
	if(window.confirm("确定执行当前操作吗？")){
		document.getElementById("subid").disabled=true;
		document.getElementById("waitdiv").style.display="";
		document.form1.submit();
	}
}
</script>
</head>
<body>
<table width="80%" border="0" align="center"><tr><td>
<font color="red"><strong>说明：</strong></font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;该页面用于将原网上登记用户的密码进行MD5加密，加密后，用户密码将不再以明文的方式存放在数据库中。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;操作步骤如下：<br/>
&nbsp;&nbsp;&nbsp;&nbsp;第一步、先在网上登记数据库中增加备用字段，并进行备份，执行如下语句：<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）alter table WEB_USER add MDREMARK varchar2(1);<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;commit;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）create table web_user_bfmd as select * from web_user;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;第二步、点击“批量MD5加密”按钮，部分地市用户量较大，点击后，等待时间会较长，请耐心等待。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;第三步、系统最后会给出操作成功或操作失败的提示。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作成功后，请删除iaicweb项目的webuser_domd5.jsp文件。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;并在数据库中删除备用字段：alter table WEB_USER drop column MDREMARK;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果提示操作失败，请联系统管理员。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;第四步、操作完毕后，确保内网业务系统程序也已经发包更新。正常运行后，可以根据需要删除备份表web_user_bfmd<br/>
</td></tr></table>
<br/><br/>
<form name="form1" method="POST" action='web/webuser_domd5_action.jsp' target="editframe">
<input type="hidden" name="ifcome" value="true">
<table width="100%" border="0" align="center"><tr><td align="center">
	<input type="button" id="subid" value=" 批量MD5加密 " onclick="doSub()"/>
</td></tr></table>

<br />
<CENTER>
  <div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
  <br/>
  操作执行中，数据量较大，操作时间较长，请耐心等待...<br/>&nbsp;
  </div>
  </CENTER>
</form>

<iframe height="300" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0">
</iframe>
</body>
</html>