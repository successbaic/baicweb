<%@ page errorPage="../error.jsp"%>
<LINK href="../css/icms.css" type="text/css" rel="stylesheet">
<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>���̾�����ע��</title>
</head>
<body leftmargin="0" topmargin="0">
<%	
	String LOGINID=request.getParameter("LOGINID");
	String type=request.getParameter("type");
%>
<form name="bbrules" method="post">
<table style="margin-top: 20px;" width="800" border="0" cellpadding="0" cellspacing="0" align="center">
<caption style="font-size: 20px;">���ϵǼ�ϵͳʹ��Э��</caption>
	<tr> 
    <td align="center" class=tc> �����ǣ� 
		<script language="JavaScript">

		var enabled = 0; today = new Date();
		var day; var date;
		if(today.getDay()==0) day = " ������"
		if(today.getDay()==1) day = " ����һ"
		if(today.getDay()==2) day = " ���ڶ�"
		if(today.getDay()==3) day = " ������"
		if(today.getDay()==4) day = " ������"
		if(today.getDay()==5) day = " ������"
		if(today.getDay()==6) day = " ������"
		document.fgColor = "000000";
		date = (today.getFullYear()) + "��" + (today.getMonth() + 1 ) + "��" + today.getDate() + "��" + day +"";
		document.write(date);
		var LOGINID="<%=LOGINID%>";
		var type="<%=type%>";
		</script>

  </td>
</tr>
  <tr>
    <td align=center class=lc1>
	<textarea rows="25" name="Declare" cols="100" readOnly style="font-size: 16px;">
                    
    ��ӭ���ļ��룬���������Ķ���������Ծ�������������ע�����û���

һ�������Ķ�����ص����ƻ��ߵǼ�ҵ����صķ��ɷ��棬ȷ֪���е�Ȩ��������
��������ŵ�������Ϣ��ȫ����ʵ��׼ȷ���Ϸ����Ҵ���ȫ��ɶ�����˼��ʾ�������ڹ涨�����޵ݽ�������������Ϣһ�»��߷����Ҫ������ƻ�Ǽǲ��ϡ�
������Ӧ��֤���롢�޸Ĳ����Ѿ�ȡ����������ȫ��ɶ���������Ȩ�������ַ����˵ĺϷ�Ȩ�档
�ġ���ͬ��Ǽǻ��������ظ���������ʱ����Ȩ�ԵǼ���������޸ģ���ͬ����������һ���Ǽǻ��غ�׼��ԭ���������ٶ���������������ġ�
�塢����վ�Ա�Э������޸ĺͶ�����ע��ϵͳ���и���ʱ�����Բ�Ԥ��֪ͨ��
�����򲻿ɿ�����ʧ��й¶���Ϣ��У��������ߵ������Ϣ����ʱ������վ�����κ����Ρ�
�ߡ�֤����������д������ʵ���֤�ţ�����Ϊ15λ����18λ��
�ˡ��û�������д������ʵ������
�š�������������ʵ��ϵ�绰��������ϵ��
ʮ�������Ʊ��������õ����룬ÿ�ε�¼��ϵͳ�����õ���
    ���ڲ���������Ҫ��ע����û���ϵͳ������Ա����ɾ����Ȩ����������û��Ը���
</textarea>	
</td>
</tr>
<tr>
  <td  class=fc style="text-align: center;">
	  <input name="but_accept" type="button" value="�� ��" class="button" onClick="GoReg()">
	  <input type="button" name="button" value="������" class="button" onClick="javascript:window.close();">
  </td>
	  
</tr>
</table>    
</form>

<body leftmargin="0" topmargin="0">

<script  language="javascript">
function GoReg()
{
	this.location="regist_main.jsp?YWLX=1&LOGINID="+LOGINID+"&type="+type;
}
function timelimit() {
	var secs = 6;
	var wait = secs * 1000;
	document.bbrules.but_accept.value = "�� ��(" + secs + ")";
	document.bbrules.but_accept.disabled = true;
	for(i = 1; i <= secs; i++) {
					window.setTimeout("update(" + i + ")", i * 1000);
	}
	window.setTimeout("timer()", wait);
}
function update(num, value) {
	var secs = 6;
	var wait = secs * 1000;
	if(num == (wait/1000)) {
		document.bbrules.but_accept.value = "�� ��";
	} else {
			printnr = (wait / 1000)-num;
			document.bbrules.but_accept.value = "�� ��(" + printnr + ")";
	}
}
function timer() {
		document.bbrules.but_accept.disabled = false;
		document.bbrules.but_accept.value = "�� ��";
}
</script>
</body>
</html>
