<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="/error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>

<%	
	
	//String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	
	//String WTYW="�������������ע����������";
	//String checkBox = "��";
    //String selected = "��";
%>
<html>
	<head>
		<link style="text/css" rel="stylesheet" href="css/print.css"/>
		<%out.print(pageshow.pagesetup_default()); %>
		<title>���幤�̻�����Ԥ�Ⱥ�׼������</title>
	</head>
	<body onload="pagesetup_default()" style="width:100%;height: 100%;">
	<div style="text-align: right; " class="noPrint">
		<div>
			<input type="button" value="��ӡ������" onclick="window.print();">
			<input name=back type="button" value="��   ��" onclick="window.close();">
		</div>
		<div>
			<font color="red" style="font-size: 9pt;">
				(����A4ֽ��ӡ,�ڴ�ӡ֮ǰ����IE->�ļ�->ҳ�����á��н���ҳü"�͡�ҳ�š����)
			</font>
		</div>
	</div>
	<div style="width:100%;height: 100%;text-align: center;">
		<div class="title">
			���幤�̻�����Ԥ�Ⱥ�׼������
		</div>
		<div class="printWidth">
			<table>
				<tbody>
					<tr>
						<td class="tdLabel">
							��������
						</td>
						<td class="tdContent">
							<%=MCGL_JBXX.getENTNAME() %>
						</td>
					</tr>	
					<tr>
						<td class="tdLabel" rowspan="2">
							��ѡ����<br/>
							����ѡ�ò�ͬ�ֺţ�
						</td>
						<td class="tdContent">
							<font style="float: left">1.</font><%=MCGL_JBXX.getENTNAME1() %>
						</td>
					</tr>	
					<tr>
						<td class="tdContent">
							<font style="float: left">2.</font><%=MCGL_JBXX.getENTNAME2() %>
						</td>
					</tr>	
						<tr>
						<td class="tdLabel" rowspan="2" style="vertical-align: center;">
							��Ӫ��
						</td>
						<td class="tdContent">
							<div id="table">
								<ul>
									<li>����</li>
								</ul>
							<div>
								<%=MCGL_JBXX.getOWNERNAME() %>
							</div>
							</div>
						</td>
					</tr>	
						<tr>
						<td>
						<div id="table">
								<ul>
									<li>��ϵ�绰</li>
								</ul>
								<div>
								<%=MCGL_JBXX.getOWNERTEL() %>
							</div>
							</div>
						</td>
					</tr>	
					<tr>
						<td class="tdLabel" style="height: 150px;">
							��Ӫ��Χ
						</td>
						<td class="tdContent" style="text-align: left;vertical-align: top;">
							<%=MCGL_JBXX.getBUSSCOPE() %>
							<%-- <table class="noBorder">
								<tr>
									<td>
										��ɾ�Ӫ��Ŀ��<%=MCGL_JBXX.getABUITEMCO() %>
									</td>
								</tr>
								<tr>
									<td>
										һ�㾭Ӫ��Ŀ��<%=MCGL_JBXX.getCBUITEM() %>
									</td>
								</tr>
							</table> --%>
						</td>
					</tr>
					<tr>
						<td class="tdLabel" style="height: 60px;">
							��Ӫ����
						</td>
						<td class="tdContent">
							<%=MCGL_JBXX.getDOM() %>
						</td>
					</tr>
					<tr>
						<td class="tdLabel" style="height: 350px;width: 100%;" colspan="2">
							<div>
							����Ӫ�����֤��ӡ��ճ������
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div style="text-align: left;"><div style="margin-left: 20px;">��Ӫ��ǩ����</div></div>
			<br/>
			<br/>
			<div style="float: right;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</div>
		</div>
	</div>
	
	<br><p class="PageNext"></p> <br>

	<table style="width: 80%;" align="center" style="border-style:none;border-width:0px">
	<tr><td style="border-style:none;border-width:0px">		
	<center>
	<strong>
	��д���幤�̻�����Ԥ�Ⱥ�׼��������֪</strong></center>
<p>&nbsp;&nbsp;&nbsp;&nbsp;1. ����ʹ�ø��幤�̻����Ƶģ�Ӧ�����ա����幤�̻��������͹��ҹ����ܾ֡����幤�̻����ƵǼǹ���취���йع涨�������<br/>
&nbsp;&nbsp;&nbsp;&nbsp;2. ������幤�̻�����Ԥ�Ⱥ�׼�ģ�Ӧ�����侭Ӫ�������ڵصĵǼǻ����ύ���پ�Ӫ��ǩ��ġ����幤�̻�����Ԥ�Ⱥ�׼�����顷���ھ�Ӫ�ߵ����֤��ӡ����<br/>
&nbsp;&nbsp;&nbsp;&nbsp;ί�д����˰���ģ���Ӧ���ύ��Ӫ��ǩ��ġ�ί�д�����֤������ί�д��������֤��ӡ����<br/>
&nbsp;&nbsp;&nbsp;&nbsp;3. ���幤�̻����������������������ֺš���ҵ����֯��ʽ��ɡ����У�����������ָ���幤�̻���Ӫ���������أ��У�����Ͻ�����ƣ���������֮�����׺�Ը��幤�̻���Ӫ�������ڵص����򡢽ֵ����������塢�������г����ƣ��������ֺ�Ӧ����2�����ϵĺ�����ɣ�����ʹ�ø��幤�̻���Ա���������ֺţ�����ʹ���ؼ��������������������ֺţ���ҵ����Ӧ����ӳ����Ҫ��Ӫ����ݻ��߾�Ӫ�ص㣻��֯��ʽ����ѡ�á����������ꡱ�����ݡ��������������С��������ġ���������������ʹ�á���ҵ��������˾���͡�ũ��רҵ�����硱������<br/>
&nbsp;&nbsp;&nbsp;&nbsp;4. ���幤�̻��ľ�Ӫ��Χ�������ա����񾭼���ҵ���ࡷ�����ࡢС����ҵ������ƻ���徭Ӫ��Ŀ��<br/>
&nbsp;&nbsp;&nbsp;&nbsp;5. ���幤�̻��ľ�Ӫ��������Ӫҵ���ڵص���ϸ��ַ����дӦ��������Ӫ���������أ��С��������磨�򣩼��塢�ֵ������ƺ��롣<br/>
&nbsp;&nbsp;&nbsp;&nbsp;6. Ӧ��ʹ�øֱʡ�ë�ʻ�ǩ�ֱʹ�������д����ǩ��������ʹ��Բ��ʡ�<br/>
&nbsp;&nbsp;&nbsp;&nbsp;7. �ύ���������������������Ӧ��ʹ��A4��ֽ��<br/>
&nbsp;&nbsp;&nbsp;&nbsp;���ϸ���δע���ύ��ӡ���ģ�Ӧ���ύԭ�����ύ��ӡ���ģ�Ӧ��ע������ԭ��һ�¡����ɸ��幤�̻���Ӫ�߻�������ί�еĴ�����ǩ�֡�<br/>
	</td></tr></table>
	</body>
</html>