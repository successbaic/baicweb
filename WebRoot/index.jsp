<%@page import="com.macrosoft.icms.qydj.WEB_USER"%>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="webuser" scope="session"
	class="com.macrosoft.icms.qydj.WEB_USER" />
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<jsp:useBean id="icms" scope="application"
	class="com.macrosoft.icms.system.SysSystem" />
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<html>
<head>
<title>���ϵǼ�</title>
<%
	String url_bszn = "";
	String url_bgxz = "";
	url_bszn = "help/help.jsp";
	url_bgxz = "djbg/djbg.jsp";
	int state=0;
	if(webuser.getUSERNAME().equals("")){
		String token=request.getParameter("token");
		if(!"".equals(token)&&token!=null){
			state=webuser.validateLogin6(dbc,token);
		}
	}
	/*
	if ("370200".equals(icms.getCURRENTUNIT())) {
		url_bszn = "http://www.qdaic.gov.cn/qdaic/Columns/1082.shtml";
	} else {
		url_bszn = "help/help.jsp";
	}
	if ("370200".equals(icms.getCURRENTUNIT())) {
		url_bgxz = "http://www.qdaic.gov.cn/qdaic/Columns/168.shtml";
	} else {
		url_bgxz = "djbg/djbg.jsp";
	}
	*/
	
	dbc.close();
%>
<script type="text/javascript">
	var d = new Date();
	var day = d.getDate();
	var month = d.getMonth()+1;
	var year = d.getFullYear();
	var currentTime = year +"-"+month+"-"+day;
	function compareDate(strDate1,strDate2) {
    	var date1 = new Date(strDate1.replace(/\-/g, "\/"));
    	var date2 = new Date(strDate2.replace(/\-/g, "\/"));
    	return date1-date2;
   	}
	function doSub(v) {
		var iflogin = document.getElementById("iflogin").value;
		if (iflogin == "true") {
			if (v == "99") {
				window.location.href = "content.jsp";
			} else if (v == "4" || v == "5" || v == "7" || v == "8"
					) {
				alert("���������У�");
			} else if (v =="10"){
				 var strDate1 = document.getElementById("strDate1").value;
  				 var strDate2 = document.getElementById("strDate2").value=currentTime;
    			 var result = compareDate(strDate1,strDate2);
    			 if(result>0){
    			 	alert("�걨�ѽ���");
    			 }else{
    			 	window.location.href = "szcp/szcp_lct.jsp";
    			 }
			}else {
				var CURRENTUNIT="<%=icms.getCURRENTUNIT()%>";
				if(v=="0" && CURRENTUNIT=="370700"){
				   // if(loginid1=="tiancai1"||loginid1=="tiancai2"||loginid1=="tiancai3"||loginid1=="tiancai4"||loginid1=="tiancai5"){
						document.getElementById("CDDL").value = v;
						document.form1.action="wfmcxz.jsp";
						document.form1.submit();				    
				    //}else{
				    	//document.getElementById("CDDL").value = v;
						//document.form1.submit();
				  //  }
				}else if(v=="6" && CURRENTUNIT=="370700"){
						document.getElementById("CDDL").value = v;
						document.form1.action="dcdyxz.jsp";
						document.form1.submit();
				}else{
					document.getElementById("CDDL").value = v;
					document.form1.submit();				
				}
			}
		} else {
			/*
			modify by:vincent
			2014.8.5
			ҵ�������¼��͹��������¼��ϲ���һ��ԭ�������¼���bug��
			 */
			//alert("����û�е�¼�����ȵ�¼���״�ʹ�ñ�ϵͳʱ������ע���û���");
			window.location.href = "login.jsp";
		}
	}
	
	function towf(){
		alert("��δ��¼");
	}
	
	function wfsub(info){
		if(window.confirm("������������ϵͳĿǰֻ֧�ֵǼǻ����Ǹ����������������걨���Ƿ�ȷ��������")){
			alert(info);
		}
	}
</script>
</head>
<body
	style="text-align:center; margin:0; background-repeat:no-repeat;background-color: 005cB3;">
	<%
		boolean iflogin = false;
		if (webuser.getUSERNAME().equals("")) {
			if("3".equals(webuser.getTYPE())){
				out.print("<script>alert('ϵͳ�����û���Ϣ������ע�ᣡ');</script>");
			}
		} else {
			iflogin = true;
		}
	%>
	<form name="form1" action="ywdt.jsp" method="POST">
		 <input type="hidden" name="CDDL" id="CDDL"> 
		 <input type="hidden" name="iflogin" id="iflogin" value="<%=iflogin%>">
		 <input type="hidden" id="strDate1" name="strDate1" value="2012-07-01"/>
 		 <input type="hidden" id="strDate2" name="strDate2" value="">
		<%
			if (icms.getCURRENTUNIT().startsWith("22")){
		%>
		<div
			style="position:relative; background-image:url(images/wel/index_jl.jpg); width:1350px; height:771px;background-position:center; background-repeat:no-repeat;">
			<%
				}else{
				
				if ("370200".equals(icms.getCURRENTUNIT()))  {
		%>
		<div
			style="position:relative; background-image:url(images/wel/index_qd.jpg); width:1350px; height:771px;background-position:center; background-repeat:no-repeat;">
			<% }else {
			%>
			<div
				style="position:relative; background-image:url(images/wel/index_sd.jpg); width:1350px; height:771px;background-position:center; background-repeat:no-repeat;">
				<%
					}
					}
				%>
				<%
					if (iflogin) {
				%>
				<div
					style="position:absolute; top:137px; height:24px; left:780px;  color:#FFFFFF; font-size:14px; font-weight:bolder"
					onclick="window.location.href='login.jsp'">
					���ã�<%=webuser.getUSERNAME()%></div>
				<%
					}
				%>
				<div
					style="position:absolute; top:167px; width:24px; height:24px; left: 786px; cursor:pointer;background-image:url(images/wel/sssm.gif);"></div>
				<div
					style="position:absolute; top:172px; width:60px; height:24px; left: 820px; cursor:pointer; color:#0E64B9; font-size:14px; font-weight:bolder"
					onclick="window.open('help/help.jsp')">ʹ��˵��</div>
				<%
					if ("371300".equals(icms.getCURRENTUNIT())) {
				%>	
				<div
					style="position:absolute; top:171px; height:24px; left: 400px; cursor:pointer;">
					<a href="help/contacts.jsp" style="cursor:hand;font-size:14px; color:red" target='_blank'>����鿴</a>
				</div>
				<%} %>	
				<div
					style="position:absolute; top:171px; height:24px; left: 400px; cursor:pointer;">
					<%=PropertiesConfigUtil.getValue("hotline")%>
				</div>
				<%
					if (iflogin) {
				%>
				<div
					style="position:absolute; top:167px; width:24px; height:24px; left: 895px; cursor:pointer;background-image:url(images/wel/zctb.gif);"></div>
					<%if("1".equals(webuser.getTYPE())||"3".equals(webuser.getTYPE())){ %>
					<div
					style="position:absolute; top:172px; height:24px; left: 926px; cursor:pointer; color:#0E64B9; font-size:14px; font-weight:bolder"
					onclick="window.open('usermodify/modify_main.jsp')">�û���Ϣ</div>
					<%}else if("2".equals(webuser.getTYPE())){ %>
					<div
					style="position:absolute; top:172px; height:24px; left: 926px; cursor:pointer; color:#0E64B9; font-size:14px; font-weight:bolder"
					onclick="window.open('https://www.baidu.com/')">ִ����Ϣ</div>
					<% } %>
				<div
					style="position:absolute; top:167px; width:24px; height:24px; left: 1000px; background-image:url(images/wel/dltb.gif);"></div>
				<div
					style="position:absolute; top:172px; height:24px; left: 1032px;  color:#0E64B9; cursor:pointer; font-size:14px; font-weight:bolder"
					onclick="if (window.confirm('ȷ���˳���ҵ���Ϲ���ϵͳ��?')){window.location.href='logout.jsp';}">�˳�</div>
				<%
					} else {
				%>
				
					<%if("3".equals(webuser.getTYPE())){ %>
					<div
						style="position:absolute; top:167px; width:24px; height:24px; left: 979px; cursor:pointer;background-image:url(images/wel/zctb.gif);"></div>
					<div
						style="position:absolute; top:172px; width:40px; height:24px; left: 1002px; cursor:pointer; color:#0E64B9; font-size:14px; font-weight:bolder"
						onclick="window.open('userregist/regist_pre.jsp?LOGINID=<%=webuser.getLOGINID()%>&type=<%=webuser.getTYPE()%>')">ע��</div>
					<%}else{ %>
					<div
						style="position:absolute; top:167px; width:24px; height:24px; left: 905px; cursor:pointer;background-image:url(images/wel/dltb.gif);"></div>
					<div
						style="position:absolute; top:172px; width:40px; height:24px; left: 936px; cursor:pointer; color:#0E64B9; font-size:14px; font-weight:bolder"
						onclick="window.location.href='login.jsp'">��¼</div>
					<div
						style="position:absolute; top:167px; width:24px; height:24px; left: 979px; cursor:pointer;background-image:url(images/wel/zctb.gif);"></div>
					<div
						style="position:absolute; top:172px; width:40px; height:24px; left: 1002px; cursor:pointer; color:#0E64B9; font-size:14px; font-weight:bolder"
						onclick="window.open('userregist/regist_pre.jsp')">ע��</div>
				<%
						}
					}
				%>

				<%
					if(icms.getCURRENTUNIT().startsWith("22")){
				%>
				<div
					style="position:absolute; top:320px; width:92px; height:74px; left: 320px; cursor:pointer;background-image:url(images/wel/mcdj.jpg);"
					onclick="doSub(0)"></div>
				<div
					style="position:absolute; top:320px; width:92px; height:74px; left: 460px; cursor:pointer;background-image:url(images/wel/qydj.jpg);"
					onclick="doSub(1)"></div>
				<div
					style="position:absolute; top:320px; width:92px; height:72px; left: 620px; cursor:pointer;background-image:url(images/wel/gtdj.jpg);"
					onclick="doSub(2)"></div>
				<div
					style="position:absolute; top:320px; width:92px; height:72px; left: 760px; cursor:pointer;background-image:url(images/wel/hzsdj.jpg);"
					onclick="doSub(3)"></div>
					
				<div
					style="position:absolute; top:320px; width:92px; height:74px; left: 920px; cursor:pointer;background-image:url(images/wel/szqysb.jpg);"
					onclick="doSub(10)"></div>
				<%	
					}else{
					if ("370200".equals(icms.getCURRENTUNIT())) {
				%>
				<div
					style="position:absolute; top:320px; width:92px; height:74px; left: 417px; cursor:pointer;background-image:url(images/wel/mcdj.jpg);"
					onclick="doSub(0)"></div>
				<div
					style="position:absolute; top:320px; width:92px; height:74px; left: 544px; cursor:pointer;background-image:url(images/wel/qydj.jpg);"
					onclick="doSub(1)"></div>
				<div
					style="position:absolute; top:320px; width:92px; height:72px; left: 675px; cursor:pointer;background-image:url(images/wel/gtdj.jpg);"
					onclick="doSub(2)"></div>
				<div
					style="position:absolute; top:320px; width:92px; height:72px; left: 803px; cursor:pointer;background-image:url(images/wel/hzsdj.jpg);"
					onclick="doSub(3)"></div>
				<div
					style="position:absolute; top:320px; width:92px; height:72px; left: 929px; cursor:pointer;background-image:url(images/wel/ggfbdj.jpg);"
					onclick="doSub(9)"></div>
					<%--div
					style="position:absolute; top:320px; width:92px; height:72px; left: 929px; cursor:pointer;background-image:url(images/wel/szqysb.jpg);"
					onclick="doSub(10)"></div--%>
				<%
					} else {
				%>

				<div
					style="position:absolute; top:265px; width:92px; height:74px; left: 317px; cursor:pointer;background-image:url(images/wel/mcdj.jpg);"
					onclick="doSub(0)"></div>
				<div
					style="position:absolute; top:265px; width:92px; height:74px; left: 444px; cursor:pointer;background-image:url(images/wel/qydj.jpg);"
					onclick="doSub(1)"></div>
				<div
					style="position:absolute; top:265px; width:92px; height:72px; left: 575px; cursor:pointer;background-image:url(images/wel/gtdj.jpg);"
					onclick="doSub(2)"></div>
				<div
					style="position:absolute; top:265px; width:92px; height:72px; left: 703px; cursor:pointer;background-image:url(images/wel/hzsdj.jpg);"
					onclick="doSub(3)"></div>
				<div
					style="position:absolute; top:265px; width:92px; height:74px; left: 831px; cursor:pointer;background-image:url(images/wel/gqczdj.jpg);"
					onclick="doSub(4)"></div>
				<div
					style="position:absolute; top:265px; width:92px; height:74px; left: 959px; cursor:pointer;background-image:url(images/wel/szqysb.jpg);"
					onclick="doSub(10)"></div>

				<div
					style="position:absolute; top:370px; width:92px; height:74px; left: 316px; cursor:pointer;background-image:url(images/wel/hwgg.jpg);"
					onclick="doSub(5)"></div>
				<div
					style="position:absolute; top:370px; width:92px; height:74px; left: 444px; cursor:pointer;background-image:url(images/wel/dcdy.jpg);"
					onclick="doSub(6)"></div>
				<div
					style="position:absolute; top:370px; width:92px; height:74px; left: 575px; cursor:pointer;background-image:url(images/wel/jjr.jpg);"
					onclick="doSub(7)"></div>
				<div
					style="position:absolute; top:370px; width:92px; height:74px; left: 703px; cursor:pointer;background-image:url(images/wel/zmsb.jpg);"
					onclick="doSub(8)"></div>
				<div
					style="position:absolute; top:370px; width:92px; height:74px; left: 831px; cursor:pointer;background-image:url(images/wel/ggfbdj.jpg);"
					onclick="doSub(9)"></div>
				<div
					style="position:absolute; top:370px; width:92px; height:74px; left: 959px; cursor:pointer;background-image:url(images/wel/ggzgjc.jpg);"
					onclick="doSub(11)"></div>
				<%
					}
					}
				%>

				<div
					style="position:absolute; top:505px; width:50px; height:50px; left: 440px; cursor:pointer;background-image:url(images/wel/blywcx.gif);"
					onclick="doSub(99)"></div>
				<div
					style="position:absolute; top:560px; width:98px; height:20px; left: 420px; cursor:pointer; font-size:14px; color:#7CA9D0; font-weight:bolder;"
					onclick="doSub(99)">������Ȳ�ѯ</div>
				<div
					style="position:absolute; top:503px; width:50px; height:50px; left: 700px; cursor:pointer;background-image:url(images/wel/bszn.jpg);"
					onclick="window.open('<%=url_bszn%>')"></div>

				<div
					style="position:absolute; top:560px; width:70px; height:20px; left: 690px; cursor:pointer; font-size:14px; color:#7CA9D0; font-weight:bolder;"
					onclick="window.open('<%=url_bszn%>')">����ָ��</div>

				<div
					style="position:absolute; top:504px; width:50px; height:50px; left: 580px; cursor:pointer;background-image:url(images/wel/bgxz.gif);"
					onclick="window.open('<%=url_bgxz%>')"></div>
				<div
					style="position:absolute; top:560px; width:70px; height:20px; left: 566px; cursor:pointer; font-size:14px; color:#7CA9D0; font-weight:bolder;"
					onclick="window.open('<%=url_bgxz%>')">�������</div>
				<%
					if (!"370200".equals(icms.getCURRENTUNIT())) {
				%>
				<div
					style="position:absolute; top:503px; width:50px; height:50px; left: 815px; cursor:pointer;background-image:url(images/wel/qygg.gif);"
					onclick="window.open('djnotice/qydjnotice.jsp')"></div>
				<div
					style="position:absolute; top:560px; width:70px; height:20px; left: 806px; cursor:pointer; font-size:14px; color:#7CA9D0; font-weight:bolder;"
					onclick="window.open('djnotice/qydjnotice.jsp')">��ҵ����</div>
				<%
					}
					if (!"370200".equals(icms.getCURRENTUNIT())) {
				%>		
				<div
					style="position:absolute; top:503px; width:50px; height:50px; left: 930px; cursor:pointer;background-image:url(images/wel/jdcx.png);"
					onclick="window.open('mccc/mdlmccc.jsp')"></div>
				<div
					style="position:absolute; top:560px; width:90px; height:20px; left: 910px; cursor:pointer; font-size:14px; color:#7CA9D0; font-weight:bolder;"
					onclick="window.open('mccc/mdlmccc.jsp')">���Ʋ���</div>
				<%
					}
					if ("370100".equals(icms.getCURRENTUNIT())) {
				%>
				<div
					style="position:absolute; top:503px; width:50px; height:50px; left: 820px; cursor:pointer;background-image:url(images/wel/jdcx.png);"
					onclick="window.open('szcp/szcp_jdcx.jsp')"></div>
					<div
					style="position:absolute; top:560px; width:90px; height:20px; left: 800px; cursor:pointer; font-size:14px; color:#7CA9D0; font-weight:bolder;"
					onclick="window.open('szcp/szcp_jdcx.jsp')">������ҵ�걨���Ȳ�ѯ</div>
				<%}
				  if (icms.getCURRENTUNIT().startsWith("22")){
				  %>
				<div
					style="position:absolute; top:503px; width:50px; height:50px; left: 930px; cursor:pointer;background-image:url(images/wel/jdcx.png);"
					onclick="window.open('szcp/szcp_jdcx.jsp')"></div>
					<div
					style="position:absolute; top:560px; width:90px; height:20px; left: 910px; cursor:pointer; font-size:14px; color:#7CA9D0; font-weight:bolder;"
					onclick="window.open('szcp/szcp_jdcx.jsp')">������ҵ�걨���Ȳ�ѯ</div>
				<%
				  }
				 %>
					<div style="position:absolute; top:709px;  height:31px; left: 433px; cursor:pointer;">
					<font color="#FFFFFF"
						style="font-size:16px; color:#FFFFFF;font-weight:bold">
						���쵥λ��<%=PropertiesConfigUtil.getValue("deployregorg")%>
						&nbsp;����֧�֣��˳�����ɷ����޹�˾
					</font>
				</div>
			</div>
	</form>
</body>
</html>
