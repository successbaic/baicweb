<%@ page import="com.macrosoft.icms.szcp.SZCP_LCZT" %>
<jsp:useBean id="GetDate" scope="page"
	class="com.macrosoft.icms.system.GetDate" />
<%
	String usernum = webuser.getLOGINID();
	SZCP_LCZT lcztBean = new SZCP_LCZT();
	int i = lcztBean.queryCount(usernum);
	
 %>
<table id="table_top"  align="center" border="1" height="100%">
<tr style="width:100%;">
<td class="info_top" colspan="3" height="72px">

	<TABLE width="1000px" height="72px" cellspacing="0" align="center" style="t:expression(this.cellSpacing=0);" cellpadding="0">
	  <TR>
	    <td width="400px" style="background-image:url(<%=request.getContextPath() %>/images/main/top-left.jpg);background-repeat:no-repeat;"></td>
	    <td width="600px" style="background-image:url(<%=request.getContextPath() %>/images/main/top-center.jpg);background-repeat:repeat-x;" align="right" valign="bottom">
		
		  <table width="320px" height="65px">
		    <tr>
		        <TD align="center" style="cursor:pointer">
			     <img src="<%=request.getContextPath() %>/images/main/userinfo.png"  onmouseover="yhxx.style.color='yellow'" onmouseout="yhxx.style.color='white'"  onclick="window.open('<%=request.getContextPath() %>/usermodify/modify_main.jsp','displayWindow','top=120,left=150,toolbar=yes,width=880,height=480,directories=yes,status=yes,scrollbars=yes,resizable =yes,menubar=yes');"></img>
			    </TD>
			    
			    <TD align="center" style="cursor:pointer">
			      <img src="<%=request.getContextPath() %>/images/main/homepage.png"  onmouseover="xssy.style.color='yellow'" onmouseout="xssy.style.color='white'" onclick="javascript:parent.window.location.href='<%=request.getContextPath() %>/index.jsp'">
			    </TD>
			     <TD align="center" style="cursor:pointer">
			      <img src="<%=request.getContextPath() %>/images/main/usinghelp.png"  onmouseover="sybz.style.color='yellow'" onmouseout="sybz.style.color='white'" onclick="window.open('<%=request.getContextPath() %>/help/help.jsp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');"></img>
			    </TD>
			     <TD align="center" style="cursor:pointer">
			      <img src="<%=request.getContextPath() %>/images/main/logout.png"  onmouseover="tcxt.style.color='yellow'" onmouseout="tcxt.style.color='white'" onclick="if(window.confirm('ȷ���˳���ҵ���Ϲ���ϵͳ��?')){parent.window.location.href='<%=request.getContextPath() %>/logout.jsp';}"></img>
			    </TD>
		    </tr>
		     <TR>
		      <TD align="center"><font id="yhxx" style='color:white'>�û���Ϣ</font>
			��</TD>
		      <TD  align="center"><font id="xssy" style='color:white'>��ʾ��ҳ</font>
		    ��  </TD>
		      <TD align="center"><font id="sybz" style='color:white'>ʹ�ð���</font>
			   </TD>
			  <TD align="center"><font id="tcxt" style='color:white'>�˳�ϵͳ</font>
			  </TD>
	         </TR>
		  </table>
		</td>   
	 </TR>
	</TABLE>
</td>
</tr>
<tr style="width:100%;">
<td class="info_top" width="207px" height="100%">
	<table width="220px" height="100%" bgcolor="#eefbf7" border="0">
		<tr>
		<td align="center" height="36px" style="background-image:url(<%=request.getContextPath() %>/images/ly/data_title.jpg); background-repeat:repeat-x;font-size:15px">
		<strong>
		<%
		out.println(GetDate.topDate());
		
		%>
		</strong>
		</td>
		</tr>
		<tr>
		<td height="200px">
			<br/>
			&nbsp;
			&nbsp;
			���ã�<%=webuser.getUSERNAME()%>��<br/>
			&nbsp;
			&nbsp;
			
			��ֹĿǰ����ʹ�����Ϲ��̷���ϵͳ������ <strong> <a href='<%=request.getContextPath() %>/szcp/szcp_jdcx.jsp'><font style="color:#FF9900;"><%=i%></font></a></strong> ��ҵ��<br/>
			&nbsp;
			&nbsp;�������Ҫ�л�����ҵ���� 
			<a style=" cursor:pointer;color:#FF9900;" href='<%=request.getContextPath() %>/index.jsp'><strong>������ҳ</strong></a>
			������ѡ��
			<br/>&nbsp;
			
			
		</td>
		</tr>
		<tr>
		<td align="center" height="36px" style="background-image:url(<%=request.getContextPath() %>/images/ly/data_title.jpg); background-repeat:repeat-x;font-size:15px">
		<strong>�� �� �� ��</strong>
		</td>
		</tr>
		<tr>
		<%
			String url_bszn = "";
			String url_bgxz = "";
			/*
			if("370200".equals(icms.getCURRENTUNIT())){
				url_bszn = "http://www.qdaic.gov.cn/qdaic/Columns/1082.shtml";
			}else{
				url_bszn = request.getContextPath() + "/help/help.jsp";
			}
			if("370200".equals(icms.getCURRENTUNIT())){
				url_bgxz = "http://www.qdaic.gov.cn/qdaic/Columns/168.shtml";
			}else{
				url_bgxz = request.getContextPath() + "/djbg/djbg.jsp";
			}
			*/
			url_bgxz = request.getContextPath() + "/djbg/djbg.jsp";
			url_bszn = request.getContextPath() + "/help/help.jsp";
		 %>
		<td valign="top" style="font-size:13px;line-height:30px">
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=request.getContextPath() %>/szcp/szcp_wwcl_qygsgg.jsp')">
			&nbsp;&nbsp;��ҵ��ʾ����</span><br/>						
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('szcp_wwcl_lct.jsp')">
			&nbsp;&nbsp;��ҵ��ʾ����ͼ</span><br/>
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=request.getContextPath() %>/szcp/szqysqxz.jsp')">
			&nbsp;&nbsp;�걨��������д˵��</span><br/>
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=request.getContextPath() %>/szcp/szcp_help.jsp')">
			&nbsp;&nbsp;��������˵��</span><br/>
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=request.getContextPath() %>/szcp/szcp_wwcl_qygm.jsp')">
			&nbsp;&nbsp;��ҵ��ģ����</span><br/>
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=request.getContextPath() %>/szcp/szcp_wwcl_qshyhf.jsp')">
			&nbsp;&nbsp;��ҵ��ʾ��ҵ����</span><br/>
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=request.getContextPath() %>/szcp/szcp_wwcl_qygsbf.jsp')">
			&nbsp;&nbsp;�غ�ͬ��������ҵ��ʾ�취</span><br/>
			
			
		</td>
		</tr>
	</table>
</td>
<td  width="3px"></td>
<td id="td_content" valign="top" style="width:770px;">	
<script type="text/javascript">
	var sanZheng = "<%=sanZheng%>";
	if(sanZheng == "1"){
		$(".info_top").hide();
		$("#td_content").css("width","100%");
	}
</script>