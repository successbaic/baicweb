<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<script type="text/javascript">
function doSub(){
	if(window.confirm("ȷ��ִ�е�ǰ������")){
		document.getElementById("subid").disabled=true;
		document.getElementById("waitdiv").style.display="";
		document.form1.submit();
	}
}
</script>
</head>
<body>
<table width="80%" border="0" align="center"><tr><td>
<font color="red"><strong>˵����</strong></font><br/>
&nbsp;&nbsp;&nbsp;&nbsp;��ҳ�����ڽ�ԭ���ϵǼ��û����������MD5���ܣ����ܺ��û����뽫���������ĵķ�ʽ��������ݿ��С�<br/>
&nbsp;&nbsp;&nbsp;&nbsp;�����������£�<br/>
&nbsp;&nbsp;&nbsp;&nbsp;��һ�����������ϵǼ����ݿ������ӱ����ֶΣ������б��ݣ�ִ��������䣺<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��1��alter table WEB_USER add MDREMARK varchar2(1);<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;commit;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��2��create table web_user_bfmd as select * from web_user;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;�ڶ��������������MD5���ܡ���ť�����ֵ����û����ϴ󣬵���󣬵ȴ�ʱ���ϳ��������ĵȴ���<br/>
&nbsp;&nbsp;&nbsp;&nbsp;��������ϵͳ������������ɹ������ʧ�ܵ���ʾ��<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ɹ�����ɾ��iaicweb��Ŀ��webuser_domd5.jsp�ļ���<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ݿ���ɾ�������ֶΣ�alter table WEB_USER drop column MDREMARK;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ʾ����ʧ�ܣ�����ϵͳ����Ա��<br/>
&nbsp;&nbsp;&nbsp;&nbsp;���Ĳ���������Ϻ�ȷ������ҵ��ϵͳ����Ҳ�Ѿ��������¡��������к󣬿��Ը�����Ҫɾ�����ݱ�web_user_bfmd<br/>
</td></tr></table>
<br/><br/>
<form name="form1" method="POST" action='web/webuser_domd5_action.jsp' target="editframe">
<input type="hidden" name="ifcome" value="true">
<table width="100%" border="0" align="center"><tr><td align="center">
	<input type="button" id="subid" value=" ����MD5���� " onclick="doSub()"/>
</td></tr></table>

<br />
<CENTER>
  <div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
  <br/>
  ����ִ���У��������ϴ󣬲���ʱ��ϳ��������ĵȴ�...<br/>&nbsp;
  </div>
  </CENTER>
</form>

<iframe height="300" width="100%" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0">
</iframe>
</body>
</html>