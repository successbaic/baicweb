<table id="table_top"  align="center" border="1" height="100%">
<tr style="width:100%;">
<td class="info_top" colspan="3" height="72px">
	<TABLE width="1050px" height="72px" cellspacing="0" align="center" style="t:expression(this.cellSpacing=0);" cellpadding="0">
	  <TR>
	    <td width="400px" style="background-image:url(<%=request.getContextPath() %>/images/main/top-left.jpg);background-repeat:no-repeat;"></td>
	    <td width="650px" style="background-image:url(<%=request.getContextPath() %>/images/main/top-center.jpg);background-repeat:repeat-x;" align="right" valign="bottom">
		
		  <table width="160px" height="65px">
		    <tr>
			    <TD align="center" style="cursor:pointer">
			      <img src="<%=request.getContextPath() %>/images/main/homepage.png"  onmouseover="xssy.style.color='yellow'" onmouseout="xssy.style.color='white'" onclick="javascript:parent.window.location.href='<%=request.getContextPath() %>/index.jsp'">
			    </TD>
			     <TD align="center" style="cursor:pointer">
			      <img src="<%=request.getContextPath() %>/images/main/usinghelp.png"  onmouseover="sybz.style.color='yellow'" onmouseout="sybz.style.color='white'" onclick="window.open('<%=request.getContextPath() %>/help/help.jsp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');"></img>
			    </TD>
		    </tr>
		     <TR>
		      <TD  align="center"><font id="xssy" style='color:white'>��ʾ��ҳ</font>
		    ��  </TD>
		      <TD align="center"><font id="sybz" style='color:white'>ʹ�ð���</font>
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
		GetDate getdate=new GetDate();
		out.println(getdate.topDate());
		
		%>
		</strong>
		</td>
		</tr>
		<tr>
		<td height="200px">
			<br/>
			&nbsp;
			&nbsp;
			���ã�</br>
			&nbsp;
			&nbsp;
			����ǰ������ҵ��
			<strong><font style="color:#FF9900;">
				���½����ǩ��ҵ��
			</font></strong>��
			���������EID����������������������֤�������е���ǩ��ҵ��<br/>
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
			url_bgxz = request.getContextPath() + "/djbg/djbg.jsp";
			url_bszn = request.getContextPath() + "/help/help.jsp";
		 %>
		<td valign="top" style="font-size:13px;line-height:30px">
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=url_bgxz %>')">
			&nbsp;&nbsp;�� �� �� ��</span><br/>						
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=url_bszn %>')">
			&nbsp;&nbsp;ϵͳ����ָ��</span><br/>
			&nbsp;&nbsp;
			<span style="background-image:url(<%=request.getContextPath() %>/images/ly/icon.png); background-repeat:no-repeat;cursor:pointer" onclick="window.open('<%=request.getContextPath() %>/whgn/wlzgy.jsp')">
			&nbsp;&nbsp;����ר��Ա</span>
			<br><br>
		</td>
		</tr>
	</table>
</td>
<td  width="3px"></td>
<td id="td_content" valign="top" style="width:830px;">	